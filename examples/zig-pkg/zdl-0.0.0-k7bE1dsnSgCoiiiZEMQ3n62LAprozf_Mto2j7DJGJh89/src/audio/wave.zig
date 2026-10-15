//! Borrowed RIFF/WAVE parsing and owned sample decoding.
//! Ported from audio/SDL_wave.c. std handles files and allocation; this module
//! handles the container/codec semantics. It never changes process hints or
//! opens a file. PCM, IEEE f32, A-law, mu-law and both four-bit ADPCM codecs are
//! supported. RF64, three-bit IMA and unrelated codecs remain unsupported.
const std = @import("std");
const audio = @import("processing.zig");

/// Supported WAVE codec tags, expressed as protocol values rather than C macros.
pub const Codec = enum(u16) { pcm = 1, ms_adpcm = 2, ieee_float = 3, a_law = 6, mu_law = 7, ima_adpcm = 17 };
/// Parse/decode failures never leave ownership with an implicit global state.
pub const Error = audio.Error || std.mem.Allocator.Error || error{
    InvalidContainer,
    TruncatedData,
    MissingFormat,
    MissingData,
    InvalidHeader,
    UnsupportedCodec,
    UnsupportedBitDepth,
    InvalidAlignment,
    InvalidData,
    MissingFact,
    InvalidFact,
};

/// Explicit versions of SDL's file-decoding hint policies.
pub const ParseOptions = struct {
    /// Bound chunk traversal by the declared RIFF size; false uses the supplied slice.
    check_riff_size: bool = true,
    /// Decode complete available frames when a data chunk/block ends early.
    allow_truncated_data: bool = false,
    /// A fact count can limit padded codec output; require also checks its presence.
    fact: enum { ignore, truncate, require } = .truncate,
};

