//! Media playback core: demuxing, decoding, A/V synchronisation and seeking.
//!
//! Pipeline (all stages are plain threads that talk through bounded queues):
//!
//!   demux thread ──packets──▶ video decode thread ──pictures──┐
//!        │                                                    ├─▶ Player.update (caller's thread)
//!        └──packets──▶ audio decode thread ──PCM chunks──────┘     feeds zdl.audio, selects pictures
//!
//! The caller's thread (the one calling `update`) owns the audio device, the
//! clock, the converter and the picture selection. Decoder threads never touch
//! them. Audio is the master clock when a device is available (see clock.zig);
//! otherwise the wall clock is.
//!
//! Seeking: `seek` bumps an atomic serial and posts a request. The demux thread
//! seeks the container, then sends a `flush` message down both packet queues.
//! Every message carries the serial it was produced under, so anything older is
//! dropped at each stage. Decoder state is flushed when the flush arrives.
//!
//! Errors: a fatal error in any thread is recorded once, the queues close, and
//! the next `update` reports it as `Event.failed`. Single bad packets are skipped.
const std = @import("std");
const zdl = @import("zdl");
const ffmpeg = @import("ffmpeg.zig");
const queue_module = @import("queue.zig");
const clock_module = @import("clock.zig");
const video = @import("video.zig");
const sink_module = @import("sink.zig");

const audio = zdl.audio;
const surface = zdl.surface;

const PacketMessage = queue_module.Message(*ffmpeg.Packet);
const PictureMessage = queue_module.Message(Picture);
const ChunkMessage = queue_module.Message(Chunk);

const video_packet_capacity = 128;
const audio_packet_capacity = 256;
const picture_capacity = 4;
const chunk_capacity = 64;
/// Input bytes kept queued in the audio stream; the decoder blocks beyond this.
const audio_queue_bytes = 128 * 1024;
const av_time_base = 1_000_000.0;
/// Hold the last picture this long after its timestamp before ending playback.
const assumed_frame_seconds = 1.0 / 30.0;

/// Sentinel: a stage stopped because the pipeline is shutting down.
const Stopped = error{Stopped};

pub const TrackKind = enum { video, audio, subtitle };

/// One elementary stream of the container, as the UI lists it.
pub const Track = struct {
    kind: TrackKind,
    stream_index: usize,
    codec: []const u8,
    language: ?[]const u8,
    channels: u16 = 0,
    sample_rate: u32 = 0,
    width: u31 = 0,
    height: u31 = 0,
};

pub const Metadata = struct {
    title: ?[]const u8,
    duration_seconds: f64,
    width: u31,
    height: u31,
    video_codec: ?[]const u8,
    audio_codec: ?[]const u8,
};

pub const Event = union(enum) {
    ended,
    failed: anyerror,
};

/// A decoded picture, borrowed from the player until the next `update`.
pub const Frame = struct {
    raw: *const ffmpeg.Frame,
    seconds: f64,

    pub fn width(self: Frame) usize {
        return @intCast(self.raw.width);
    }

    pub fn height(self: Frame) usize {
        return @intCast(self.raw.height);
    }
};

const StreamInfo = struct {
    index: c_int,
    codec_id: c_int,
    codecpar: *ffmpeg.CodecParameters,
    time_base: f64,
};

const Picture = struct {
    frame: *ffmpeg.Frame,
    seconds: f64,
};

const Chunk = struct {
    bytes: []u8,
    seconds: f64,
    format: audio.Format,
    sample_rate: u32,
};

/// State shared between the caller and the demux thread.
const Shared = struct {
    mutex: std.Io.Mutex = .init,
    wake: std.Io.Condition = .init,
    stop: bool = false,
    seek_request: ?f64 = null,
    failure: ?anyerror = null,
    failure_message: ffmpeg.Message = .{},
};

