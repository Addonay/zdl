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
pub extern fn abs(__x: c_int) c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn acos(__x: f64) f64;
pub extern fn asin(__x: f64) f64;
pub extern fn atan(__x: f64) f64;
pub extern fn atan2(__y: f64, __x: f64) f64;
pub extern fn cos(__x: f64) f64;
pub extern fn sin(__x: f64) f64;
pub extern fn tan(__x: f64) f64;
pub extern fn exp(__x: f64) f64;
pub extern fn log(__x: f64) f64;
pub extern fn log10(__x: f64) f64;
pub extern fn modf(__x: f64, __iptr: [*c]f64) f64;
pub extern fn pow(__x: f64, __y: f64) f64;
pub extern fn sqrt(__x: f64) f64;
pub extern fn ceil(__x: f64) f64;
pub extern fn fabs(__x: f64) f64;
pub extern fn floor(__x: f64) f64;
pub extern fn fmod(__x: f64, __y: f64) f64;
pub extern fn copysign(__x: f64, __y: f64) f64;
pub extern fn isnan(__value: f64) c_int;
pub extern fn scalbn(__x: f64, __n: c_int) f64;
pub extern fn round(__x: f64) f64;
pub extern fn trunc(__x: f64) f64;
pub extern fn lround(__x: f64) c_long;
pub extern fn acosf(__x: f32) f32;
pub extern fn asinf(__x: f32) f32;
pub extern fn atanf(__x: f32) f32;
pub extern fn atan2f(__y: f32, __x: f32) f32;
pub extern fn cosf(__x: f32) f32;
pub extern fn sinf(__x: f32) f32;
pub extern fn tanf(__x: f32) f32;
pub extern fn expf(__x: f32) f32;
pub extern fn logf(__x: f32) f32;
pub extern fn log10f(__x: f32) f32;
pub extern fn modff(__x: f32, __iptr: [*c]f32) f32;
pub extern fn powf(__x: f32, __y: f32) f32;
pub extern fn sqrtf(__x: f32) f32;
pub extern fn ceilf(__x: f32) f32;
pub extern fn fabsf(__x: f32) f32;
pub extern fn floorf(__x: f32) f32;
pub extern fn fmodf(__x: f32, __y: f32) f32;
pub extern fn copysignf(__x: f32, __y: f32) f32;
pub extern fn scalbnf(__x: f32, __n: c_int) f32;
pub extern fn roundf(__x: f32) f32;
pub extern fn truncf(__x: f32) f32;
pub extern fn lroundf(__x: f32) c_long;
pub const Uint8 = u8;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub inline fn SDL_size_add_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.add_overflow(a, b, ret))) == @as(c_int, 0);
}
pub export fn SDL_atan_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return atan(x);
}
pub export fn SDL_atanf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return atanf(x);
}
pub export fn SDL_atan2_REAL(y: f64, x: f64) f64 {
    @setEvalBranchQuota(100000);
    return atan2(y, x);
}
pub export fn SDL_atan2f_REAL(y: f32, x: f32) f32 {
    @setEvalBranchQuota(100000);
    return atan2f(y, x);
}
pub export fn SDL_acos_REAL(val: f64) f64 {
    @setEvalBranchQuota(100000);
    return acos(val);
}
pub export fn SDL_acosf_REAL(val: f32) f32 {
    @setEvalBranchQuota(100000);
    return acosf(val);
}
pub export fn SDL_asin_REAL(val: f64) f64 {
    @setEvalBranchQuota(100000);
    return asin(val);
}
pub export fn SDL_asinf_REAL(val: f32) f32 {
    @setEvalBranchQuota(100000);
    return asinf(val);
}
pub export fn SDL_ceil_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return ceil(x);
}
pub export fn SDL_ceilf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return ceilf(x);
}
pub export fn SDL_copysign_REAL(x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    return copysign(x, y);
}
pub export fn SDL_copysignf_REAL(x: f32, y: f32) f32 {
    @setEvalBranchQuota(100000);
    return copysignf(x, y);
}
pub export fn SDL_cos_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return cos(x);
}
pub export fn SDL_cosf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return cosf(x);
}
pub export fn SDL_exp_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return exp(x);
}
pub export fn SDL_expf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return expf(x);
}
pub export fn SDL_fabs_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return fabs(x);
}
pub export fn SDL_fabsf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return fabsf(x);
}
pub export fn SDL_floor_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return floor(x);
}
pub export fn SDL_floorf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return floorf(x);
}
pub export fn SDL_trunc_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return trunc(x);
}
pub export fn SDL_truncf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return truncf(x);
}
pub export fn SDL_fmod_REAL(x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    return fmod(x, y);
}
pub export fn SDL_fmodf_REAL(x: f32, y: f32) f32 {
    @setEvalBranchQuota(100000);
    return fmodf(x, y);
}
pub export fn SDL_isinf_REAL(x: f64) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.isinf_sign(x);
}
pub export fn SDL_isinff_REAL(x: f32) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.isinf_sign(x);
}
pub export fn SDL_isnan_REAL(x: f64) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.isnan(x);
}
pub export fn SDL_isnanf_REAL(x: f32) c_int {
    @setEvalBranchQuota(100000);
    return __builtin.isnan(x);
}
pub export fn SDL_log_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return log(x);
}
pub export fn SDL_logf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return logf(x);
}
pub export fn SDL_log10_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return log10(x);
}
pub export fn SDL_log10f_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return log10f(x);
}
pub export fn SDL_modf_REAL(x: f64, y: [*c]f64) f64 {
    @setEvalBranchQuota(100000);
    return modf(x, y);
}
pub export fn SDL_modff_REAL(x: f32, y: [*c]f32) f32 {
    @setEvalBranchQuota(100000);
    return modff(x, y);
}
pub export fn SDL_pow_REAL(x: f64, y: f64) f64 {
    @setEvalBranchQuota(100000);
    return pow(x, y);
}
pub export fn SDL_powf_REAL(x: f32, y: f32) f32 {
    @setEvalBranchQuota(100000);
    return powf(x, y);
}
pub export fn SDL_round_REAL(arg: f64) f64 {
    @setEvalBranchQuota(100000);
    return round(arg);
}
pub export fn SDL_roundf_REAL(arg: f32) f32 {
    @setEvalBranchQuota(100000);
    return roundf(arg);
}
pub export fn SDL_lround_REAL(arg: f64) c_long {
    @setEvalBranchQuota(100000);
    return lround(arg);
}
pub export fn SDL_lroundf_REAL(arg: f32) c_long {
    @setEvalBranchQuota(100000);
    return lroundf(arg);
}
pub export fn SDL_scalbn_REAL(x: f64, n: c_int) f64 {
    @setEvalBranchQuota(100000);
    return scalbn(x, n);
}
pub export fn SDL_scalbnf_REAL(x: f32, n: c_int) f32 {
    @setEvalBranchQuota(100000);
    return scalbnf(x, n);
}
pub export fn SDL_sin_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return sin(x);
}
pub export fn SDL_sinf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return sinf(x);
}
pub export fn SDL_sqrt_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return sqrt(x);
}
pub export fn SDL_sqrtf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return sqrtf(x);
}
pub export fn SDL_tan_REAL(x: f64) f64 {
    @setEvalBranchQuota(100000);
    return tan(x);
}
pub export fn SDL_tanf_REAL(x: f32) f32 {
    @setEvalBranchQuota(100000);
    return tanf(x);
}
pub export fn SDL_abs_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return abs(x);
}
pub export fn SDL_isalpha_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((SDL_isupper_REAL(x) != 0) or (SDL_islower_REAL(x) != 0));
}
pub export fn SDL_isalnum_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((SDL_isalpha_REAL(x) != 0) or (SDL_isdigit_REAL(x) != 0));
}
pub export fn SDL_isdigit_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool((x >= @as(c_int, '0')) and (x <= @as(c_int, '9')));
}
pub export fn SDL_isxdigit_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool((((x >= @as(c_int, 'A')) and (x <= @as(c_int, 'F'))) or ((x >= @as(c_int, 'a')) and (x <= @as(c_int, 'f')))) or (SDL_isdigit_REAL(x) != 0));
}
pub export fn SDL_ispunct_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((SDL_isgraph_REAL(x) != 0) and !(SDL_isalnum_REAL(x) != 0));
}
pub export fn SDL_isspace_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((((((x == @as(c_int, ' ')) or (x == @as(c_int, '\t'))) or (x == @as(c_int, '\r'))) or (x == @as(c_int, '\n'))) or (x == @as(c_int, '\x0c'))) or (x == @as(c_int, '\x0b')));
}
pub export fn SDL_isupper_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool((x >= @as(c_int, 'A')) and (x <= @as(c_int, 'Z')));
}
pub export fn SDL_islower_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool((x >= @as(c_int, 'a')) and (x <= @as(c_int, 'z')));
}
pub export fn SDL_isprint_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool((x >= @as(c_int, ' ')) and (x < @as(c_int, '\x7f')));
}
pub export fn SDL_isgraph_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((SDL_isprint_REAL(x) != 0) and (x != @as(c_int, ' ')));
}
pub export fn SDL_iscntrl_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return @intFromBool(((x >= @as(c_int, '\x00')) and (x <= @as(c_int, '\x1f'))) or (x == @as(c_int, '\x7f')));
}
pub export fn SDL_toupper_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return if ((x >= @as(c_int, 'a')) and (x <= @as(c_int, 'z'))) @as(c_int, 'A') + (x - @as(c_int, 'a')) else x;
}
pub export fn SDL_tolower_REAL(arg_x: c_int) c_int {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return if ((x >= @as(c_int, 'A')) and (x <= @as(c_int, 'Z'))) @as(c_int, 'a') + (x - @as(c_int, 'A')) else x;
}
pub export fn SDL_isblank_REAL(x: c_int) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((x == @as(c_int, ' ')) or (x == @as(c_int, '\t')));
}
pub fn SDL_aligned_alloc_internal(arg_alignment: usize, arg_size: usize, clear_memory: bool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var alignment = arg_alignment;
    _ = &alignment;
    var size = arg_size;
    _ = &size;
    var padding: usize = undefined;
    _ = &padding;
    var result: [*c]Uint8 = null;
    _ = &result;
    var requested_size: usize = size;
    _ = &requested_size;
    if (alignment < @sizeOf(?*anyopaque)) {
        alignment = @sizeOf(?*anyopaque);
    }
    padding = alignment -% (size % alignment);
    if ((SDL_size_add_check_overflow_builtin(size, alignment, &size) and SDL_size_add_check_overflow_builtin(size, @sizeOf(?*anyopaque), &size)) and SDL_size_add_check_overflow_builtin(size, padding, &size)) {
        var original: ?*anyopaque = if (clear_memory) SDL_calloc_REAL(1, size) else SDL_malloc_REAL(size);
        _ = &original;
        if (original != null) {
            result = @as([*c]Uint8, @ptrCast(@alignCast(original))) + @sizeOf(@TypeOf(original));
            result += alignment -% (@as(usize, @intCast(@intFromPtr(result))) % alignment);
            _ = memcpy(@ptrCast(@alignCast(result - @sizeOf(@TypeOf(original)))), @ptrCast(@alignCast(&original)), @sizeOf(@TypeOf(original)));
            if (padding > @as(usize, 0)) {
                _ = memset(@ptrCast(@alignCast(result + requested_size)), 0, padding);
            }
        }
    }
    return @ptrCast(@alignCast(result));
}
pub export fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_aligned_alloc_internal(alignment, size, @"false" != 0);
}
pub export fn SDL_aligned_alloc_zero_REAL(alignment: usize, size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_aligned_alloc_internal(alignment, size, @"true" != 0);
}
pub export fn SDL_aligned_free_REAL(mem: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (mem != null) {
        var original: ?*anyopaque = undefined;
        _ = &original;
        _ = memcpy(@ptrCast(@alignCast(&original)), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(mem))) - @sizeOf(@TypeOf(original)))), @sizeOf(@TypeOf(original)));
        SDL_free_REAL(original);
    }
}

