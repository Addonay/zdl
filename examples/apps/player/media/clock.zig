//! Playback clock with the audio device as master, as in ffplay.
//!
//! With audio, media time is the timestamp of the first sample written to the
//! device, advanced by the frames the device has accepted since, minus the
//! frames it still holds in its buffer (`latency_frames`). Pausing freezes the
//! position; the device keeps receiving silence meanwhile, so resuming rebases
//! the counters rather than trusting the accepted total.
//!
//! Without audio the wall clock is the master. The clock is plain data: callers
//! pass the accepted-frame count and the monotonic time, which keeps it testable.
const std = @import("std");

pub const Clock = struct {
    /// Device sample rate in frames per second; 0 selects the wall clock.
    rate: u32 = 0,
    /// Frames accepted by the device but not yet played.
    latency_frames: u64 = 0,
    /// Media time (seconds) at the base point.
    base_seconds: f64 = 0,
    /// Accepted-frame total and monotonic time (ns) at the base point.
    base_frames: u64 = 0,
    base_ns: i96 = 0,
    running: bool = false,
    /// Audio clocks stay at the base until the first sample anchors them.
    anchored: bool = false,

    /// Clock driven by the wall clock only.
    pub fn wall() Clock {
        return .{ .anchored = true };
    }

    /// Clock driven by an audio device with the given rate and buffer latency.
    pub fn audio(rate: u32, latency_frames: u64) Clock {
        return .{ .rate = rate, .latency_frames = latency_frames };
    }

    /// Current media time in seconds.
    pub fn position(self: Clock, accepted_frames: u64, now_ns: i96) f64 {
        if (!self.running or !self.anchored) return self.base_seconds;
        if (self.rate == 0) {
            return self.base_seconds + @as(f64, @floatFromInt(now_ns - self.base_ns)) / std.time.ns_per_s;
        }
        const played = accepted_frames -| self.base_frames;
        const audible = played -| self.latency_frames;
        return self.base_seconds + @as(f64, @floatFromInt(audible)) / @as(f64, @floatFromInt(self.rate));
    }

    /// Sets media time `seconds` as the base point and marks the clock anchored.
    pub fn anchor(self: *Clock, seconds: f64, accepted_frames: u64, now_ns: i96) void {
        self.base_seconds = seconds;
        self.base_frames = accepted_frames;
        self.base_ns = now_ns;
        self.anchored = true;
    }

    /// Jumps to `seconds`. An audio clock stays unanchored until the next sample.
    pub fn seek(self: *Clock, seconds: f64, accepted_frames: u64, now_ns: i96) void {
        self.base_seconds = seconds;
        self.base_frames = accepted_frames;
        self.base_ns = now_ns;
        self.anchored = self.rate == 0;
    }

    /// Starts or stops the clock. Stopping freezes the current position.
    pub fn set_running(self: *Clock, running: bool, accepted_frames: u64, now_ns: i96) void {
        if (running == self.running) return;
        if (!running) {
            self.base_seconds = self.position(accepted_frames, now_ns);
        } else {
            self.base_frames = accepted_frames;
            self.base_ns = now_ns;
        }
        self.running = running;
    }
};

test "audio clock advances with accepted frames and subtracts latency" {
    var clock = Clock.audio(48_000, 1_024);
    clock.running = true;
    try std.testing.expectEqual(@as(f64, 0), clock.position(0, 0));
    clock.anchor(2.0, 0, 0);
    try std.testing.expectEqual(@as(f64, 2.0), clock.position(1_024, 0));
    try std.testing.expectApproxEqAbs(@as(f64, 2.5), clock.position(1_024 + 24_000, 0), 1e-9);
}

test "pausing freezes the audio clock and resuming rebases it" {
    var clock = Clock.audio(48_000, 0);
    clock.running = true;
    clock.anchor(1.0, 0, 0);
    clock.set_running(false, 48_000, 0);
    try std.testing.expectApproxEqAbs(@as(f64, 2.0), clock.position(96_000, 0), 1e-9);
    clock.set_running(true, 96_000, 0);
    try std.testing.expectApproxEqAbs(@as(f64, 2.5), clock.position(120_000, 0), 1e-9);
}

test "wall clock follows monotonic time" {
    var clock = Clock.wall();
    clock.anchor(0, 0, 1_000_000_000);
    clock.running = true;
    try std.testing.expectApproxEqAbs(@as(f64, 0.5), clock.position(0, 1_500_000_000), 1e-9);
}