/// Playback handle. Allocated by `open` and released by `close`; threads hold
/// its address, so it never moves after `open` returns.
pub const Player = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    library: ffmpeg.Library,
    path: [:0]u8,
    context: ?*ffmpeg.FormatContext = null,
    video: ?StreamInfo = null,
    audio: ?StreamInfo = null,
    width: u31 = 0,
    height: u31 = 0,
    duration_seconds: f64 = 0,
    title: ?[]u8 = null,
    track_list: []Track = &.{},

    serial: std.atomic.Value(u32) = .init(0),
    shared: Shared = .{},
    video_packets: queue_module.Queue(PacketMessage) = .{ .items = &.{} },
    audio_packets: queue_module.Queue(PacketMessage) = .{ .items = &.{} },
    pictures: queue_module.Queue(PictureMessage) = .{ .items = &.{} },
    chunks: queue_module.Queue(ChunkMessage) = .{ .items = &.{} },
    demux_thread: ?std.Thread = null,
    video_thread: ?std.Thread = null,
    audio_thread: ?std.Thread = null,

    // Consumer state: touched only by the thread that calls the public methods.
    clock: clock_module.Clock = .wall(),
    sink: ?*sink_module.Sink = null,
    converter: video.Converter,
    accepted_frames: u64 = 0,
    paused: bool = false,
    pause_needs_seek: bool = false,
    hardware_paused: bool = false,
    seek_floor: f64 = 0,
    ended: bool = false,
    failed: bool = false,
    volume: f32 = 1,
    muted: bool = false,
    pending: ?Picture = null,
    current: ?Picture = null,
    video_eof: bool = false,
    audio_eof: bool = false,
    events: [4]Event = undefined,
    event_count: usize = 0,
    last_error: ffmpeg.Message = .{},

    /// Opens `path`, starts demuxing and decoding, and begins playback.
    /// `error.Unavailable` means the FFmpeg libraries are not installed.
    pub fn open(allocator: std.mem.Allocator, io: std.Io, path: []const u8) !*Player {
        var library = try ffmpeg.Library.open();
        const path_z = allocator.dupeSentinel(u8, path, 0) catch |err| {
            library.deinit();
            return err;
        };
        const self = allocator.create(Player) catch |err| {
            allocator.free(path_z);
            library.deinit();
            return err;
        };
        self.* = .{
            .allocator = allocator,
            .io = io,
            .library = library,
            .path = path_z,
            .converter = undefined,
        };
        self.converter = video.Converter.init(allocator, &self.library);
        // From here on `close` releases everything, including the library.
        errdefer self.close();
        try self.open_container();
        try self.open_outputs();
        try self.start_threads();
        self.clock.set_running(true, 0, self.now());
        return self;
    }

    /// Stops every thread and releases all resources. The pointer is invalid after.
    pub fn close(self: *Player) void {
        const io = self.io;
        self.shared.mutex.lockUncancelable(io);
        self.shared.stop = true;
        self.shared.wake.broadcast(io);
        self.shared.mutex.unlock(io);
        self.close_queues();
        if (self.demux_thread) |thread| thread.join();
        if (self.video_thread) |thread| thread.join();
        if (self.audio_thread) |thread| thread.join();

        self.video_packets.drain(io, self, dispose_packet);
        self.audio_packets.drain(io, self, dispose_packet);
        self.pictures.drain(io, self, dispose_picture);
        self.chunks.drain(io, self, dispose_chunk);
        if (self.pending) |picture| self.free_picture(picture);
        if (self.current) |picture| self.free_picture(picture);
        self.converter.deinit();
        if (self.sink) |sink| sink.close();
        if (self.context) |context| {
            var handle: ?*ffmpeg.FormatContext = context;
            self.library.format.avformat_close_input(&handle);
        }
        self.video_packets.deinit(self.allocator);
        self.audio_packets.deinit(self.allocator);
        self.pictures.deinit(self.allocator);
        self.chunks.deinit(self.allocator);
        for (self.track_list) |track| {
            self.allocator.free(track.codec);
            if (track.language) |language| self.allocator.free(language);
        }
        if (self.track_list.len != 0) self.allocator.free(self.track_list);
        if (self.title) |title| self.allocator.free(title);
        self.allocator.free(self.path);
        self.library.deinit();
        self.allocator.destroy(self);
    }

    /// Consumer step, called once per display frame. Feeds audio, pumps the
    /// device, chooses the picture for the current time and detects the end.
    pub fn update(self: *Player) !void {
        if (self.failed) return;
        if (self.reported_failure()) |err| {
            self.failed = true;
            self.push_event(.{ .failed = err });
            return;
        }
        if (self.ended) return;
        if (!self.paused) try self.feed_audio();
        const time = self.position();
        try self.show_pictures(time);
        self.check_end(time);
    }

    /// Next pending event, oldest first.
    pub fn poll_event(self: *Player) ?Event {
        if (self.event_count == 0) return null;
        const event = self.events[0];
        std.mem.copyForwards(Event, self.events[0 .. self.event_count - 1], self.events[1..self.event_count]);
        self.event_count -= 1;
        return event;
    }

    pub fn play(self: *Player) !void {
        if (!self.paused) return;
        if (self.ended) try self.seek(0);
        if (self.pause_needs_seek) {
            try self.seek(self.position());
            self.pause_needs_seek = false;
        } else if (self.hardware_paused) {
            if (self.sink) |sink| if (!sink.set_paused(false)) try self.seek(self.position());
        }
        self.hardware_paused = false;
        self.paused = false;
        self.clock.set_running(true, self.accepted_frames, self.now());
    }

    pub fn pause(self: *Player) void {
        if (self.paused) return;
        self.clock.set_running(false, self.accepted_frames, self.now());
        self.paused = true;
        if (self.sink) |sink| {
            self.hardware_paused = sink.set_paused(true);
            self.pause_needs_seek = !self.hardware_paused;
        }
    }

    pub fn toggle_pause(self: *Player) !void {
        if (self.paused) try self.play() else self.pause();
    }

    pub fn is_paused(self: *const Player) bool {
        return self.paused;
    }

    /// Moves to `seconds` (clamped to the media). Playback state is kept.
    pub fn seek(self: *Player, seconds: f64) !void {
        if (!std.math.isFinite(seconds)) return error.InvalidSeek;
        const upper = if (self.duration_seconds > 0) self.duration_seconds else std.math.inf(f64);
        const target = std.math.clamp(seconds, 0, upper);
        self.seek_floor = target;
        const io = self.io;
        _ = self.serial.fetchAdd(1, .acq_rel);
        self.shared.mutex.lockUncancelable(io);
        self.shared.seek_request = target;
        self.shared.wake.broadcast(io);
        self.shared.mutex.unlock(io);

        if (self.sink) |sink| try sink.clear();
        self.hardware_paused = false;
        self.pause_needs_seek = false;
        if (self.pending) |picture| {
            self.free_picture(picture);
            self.pending = null;
        }
        self.video_eof = false;
        self.audio_eof = false;
        self.ended = false;
        self.clock.seek(target, self.accepted_frames, self.now());
    }

    /// Current media time in seconds.
    pub fn position(self: *Player) f64 {
        return self.clock.position(self.accepted_frames, self.now());
    }

    pub fn duration(self: *const Player) f64 {
        return self.duration_seconds;
    }

    /// Sets the output volume in [0, 1]. Muting keeps the level for unmute.
    pub fn set_volume(self: *Player, volume: f32) !void {
        self.volume = std.math.clamp(volume, 0, 1);
        try self.apply_gain();
    }

    pub fn get_volume(self: *const Player) f32 {
        return self.volume;
    }

    pub fn set_muted(self: *Player, muted: bool) !void {
        self.muted = muted;
        try self.apply_gain();
    }

    pub fn is_muted(self: *const Player) bool {
        return self.muted;
    }

    /// Container tracks: the first video and audio streams play; all are listed.
    pub fn tracks(self: *const Player) []const Track {
        return self.track_list;
    }

    pub fn metadata(self: *const Player) Metadata {
        return .{
            .title = self.title,
            .duration_seconds = self.duration_seconds,
            .width = self.width,
            .height = self.height,
            .video_codec = if (self.video) |info| self.library.codec_name(info.codec_id) else null,
            .audio_codec = if (self.audio) |info| self.library.codec_name(info.codec_id) else null,
        };
    }

    /// Picture to show now, borrowed until the next `update`.
    pub fn current_frame(self: *const Player) ?Frame {
        const picture = self.current orelse return null;
        return .{ .raw = picture.frame, .seconds = picture.seconds };
    }

    /// Draws the current picture letterboxed into `destination` (RGBA8).
    /// Returns false when no picture is available yet.
    pub fn draw(self: *Player, destination: surface.View) !bool {
        const frame = self.current_frame() orelse return false;
        try self.converter.draw(frame.raw, destination);
        return true;
    }

    /// Text of the last FFmpeg error, if playback failed inside FFmpeg.
    pub fn last_error_text(self: *const Player) []const u8 {
        return self.last_error.slice();
    }

    // ---- open helpers --------------------------------------------------

    fn open_container(self: *Player) !void {
        const lib = &self.library;
        var context: ?*ffmpeg.FormatContext = null;
        try self.check_open(lib.format.avformat_open_input(&context, self.path.ptr, null, null));
        self.context = context;
        const ctx = context.?;
        try self.check_open(lib.format.avformat_find_stream_info(ctx, null));

        var list: std.ArrayList(Track) = .empty;
        errdefer {
            for (list.items) |track| {
                self.allocator.free(track.codec);
                if (track.language) |language| self.allocator.free(language);
            }
            list.deinit(self.allocator);
        }
        for (0..ctx.nb_streams) |index| {
            const stream = ctx.streams[index];
            const params = stream.codecpar;
            const kind: ?TrackKind = switch (@as(ffmpeg.CodecType, params.codec_type)) {
                .video => .video,
                .audio => .audio,
                .subtitle => .subtitle,
                else => null,
            };
            const track_kind = kind orelse continue;
            const info: StreamInfo = .{ .index = stream.index, .codec_id = params.codec_id, .codecpar = params, .time_base = stream.time_base.to_f64() };
            switch (track_kind) {
                .video => if (self.video == null) {
                    self.video = info;
                    self.width = @intCast(params.width);
                    self.height = @intCast(params.height);
                },
                .audio => if (self.audio == null) {
                    self.audio = info;
                },
                .subtitle => {},
            }
            const codec = try self.allocator.dupe(u8, self.library.codec_name(params.codec_id));
            errdefer self.allocator.free(codec);
            const language_text = lib.metadata_value(stream.metadata, "language");
            const language: ?[]u8 = if (language_text) |text| try self.allocator.dupe(u8, text) else null;
            errdefer if (language) |text| self.allocator.free(text);
            try list.append(self.allocator, .{
                .kind = track_kind,
                .stream_index = @intCast(stream.index),
                .codec = codec,
                .language = language,
                .channels = @intCast(params.ch_layout.nb_channels),
                .sample_rate = @intCast(params.sample_rate),
                .width = @intCast(params.width),
                .height = @intCast(params.height),
            });
        }
        if (self.video == null and self.audio == null) return error.NoStreams;
        self.track_list = try list.toOwnedSlice(self.allocator);

        if (ctx.duration != ffmpeg.nopts_value and ctx.duration > 0) {
            self.duration_seconds = @as(f64, @floatFromInt(ctx.duration)) / av_time_base;
        }
        if (lib.metadata_value(ctx.metadata, "title")) |title| {
            self.title = try self.allocator.dupe(u8, title);
        }
    }

    fn open_outputs(self: *Player) !void {
        if (self.audio) |info| {
            const channels: u16 = @intCast(info.codecpar.ch_layout.nb_channels);
            const opened: ?*sink_module.Sink = sink_module.Sink.open(self.allocator, channels) catch |err| blk: {
                // No ALSA: keep playing against the wall clock and drop the audio.
                if (err != error.Unavailable) return err;
                std.debug.print("audio output unavailable; playing video on the wall clock\n", .{});
                break :blk null;
            };
            if (opened) |device| {
                self.sink = device;
                self.clock = clock_module.Clock.audio(device.rate(), @intCast(device.buffer_frames()));
                try self.apply_gain();
            } else {
                self.audio = null;
            }
        }
        if (self.sink == null) self.clock = clock_module.Clock.wall();
    }

    fn apply_gain(self: *Player) !void {
        if (self.sink) |sink| try sink.set_gain(if (self.muted) 0 else self.volume);
    }

    fn start_threads(self: *Player) !void {
        try self.allocate_queues();
        self.demux_thread = try std.Thread.spawn(.{}, demux_main, .{self});
        if (self.video != null) self.video_thread = try std.Thread.spawn(.{}, video_main, .{self});
        if (self.audio != null) self.audio_thread = try std.Thread.spawn(.{}, audio_main, .{self});
    }

    fn allocate_queues(self: *Player) !void {
        self.video_packets = try queue_module.Queue(PacketMessage).init(self.allocator, video_packet_capacity);
        self.audio_packets = try queue_module.Queue(PacketMessage).init(self.allocator, audio_packet_capacity);
        self.pictures = try queue_module.Queue(PictureMessage).init(self.allocator, picture_capacity);
        self.chunks = try queue_module.Queue(ChunkMessage).init(self.allocator, chunk_capacity);
    }

    fn check_open(self: *Player, code: c_int) !void {
        if (code >= 0) return;
        self.last_error = self.library.describe(code);
        return error.OpenFailed;
    }

    // ---- shared state and shutdown ---------------------------------------

    fn now(self: *const Player) i96 {
        return std.Io.Clock.awake.now(self.io).nanoseconds;
    }

    fn close_queues(self: *Player) void {
        const io = self.io;
        self.video_packets.close(io);
        self.audio_packets.close(io);
        self.pictures.close(io);
        self.chunks.close(io);
    }

    /// Records the first fatal error and stops every stage.
    fn fail(self: *Player, err: anyerror, message: ?ffmpeg.Message) void {
        const io = self.io;
        self.shared.mutex.lockUncancelable(io);
        if (self.shared.failure == null) {
            self.shared.failure = err;
            if (message) |text| self.shared.failure_message = text;
        }
        self.shared.stop = true;
        self.shared.wake.broadcast(io);
        self.shared.mutex.unlock(io);
        self.close_queues();
    }

    /// Reports an FFmpeg return code as the failure of the current stage.
    fn ffmpeg_fail(self: *Player, code: c_int) anyerror {
        self.fail(error.FfmpegFailed, self.library.describe(code));
        return error.FfmpegFailed;
    }

    fn reported_failure(self: *Player) ?anyerror {
        const io = self.io;
        self.shared.mutex.lockUncancelable(io);
        defer self.shared.mutex.unlock(io);
        if (self.shared.failure) |err| {
            self.last_error = self.shared.failure_message;
            return err;
        }
        return null;
    }

    fn push_event(self: *Player, event: Event) void {
        if (self.event_count == self.events.len) return;
        self.events[self.event_count] = event;
        self.event_count += 1;
    }

    fn free_picture(self: *Player, picture: Picture) void {
        var frame: ?*ffmpeg.Frame = picture.frame;
        self.library.util.av_frame_free(&frame);
    }

    fn dispose_packet(self: *Player, message: PacketMessage) void {
        switch (message) {
            .payload => |payload| {
                var packet: ?*ffmpeg.Packet = payload.value;
                self.library.codec.av_packet_free(&packet);
            },
            .flush, .eof => {},
        }
    }

    fn dispose_picture(self: *Player, message: PictureMessage) void {
        switch (message) {
            .payload => |payload| self.free_picture(payload.value),
            .flush, .eof => {},
        }
    }

    fn dispose_chunk(self: *Player, message: ChunkMessage) void {
        switch (message) {
            .payload => |payload| self.allocator.free(payload.value.bytes),
            .flush, .eof => {},
        }
    }

    // ---- consumer: audio and pictures -----------------------------------

    /// Moves decoded PCM into the audio stream while it has room, then pumps the device.
    fn feed_audio(self: *Player) !void {
        const sink = self.sink orelse return;
        const io = self.io;
        const serial = self.serial.load(.acquire);
        while (sink.queued_bytes() < audio_queue_bytes) {
            const message = self.chunks.try_pop(io) orelse break;
            switch (message) {
                .flush => {},
                .eof => |tag| if (tag == serial) {
                    sink.finish_input();
                    self.audio_eof = true;
                },
                .payload => |payload| {
                    defer self.allocator.free(payload.value.bytes);
                    if (payload.serial != serial) continue;
                    const chunk = payload.value;
                    if (chunk.sample_rate == 0) return error.InvalidSampleRate;
                    const frame_bytes = chunk.format.bytes_per_sample() * sink.source_channels;
                    const frames = chunk.bytes.len / frame_bytes;
                    const skip = audio_seek_skip(chunk.seconds, self.seek_floor, chunk.sample_rate, frames);
                    if (skip == frames) continue;
                    const seconds = chunk.seconds + @as(f64, @floatFromInt(skip)) / @as(f64, @floatFromInt(chunk.sample_rate));
                    if (!self.clock.anchored) self.clock.anchor(seconds, self.accepted_frames, self.now());
                    try sink.write(chunk.format, chunk.sample_rate, chunk.bytes[skip * frame_bytes ..]);
                },
            }
        }
        while (true) {
            const accepted = try sink.pump();
            if (accepted == 0) break;
            self.accepted_frames += @intCast(accepted);
        }
    }

    /// Shows the newest picture that is due at `position`. The first picture is
    /// shown at once; later ones wait for their timestamp, and older due pictures
    /// are dropped in favour of the newest.
    fn show_pictures(self: *Player, time: f64) !void {
        while (true) {
            if (self.pending == null) self.pending = self.next_picture();
            const next = self.pending orelse break;
            if (self.current != null and next.seconds > time) break;
            if (self.current) |old| self.free_picture(old);
            self.current = next;
            self.pending = null;
        }
    }

    fn next_picture(self: *Player) ?Picture {
        const io = self.io;
        const serial = self.serial.load(.acquire);
        while (self.pictures.try_pop(io)) |message| {
            switch (message) {
                .flush => {},
                .eof => |tag| if (tag == serial) {
                    self.video_eof = true;
                },
                .payload => |payload| {
                    if (payload.serial == serial and payload.value.seconds >= self.seek_floor) return payload.value;
                    self.free_picture(payload.value);
                },
            }
        }
        return null;
    }

    fn check_end(self: *Player, time: f64) void {
        if (self.ended) return;
        if (self.video != null) {
            if (!self.video_eof or self.pending != null) return;
        }
        if (self.sink) |sink| {
            if (!self.audio_eof or !sink.drained()) return;
        }
        if (self.current) |picture| {
            if (time < picture.seconds + assumed_frame_seconds) return;
        }
        self.ended = true;
        self.paused = true;
        self.clock.set_running(false, self.accepted_frames, self.now());
        if (self.sink) |sink| {
            self.hardware_paused = sink.set_paused(true);
            self.pause_needs_seek = !self.hardware_paused;
        }
        self.push_event(.ended);
    }

    // ---- demux ----------------------------------------------------------

    fn demux_loop(self: *Player) !void {
        const io = self.io;
        var serial: u32 = 0;
        var at_end = false;
        while (true) {
            // Wait for a seek while at end of stream; otherwise continue reading.
            self.shared.mutex.lockUncancelable(io);
            while (!self.shared.stop and self.shared.seek_request == null and at_end) {
                self.shared.wake.waitUncancelable(io, &self.shared.mutex);
            }
            if (self.shared.stop) {
                self.shared.mutex.unlock(io);
                return error.Stopped;
            }
            const request = self.shared.seek_request;
            self.shared.seek_request = null;
            self.shared.mutex.unlock(io);

            if (request) |target| {
                serial = self.serial.load(.acquire);
                at_end = false;
                const timestamp: i64 = @intFromFloat(target * av_time_base);
                // A failed seek leaves the position unchanged; playback continues from there.
                _ = self.library.format.av_seek_frame(self.context.?, -1, timestamp, ffmpeg.seek_flag_backward);
                if (self.video != null) try self.send_control(&self.video_packets, .{ .flush = serial });
                if (self.audio != null) try self.send_control(&self.audio_packets, .{ .flush = serial });
                continue;
            }

            const packet = self.library.codec.av_packet_alloc() orelse return error.OutOfMemory;
            const code = self.library.format.av_read_frame(self.context.?, packet);
            if (code == ffmpeg.error_eof) {
                var discard: ?*ffmpeg.Packet = packet;
                self.library.codec.av_packet_free(&discard);
                at_end = true;
                if (self.video != null) try self.send_control(&self.video_packets, .{ .eof = serial });
                if (self.audio != null) try self.send_control(&self.audio_packets, .{ .eof = serial });
                continue;
            }
            if (code < 0) {
                var discard: ?*ffmpeg.Packet = packet;
                self.library.codec.av_packet_free(&discard);
                return self.ffmpeg_fail(code);
            }
            if (self.video) |info| {
                if (packet.stream_index == info.index) {
                    try self.send_packet(&self.video_packets, serial, packet);
                    continue;
                }
            }
            if (self.audio) |info| {
                if (packet.stream_index == info.index) {
                    try self.send_packet(&self.audio_packets, serial, packet);
                    continue;
                }
            }
            var discard: ?*ffmpeg.Packet = packet;
            self.library.codec.av_packet_free(&discard);
        }
    }

    fn send_packet(self: *Player, queue: *queue_module.Queue(PacketMessage), serial: u32, packet: *ffmpeg.Packet) !void {
        queue.push(self.io, .{ .payload = .{ .serial = serial, .value = packet } }) catch {
            var discard: ?*ffmpeg.Packet = packet;
            self.library.codec.av_packet_free(&discard);
            return error.Stopped;
        };
    }

    fn send_control(self: *Player, queue: *queue_module.Queue(PacketMessage), message: PacketMessage) !void {
        queue.push(self.io, message) catch return error.Stopped;
    }
};

