//! Linux virtual-terminal release/acquire coordination for KMS/DRM.
//!
//! SDL installs process signal handlers for VT_PROCESS notifications. This
//! backend uses a tiny async-signal-safe trampoline that sets atomic pending
//! bits and writes to an eventfd; all DRM calls and VT acknowledgements happen
//! later on the platform-driving thread. A session is optional when there is
//! no controlling `/dev/tty` or no unused signal pair.
const std = @import("std");
const linux = std.os.linux;

const vt_getmode: u32 = 0x5601;
const vt_setmode: u32 = 0x5602;
const vt_reldisp: u32 = 0x5605;
const vt_process: u8 = 1;
const vt_ackacq: usize = 2;
const pending_release: u32 = 1;
const pending_acquire: u32 = 2;

const VtMode = extern struct {
    mode: u8,
    waitv: u8,
    release_signal: i16,
    acquire_signal: i16,
    force_signal: i16,
};

var session_claimed = std.atomic.Value(bool).init(false);
var handler_active = std.atomic.Value(bool).init(false);
var handler_count = std.atomic.Value(usize).init(0);
var handler_fd = std.atomic.Value(i32).init(-1);
var release_signal_number = std.atomic.Value(u32).init(0);
var acquire_signal_number = std.atomic.Value(u32).init(0);
var pending_events = std.atomic.Value(u32).init(0);

/// One virtual-terminal transition sent by the kernel.
pub const Event = enum { release, acquire };

/// Owns `/dev/tty`, its previous mode and an eventfd used to wake platform poll.
/// Initialize, poll and deinitialize on one platform-driving thread.
pub const Session = struct {
    tty_fd: std.posix.fd_t,
    event_fd: std.posix.fd_t,
    old_mode: VtMode,
    old_release_action: std.posix.Sigaction,
    old_acquire_action: std.posix.Sigaction,
    release_signal: std.posix.SIG,
    acquire_signal: std.posix.SIG,
    pending_local: u32 = 0,

    /// Attempts to install VT_PROCESS. Returns null when there is no controlling
    /// terminal or the kernel refuses process-controlled switching.
    pub fn open() ?Session {
        if (session_claimed.cmpxchgStrong(false, true, .acq_rel, .acquire) != null) return null;
        var keep_claim = false;
        defer if (!keep_claim) session_claimed.store(false, .release);

        const tty_fd = std.posix.openatZ(std.posix.AT.FDCWD, "/dev/tty", .{ .ACCMODE = .RDWR, .CLOEXEC = true }, 0) catch return null;
        var old_mode: VtMode = undefined;
        if (!ioctl_ptr(tty_fd, vt_getmode, &old_mode)) {
            _ = std.c.close(tty_fd);
            return null;
        }
        const release_signal = find_free_signal(null) orelse {
            _ = std.c.close(tty_fd);
            return null;
        };
        const acquire_signal = find_free_signal(release_signal) orelse {
            _ = std.c.close(tty_fd);
            return null;
        };

        const event_fd_raw = linux.eventfd(0, linux.EFD.CLOEXEC | linux.EFD.NONBLOCK);
        if (linux.errno(event_fd_raw) != .SUCCESS) {
            _ = std.c.close(tty_fd);
            return null;
        }
        const event_fd: std.posix.fd_t = @intCast(event_fd_raw);
        var old_release_action: std.posix.Sigaction = undefined;
        var old_acquire_action: std.posix.Sigaction = undefined;
        std.posix.sigaction(release_signal, null, &old_release_action);
        std.posix.sigaction(acquire_signal, null, &old_acquire_action);

        release_signal_number.store(@intCast(@backingInt(release_signal)), .release);
        acquire_signal_number.store(@intCast(@backingInt(acquire_signal)), .release);
        pending_events.store(0, .release);
        handler_fd.store(event_fd, .release);
        var release_action = old_release_action;
        release_action.handler.handler = on_vt_signal;
        var acquire_action = old_acquire_action;
        acquire_action.handler.handler = on_vt_signal;
        handler_active.store(true, .release);
        std.posix.sigaction(release_signal, &release_action, null);
        std.posix.sigaction(acquire_signal, &acquire_action, null);

        var mode = old_mode;
        mode.mode = vt_process;
        mode.waitv = 0;
        mode.release_signal = @intCast(@backingInt(release_signal));
        mode.acquire_signal = @intCast(@backingInt(acquire_signal));
        mode.force_signal = 0;
        if (!ioctl_ptr(tty_fd, vt_setmode, &mode)) {
            cleanup_failed_open(tty_fd, event_fd, release_signal, acquire_signal, old_release_action, old_acquire_action);
            return null;
        }

        keep_claim = true;
        return .{
            .tty_fd = tty_fd,
            .event_fd = event_fd,
            .old_mode = old_mode,
            .old_release_action = old_release_action,
            .old_acquire_action = old_acquire_action,
            .release_signal = release_signal,
            .acquire_signal = acquire_signal,
        };
    }

    /// Reads one pending transition. The eventfd is drained before returning a
    /// queued signal; coalesced release/acquire signals remain in `pending_local`.
    pub fn poll(self: *Session) ?Event {
        if (self.pending_local == 0) {
            var counter: u64 = 0;
            _ = std.posix.read(self.event_fd, std.mem.asBytes(&counter)) catch return null;
            self.pending_local = pending_events.swap(0, .acq_rel);
        }
        if (self.pending_local & pending_release != 0) {
            self.pending_local &= ~pending_release;
            return .release;
        }
        if (self.pending_local & pending_acquire != 0) {
            self.pending_local &= ~pending_acquire;
            return .acquire;
        }
        return null;
    }

    /// Acknowledges the kernel after the backend has dropped or reclaimed DRM master.
    pub fn acknowledge(self: *Session, event: Event) error{DeviceFailure}!void {
        const response: usize = switch (event) {
            .release => 1,
            .acquire => vt_ackacq,
        };
        if (!ioctl_value(self.tty_fd, vt_reldisp, response)) return error.DeviceFailure;
    }

    /// Restores the previous VT mode and signal actions, then closes owned descriptors.
    pub fn deinit(self: *Session) void {
        handler_active.store(false, .release);
        _ = ioctl_ptr(self.tty_fd, vt_setmode, &self.old_mode);
        std.posix.sigaction(self.release_signal, &self.old_release_action, null);
        std.posix.sigaction(self.acquire_signal, &self.old_acquire_action, null);
        while (handler_count.load(.acquire) != 0) std.atomic.spinLoopHint();
        handler_fd.store(-1, .release);
        pending_events.store(0, .release);
        _ = std.c.close(self.event_fd);
        _ = std.c.close(self.tty_fd);
        session_claimed.store(false, .release);
        self.* = undefined;
    }
};

