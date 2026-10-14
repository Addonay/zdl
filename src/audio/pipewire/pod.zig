//! SPA pod encoding and decoding for PipeWire audio parameters, written as
//! plain byte layout instead of calling SPA's inline C builders.
//!
//! Layout (spa/pod/pod.h, spa/pod/builder.h):
//!   - Every pod starts with two native-endian u32 words: `size` (body bytes,
//!     excluding the 8-byte header and any trailing padding) and `type`.
//!   - Bodies are padded with zeros to a multiple of 8 bytes.
//!   - Object body: u32 object type, u32 object id, then properties. A property
//!     is u32 key, u32 flags, then a complete value pod.
//!   - Choice body: u32 choice kind (SPA_CHOICE_*), u32 flags, then one child
//!     header whose type gives the element type, then the elements. Elements are
//!     packed with a stride equal to the child size; padding is applied once at
//!     the end of the whole pod.
//!   - Array body: child header (size, type), then packed elements, same rules.
//!
//! Numeric constants were checked against the installed headers (SPA 0.2,
//! PipeWire 0.3). Writers return slices of caller storage; nothing allocates.
//! Multi-byte values use the host's native endianness, as SPA does.
const std = @import("std");
const audio = @import("../processing.zig");

const native_endian = @import("builtin").cpu.arch.endian();

/// SPA_TYPE_* values for pod types (spa/pod/pod.h).
pub const Type = struct {
    pub const none: u32 = 1;
    pub const id: u32 = 3;
    pub const int: u32 = 4;
    pub const choice: u32 = 19;
    pub const array: u32 = 13;
    pub const object: u32 = 15;
};

/// SPA_CHOICE_* kinds.
pub const choice_enum: u32 = 3;

/// SPA_TYPE_OBJECT_Format and SPA_PARAM_EnumFormat / SPA_PARAM_Format.
pub const object_format: u32 = 0x40003;
pub const param_enum_format: u32 = 3;
pub const param_format: u32 = 4;

/// Keys from spa/param/format.h.
const format_media_type: u32 = 1;
const format_media_subtype: u32 = 2;
const format_audio_format: u32 = 0x10001;
const format_audio_rate: u32 = 0x10003;
const format_audio_channels: u32 = 0x10004;
const format_audio_position: u32 = 0x10005;

/// SPA_MEDIA_TYPE_audio and SPA_MEDIA_SUBTYPE_raw.
const media_type_audio: u32 = 1;
const media_subtype_raw: u32 = 1;

/// Errors from encoding into caller storage or decoding untrusted bytes.
pub const Error = error{ BufferTooSmall, MalformedPod, UnsupportedFormat };

/// SPA_AUDIO_FORMAT_* identifiers (spa/param/audio/raw.h).
pub fn spa_format(format: audio.Format) u32 {
    return switch (format) {
        .unsigned8 => 258,
        .signed8 => 257,
        .signed16_le => 259,
        .signed16_be => 260,
        .signed32_le => 267,
        .signed32_be => 268,
        .float32_le => 283,
        .float32_be => 284,
    };
}

/// Inverse of `spa_format`; unknown identifiers are reported, not guessed.
pub fn native_format(value: u32) Error!audio.Format {
    return switch (value) {
        258 => .unsigned8,
        257 => .signed8,
        259 => .signed16_le,
        260 => .signed16_be,
        267 => .signed32_le,
        268 => .signed32_be,
        283 => .float32_le,
        284 => .float32_be,
        else => error.UnsupportedFormat,
    };
}

/// SPA_AUDIO_CHANNEL_* position for each standard speaker of a layout, in the
/// interleaving order used by `audio.Layout` (front-left first).
pub fn layout_positions(layout: audio.Layout) []const u32 {
    return switch (layout) {
        .mono => &.{2},
        .stereo => &.{ 3, 4 },
        .stereo_lfe => &.{ 3, 4, 6 },
        .quad => &.{ 3, 4, 12, 13 },
        .quad_lfe => &.{ 3, 4, 6, 12, 13 },
        .surround_5_1 => &.{ 3, 4, 5, 6, 12, 13 },
        .surround_6_1 => &.{ 3, 4, 5, 6, 11, 7, 8 },
        .surround_7_1 => &.{ 3, 4, 5, 6, 12, 13, 7, 8 },
    };
}

