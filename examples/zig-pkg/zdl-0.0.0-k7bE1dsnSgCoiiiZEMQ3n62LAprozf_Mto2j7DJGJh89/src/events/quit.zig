//! Quit requests from SIGINT and SIGTERM, ported from SDL_quit.c.
//!
//! SDL installs C signal handlers that set a pending flag; the flag is turned into
//! an SDL_EVENT_QUIT on the next pump (SDL_SendPendingSignalEvents), and any number
//! of signals before that collapse into one quit. This port keeps the same
//! observable behavior without a handler:
//! - `Signals.install` is an explicit request (SDL does this at init unless
//!   SDL_HINT_NO_SIGNAL_HANDLERS is set). It blocks SIGINT and SIGTERM for the calling
//!   thread and opens a `signalfd` that receives them while they stay pending.
//! - `Signals.poll` drains the descriptor without blocking and returns one quit event
//!   when any of the signals arrived since the previous poll.
//! - `Signals.uninstall` restores the previous signal mask and closes the descriptor,
//!   the counterpart of SDL_QuitQuit restoring the default actions.
//!
//! Deliberate differences from SDL:
//! - No signal handler runs. A Zig signal handler must be declared with the C calling
//!   convention, which this module keeps out of the native source. signalfd delivers the
//!   same records to ordinary code instead, with no async-signal-safety constraints.
//! - The signals stay blocked until `uninstall`, so a process that never polls ignores
//!   Ctrl+C instead of exiting. SDL would keep running too, since its handler only sets
//!   a flag, so the behavior is the same, but nothing exits on its own. Poll regularly, or
//!   put `Signals.fd` in the wait set (a readable descriptor means a pending signal).
//! - The mask is per thread. Install before creating threads so they inherit it; a
//!   thread that was started earlier may still take the default action.
//! - Only the thread that polls sees the quit; the event is queued like SDL_SendQuit's.
//!
//! Ownership: `Signals` owns one descriptor and the saved mask. It is an explicit value,
//! not process-global state, so two values can coexist. Uninstall before dropping it.
const std = @import("std");
const linux = std.os.linux;
const event = @import("event.zig");

/// Failures from `Signals.install`. The kernel errno is not kept.
pub const Error = error{ SignalMaskFailed, SignalFdFailed };

/// Signals that request a quit (SDL: SIGINT and SIGTERM).
pub const quit_signals = [_]linux.SIG{ .INT, .TERM };

/// Explicit SIGINT/SIGTERM quit source. Create with `install`, poll from the loop.
pub const Signals = struct {
    /// signalfd that becomes readable while a quit signal is pending. Include it in a
    /// poll set to wake a blocked loop when a signal arrives.
    fd: linux.fd_t,
    /// Mask in effect before `install`; restored by `uninstall`.
    previous_mask: linux.sigset_t,

    /// Blocks SIGINT and SIGTERM on the calling thread and opens the signalfd.
    /// Returns an error without changing the mask when the descriptor cannot be made.
    pub fn install() Error!Signals {
        var mask = linux.sigemptyset();
        for (quit_signals) |sig| linux.sigaddset(&mask, sig);

        var previous = linux.sigemptyset();
        if (linux.errno(linux.sigprocmask(linux.SIG.BLOCK, &mask, &previous)) != .SUCCESS) {
            return error.SignalMaskFailed;
        }
        const flags: u32 = linux.SFD.CLOEXEC | linux.SFD.NONBLOCK;
        const rc = linux.signalfd(-1, &mask, flags);
        if (linux.errno(rc) != .SUCCESS) {
            _ = linux.sigprocmask(linux.SIG.SETMASK, &previous, null);
            return error.SignalFdFailed;
        }
        return .{ .fd = @intCast(rc), .previous_mask = previous };
    }

    /// Restores the mask saved by `install` and closes the descriptor. Signals that
    /// arrived while blocked and were not polled are discarded with it.
    pub fn uninstall(self: *Signals) void {
        _ = linux.sigprocmask(linux.SIG.SETMASK, &self.previous_mask, null);
        _ = linux.close(self.fd);
        self.* = undefined;
    }

    /// Reads every pending signal without blocking. Returns a `quit` event stamped
    /// with host monotonic nanoseconds in `timestamp` when at least one SIGINT or
    /// SIGTERM was pending, and null otherwise. Several signals give one event,
    /// as SDL's pending flag does. Queue the result with
    /// `queue.Queue.send_app_event` (a quit is never a lifecycle kind).
    pub fn poll(self: *Signals, timestamp: event.Timestamp) ?event.Event {
        var records: [8]linux.signalfd_siginfo = undefined;
        const bytes = std.mem.sliceAsBytes(records[0..]);
        var quit = false;
        while (true) {
            const rc = linux.read(self.fd, bytes.ptr, bytes.len);
            if (linux.errno(rc) != .SUCCESS) break;
            const count = rc / @sizeOf(linux.signalfd_siginfo);
            if (count == 0) break;
            for (records[0..count]) |record| {
                for (quit_signals) |sig| {
                    if (record.signo == @backingInt(sig)) quit = true;
                }
            }
        }
        if (!quit) return null;
        return .{ .quit = .{ .timestamp = timestamp } };
    }
};

comptime {
    // Linux signal numbers the signalfd records are compared against.
    std.debug.assert(@backingInt(linux.SIG.INT) == 2);
    std.debug.assert(@backingInt(linux.SIG.TERM) == 15);
}
