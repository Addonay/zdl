//! Private FFmpeg binding for the player example.
//!
//! Nothing here links against FFmpeg. libavformat, libavcodec and libavutil are
//! opened with std.DynLib by their installed SONAMEs, and every function is
//! resolved by its C symbol name in `Library.open`. libswscale is optional and
//! only used as a fallback for pixel formats the native converter does not read.
//!
//! The installed libraries are FFmpeg 8.1.3 (libavutil 60.26.103,
//! libavcodec 62.28.103, libavformat 62.12.103). The struct layouts below were
//! measured against the 8.1.3 public headers with a C probe (offsetof/sizeof);
//! the comptime assertions at the end of this file keep them honest. Only the
//! fields this player reads or writes are named. Everything else is padding, and
//! the code never allocates these structs itself: it uses av_*_alloc.
const std = @import("std");
const builtin = @import("builtin");

pub const Error = error{ Unavailable, UnsupportedLibraryVersion, FfmpegFailed, OutOfMemory };

/// Opaque AVFormatContext, owned by libavformat.
pub const FormatContext = extern struct {
    _header: [44]u8,
    nb_streams: c_uint,
    streams: [*]*Stream,
    _timing: [40]u8,
    start_time: i64,
    duration: i64,
    _rest: [80]u8,
    metadata: ?*Dictionary,
};

/// AVStream prefix. `time_base` is in units of the container timeline.
pub const Stream = extern struct {
    _header: [8]u8,
    index: c_int,
    id: c_int,
    codecpar: *CodecParameters,
    _priv: [8]u8,
    time_base: Rational,
    start_time: i64,
    duration: i64,
    _counts: [8]u8,
    _disposition: [16]u8,
    metadata: ?*Dictionary,
};

/// AVCodecParameters prefix (codec description read from the demuxer).
pub const CodecParameters = extern struct {
    codec_type: CodecType,
    codec_id: c_int,
    _tag_and_extradata: [36]u8,
    format: c_int,
    _bitrate_and_sizes: [24]u8,
    width: c_int,
    height: c_int,
    _sample_aspect_and_pad: [48]u8,
    ch_layout: ChannelLayout,
    sample_rate: c_int,
};

pub const ChannelLayout = extern struct {
    order: c_int,
    nb_channels: c_int,
    _u: [8]u8,
    opaque_ptr: ?*anyopaque,
};

pub const Rational = extern struct {
    num: c_int,
    den: c_int,

    /// av_q2d: the rational as a float, zero for an invalid denominator.
    pub fn to_f64(self: Rational) f64 {
        if (self.den == 0) return 0;
        return @as(f64, @floatFromInt(self.num)) / @as(f64, @floatFromInt(self.den));
    }
};

/// AVPacket prefix. Packets are allocated with av_packet_alloc.
pub const Packet = extern struct {
    buf: ?*anyopaque,
    pts: i64,
    dts: i64,
    data: ?[*]u8,
    size: c_int,
    stream_index: c_int,
    flags: c_int,
    _rest: [60]u8,
};

/// AVFrame prefix. Frames are allocated with av_frame_alloc; sample planes are in
/// `extended_data` (one pointer per plane, which is one for interleaved audio).
pub const Frame = extern struct {
    data: [8]?[*]u8,
    linesize: [8]c_int,
    extended_data: ?[*][*]u8,
    width: c_int,
    height: c_int,
    nb_samples: c_int,
    format: c_int,
    _pts_region: [16]u8,
    pts: i64,
    pkt_dts: i64,
    time_base: Rational,
    _rate_region: [20]u8,
    sample_rate: c_int,
    _flags_region: [92]u8,
    flags: c_int,
    color_range: c_int,
    _spaces: [8]u8,
    colorspace: c_int,
    _more: [8]u8,
    best_effort_timestamp: i64,
    _layout_region: [72]u8,
    ch_layout: ChannelLayout,
    duration: i64,
};

pub const Dictionary = opaque {};
pub const DictionaryEntry = extern struct {
    key: [*:0]u8,
    value: [*:0]u8,
};
pub const Codec = opaque {};
pub const CodecContext = opaque {};
pub const SwsContext = opaque {};

