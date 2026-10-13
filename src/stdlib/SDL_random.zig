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
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_GetPerformanceCounter_REAL() Uint64;
pub var SDL_rand_state: Uint64 = 0;
pub var SDL_rand_initialized: bool = @"false" != 0;
pub export fn SDL_srand_REAL(arg_seed: Uint64) void {
    @setEvalBranchQuota(100000);
    var seed = arg_seed;
    _ = &seed;
    if (!(seed != 0)) {
        seed = SDL_GetPerformanceCounter_REAL();
    }
    SDL_rand_state = seed;
    SDL_rand_initialized = @"true" != 0;
}
pub export fn SDL_rand_REAL(n: Sint32) Sint32 {
    @setEvalBranchQuota(100000);
    if (!SDL_rand_initialized) {
        SDL_srand_REAL(0);
    }
    return SDL_rand_r_REAL(&SDL_rand_state, n);
}
pub export fn SDL_randf_REAL() f32 {
    @setEvalBranchQuota(100000);
    if (!SDL_rand_initialized) {
        SDL_srand_REAL(0);
    }
    return SDL_randf_r_REAL(&SDL_rand_state);
}
pub export fn SDL_rand_bits_REAL() Uint32 {
    @setEvalBranchQuota(100000);
    if (!SDL_rand_initialized) {
        SDL_srand_REAL(0);
    }
    return SDL_rand_bits_r_REAL(&SDL_rand_state);
}
pub export fn SDL_rand_bits_r_REAL(state: [*c]Uint64) Uint32 {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return 0;
    }
    state.* = (state.* *% @as(c_ulong, 4280078389)) +% @as(Uint64, 5);
    return @truncate(state.* >> @intCast(@as(Uint64, 32)));
}
pub export fn SDL_rand_r_REAL(state: [*c]Uint64, n: Sint32) Sint32 {
    @setEvalBranchQuota(100000);
    if (n < @as(c_int, 0)) {
        return 0;
    }
    var val: Uint64 = @as(Uint64, SDL_rand_bits_r_REAL(state)) *% @as(Uint64, @bitCast(@as(c_long, n)));
    _ = &val;
    return @bitCast(@as(c_uint, @truncate(val >> @intCast(@as(Uint64, 32)))));
}
pub export fn SDL_randf_r_REAL(state: [*c]Uint64) f32 {
    @setEvalBranchQuota(100000);
    return @as(f32, @floatFromInt(SDL_rand_bits_r_REAL(state) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 32) - @as(c_int, 24))))))) * @as(f32, 0.0);
}

pub const SDL_rand = SDL_rand_REAL;
pub const SDL_rand_bits = SDL_rand_bits_REAL;
pub const SDL_rand_bits_r = SDL_rand_bits_r_REAL;
pub const SDL_rand_r = SDL_rand_r_REAL;
pub const SDL_randf = SDL_randf_REAL;
pub const SDL_randf_r = SDL_randf_r_REAL;
pub const SDL_srand = SDL_srand_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
