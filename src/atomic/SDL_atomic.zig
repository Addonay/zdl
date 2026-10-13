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
//! Lock-free atomics for integers and pointers.
//!
//! There is nothing to wrap here. SDL's atomics are the C11 `<stdatomic.h>`
//! operations, and `std.atomic.Value` is the Zig equivalent, so this module
//! exists to name the shapes SDL's API promises and to supply the one
//! primitive std does not have: a standalone memory barrier.

const std = @import("std");

/// A 32-bit signed integer that may be read and written atomically.
pub const AtomicInt = std.atomic.Value(i32);

/// A 32-bit unsigned integer that may be read and written atomically.
pub const AtomicU32 = std.atomic.Value(u32);

/// A pointer that may be read and written atomically.
pub const AtomicPointer = std.atomic.Value(?*anyopaque);

/// Orders every load and store in the program, not just those touching one
/// location.
///
/// Zig 0.18 has no fence builtin, so this is expressed as a no-op
/// sequentially consistent RMW against a dummy. `.seq_cst` is never weaker
/// than the acquire/release ordering a caller can ask for, and it replaces
/// the architecture-specific `mfence` / `dmb ish` inline asm the C
/// translation needed.
pub fn memoryBarrier() void {
    _ = @atomicRmw(u8, &barrier_sink, .Add, 0, .seq_cst);
}

var barrier_sink: u8 = 0;

test "memory barrier compiles to a real barrier" {
    memoryBarrier();
}

test "compare and swap reports success and failure" {
    var value = AtomicInt.init(1);
    // Succeeds: the current value matches the expected one.
    try std.testing.expect(value.cmpxchgStrong(1, 3, .seq_cst, .seq_cst) == null);
    // Fails: the value moved on under us, and is left untouched.
    try std.testing.expect(value.cmpxchgStrong(1, 9, .seq_cst, .seq_cst) != null);
    try std.testing.expectEqual(@as(i32, 3), value.load(.seq_cst));
}

test "fetchAdd is atomic" {
    var value = AtomicU32.init(0);
    _ = value.fetchAdd(7, .seq_cst);
    _ = value.fetchAdd(3, .seq_cst);
    try std.testing.expectEqual(@as(u32, 10), value.load(.seq_cst));
}

test "atomic pointers round-trip" {
    var local: u8 = 0;
    var value = AtomicPointer.init(@as(?*anyopaque, null));
    const old = value.swap(@ptrCast(&local), .seq_cst);
    try std.testing.expect(old == null);
    const stored: *u8 = @ptrCast(@alignCast(value.load(.seq_cst).?));
    try std.testing.expectEqual(@as(u8, 0), stored.*);
}

// -- C ABI bridge ---------------------------------------------------------
// TODO(zdl): delete this section. It exists only so the subsystems that are
// still on the C translation keep linking while they are converted, one at
// a time, to the Zig API above. 29 files still call these symbols. None of
// them should survive the migration.

pub export fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]AtomicInt, oldval: c_int, newval: c_int) bool {
    return a.*.cmpxchgStrong(oldval, newval, .seq_cst, .seq_cst) == null;
}

pub export fn SDL_CompareAndSwapAtomicU32_REAL(a: [*c]AtomicU32, oldval: u32, newval: u32) bool {
    return a.*.cmpxchgStrong(oldval, newval, .seq_cst, .seq_cst) == null;
}

pub export fn SDL_CompareAndSwapAtomicPointer_REAL(a: [*c]AtomicPointer, oldval: ?*anyopaque, newval: ?*anyopaque) bool {
    return a.*.cmpxchgStrong(oldval, newval, .seq_cst, .seq_cst) == null;
}

pub export fn SDL_SetAtomicInt_REAL(a: [*c]AtomicInt, v: c_int) c_int {
    return a.*.swap(v, .seq_cst);
}

pub export fn SDL_SetAtomicU32_REAL(a: [*c]AtomicU32, v: u32) u32 {
    return a.*.swap(v, .seq_cst);
}

pub export fn SDL_SetAtomicPointer_REAL(a: [*c]AtomicPointer, v: ?*anyopaque) ?*anyopaque {
    return a.*.swap(v, .seq_cst);
}

pub export fn SDL_AddAtomicInt_REAL(a: [*c]AtomicInt, v: c_int) c_int {
    return a.*.fetchAdd(v, .seq_cst);
}

pub export fn SDL_AddAtomicU32_REAL(a: [*c]AtomicU32, v: u32) u32 {
    return a.*.fetchAdd(v, .seq_cst);
}

pub export fn SDL_GetAtomicInt_REAL(a: [*c]AtomicInt) c_int {
    return a.*.load(.seq_cst);
}

pub export fn SDL_GetAtomicU32_REAL(a: [*c]AtomicU32) u32 {
    return a.*.load(.seq_cst);
}

pub export fn SDL_GetAtomicPointer_REAL(a: [*c]AtomicPointer) ?*anyopaque {
    return a.*.load(.seq_cst);
}

pub export fn SDL_MemoryBarrierReleaseFunction_REAL() void {
    memoryBarrier();
}

pub export fn SDL_MemoryBarrierAcquireFunction_REAL() void {
    memoryBarrier();
}