/// Writes pods into caller storage. Each `begin` returns the offset of the
/// header; `end` fills in the size and pads. Pods nest by calling `begin`
/// again before the parent is ended.
pub const Writer = struct {
    bytes: []u8,
    len: usize = 0,

    fn word(self: *Writer, value: u32) Error!void {
        if (self.bytes.len - self.len < 4) return error.BufferTooSmall;
        std.mem.writeInt(u32, self.bytes[self.len..][0..4], value, native_endian);
        self.len += 4;
    }

    /// Opens a pod of `pod_type`. The returned offset must be passed to `end`.
    pub fn begin(self: *Writer, pod_type: u32) Error!usize {
        const at = self.len;
        try self.word(0);
        try self.word(pod_type);
        return at;
    }

    /// Closes the pod opened at `at`: size excludes padding, then zero-fill to 8.
    pub fn end(self: *Writer, at: usize) Error!void {
        const body = self.len - at - 8;
        std.mem.writeInt(u32, self.bytes[at..][0..4], @intCast(body), native_endian);
        const padded = std.mem.alignForward(usize, self.len, 8);
        if (padded > self.bytes.len) return error.BufferTooSmall;
        @memset(self.bytes[self.len..padded], 0);
        self.len = padded;
    }

    /// Writes an Int pod.
    pub fn int(self: *Writer, value: i32) Error!void {
        const at = try self.begin(Type.int);
        try self.word(@bitCast(value));
        try self.end(at);
    }

    /// Writes an Id pod.
    pub fn id(self: *Writer, value: u32) Error!void {
        const at = try self.begin(Type.id);
        try self.word(value);
        try self.end(at);
    }

    /// Writes an Enum choice of allowed Ids, preferred first. SPA stores the
    /// default separately from the allowed list, so the first Id is emitted
    /// twice. A singleton input therefore still permits its default.
    pub fn id_enum(self: *Writer, values: []const u32) Error!void {
        std.debug.assert(values.len != 0);
        const at = try self.begin(Type.choice);
        try self.word(choice_enum);
        try self.word(0);
        try self.word(4);
        try self.word(Type.id);
        try self.word(values[0]);
        for (values) |value| try self.word(value);
        try self.end(at);
    }

    /// Writes an Array of Ids (used for channel positions).
    pub fn id_array(self: *Writer, values: []const u32) Error!void {
        const at = try self.begin(Type.array);
        try self.word(4);
        try self.word(Type.id);
        for (values) |value| try self.word(value);
        try self.end(at);
    }

    /// Writes an EnumFormat object describing raw audio. `formats` lists the
    /// acceptable sample formats, preferred first; `positions` lists channel
    /// positions and must have one entry per channel.
    pub fn enum_format(self: *Writer, formats: []const audio.Format, sample_rate: u32, channels: u16, positions: []const u32) Error!void {
        std.debug.assert(formats.len != 0);
        const at = try self.begin(Type.object);
        try self.word(object_format);
        try self.word(param_enum_format);

        try self.property(format_media_type);
        try self.id(media_type_audio);
        try self.property(format_media_subtype);
        try self.id(media_subtype_raw);

        var ids: [8]u32 = undefined;
        if (formats.len > ids.len) return error.UnsupportedFormat;
        for (formats, ids[0..formats.len]) |format, *slot| slot.* = spa_format(format);
        try self.property(format_audio_format);
        try self.id_enum(ids[0..formats.len]);

        try self.property(format_audio_rate);
        try self.int(@intCast(sample_rate));
        try self.property(format_audio_channels);
        try self.int(@intCast(channels));
        if (positions.len != 0) {
            try self.property(format_audio_position);
            try self.id_array(positions);
        }
        try self.end(at);
    }

    /// Starts an object property: key and zero flags. A value pod follows.
    fn property(self: *Writer, key: u32) Error!void {
        try self.word(key);
        try self.word(0);
    }
};

