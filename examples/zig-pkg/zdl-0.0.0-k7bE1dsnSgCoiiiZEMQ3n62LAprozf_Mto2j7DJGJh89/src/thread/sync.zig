//! Synchronization behavior that is not supplied by a standard atomic value.
//! Most code should use `std.Io.Mutex`; this lock is for very short sections
//! where blocking an OS thread would cost more than the protected work.
const std = @import("std");

/// A non-recursive lock. Initialize in its final location and never copy it
/// while threads can access it. It owns no memory and needs no deinitialization.
/// Acquire and release publish protected writes using std's atomic mutex.
pub const SpinLock = struct {
    mutex: std.atomic.Mutex = .unlocked,

    /// Attempts acquisition once; false means another thread owns the lock.
    pub fn try_lock(self: *SpinLock) bool {
        return self.mutex.tryLock();
    }

    /// Spins briefly, then yields until acquisition succeeds. This operation
    /// cannot be cancelled; callers must keep the protected section bounded.
    pub fn lock(self: *SpinLock) void {
        var spins: usize = 0;
        while (!self.try_lock()) {
            if (spins < 32) {
                spins += 1;
                std.atomic.spinLoopHint();
            } else {
                // Refusing a scheduler yield is harmless: retry acquisition.
                std.Thread.yield() catch {};
            }
        }
    }

    /// Releases a lock owned by this thread. Unlocking an unowned lock is a bug.
    pub fn unlock(self: *SpinLock) void {
        self.mutex.unlock();
    }
};

test "lock excludes" {
    var lock: SpinLock = .{};
    try std.testing.expect(lock.try_lock());
    try std.testing.expect(!lock.try_lock());
    lock.unlock();
    try std.testing.expect(lock.try_lock());
    lock.unlock();
}