/// Validated codec metadata. Extension bytes remain borrowed from the input.
pub const Header = struct {
    codec: Codec,
    channels: u16,
    sample_rate: u32,
    bits: u16,
    block_align: u16,
    samples_per_block: usize = 0,
    channel_mask: u32 = 0,
    coefficients: []const u8 = &.{},

    fn parse(raw: []const u8) Error!Header {
        if (raw.len < 16) return error.InvalidHeader;
        var tag = read(u16, raw, 0);
        var header: Header = .{
            .codec = undefined,
            .channels = read(u16, raw, 2),
            .sample_rate = read(u32, raw, 4),
            .block_align = read(u16, raw, 12),
            .bits = read(u16, raw, 14),
        };
        if (header.channels == 0) return error.InvalidChannels;
        if (header.sample_rate == 0) return error.InvalidSampleRate;
        if (header.block_align == 0) return error.InvalidAlignment;
        const extra = if (raw.len >= 18) read(u16, raw, 16) else 0;
        if (extra > raw.len - @min(raw.len, 18)) return error.InvalidHeader;
        const extensible = tag == 0xfffe;
        if (extensible) {
            if (raw.len < 40 or extra < 22) return error.InvalidHeader;
            const subtype = raw[24..40];
            if (!std.mem.eql(u8, subtype[4..], "\x00\x00\x10\x00\x80\x00\x00\xaa\x00\x38\x9b\x71")) return error.UnsupportedCodec;
            const code = read(u32, subtype, 0);
            tag = std.math.cast(u16, code) orelse return error.UnsupportedCodec;
            header.channel_mask = read(u32, raw, 20);
            const valid_bits = read(u16, raw, 18);
            if (valid_bits > header.bits and tag != 17) return error.InvalidHeader;
            if (tag == 17) header.samples_per_block = valid_bits;
        }
        header.codec = switch (tag) {
            1 => .pcm,
            2 => .ms_adpcm,
            3 => .ieee_float,
            6 => .a_law,
            7 => .mu_law,
            17 => .ima_adpcm,
            else => return error.UnsupportedCodec,
        };
        const channels: usize = header.channels;
        switch (header.codec) {
            .pcm, .ieee_float, .a_law, .mu_law => {
                const supported = switch (header.codec) {
                    .pcm => header.bits == 8 or header.bits == 16 or header.bits == 24 or header.bits == 32,
                    .ieee_float => header.bits == 32,
                    else => header.bits == 8,
                };
                if (!supported) return error.UnsupportedBitDepth;
                if (channels * (header.bits / 8) != header.block_align) return error.InvalidAlignment;
            },
            .ms_adpcm => {
                if (extensible) return error.UnsupportedCodec;
                if (header.channels > 2) return error.InvalidChannels;
                if (header.bits != 4) return error.UnsupportedBitDepth;
                if (header.block_align < channels * 7 or raw.len < 22) return error.InvalidHeader;
                const count = @min(@as(usize, read(u16, raw, 20)), 256);
                if (count < 7 or raw.len < 22 + count * 4 or extra < 4 + count * 4) return error.InvalidHeader;
                header.coefficients = raw[22..][0 .. count * 4];
                const presets = [_]i16{ 256, 0, 512, -256, 0, 0, 192, 64, 240, 0, 460, -208, 392, -232 };
                for (presets, 0..) |expected, i| if (read(i16, header.coefficients, i * 2) != expected) return error.InvalidHeader;
                header.samples_per_block = read(u16, raw, 18);
                const maximum = (@as(usize, header.block_align) - channels * 7) * 2 / channels + 2;
                if (header.samples_per_block == 0) header.samples_per_block = maximum;
                if (header.samples_per_block < 2 or header.samples_per_block > maximum) return error.InvalidHeader;
            },
            .ima_adpcm => {
                if (header.bits != 4) return error.UnsupportedBitDepth;
                if (header.block_align < channels * 4 or header.block_align % 4 != 0) return error.InvalidAlignment;
                if (!extensible and raw.len >= 20 and extra >= 2) header.samples_per_block = read(u16, raw, 18);
                const maximum = ima_frames(@as(usize, header.block_align) - channels * 4, channels) + 1;
                if (header.samples_per_block == 0) header.samples_per_block = maximum;
                if (header.samples_per_block > maximum) return error.InvalidHeader;
            },
        }
        return header;
    }

    /// Storage format of the decoded output. Compact/companded/ADPCM samples
    /// expand to supported signed PCM; channel order is preserved, not guessed.
    pub fn decoded_format(self: Header) audio.Format {
        return switch (self.codec) {
            .pcm => switch (self.bits) {
                8 => .unsigned8,
                16 => .signed16_le,
                else => .signed32_le,
            },
            .ieee_float => .float32_le,
            else => .signed16_le,
        };
    }
};