/// AVMediaType, AVCodecID-independent part.
pub const CodecType = enum(c_int) { video = 0, audio = 1, subtitle = 3, _ };

/// AVPixelFormat values used by the player (FFmpeg 8.1.3 numbering).
pub const PixelFormat = enum(c_int) {
    yuv420p = 0,
    yuyv422 = 1,
    rgb24 = 2,
    yuv422p = 4,
    yuv444p = 5,
    rgba = 26,
    nv12 = 23,
    nv21 = 24,
    uyvy422 = 15,
    yuv420p10le = 62,
    yuv422p10le = 64,
    yuv444p10le = 68,
    p010le = 158,
    _,
};

/// AVSampleFormat values (FFmpeg 8.1.3 numbering).
pub const SampleFormat = enum(c_int) {
    none = -1,
    u8 = 0,
    s16 = 1,
    s32 = 2,
    flt = 3,
    dbl = 4,
    u8p = 5,
    s16p = 6,
    s32p = 7,
    fltp = 8,
    dblp = 9,
    s64 = 10,
    s64p = 11,
    _,
};

/// AVColorRange and AVColorSpace values the encoding choice depends on.
pub const color_range_mpeg: c_int = 1;
pub const color_range_jpeg: c_int = 2;
pub const color_space_bt709: c_int = 1;
pub const color_space_bt2020_ncl: c_int = 9;

pub const nopts_value: i64 = std.math.minInt(i64);
pub const seek_flag_backward: c_int = 1;
pub const error_eof: c_int = -541478725;
pub const error_again: c_int = -11;
const sws_bilinear: c_int = 2;

const FormatFunctions = struct {
    avformat_open_input: *const fn (*?*FormatContext, [*:0]const u8, ?*const anyopaque, ?*?*Dictionary) callconv(.c) c_int,
    avformat_find_stream_info: *const fn (*FormatContext, ?*?*Dictionary) callconv(.c) c_int,
    avformat_close_input: *const fn (*?*FormatContext) callconv(.c) void,
    av_read_frame: *const fn (*FormatContext, *Packet) callconv(.c) c_int,
    av_seek_frame: *const fn (*FormatContext, c_int, i64, c_int) callconv(.c) c_int,
};

const CodecFunctions = struct {
    avcodec_find_decoder: *const fn (c_int) callconv(.c) ?*const Codec,
    avcodec_alloc_context3: *const fn (?*const Codec) callconv(.c) ?*CodecContext,
    avcodec_parameters_to_context: *const fn (*CodecContext, *const CodecParameters) callconv(.c) c_int,
    avcodec_open2: *const fn (*CodecContext, ?*const Codec, ?*?*Dictionary) callconv(.c) c_int,
    avcodec_free_context: *const fn (*?*CodecContext) callconv(.c) void,
    avcodec_send_packet: *const fn (*CodecContext, ?*const Packet) callconv(.c) c_int,
    avcodec_receive_frame: *const fn (*CodecContext, *Frame) callconv(.c) c_int,
    avcodec_flush_buffers: *const fn (*CodecContext) callconv(.c) void,
    avcodec_get_name: *const fn (c_int) callconv(.c) [*:0]const u8,
    av_packet_alloc: *const fn () callconv(.c) ?*Packet,
    av_packet_free: *const fn (*?*Packet) callconv(.c) void,
    av_packet_unref: *const fn (*Packet) callconv(.c) void,
};

const UtilFunctions = struct {
    av_frame_alloc: *const fn () callconv(.c) ?*Frame,
    av_frame_free: *const fn (*?*Frame) callconv(.c) void,
    av_frame_unref: *const fn (*Frame) callconv(.c) void,
    av_dict_get: *const fn (?*const Dictionary, [*:0]const u8, ?*const DictionaryEntry, c_int) callconv(.c) ?*DictionaryEntry,
    av_strerror: *const fn (c_int, [*]u8, usize) callconv(.c) c_int,
};

pub const ScaleFunctions = struct {
    sws_getContext: *const fn (c_int, c_int, c_int, c_int, c_int, c_int, c_int, ?*anyopaque, ?*anyopaque, ?*const f64) callconv(.c) ?*SwsContext,
    sws_scale: *const fn (*SwsContext, [*]const [*]const u8, [*]const c_int, c_int, c_int, [*]const [*]u8, [*]const c_int) callconv(.c) c_int,
    sws_freeContext: *const fn (*SwsContext) callconv(.c) void,
};

