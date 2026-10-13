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
pub const SDL_SpinLock = c_int;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn ZDL_Pause() void;
pub export fn SDL_TryLockSpinlock_REAL(lock: [*c]SDL_SpinLock) bool {
    @setEvalBranchQuota(100000);
    return __builtin.sync_exchange(lock, @as(c_int, 1)) == @as(c_int, 0);
}
pub export fn SDL_LockSpinlock_REAL(lock: [*c]SDL_SpinLock) void {
    @setEvalBranchQuota(100000);
    var iterations: c_int = 0;
    _ = &iterations;
    while (!SDL_TryLockSpinlock_REAL(lock)) {
        if (iterations < @as(c_int, 32)) {
            iterations += 1;
            ZDL_Pause();
        } else {
            SDL_Delay_REAL(0);
        }
    }
}
pub export fn SDL_UnlockSpinlock_REAL(lock: [*c]SDL_SpinLock) void {
    @setEvalBranchQuota(100000);
    __builtin.sync_release(lock);
}

pub const SDL_LockSpinlock = SDL_LockSpinlock_REAL;
pub const SDL_UnlockSpinlock = SDL_UnlockSpinlock_REAL;