/// Parsed WAVE borrowing its fmt/data chunks. The supplied container slice must
/// outlive this value and all its decoding calls. No allocation occurs in parse.
pub const Wave = struct {
    /// Container bounds, truncation and fact-count policy for parse.
    pub const Options = ParseOptions;
    header: Header,
    data: []const u8,
    fact_frames: ?u32,
    options: Options,

    /// Traverses bounded RIFF chunks, skips unknown chunks, honors odd-byte
    /// padding, and accepts fmt/data in either order. Duplicate fmt/data chunks
    /// use the first occurrence. A truncated non-data chunk is always rejected.
    pub fn parse(bytes: []const u8, options: Options) Error!Wave {
        if (bytes.len < 12) return error.TruncatedData;
        if (!std.mem.eql(u8, bytes[0..4], "RIFF") or !std.mem.eql(u8, bytes[8..12], "WAVE")) return error.InvalidContainer;
        var end = bytes.len;
        if (options.check_riff_size) {
            const declared = std.math.add(usize, read(u32, bytes, 4), 8) catch return error.Overflow;
            if (declared < 12) return error.InvalidContainer;
            if (declared > bytes.len and !options.allow_truncated_data) return error.TruncatedData;
            end = @min(declared, bytes.len);
        }
        var format: ?[]const u8 = null;
        var data: ?[]const u8 = null;
        var fact: ?u32 = null;
        var position: usize = 12;
        while (position < end) {
            if (end - position < 8) return error.TruncatedData;
            const name = bytes[position..][0..4];
            const length: usize = read(u32, bytes, position + 4);
            const start = position + 8;
            const available = end - start;
            const is_data = std.mem.eql(u8, name, "data");
            if (length > available and (!is_data or !options.allow_truncated_data)) return error.TruncatedData;
            const chunk = bytes[start..][0..@min(length, available)];
            if (std.mem.eql(u8, name, "fmt ") and format == null) format = chunk;
            if (is_data and data == null) data = chunk;
            if (std.mem.eql(u8, name, "fact") and fact == null) {
                if (chunk.len < 4) return error.InvalidFact;
                fact = read(u32, chunk, 0);
            }
            if (length > available) break;
            const padded = std.math.add(usize, length, length & 1) catch return error.Overflow;
            position = std.math.add(usize, start, padded) catch return error.Overflow;
            // An odd final chunk may omit its non-data alignment byte. This
            // does not make a complete final sample frame truncated.
            if (position > end and position != end + 1) return error.TruncatedData;
        }
        const header = try Header.parse(format orelse return error.MissingFormat);
        const wave: Wave = .{ .header = header, .data = data orelse return error.MissingData, .fact_frames = fact, .options = options };
        _ = try wave.frames();
        return wave;
    }

    /// Decodable real frames, limited by an optional fact count. Strict options
    /// reject incomplete frames/blocks and fact counts beyond available output.
    pub fn frames(self: Wave) Error!usize {
        const header = self.header;
        if (self.data.len % header.block_align != 0 and !self.options.allow_truncated_data) return error.TruncatedData;
        var available: usize = 0;
        switch (header.codec) {
            .ms_adpcm, .ima_adpcm => {
                available = std.math.mul(usize, self.data.len / header.block_align, header.samples_per_block) catch return error.Overflow;
                const trailing = self.data.len % header.block_align;
                const channels: usize = header.channels;
                const prefix = channels * (if (header.codec == .ms_adpcm) @as(usize, 7) else 4);
                if (trailing >= prefix) {
                    const additional = if (header.codec == .ms_adpcm) (trailing - prefix) * 2 / channels + 2 else ima_frames(trailing - prefix, channels) + 1;
                    available = std.math.add(usize, available, @min(additional, header.samples_per_block)) catch return error.Overflow;
                }
            },
            else => available = self.data.len / header.block_align,
        }
        if (self.options.fact == .require and header.codec != .pcm and self.fact_frames == null) return error.MissingFact;
        if (self.options.fact != .ignore) if (self.fact_frames) |count| {
            if (count > available and self.options.fact == .require) return error.InvalidFact;
            available = @min(available, count);
        };
        return available;
    }

    /// Allocates decoded interleaved samples. All error paths release output.
    /// Source bytes stay borrowed; the returned object owns only its new buffer.
    pub fn decode(self: Wave, allocator: std.mem.Allocator) Error!Decoded {
        const frames_to_decode = try self.frames();
        const spec: audio.Spec = .{ .format = self.header.decoded_format(), .channels = self.header.channels, .sample_rate = self.header.sample_rate };
        const size = std.math.mul(usize, frames_to_decode, try spec.frame_size()) catch return error.Overflow;
        const output = try allocator.alloc(u8, size);
        errdefer allocator.free(output);
        if (frames_to_decode != 0) switch (self.header.codec) {
            .pcm => {
                if (self.header.bits != 24) @memcpy(output, self.data[0..size]) else {
                    const count = frames_to_decode * @as(usize, self.header.channels);
                    for (0..count) |i| {
                        const value = @as(i32, read(i24, self.data, i * 3)) * 256;
                        std.mem.writeInt(i32, output[i * 4 ..][0..4], value, .little);
                    }
                }
            },
            .ieee_float => @memcpy(output, self.data[0..size]),
            .a_law, .mu_law => for (self.data[0 .. size / 2], 0..) |byte, i| {
                store(output, i, if (self.header.codec == .a_law) decode_a_law(byte) else decode_mu_law(byte));
            },
            .ms_adpcm, .ima_adpcm => try self.decode_adpcm(allocator, output, frames_to_decode),
        };
        return .{ .allocator = allocator, .spec = spec, .data = output };
    }

    fn decode_adpcm(self: Wave, allocator: std.mem.Allocator, output: []u8, frames_to_decode: usize) Error!void {
        const channels: usize = self.header.channels;
        const states = try allocator.alloc(ImaState, if (self.header.codec == .ima_adpcm) channels else 0);
        defer allocator.free(states);
        var consumed: usize = 0;
        var produced: usize = 0;
        while (produced < frames_to_decode) {
            const length = @min(@as(usize, self.header.block_align), self.data.len - consumed);
            const block = self.data[consumed..][0..length];
            const count = @min(self.header.samples_per_block, frames_to_decode - produced);
            const target = output[produced * channels * 2 ..];
            if (self.header.codec == .ms_adpcm) try decode_ms(self.header, block, target, count) else try decode_ima(block, target, states, channels, count);
            consumed += length;
            produced += count;
        }
    }
};

