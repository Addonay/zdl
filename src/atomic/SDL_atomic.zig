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
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub const Uint32 = u32;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub const struct_SDL_AtomicU32 = extern struct {
    value: Uint32 = 0,
};
pub const SDL_AtomicU32 = struct_SDL_AtomicU32;
pub export fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool {
    @setEvalBranchQuota(100000);
    return __builtin.sync_cas(&a.*.value, oldval, newval);
}
pub export fn SDL_CompareAndSwapAtomicU32_REAL(a: [*c]SDL_AtomicU32, oldval: Uint32, newval: Uint32) bool {
    @setEvalBranchQuota(100000);
    return __builtin.sync_cas(&a.*.value, oldval, newval);
}
pub export fn SDL_CompareAndSwapAtomicPointer_REAL(a: [*c]?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return __builtin.sync_cas(a, oldval, newval);
}
pub export fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_exchange(&a.*.value, v, __ATOMIC_SEQ_CST);
}
pub export fn SDL_SetAtomicU32_REAL(a: [*c]SDL_AtomicU32, v: Uint32) Uint32 {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_exchange(&a.*.value, v, __ATOMIC_SEQ_CST);
}
pub export fn SDL_SetAtomicPointer_REAL(a: [*c]?*anyopaque, v: ?*anyopaque) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_exchange(a, v, __ATOMIC_SEQ_CST);
}
pub export fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.sync_fetch_add(&a.*.value, v);
}
pub export fn SDL_AddAtomicU32_REAL(a: [*c]SDL_AtomicU32, v: c_int) Uint32 {
    @setEvalBranchQuota(100000);
    return __builtin.sync_fetch_add(&a.*.value, @as(Uint32, @bitCast(@as(c_int, v))));
}
pub export fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_load(&a.*.value, __ATOMIC_SEQ_CST);
}
pub export fn SDL_GetAtomicU32_REAL(a: [*c]SDL_AtomicU32) Uint32 {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_load(&a.*.value, __ATOMIC_SEQ_CST);
}
pub export fn SDL_GetAtomicPointer_REAL(a: [*c]?*anyopaque) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return __builtin.atomic_load(a, __ATOMIC_SEQ_CST);
}
pub export fn SDL_MemoryBarrierReleaseFunction_REAL() void {
    @setEvalBranchQuota(100000);
    __builtin.atomic_fence(__ATOMIC_RELEASE);
}
pub export fn SDL_MemoryBarrierAcquireFunction_REAL() void {
    @setEvalBranchQuota(100000);
    __builtin.atomic_fence(__ATOMIC_ACQUIRE);
}

pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const SDL_AddAtomicInt = SDL_AddAtomicInt_REAL;
pub const SDL_CompareAndSwapAtomicInt = SDL_CompareAndSwapAtomicInt_REAL;
pub const SDL_CompareAndSwapAtomicPointer = SDL_CompareAndSwapAtomicPointer_REAL;
pub const SDL_CompareAndSwapAtomicU32 = SDL_CompareAndSwapAtomicU32_REAL;
pub const SDL_GetAtomicInt = SDL_GetAtomicInt_REAL;
pub const SDL_GetAtomicPointer = SDL_GetAtomicPointer_REAL;
pub const SDL_GetAtomicU32 = SDL_GetAtomicU32_REAL;
pub const SDL_MemoryBarrierAcquireFunction = SDL_MemoryBarrierAcquireFunction_REAL;
pub const SDL_MemoryBarrierReleaseFunction = SDL_MemoryBarrierReleaseFunction_REAL;
pub const SDL_SetAtomicInt = SDL_SetAtomicInt_REAL;
pub const SDL_SetAtomicPointer = SDL_SetAtomicPointer_REAL;
pub const SDL_SetAtomicU32 = SDL_SetAtomicU32_REAL;
pub const SDL_AddAtomicU32 = SDL_AddAtomicU32_REAL;