// ---- thread entry points -------------------------------------------------

fn demux_main(self: *Player) void {
    self.demux_loop() catch |err| if (err != error.Stopped) self.fail(err, null);
}

fn video_main(self: *Player) void {
    video_loop(self) catch |err| if (err != error.Stopped) self.fail(err, null);
}

fn audio_main(self: *Player) void {
    audio_loop(self) catch |err| if (err != error.Stopped) self.fail(err, null);
}

// ---- decode stages --------------------------------------------------------

/// Opens a decoder for a stream's parameters. The caller frees the context.
fn open_decoder(player: *Player, info: StreamInfo) !*ffmpeg.CodecContext {
    const lib = &player.library;
    const codec = lib.codec.avcodec_find_decoder(info.codec_id) orelse return error.UnsupportedCodec;
    const context = lib.codec.avcodec_alloc_context3(codec) orelse return error.OutOfMemory;
    errdefer {
        var handle: ?*ffmpeg.CodecContext = context;
        lib.codec.avcodec_free_context(&handle);
    }
    const copied = lib.codec.avcodec_parameters_to_context(context, info.codecpar);
    if (copied < 0) return player.ffmpeg_fail(copied);
    const opened = lib.codec.avcodec_open2(context, codec, null);
    if (opened < 0) return player.ffmpeg_fail(opened);
    return context;
}