/// Owns decoded data, with the storage format/channels/rate needed to consume it.
/// Do not copy after decoding. Deinit before destroying the backing allocator.
pub const Decoded = struct {
    allocator: std.mem.Allocator,
    spec: audio.Spec,
    data: []u8,
    /// Releases decoded samples. Any slices borrowed from data become invalid.
    pub fn deinit(self: *Decoded) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }
};

fn read(comptime Integer: type, bytes: []const u8, offset: usize) Integer {
    const width = @divExact(@bitSizeOf(Integer), 8);
    return std.mem.readInt(Integer, bytes[offset..][0..width], .little);
}
fn store(bytes: []u8, index: usize, sample: i16) void {
    std.mem.writeInt(i16, bytes[index * 2 ..][0..2], sample, .little);
}
fn decode_a_law(byte: u8) i16 {
    const value = byte ^ 0x55;
    const exponent = (value >> 4) & 7;
    var magnitude: i32 = (@as(i32, value & 15) << 4) + 8;
    if (exponent != 0) magnitude += 256;
    if (exponent > 1) magnitude <<= @as(u5, @intCast(exponent - 1));
    return @intCast(if (value & 128 != 0) magnitude else -magnitude);
}
fn decode_mu_law(byte: u8) i16 {
    const value = ~byte;
    const magnitude = ((@as(i32, value & 15) << 3) + 132) << @as(u5, @intCast((value >> 4) & 7));
    return @intCast(if (value & 128 != 0) 132 - magnitude else magnitude - 132);
}

const MsState = struct {
    coefficient1: i16,
    coefficient2: i16,
    delta: u32,
    previous: i16,
    older: i16,
    fn sample(self: *MsState, nibble: u4) i16 {
        const adapt = [_]u16{ 230, 230, 230, 230, 307, 409, 512, 614, 768, 614, 512, 409, 307, 230, 230, 230 };
        const error_delta = @as(i64, nibble) - (if (nibble >= 8) @as(i64, 16) else 0);
        const prediction = @divTrunc(@as(i64, self.previous) * self.coefficient1 + @as(i64, self.older) * self.coefficient2, 256);
        const value: i16 = @intCast(std.math.clamp(prediction + error_delta * self.delta, -32768, 32767));
        self.delta = std.math.clamp(self.delta * adapt[nibble] / 256, 16, 65535);
        self.older = self.previous;
        self.previous = value;
        return value;
    }
};
fn decode_ms(header: Header, block: []const u8, output: []u8, frames: usize) Error!void {
    const channels: usize = header.channels;
    if (block.len < channels * 7) return error.TruncatedData;
    var states: [2]MsState = undefined;
    for (0..channels) |channel| {
        const predictor: usize = block[channel];
        // SDL's original > check allowed the first out-of-range pair. Use >=.
        if (predictor >= header.coefficients.len / 4) return error.InvalidData;
        states[channel] = .{
            .coefficient1 = read(i16, header.coefficients, predictor * 4),
            .coefficient2 = read(i16, header.coefficients, predictor * 4 + 2),
            .delta = read(u16, block, channels + channel * 2),
            .previous = read(i16, block, channels * 3 + channel * 2),
            .older = read(i16, block, channels * 5 + channel * 2),
        };
        store(output, channel, states[channel].older);
        if (frames > 1) store(output, channels + channel, states[channel].previous);
    }
    const prefix = channels * 7;
    for (2..@max(frames, 2)) |frame| for (0..channels) |channel| {
        const ordinal = (frame - 2) * channels + channel;
        const position = prefix + ordinal / 2;
        if (position >= block.len) return error.TruncatedData;
        const nibble: u4 = @truncate(if (ordinal & 1 == 0) block[position] >> 4 else block[position]);
        store(output, frame * channels + channel, states[channel].sample(nibble));
    };
}