pub const SDL_abs = SDL_abs_REAL;
pub const SDL_acos = SDL_acos_REAL;
pub const SDL_acosf = SDL_acosf_REAL;
pub const SDL_aligned_alloc = SDL_aligned_alloc_REAL;
pub const SDL_aligned_free = SDL_aligned_free_REAL;
pub const SDL_asin = SDL_asin_REAL;
pub const SDL_asinf = SDL_asinf_REAL;
pub const SDL_atan = SDL_atan_REAL;
pub const SDL_atan2 = SDL_atan2_REAL;
pub const SDL_atan2f = SDL_atan2f_REAL;
pub const SDL_atanf = SDL_atanf_REAL;
pub const SDL_ceil = SDL_ceil_REAL;
pub const SDL_ceilf = SDL_ceilf_REAL;
pub const SDL_copysign = SDL_copysign_REAL;
pub const SDL_copysignf = SDL_copysignf_REAL;
pub const SDL_cos = SDL_cos_REAL;
pub const SDL_cosf = SDL_cosf_REAL;
pub const SDL_exp = SDL_exp_REAL;
pub const SDL_expf = SDL_expf_REAL;
pub const SDL_fabs = SDL_fabs_REAL;
pub const SDL_fabsf = SDL_fabsf_REAL;
pub const SDL_floor = SDL_floor_REAL;
pub const SDL_floorf = SDL_floorf_REAL;
pub const SDL_fmod = SDL_fmod_REAL;
pub const SDL_fmodf = SDL_fmodf_REAL;
pub const SDL_isinf = SDL_isinf_REAL;
pub const SDL_isinff = SDL_isinff_REAL;
pub const SDL_isnan = SDL_isnan_REAL;
pub const SDL_isnanf = SDL_isnanf_REAL;
pub const SDL_log = SDL_log_REAL;
pub const SDL_log10 = SDL_log10_REAL;
pub const SDL_log10f = SDL_log10f_REAL;
pub const SDL_logf = SDL_logf_REAL;
pub const SDL_lround = SDL_lround_REAL;
pub const SDL_lroundf = SDL_lroundf_REAL;
pub const SDL_modf = SDL_modf_REAL;
pub const SDL_modff = SDL_modff_REAL;
pub const SDL_pow = SDL_pow_REAL;
pub const SDL_powf = SDL_powf_REAL;
pub const SDL_round = SDL_round_REAL;
pub const SDL_roundf = SDL_roundf_REAL;
pub const SDL_scalbn = SDL_scalbn_REAL;
pub const SDL_scalbnf = SDL_scalbnf_REAL;
pub const SDL_sin = SDL_sin_REAL;
pub const SDL_sinf = SDL_sinf_REAL;
pub const SDL_sqrt = SDL_sqrt_REAL;
pub const SDL_sqrtf = SDL_sqrtf_REAL;
pub const SDL_tan = SDL_tan_REAL;
pub const SDL_tanf = SDL_tanf_REAL;
pub const SDL_trunc = SDL_trunc_REAL;
pub const SDL_truncf = SDL_truncf_REAL;
pub const SDL_aligned_alloc_zero = SDL_aligned_alloc_zero_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