fn free_decoder(player: *Player, context: *ffmpeg.CodecContext) void {
    var handle: ?*ffmpeg.CodecContext = context;
    player.library.codec.avcodec_free_context(&handle);
}

fn frame_seconds(player: *Player, info: StreamInfo, frame: *const ffmpeg.Frame, previous: f64) f64 {
    _ = player;
    const timestamp = if (frame.best_effort_timestamp != ffmpeg.nopts_value) frame.best_effort_timestamp else frame.pts;
    if (timestamp == ffmpeg.nopts_value) return previous + assumed_frame_seconds;
    return @as(f64, @floatFromInt(timestamp)) * info.time_base;
}

fn video_loop(self: *Player) !void {
    const info = self.video.?;
    const context = try open_decoder(self, info);
    defer free_decoder(self, context);
    var last_seconds: f64 = 0;
    while (self.video_packets.pop(self.io)) |message| {
        const current = self.serial.load(.acquire);
        switch (message) {
            .flush => |serial| if (serial == current) self.library.codec.avcodec_flush_buffers(context),
            .eof => |serial| if (serial == current) {
                _ = self.library.codec.avcodec_send_packet(context, null);
                try drain_video(self, context, serial, &last_seconds);
                self.pictures.push(self.io, .{ .eof = serial }) catch return error.Stopped;
            },
            .payload => |payload| {
                var packet: ?*ffmpeg.Packet = payload.value;
                defer self.library.codec.av_packet_free(&packet);
                if (payload.serial != current) continue;
                try decode_video_packet(self, context, payload.serial, payload.value, &last_seconds);
            },
        }
    }
}