/// Loaded FFmpeg libraries with every required function resolved. `scale` is
/// null when libswscale is not installed; the player then reports an unsupported
/// format for anything the native converter cannot read.
pub const Library = struct {
    format_handle: std.DynLib,
    codec_handle: std.DynLib,
    util_handle: std.DynLib,
    scale_handle: ?std.DynLib,
    format: FormatFunctions,
    codec: CodecFunctions,
    util: UtilFunctions,
    scale: ?ScaleFunctions,

    /// Loads the installed FFmpeg 8 libraries. Any missing library or symbol is
    /// `error.Unavailable`; the caller decides whether that is fatal.
    pub fn open() error{ Unavailable, UnsupportedLibraryVersion }!Library {
        if (builtin.target.os.tag != .linux) @compileError("the player's FFmpeg loader targets Linux");
        if (!builtin.link_libc) @compileError("the player's FFmpeg loader requires link_libc = true");
        var format_handle = std.DynLib.open("libavformat.so.62") catch return error.Unavailable;
        errdefer format_handle.close();
        var codec_handle = std.DynLib.open("libavcodec.so.62") catch return error.Unavailable;
        errdefer codec_handle.close();
        var util_handle = std.DynLib.open("libavutil.so.60") catch return error.Unavailable;
        errdefer util_handle.close();
        // The prefix offsets below were measured against these precise headers.
        // Reject an unverified ABI before reading any library-owned record.
        const Version = *const fn () callconv(.c) c_uint;
        const format_version = format_handle.lookup(Version, "avformat_version") orelse return error.Unavailable;
        const codec_version = codec_handle.lookup(Version, "avcodec_version") orelse return error.Unavailable;
        const util_version = util_handle.lookup(Version, "avutil_version") orelse return error.Unavailable;
        if (format_version() != (62 << 16 | 12 << 8 | 103) or
            codec_version() != (62 << 16 | 28 << 8 | 103) or
            util_version() != (60 << 16 | 26 << 8 | 103)) return error.UnsupportedLibraryVersion;

        var scale_handle: ?std.DynLib = std.DynLib.open("libswscale.so.9") catch null;
        errdefer if (scale_handle) |*handle| handle.close();

        var scale: ?ScaleFunctions = null;
        if (scale_handle) |*handle| scale = load(ScaleFunctions, handle) catch null;

        return .{
            .format_handle = format_handle,
            .codec_handle = codec_handle,
            .util_handle = util_handle,
            .scale_handle = scale_handle,
            .format = try load(FormatFunctions, &format_handle),
            .codec = try load(CodecFunctions, &codec_handle),
            .util = try load(UtilFunctions, &util_handle),
            .scale = scale,
        };
    }

    /// Unloads the libraries. Function pointers and buffers from them become invalid.
    pub fn deinit(self: *Library) void {
        self.format_handle.close();
        self.codec_handle.close();
        self.util_handle.close();
        if (self.scale_handle) |*handle| handle.close();
        self.* = undefined;
    }

    /// Converts an FFmpeg return code to an error, keeping the text for the caller.
    pub fn check(self: *const Library, code: c_int, message: *Message) Error!void {
        if (code >= 0) return;
        message.* = self.describe(code);
        return error.FfmpegFailed;
    }

    /// Human-readable text for an FFmpeg error code (av_strerror).
    pub fn describe(self: *const Library, code: c_int) Message {
        var message: Message = .{};
        const result = self.util.av_strerror(code, &message.bytes, message.bytes.len);
        if (result < 0) {
            const text = std.fmt.bufPrint(&message.bytes, "ffmpeg error {d}", .{code}) catch "ffmpeg error";
            message.len = text.len;
        } else {
            message.len = std.mem.indexOfScalar(u8, &message.bytes, 0) orelse message.bytes.len;
        }
        return message;
    }

    /// Codec name for a codec id (avcodec_get_name). Static storage in FFmpeg.
    pub fn codec_name(self: *const Library, codec_id: c_int) []const u8 {
        return std.mem.span(self.codec.avcodec_get_name(codec_id));
    }

    /// Reads a metadata value by key; the returned slice belongs to FFmpeg's dictionary.
    pub fn metadata_value(self: *const Library, dictionary: ?*const Dictionary, key: [:0]const u8) ?[]const u8 {
        const entry = self.util.av_dict_get(dictionary, key.ptr, null, 0) orelse return null;
        return std.mem.span(entry.value);
    }
};