const ImaState = struct {
    previous: i16,
    index: i16,
    fn sample(self: *ImaState, nibble: u4) i16 {
        const changes = [_]i8{ -1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8 };
        const steps = [_]u16{
            7,     8,     9,     10,    11,    12,    13,    14,    16,    17,   19,   21,   23,    25,    28,    31,
            34,    37,    41,    45,    50,    55,    60,    66,    73,    80,   88,   97,   107,   118,   130,   143,
            157,   173,   190,   209,   230,   253,   279,   307,   337,   371,  408,  449,  494,   544,   598,   658,
            724,   796,   876,   963,   1060,  1166,  1282,  1411,  1552,  1707, 1878, 2066, 2272,  2499,  2749,  3024,
            3327,  3660,  4026,  4428,  4871,  5358,  5894,  6484,  7132,  7845, 8630, 9493, 10442, 11487, 12635, 13899,
            15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767,
        };
        const index: usize = @intCast(std.math.clamp(self.index, 0, 88));
        const step: i32 = steps[index];
        self.index = @as(i16, @intCast(index)) + changes[nibble];
        // Preserve the separately truncated shifts. Multiplication would change
        // IMA's historical rounding and therefore its decoded sample sequence.
        var delta = step >> 3;
        if (nibble & 4 != 0) delta += step;
        if (nibble & 2 != 0) delta += step >> 1;
        if (nibble & 1 != 0) delta += step >> 2;
        if (nibble & 8 != 0) delta = -delta;
        self.previous = @intCast(std.math.clamp(@as(i32, self.previous) + delta, -32768, 32767));
        return self.previous;
    }
};
fn ima_frames(payload: usize, channels: usize) usize {
    const group = channels * 4;
    const full = payload / group * 8;
    const remainder = payload % group;
    const earlier_channels = (channels - 1) * 4;
    return full + (if (remainder > earlier_channels) (remainder - earlier_channels) * 2 else 0);
}
fn decode_ima(block: []const u8, output: []u8, states: []ImaState, channels: usize, frames: usize) Error!void {
    const prefix = channels * 4;
    if (block.len < prefix) return error.TruncatedData;
    for (states, 0..) |*state, channel| {
        state.* = .{ .previous = read(i16, block, channel * 4), .index = @as(i8, @bitCast(block[channel * 4 + 2])) };
        store(output, channel, state.previous);
        // Reserved header byte is intentionally ignored, as SDL does.
    }
    for (1..@max(frames, 1)) |frame| for (states, 0..) |*state, channel| {
        const relative = frame - 1;
        const position = prefix + relative / 8 * (channels * 4) + channel * 4 + relative % 8 / 2;
        if (position >= block.len) return error.TruncatedData;
        const nibble: u4 = @truncate(if (relative & 1 == 0) block[position] else block[position] >> 4);
        store(output, frame * channels + channel, state.sample(nibble));
    };
}