fn decode_video_packet(self: *Player, context: *ffmpeg.CodecContext, serial: u32, packet: *ffmpeg.Packet, last_seconds: *f64) !void {
    while (true) {
        const code = self.library.codec.avcodec_send_packet(context, packet);
        if (code == ffmpeg.error_again) {
            try drain_video(self, context, serial, last_seconds);
            continue;
        }
        // A corrupt packet is skipped; the decoder recovers on the next keyframe.
        break;
    }
    try drain_video(self, context, serial, last_seconds);
}

fn drain_video(self: *Player, context: *ffmpeg.CodecContext, serial: u32, last_seconds: *f64) !void {
    const info = self.video.?;
    while (true) {
        const frame = self.library.util.av_frame_alloc() orelse return error.OutOfMemory;
        const code = self.library.codec.avcodec_receive_frame(context, frame);
        if (code == ffmpeg.error_again or code == ffmpeg.error_eof or code < 0) {
            var discard: ?*ffmpeg.Frame = frame;
            self.library.util.av_frame_free(&discard);
            return;
        }
        const seconds = frame_seconds(self, info, frame, last_seconds.*);
        last_seconds.* = seconds;
        self.pictures.push(self.io, .{ .payload = .{ .serial = serial, .value = .{ .frame = frame, .seconds = seconds } } }) catch {
            var discard: ?*ffmpeg.Frame = frame;
            self.library.util.av_frame_free(&discard);
            return error.Stopped;
        };
    }
}