/// Fixed-size error text buffer; no allocation.
pub const Message = struct {
    bytes: [160]u8 = undefined,
    len: usize = 0,

    pub fn slice(self: *const Message) []const u8 {
        return self.bytes[0..self.len];
    }
};

fn load(comptime T: type, handle: *std.DynLib) error{Unavailable}!T {
    var table: T = undefined;
    const info = @typeInfo(T).@"struct";
    inline for (info.field_names, info.field_types) |name, Field| {
        @field(table, name) = handle.lookup(Field, name) orelse return error.Unavailable;
    }
    return table;
}

comptime {
    // Offsets measured with the FFmpeg 8.1.3 headers (see the module comment).
    std.debug.assert(@offsetOf(FormatContext, "nb_streams") == 44);
    std.debug.assert(@offsetOf(FormatContext, "streams") == 48);
    std.debug.assert(@offsetOf(FormatContext, "start_time") == 96);
    std.debug.assert(@offsetOf(FormatContext, "duration") == 104);
    std.debug.assert(@offsetOf(FormatContext, "metadata") == 192);
    std.debug.assert(@offsetOf(Stream, "index") == 8);
    std.debug.assert(@offsetOf(Stream, "codecpar") == 16);
    std.debug.assert(@offsetOf(Stream, "time_base") == 32);
    std.debug.assert(@offsetOf(Stream, "start_time") == 40);
    std.debug.assert(@offsetOf(Stream, "duration") == 48);
    std.debug.assert(@offsetOf(Stream, "metadata") == 80);
    std.debug.assert(@offsetOf(CodecParameters, "codec_type") == 0);
    std.debug.assert(@offsetOf(CodecParameters, "codec_id") == 4);
    std.debug.assert(@offsetOf(CodecParameters, "format") == 44);
    std.debug.assert(@offsetOf(CodecParameters, "width") == 72);
    std.debug.assert(@offsetOf(CodecParameters, "height") == 76);
    std.debug.assert(@offsetOf(CodecParameters, "ch_layout") == 128);
    std.debug.assert(@offsetOf(CodecParameters, "sample_rate") == 152);
    std.debug.assert(@sizeOf(ChannelLayout) == 24);
    std.debug.assert(@offsetOf(ChannelLayout, "nb_channels") == 4);
    std.debug.assert(@offsetOf(Packet, "pts") == 8);
    std.debug.assert(@offsetOf(Packet, "data") == 24);
    std.debug.assert(@offsetOf(Packet, "size") == 32);
    std.debug.assert(@offsetOf(Packet, "stream_index") == 36);
    std.debug.assert(@offsetOf(Packet, "flags") == 40);
    std.debug.assert(@sizeOf(Packet) == 104);
    std.debug.assert(@offsetOf(Frame, "linesize") == 64);
    std.debug.assert(@offsetOf(Frame, "extended_data") == 96);
    std.debug.assert(@offsetOf(Frame, "width") == 104);
    std.debug.assert(@offsetOf(Frame, "nb_samples") == 112);
    std.debug.assert(@offsetOf(Frame, "format") == 116);
    std.debug.assert(@offsetOf(Frame, "pts") == 136);
    std.debug.assert(@offsetOf(Frame, "time_base") == 152);
    std.debug.assert(@offsetOf(Frame, "sample_rate") == 180);
    std.debug.assert(@offsetOf(Frame, "flags") == 276);
    std.debug.assert(@offsetOf(Frame, "color_range") == 280);
    std.debug.assert(@offsetOf(Frame, "colorspace") == 292);
    std.debug.assert(@offsetOf(Frame, "best_effort_timestamp") == 304);
    std.debug.assert(@offsetOf(Frame, "ch_layout") == 384);
    std.debug.assert(@offsetOf(Frame, "duration") == 408);
    std.debug.assert(@sizeOf(DictionaryEntry) == 16);
}
