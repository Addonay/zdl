//! Media playback core for the player example, usable by any zdl application.
//!
//! `Player` opens a file with FFmpeg (loaded at run time, see `ffmpeg.zig`),
//! decodes video and audio on their own threads, and presents them through
//! zdl: video is converted with zdl's YUV converters, audio goes to zdl.audio.
//! The application calls `Player.update` once per display frame and draws with
//! `Player.draw` or `Player.current_frame`.
const player = @import("player.zig");

pub const ffmpeg = @import("ffmpeg.zig");
pub const video = @import("video.zig");
pub const sink = @import("sink.zig");
pub const clock = @import("clock.zig");
pub const queue = @import("queue.zig");

pub const Player = player.Player;
pub const Track = player.Track;
pub const TrackKind = player.TrackKind;
pub const Metadata = player.Metadata;
pub const Event = player.Event;
pub const Frame = player.Frame;

test {
    _ = player;
    _ = video;
    _ = clock;
    _ = queue;
}
