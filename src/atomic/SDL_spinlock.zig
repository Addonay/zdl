// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
//
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
//
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
//! A test-and-set spinlock, for short critical sections.
//!
//! Spinlocks are only appropriate where the critical section is a handful of
//! instructions and contention is rare. `acquire` backs off after
//! `spin_limit` failed attempts so a waiter stops burning the core.

const std = @import("std");

/// Failed attempts before `acquire` stops spinning and yields instead.
pub const spin_limit: usize = 32;

pub const SpinLock = struct {
    locked: std.atomic.Value(bool) = .init(false),

    pub const init: SpinLock = .{};

    /// Attempts to take the lock once, without blocking.
    pub fn tryAcquire(self: *SpinLock) bool {
        return !self.locked.swap(true, .acquire);
    }

    /// Takes the lock, spinning and then yielding until it is available.
    pub fn acquire(self: *SpinLock) void {
        var spins: usize = 0;
        while (!self.tryAcquire()) {
            if (spins < spin_limit) {
                spins += 1;
                std.atomic.spinLoopHint();
            } else {
                // Nothing to do if the yield is refused; spin anyway.
                std.Thread.yield() catch {};
            }
        }
    }

    /// Releases a lock held by the calling thread.
    pub fn release(self: *SpinLock) void {
        self.locked.store(false, .release);
    }
};

test "lock excludes" {
    var lock = SpinLock.init;
    try std.testing.expect(lock.tryAcquire());
    try std.testing.expect(!lock.tryAcquire());
    lock.release();
    try std.testing.expect(lock.tryAcquire());
}

/// Spins until `flag` is set or `budget` attempts are exhausted. Returns
/// whether the flag was observed.
fn waitFor(flag: *const std.atomic.Value(bool), budget: usize) bool {
    var attempts: usize = 0;
    while (attempts < budget) : (attempts += 1) {
        if (flag.load(.seq_cst)) return true;
        std.atomic.spinLoopHint();
    }
    return flag.load(.seq_cst);
}

test "acquire blocks until release" {
    if (@import("builtin").single_threaded) return error.SkipZigTest;

    const Context = struct {
        lock: *SpinLock,
        about_to_acquire: std.atomic.Value(bool) = .init(false),
        acquired: std.atomic.Value(bool) = .init(false),

        fn wait(c: *@This()) void {
            c.about_to_acquire.store(true, .seq_cst);
            c.lock.acquire();
            c.lock.release();
            c.acquired.store(true, .seq_cst);
        }
    };

    var lock = SpinLock.init;
    var ctx = Context{ .lock = &lock };

    lock.acquire();
    const thread = try std.Thread.spawn(.{}, Context.wait, .{&ctx});

    // Once the waiter announces it is about to acquire, we know it is
    // inside acquire() spinning. Nobody else can release the lock, so it
    // provably cannot have got in.
    try std.testing.expect(waitFor(&ctx.about_to_acquire, 100_000_000));
    try std.testing.expect(!ctx.acquired.load(.seq_cst));

    lock.release();
    thread.join();
    try std.testing.expect(ctx.acquired.load(.seq_cst));
}

// -- C ABI bridge ---------------------------------------------------------
// TODO(zdl): delete this section along with the one in SDL_atomic.zig.

pub export fn SDL_TryLockSpinlock_REAL(lock: [*c]SpinLock) bool {
    return lock.*.tryAcquire();
}

pub export fn SDL_LockSpinlock_REAL(lock: [*c]SpinLock) void {
    lock.*.acquire();
}

pub export fn SDL_UnlockSpinlock_REAL(lock: [*c]SpinLock) void {
    lock.*.release();
}