fn audio_loop(self: *Player) !void {
    const info = self.audio.?;
    const context = try open_decoder(self, info);
    defer free_decoder(self, context);
    const channels: usize = @intCast(info.codecpar.ch_layout.nb_channels);
    var last_seconds: f64 = 0;
    while (self.audio_packets.pop(self.io)) |message| {
        const current = self.serial.load(.acquire);
        switch (message) {
            .flush => |serial| if (serial == current) self.library.codec.avcodec_flush_buffers(context),
            .eof => |serial| if (serial == current) {
                _ = self.library.codec.avcodec_send_packet(context, null);
                try drain_audio(self, context, info, serial, channels, &last_seconds);
                self.chunks.push(self.io, .{ .eof = serial }) catch return error.Stopped;
            },
            .payload => |payload| {
                var packet: ?*ffmpeg.Packet = payload.value;
                defer self.library.codec.av_packet_free(&packet);
                if (payload.serial != current) continue;
                while (true) {
                    const code = self.library.codec.avcodec_send_packet(context, payload.value);
                    if (code == ffmpeg.error_again) {
                        try drain_audio(self, context, info, payload.serial, channels, &last_seconds);
                        continue;
                    }
                    break;
                }
                try drain_audio(self, context, info, payload.serial, channels, &last_seconds);
            },
        }
    }
}