fn on_vt_signal(signal: std.posix.SIG) callconv(.c) void {
    _ = handler_count.fetchAdd(1, .acq_rel);
    defer _ = handler_count.fetchSub(1, .release);
    if (!handler_active.load(.acquire)) return;
    const number: u32 = @intCast(@backingInt(signal));
    const bit: u32 = if (number == release_signal_number.load(.acquire))
        pending_release
    else if (number == acquire_signal_number.load(.acquire))
        pending_acquire
    else
        return;
    _ = pending_events.fetchOr(bit, .acq_rel);
    const fd = handler_fd.load(.acquire);
    if (fd >= 0) {
        const one: u64 = 1;
        _ = linux.write(fd, @ptrCast(&one), @sizeOf(u64));
    }
}

fn cleanup_failed_open(
    tty_fd: std.posix.fd_t,
    event_fd: std.posix.fd_t,
    release_signal: std.posix.SIG,
    acquire_signal: std.posix.SIG,
    old_release_action: std.posix.Sigaction,
    old_acquire_action: std.posix.Sigaction,
) void {
    handler_active.store(false, .release);
    std.posix.sigaction(release_signal, &old_release_action, null);
    std.posix.sigaction(acquire_signal, &old_acquire_action, null);
    while (handler_count.load(.acquire) != 0) std.atomic.spinLoopHint();
    handler_fd.store(-1, .release);
    pending_events.store(0, .release);
    _ = std.c.close(event_fd);
    _ = std.c.close(tty_fd);
}

fn find_free_signal(exclude: ?std.posix.SIG) ?std.posix.SIG {
    const realtime_start = linux.sigrtmin() + 2;
    for (realtime_start..linux.sigrtmax() + 1) |number| {
        const signal: std.posix.SIG = @fromBackingInt(@intCast(number));
        if (exclude) |blocked| if (signal == blocked) continue;
        var previous: std.posix.Sigaction = undefined;
        std.posix.sigaction(signal, null, &previous);
        if (previous.handler.handler == null) return signal;
    }
    inline for (.{ std.posix.SIG.USR1, std.posix.SIG.USR2 }) |signal| {
        const skip = if (exclude) |blocked| signal == blocked else false;
        if (!skip) {
            var previous: std.posix.Sigaction = undefined;
            std.posix.sigaction(signal, null, &previous);
            if (previous.handler.handler == null) return signal;
        }
    }
    return null;
}

fn ioctl_ptr(fd: std.posix.fd_t, request: u32, pointer: anytype) bool {
    return linux.errno(linux.ioctl(fd, request, @intFromPtr(pointer))) == .SUCCESS;
}

fn ioctl_value(fd: std.posix.fd_t, request: u32, value: usize) bool {
    return linux.errno(linux.ioctl(fd, request, value)) == .SUCCESS;
}

comptime {
    if (@sizeOf(VtMode) != 8) @compileError("Linux vt_mode ABI size mismatch");
}
