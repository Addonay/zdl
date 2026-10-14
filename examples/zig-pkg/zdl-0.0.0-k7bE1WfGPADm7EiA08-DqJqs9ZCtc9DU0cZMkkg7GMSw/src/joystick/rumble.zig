//! Rumble duration and resend bookkeeping (SDL_RumbleJoystick and the rumble
//! part of SDL_UpdateJoysticks in SDL_joystick.c).
//!
//! A `Rumble` remembers the last magnitudes it sent, when they expire, and when
//! they must be sent again. Devices such as DualShock 4 stop vibrating after a few
//! seconds, so a non-zero rumble is repeated every `resend_interval_ms`.
//!
//! The state object does not own a device. Each operation takes a backend, any
//! value with `fn rumble(self, low: u16, high: u16) !void` (for example
//! `linux_evdev.Device`), and the caller's current time in milliseconds. This
//! keeps the object free of clocks, threads and global state.
//!
//! Deliberate differences from SDL:
//! - SDL stores "no expiration" and "no resend" as 0 and nudges computed deadlines
//!   that happen to be 0 to 1 so that they stay non-zero. Here both are optionals,
//!   so there is no sentinel and no adjustment.
//! - Triggers (`SDL_RumbleJoystickTriggers`) are not part of this object. The Linux
//!   backend reports them unsupported, so the trigger state would never change.
/// Longest duration a rumble may be given (SDL_MAX_RUMBLE_DURATION_MS).
pub const max_duration_ms: u32 = 0xffff;

/// Interval between re-sends of a non-zero rumble (SDL_RUMBLE_RESEND_MS).
pub const resend_interval_ms: u64 = 2000;

/// The last rumble sent to a device, with its expiry and resend deadlines.
pub const Rumble = struct {
    /// Strong-motor magnitude last accepted by the backend.
    low: u16 = 0,
    /// Weak-motor magnitude last accepted by the backend.
    high: u16 = 0,
    /// Time at which the rumble stops; null when it runs until replaced.
    expires_at_ms: ?u64 = null,
    /// Time at which the magnitudes are sent again; null when no re-send is due.
    resend_at_ms: ?u64 = null,

    /// Starts `low`/`high` for `duration_ms` (SDL_RumbleJoystick). Zero duration
    /// or zero magnitudes cancel any pending expiry and re-send.
    ///
    /// When the magnitudes differ from the last accepted ones, the backend is
    /// called first. If it fails, the error is returned and this object keeps its
    /// previous magnitudes and expiry, but drops the resend deadline, as SDL does.
    /// When they match, only the expiry is updated and the backend is not called.
    pub fn set(self: *Rumble, backend: anytype, now_ms: u64, low: u16, high: u16, duration_ms: u32) !void {
        if (low != self.low or high != self.high) {
            backend.rumble(low, high) catch |err| {
                self.resend_at_ms = null;
                return err;
            };
            self.resend_at_ms = now_ms +| resend_interval_ms;
        }
        self.low = low;
        self.high = high;

        if ((low != 0 or high != 0) and duration_ms != 0) {
            self.expires_at_ms = now_ms +| @min(duration_ms, max_duration_ms);
        } else {
            self.expires_at_ms = null;
            self.resend_at_ms = null;
        }
    }

    /// Stops the rumble immediately (SDL_RumbleJoystick(0, 0, 0)).
    pub fn stop(self: *Rumble, backend: anytype, now_ms: u64) !void {
        try self.set(backend, now_ms, 0, 0, 0);
    }

    /// Runs the time-based part of the update loop (the rumble section of
    /// SDL_UpdateJoysticks). Expired rumble is stopped first. Then a due re-send
    /// is sent with the current magnitudes, and its deadline moves forward. A
    /// failed re-send still advances the deadline, as in SDL, and its error is
    /// returned.
    pub fn update(self: *Rumble, backend: anytype, now_ms: u64) !void {
        if (self.expires_at_ms) |expires| {
            if (now_ms >= expires) try self.stop(backend, now_ms);
        }
        if (self.resend_at_ms) |resend| {
            if (now_ms >= resend) {
                self.resend_at_ms = now_ms +| resend_interval_ms;
                try backend.rumble(self.low, self.high);
            }
        }
    }

    /// The earliest time at which `update` has work to do, or null when the
    /// rumble is idle. Event loops use it to decide how long to sleep.
    pub fn next_deadline_ms(self: Rumble) ?u64 {
        if (self.expires_at_ms == null) return self.resend_at_ms;
        if (self.resend_at_ms == null) return self.expires_at_ms;
        return @min(self.expires_at_ms.?, self.resend_at_ms.?);
    }
};