fn drain_audio(self: *Player, context: *ffmpeg.CodecContext, info: StreamInfo, serial: u32, channels: usize, last_seconds: *f64) !void {
    while (true) {
        const frame = self.library.util.av_frame_alloc() orelse return error.OutOfMemory;
        var discard: ?*ffmpeg.Frame = frame;
        defer self.library.util.av_frame_free(&discard);
        const code = self.library.codec.avcodec_receive_frame(context, frame);
        if (code == ffmpeg.error_again or code == ffmpeg.error_eof) return;
        if (code < 0) return self.ffmpeg_fail(code);
        if (@as(usize, @intCast(frame.ch_layout.nb_channels)) != channels) return self.fail(error.ChannelMismatch, null);

        const format = try sink_module.target_format(frame);
        const bytes = try self.allocator.alloc(u8, sink_module.byte_count(format, @intCast(frame.nb_samples), channels));
        errdefer self.allocator.free(bytes);
        _ = try sink_module.interleave(frame, channels, bytes);
        const seconds = frame_seconds(self, info, frame, last_seconds.*);
        last_seconds.* = seconds;
        self.chunks.push(self.io, .{ .payload = .{ .serial = serial, .value = .{
            .bytes = bytes,
            .seconds = seconds,
            .format = format,
            .sample_rate = @intCast(frame.sample_rate),
        } } }) catch return error.Stopped;
    }
}

/// Decode seeks begin at an earlier keyframe; discard whole pre-target samples.
fn audio_seek_skip(seconds: f64, target: f64, rate: u32, frames: usize) usize {
    const delta = target - seconds;
    if (!(delta > 0)) return 0;
    return @intFromFloat(@min(@as(f64, @floatFromInt(frames)), @ceil(delta * @as(f64, @floatFromInt(rate)))));
}

test "seek discards keyframe preroll and aligns the first audio sample" {
    try std.testing.expectEqual(@as(usize, 1024), audio_seek_skip(0, 0.5, 48000, 1024));
    try std.testing.expectEqual(@as(usize, 480), audio_seek_skip(0.25, 0.5, 1920, 1024));
    try std.testing.expectEqual(@as(usize, 0), audio_seek_skip(0.51, 0.5, 48000, 1024));
}