/// Writes an EnumFormat param into `storage` and returns the filled prefix.
/// `positions` are SPA channel positions (see `layout_positions`); pass an
/// empty slice to leave positions to the negotiated stream.
pub fn build_enum_format(storage: []u8, formats: []const audio.Format, sample_rate: u32, channels: u16, positions: []const u32) Error![]const u8 {
    var writer: Writer = .{ .bytes = storage };
    try writer.enum_format(formats, sample_rate, channels, positions);
    return storage[0..writer.len];
}

/// Sample format, rate and channels read from a negotiated Format param.
pub const Negotiated = struct {
    format: audio.Format,
    sample_rate: u32,
    channels: u16,
};

/// Decodes a Format object as delivered by a stream's `param_changed` event.
/// Only raw audio is accepted. Choice values use their default (first) entry.
pub fn read_format(bytes: []const u8) Error!Negotiated {
    if (bytes.len < 16) return error.MalformedPod;
    if (read_word(bytes, 4) != Type.object) return error.MalformedPod;
    const body = pod_body(bytes) orelse return error.MalformedPod;
    if (body.len < 8) return error.MalformedPod;
    if (read_word(body, 0) != object_format) return error.MalformedPod;

    var format: ?audio.Format = null;
    var rate: ?u32 = null;
    var channels: ?u16 = null;
    var media_ok = false;
    var cursor: usize = 8;
    while (cursor + 8 <= body.len) {
        const key = read_word(body, cursor);
        const value_at = cursor + 8;
        if (value_at + 8 > body.len) return error.MalformedPod;
        const value = pod_at(body, value_at) orelse return error.MalformedPod;
        switch (key) {
            format_media_type => media_ok = (default_id(value) orelse 0) == media_type_audio,
            format_media_subtype => {
                if ((default_id(value) orelse 0) != media_subtype_raw) return error.UnsupportedFormat;
            },
            format_audio_format => format = try native_format(default_id(value) orelse return error.MalformedPod),
            format_audio_rate => rate = @intCast(default_int(value) orelse return error.MalformedPod),
            format_audio_channels => channels = @intCast(default_int(value) orelse return error.MalformedPod),
            else => {},
        }
        cursor = value_at + 8 + std.mem.alignForward(usize, value.value.len, 8);
    }
    if (!media_ok) return error.UnsupportedFormat;
    return .{
        .format = format orelse return error.MalformedPod,
        .sample_rate = rate orelse return error.MalformedPod,
        .channels = channels orelse return error.MalformedPod,
    };
}

fn read_word(bytes: []const u8, at: usize) u32 {
    return std.mem.readInt(u32, bytes[at..][0..4], native_endian);
}

/// Body slice of the pod at offset 0, or null when the header overruns.
fn pod_body(bytes: []const u8) ?[]const u8 {
    const size = read_word(bytes, 0);
    if (size > bytes.len - 8) return null;
    return bytes[8..][0..size];
}

/// Pod at `at` inside a parent body; its body is returned with its header
/// stripped, and the header's type is checked by the caller where needed.
fn pod_at(body: []const u8, at: usize) ?PodView {
    if (at + 8 > body.len) return null;
    const size = read_word(body, at);
    if (size > body.len - at - 8) return null;
    return .{ .type = read_word(body, at + 4), .value = body[at + 8 ..][0..size] };
}

const PodView = struct {
    type: u32,
    value: []const u8,
};

/// Id value of a pod, taking the default entry of a Choice.
fn default_id(pod: PodView) ?u32 {
    return default_word(pod, Type.id);
}

fn default_int(pod: PodView) ?i32 {
    const word = default_word(pod, Type.int) orelse return null;
    return @bitCast(word);
}

fn default_word(pod: PodView, expected: u32) ?u32 {
    if (pod.type == expected) {
        if (pod.value.len < 4) return null;
        return std.mem.readInt(u32, pod.value[0..4], native_endian);
    }
    if (pod.type != Type.choice) return null;
    // Choice body: kind, flags, child header (size, type), then elements.
    if (pod.value.len < 20) return null;
    if (read_word(pod.value, 12) != expected) return null;
    return read_word(pod.value, 16);
}

test "format round trip through the spa table" {
    try std.testing.expectEqual(audio.Format.float32_le, try native_format(spa_format(.float32_le)));
    try std.testing.expectError(error.UnsupportedFormat, native_format(0));
}
