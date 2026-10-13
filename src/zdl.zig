//! zdl — SDL3 in Zig.
//!
//! This is the root of the public API. Everything reachable from here is
//! plain Zig: `std`-only, no C translation layer, no `extern` declarations.
//! A program imports this module and uses what it needs; the linker drops
//! the rest.
//!
//! Conversion is in progress. The idiomatic subsystems are re-exported here;
//! the remaining SDL subsystems are still being moved off the C translation
//! and are not yet part of this surface.

const std = @import("std");

/// Lock-free atomics: `AtomicInt`, `AtomicU32`, `AtomicPointer`,
/// `memoryBarrier`.
pub const atomic = @import("atomic/SDL_atomic.zig");

/// A test-and-set spinlock, for short critical sections.
pub const spinlock = @import("atomic/SDL_spinlock.zig");

test {
    std.testing.refAllDecls(@This());
    _ = atomic;
    _ = spinlock;
}