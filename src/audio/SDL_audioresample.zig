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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub extern fn sin(__x: f64) f64;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_sinf_REAL(x: f32) f32;
pub extern fn SDL_sqrtf_REAL(x: f32) f32;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub const SDL_ThreadID = Uint64;
pub const struct_SDL_InitState = extern struct {
    status: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: SDL_ThreadID = 0,
    reserved: ?*anyopaque = null,
};
pub const SDL_InitState = struct_SDL_InitState;
pub extern fn SDL_ShouldInit_REAL(state: [*c]SDL_InitState) bool;
pub extern fn SDL_SetInitialized_REAL(state: [*c]SDL_InitState, initialized: bool) void;
pub extern fn SDL_HasSSE_REAL() bool;
pub const __m64 = @Vector(1, c_longlong);
pub const __m128 = @Vector(4, f32);
pub const __m128_u = @Vector(4, f32);
pub inline fn _mm_add_ss(input: __m128, __b: __m128) __m128 {
    var __a = input;
    @setEvalBranchQuota(100000);
    __a[@as(c_int, 0)] += __b[@as(c_int, 0)];
    return __a;
}
pub inline fn _mm_add_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return __a + __b;
}
pub inline fn _mm_mul_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return __a * __b;
}
pub inline fn _mm_load_ss(__p: [*c]const f32) __m128 {
    @setEvalBranchQuota(100000);
    const struct___mm_load_ss_struct = extern struct {
        __u: f32 align(1) = 0,
    };
    _ = &struct___mm_load_ss_struct;
    var __u: f32 = @as([*c]const struct___mm_load_ss_struct, @ptrCast(@alignCast(__p))).*.__u;
    _ = &__u;
    return [4]f32{
        __u,
        @floatFromInt(@as(c_int, 0)),
        @floatFromInt(@as(c_int, 0)),
        @floatFromInt(@as(c_int, 0)),
    };
}
pub inline fn _mm_load_ps(__p: [*c]const f32) __m128 {
    @setEvalBranchQuota(100000);
    return @as([*c]const __m128, @ptrCast(@alignCast(__p))).*;
}
pub inline fn _mm_loadu_ps(__p: [*c]const f32) __m128 {
    @setEvalBranchQuota(100000);
    const struct___loadu_ps = extern struct {
        __v: [4]f32 align(1) = @import("std").mem.zeroes(__m128_u),
    };
    _ = &struct___loadu_ps;
    return @as([*c]const struct___loadu_ps, @ptrCast(@alignCast(__p))).*.__v;
}
pub inline fn _mm_set1_ps(__w: f32) __m128 {
    @setEvalBranchQuota(100000);
    return [4]f32{
        __w,
        __w,
        __w,
        __w,
    };
}
pub inline fn _mm_setzero_ps() __m128 {
    @setEvalBranchQuota(100000);
    return [4]f32{
        0.0,
        0.0,
        0.0,
        0.0,
    };
}
pub inline fn _mm_storel_pi(__p: [*c]__m64, __a: __m128) void {
    @setEvalBranchQuota(100000);
    const __mm_storeh_pi_v2f32 = @Vector(2, f32);
    _ = &__mm_storeh_pi_v2f32;
    const struct___mm_storeh_pi_struct = extern struct {
        __u: [2]f32 align(1) = @import("std").mem.zeroes(__mm_storeh_pi_v2f32),
    };
    _ = &struct___mm_storeh_pi_struct;
    @as([*c]struct___mm_storeh_pi_struct, @ptrCast(@alignCast(__p))).*.__u = @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __a, @Vector(2, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(__a)).vector.len),
    });
}
pub inline fn _mm_store_ss(__p: [*c]f32, __a: __m128) void {
    @setEvalBranchQuota(100000);
    const struct___mm_store_ss_struct = extern struct {
        __u: f32 align(1) = 0,
    };
    _ = &struct___mm_store_ss_struct;
    @as([*c]struct___mm_store_ss_struct, @ptrCast(@alignCast(__p))).*.__u = __a[@as(c_int, 0)];
}
pub inline fn _mm_storeu_ps(__p: [*c]f32, __a: __m128) void {
    @setEvalBranchQuota(100000);
    const struct___storeu_ps = extern struct {
        __v: [4]f32 align(1) = @import("std").mem.zeroes(__m128_u),
    };
    _ = &struct___storeu_ps;
    @as([*c]struct___storeu_ps, @ptrCast(@alignCast(__p))).*.__v = __a;
}
pub inline fn _mm_unpackhi_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __b, @Vector(4, i32){
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(6, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(3, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(7, @typeInfo(@TypeOf(__a)).vector.len),
    });
}
pub inline fn _mm_unpacklo_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __b, @Vector(4, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(__a)).vector.len),
    });
}
pub inline fn _mm_movehl_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __b, @Vector(4, i32){
        __helpers.shuffleVectorIndex(6, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(7, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(3, @typeInfo(@TypeOf(__a)).vector.len),
    });
}
pub inline fn _mm_movelh_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __b, @Vector(4, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(__a)).vector.len),
    });
}
pub export fn SDL_GetResampleRate(src_rate: c_int, dst_rate: c_int) Sint64 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_GetResampleRate".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(src_rate > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "src_rate > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioresample.c", 587);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    while (true) {
        while (!(dst_rate > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dst_rate > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioresample.c", 588);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    var numerator: Sint64 = @as(Sint64, src_rate) << @intCast(@as(Sint64, 32));
    _ = &numerator;
    var denominator: Sint64 = dst_rate;
    _ = &denominator;
    var sample_rate: Sint64 = @divTrunc(numerator - @as(Sint64, 1), denominator) + @as(Sint64, 1);
    _ = &sample_rate;
    while (true) {
        while (!(sample_rate > @as(Sint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "sample_rate > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioresample.c", 602);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    return sample_rate;
}
pub export fn SDL_GetResamplerHistoryFrames() c_int {
    @setEvalBranchQuota(100000);
    return RESAMPLER_ZERO_CROSSINGS + @as(c_int, 1);
}
pub export fn SDL_GetResamplerPaddingFrames(resample_rate: Sint64) c_int {
    @setEvalBranchQuota(100000);
    return if (resample_rate != 0) RESAMPLER_ZERO_CROSSINGS + @as(c_int, 1) else @as(c_int, 0);
}
pub export fn SDL_GetResamplerInputFrames(output_frames: Sint64, resample_rate: Sint64, resample_offset: Sint64) Sint64 {
    @setEvalBranchQuota(100000);
    var output_offset: Sint64 = undefined;
    _ = &output_offset;
    if (!ResamplerMul(output_frames, resample_rate, &output_offset) or !ResamplerAdd(output_offset, (-resample_rate + resample_offset) + @as(c_long, 4294967296), &output_offset)) {
        output_offset = 9223372036854775807;
    }
    var input_frames: Sint64 = @as(Sint32, @truncate(output_offset >> @intCast(@as(Sint64, 32))));
    _ = &input_frames;
    input_frames = if (input_frames > @as(Sint64, @as(c_int, 0))) input_frames else @as(Sint64, @as(c_int, 0));
    return input_frames;
}
pub export fn SDL_GetResamplerOutputFrames(input_frames: Sint64, resample_rate: Sint64, inout_resample_offset: [*c]Sint64) Sint64 {
    @setEvalBranchQuota(100000);
    var resample_offset: Sint64 = inout_resample_offset.*;
    _ = &resample_offset;
    var input_offset: Sint64 = undefined;
    _ = &input_offset;
    if (!ResamplerMul(input_frames, 4294967296, &input_offset) or !ResamplerAdd(input_offset, -resample_offset, &input_offset)) {
        input_offset = 9223372036854775807;
    }
    var output_frames: Sint64 = if (input_offset > @as(Sint64, 0)) @divTrunc(input_offset - @as(Sint64, 1), resample_rate) + @as(Sint64, 1) else @as(Sint64, 0);
    _ = &output_frames;
    inout_resample_offset.* = (output_frames * resample_rate) - input_offset;
    return output_frames;
}
pub export fn SDL_ResampleAudio(chans: c_int, arg_src: [*c]const f32, inframes: c_int, arg_dst: [*c]f32, outframes: c_int, resample_rate: Sint64, inout_resample_offset: [*c]Sint64) void {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "SDL_ResampleAudio".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var srcpos: Sint64 = inout_resample_offset.*;
    _ = &srcpos;
    var resample_frame: ResampleFrameFunc = ResampleFrame[@bitCast(@as(isize, @intCast(chans - @as(c_int, 1))))];
    _ = &resample_frame;
    while (true) {
        while (!(resample_rate > @as(Sint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "resample_rate > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioresample.c", 685);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    src -= @as(usize, @bitCast(@as(isize, @intCast((RESAMPLER_ZERO_CROSSINGS - @as(c_int, 1)) * chans))));
    {
        i = 0;
        while (i < outframes) : (i += 1) {
            var srcindex: c_int = @truncate(srcpos >> @intCast(@as(Sint64, 32)));
            _ = &srcindex;
            var srcfraction: Uint32 = @bitCast(@as(c_int, @truncate(srcpos & @as(Sint64, 4294967295))));
            _ = &srcfraction;
            srcpos += resample_rate;
            while (true) {
                while (!((srcindex >= -@as(c_int, 1)) and (srcindex < inframes))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "srcindex >= -1 && srcindex < inframes",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioresample.c", 694);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            var filter: [*c]const Cubic = @ptrCast(@alignCast(&ResamplerFilter[srcfraction >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 32) - RESAMPLER_BITS_PER_ZERO_CROSSING))))]));
            _ = &filter;
            const frac: f32 = @as(f32, @floatFromInt(srcfraction & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(@as(c_int, 32) - RESAMPLER_BITS_PER_ZERO_CROSSING)) - @as(c_int, 1)))))) * (@as(f32, 1.0) / @as(f32, @floatFromInt(@as(c_int, 1) << @intCast(@as(c_int, 32) - RESAMPLER_BITS_PER_ZERO_CROSSING))));
            _ = &frac;
            var frame: [*c]const f32 = &src[@bitCast(@as(isize, @intCast(srcindex * chans)))];
            _ = &frame;
            resample_frame.?(frame, dst, filter, frac, chans);
            dst += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        }
    }
    inout_resample_offset.* = srcpos - (@as(Sint64, inframes) << @intCast(@as(Sint64, 32)));
}

pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const union_Cubic = extern union {
    v: [4]f32,
    v128: [4]f32 align(@alignOf(__m128)),
};
pub const Cubic = union_Cubic;
pub fn ResampleFrame_Generic(src: [*c]const f32, dst: [*c]f32, arg_filter: [*c]const Cubic, frac: f32, chans: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var filter = arg_filter;
    _ = &filter;
    const frac2: f32 = frac * frac;
    _ = &frac2;
    const frac3: f32 = frac * frac2;
    _ = &frac3;
    var i: c_int = undefined;
    _ = &i;
    var chan: c_int = undefined;
    _ = &chan;
    var scales: [12]f32 = undefined;
    _ = &scales;
    {
        i = 0;
        while (i < (RESAMPLER_ZERO_CROSSINGS * @as(c_int, 2))) : ({
            i += 1;
            filter += 1;
        }) {
            scales[@bitCast(@as(isize, @intCast(i)))] = ((filter.*.v[@as(c_int, 0)] + (filter.*.v[@as(c_int, 1)] * frac)) + (filter.*.v[@as(c_int, 2)] * frac2)) + (filter.*.v[@as(c_int, 3)] * frac3);
        }
    }
    {
        chan = 0;
        while (chan < chans) : (chan += 1) {
            var out: f32 = 0.0;
            _ = &out;
            {
                i = 0;
                while (i < (RESAMPLER_ZERO_CROSSINGS * @as(c_int, 2))) : (i += 1) {
                    out += src[@bitCast(@as(isize, @intCast((i * chans) + chan)))] * scales[@bitCast(@as(isize, @intCast(i)))];
                }
            }
            dst[@bitCast(@as(isize, @intCast(chan)))] = out;
        }
    }
}
pub fn ResampleFrame_Mono(src: [*c]const f32, dst: [*c]f32, arg_filter: [*c]const Cubic, frac: f32, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var filter = arg_filter;
    _ = &filter;
    const frac2: f32 = frac * frac;
    _ = &frac2;
    const frac3: f32 = frac * frac2;
    _ = &frac3;
    var i: c_int = undefined;
    _ = &i;
    var out: f32 = 0.0;
    _ = &out;
    {
        i = 0;
        while (i < (RESAMPLER_ZERO_CROSSINGS * @as(c_int, 2))) : ({
            i += 1;
            filter += 1;
        }) {
            const scale: f32 = ((filter.*.v[@as(c_int, 0)] + (filter.*.v[@as(c_int, 1)] * frac)) + (filter.*.v[@as(c_int, 2)] * frac2)) + (filter.*.v[@as(c_int, 3)] * frac3);
            _ = &scale;
            out += src[@bitCast(@as(isize, @intCast(i)))] * scale;
        }
    }
    dst[@as(c_int, 0)] = out;
}
pub fn ResampleFrame_Stereo(src: [*c]const f32, dst: [*c]f32, arg_filter: [*c]const Cubic, frac: f32, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var filter = arg_filter;
    _ = &filter;
    const frac2: f32 = frac * frac;
    _ = &frac2;
    const frac3: f32 = frac * frac2;
    _ = &frac3;
    var i: c_int = undefined;
    _ = &i;
    var out0: f32 = 0.0;
    _ = &out0;
    var out1: f32 = 0.0;
    _ = &out1;
    {
        i = 0;
        while (i < (RESAMPLER_ZERO_CROSSINGS * @as(c_int, 2))) : ({
            i += 1;
            filter += 1;
        }) {
            const scale: f32 = ((filter.*.v[@as(c_int, 0)] + (filter.*.v[@as(c_int, 1)] * frac)) + (filter.*.v[@as(c_int, 2)] * frac2)) + (filter.*.v[@as(c_int, 3)] * frac3);
            _ = &scale;
            out0 += src[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 0))))] * scale;
            out1 += src[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 1))))] * scale;
        }
    }
    dst[@as(c_int, 0)] = out0;
    dst[@as(c_int, 1)] = out1;
}
pub fn ResampleFrame_Generic_SSE(src: [*c]const f32, dst: [*c]f32, arg_filter: [*c]const Cubic, frac: f32, chans: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var filter = arg_filter;
    _ = &filter;
    var f0: __m128 = undefined;
    _ = &f0;
    var f1: __m128 = undefined;
    _ = &f1;
    var f2: __m128 = undefined;
    _ = &f2;
    {
        const frac1: __m128 = _mm_set1_ps(frac);
        _ = &frac1;
        const frac2: __m128 = _mm_mul_ps(frac1, frac1);
        _ = &frac2;
        const frac3: __m128 = _mm_mul_ps(frac1, frac2);
        _ = &frac3;
        f0 = _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 0)].v)));
        f0 = _mm_add_ps(f0, _mm_mul_ps(frac1, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 1)].v)))));
        f0 = _mm_add_ps(f0, _mm_mul_ps(frac2, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 2)].v)))));
        f0 = _mm_add_ps(f0, _mm_mul_ps(frac3, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 3)].v)))));
        filter += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        f1 = _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 0)].v)));
        f1 = _mm_add_ps(f1, _mm_mul_ps(frac1, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 1)].v)))));
        f1 = _mm_add_ps(f1, _mm_mul_ps(frac2, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 2)].v)))));
        f1 = _mm_add_ps(f1, _mm_mul_ps(frac3, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 3)].v)))));
        filter += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        f2 = _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 0)].v)));
        f2 = _mm_add_ps(f2, _mm_mul_ps(frac1, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 1)].v)))));
        f2 = _mm_add_ps(f2, _mm_mul_ps(frac2, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 2)].v)))));
        f2 = _mm_add_ps(f2, _mm_mul_ps(frac3, _mm_load_ps(@ptrCast(@alignCast(&filter[@as(c_int, 3)].v)))));
        filter += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    }
    if (chans == @as(c_int, 2)) {
        var out0: __m128 = _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))), _mm_unpacklo_ps(f0, f0));
        _ = &out0;
        var out1: __m128 = _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))))), _mm_unpackhi_ps(f0, f0));
        _ = &out1;
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))))), _mm_unpacklo_ps(f1, f1)));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 12)))))), _mm_unpackhi_ps(f1, f1)));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))), _mm_unpacklo_ps(f2, f2)));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 20)))))), _mm_unpackhi_ps(f2, f2)));
        var out: __m128 = _mm_add_ps(out0, out1);
        _ = &out;
        out = _mm_add_ps(out, _mm_movehl_ps(out, out));
        _mm_storel_pi(@ptrCast(@alignCast(dst)), out);
        return;
    }
    if (chans == @as(c_int, 1)) {
        var out: __m128 = _mm_mul_ps(f0, _mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))));
        _ = &out;
        out = _mm_add_ps(out, _mm_mul_ps(f1, _mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))));
        out = _mm_add_ps(out, _mm_mul_ps(f2, _mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))))));
        var shuf: __m128 = __builtin.shufps(out, out, (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1));
        _ = &shuf;
        out = _mm_add_ps(out, shuf);
        out = _mm_add_ss(out, _mm_movehl_ps(shuf, out));
        _mm_store_ss(dst, out);
        return;
    }
    var chan: c_int = 0;
    _ = &chan;
    while ((chan + @as(c_int, 4)) <= chans) : (chan += 4) {
        var in: [*c]const f32 = &src[@bitCast(@as(isize, @intCast(chan)))];
        _ = &in;
        var out0: __m128 = _mm_setzero_ps();
        _ = &out0;
        var out1: __m128 = _mm_setzero_ps();
        _ = &out1;
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f0, f0, (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 0) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f0, f0, (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f0, f0, (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 2))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f0, f0, (((@as(c_int, 3) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f1, f1, (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 0) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f1, f1, (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f1, f1, (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 2))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f1, f1, (((@as(c_int, 3) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f2, f2, (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 0) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f2, f2, (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out0 = _mm_add_ps(out0, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f2, f2, (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 2))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        out1 = _mm_add_ps(out1, _mm_mul_ps(_mm_loadu_ps(in), __builtin.shufps(f2, f2, (((@as(c_int, 3) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans))));
        var out: __m128 = _mm_add_ps(out0, out1);
        _ = &out;
        _mm_storeu_ps(&dst[@bitCast(@as(isize, @intCast(chan)))], out);
    }
    while (chan < chans) : (chan += 1) {
        var in: [*c]const f32 = &src[@bitCast(@as(isize, @intCast(chan)))];
        _ = &in;
        var v0: __m128 = undefined;
        _ = &v0;
        var v1: __m128 = undefined;
        _ = &v1;
        var v2: __m128 = undefined;
        _ = &v2;
        v0 = _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        v0 = _mm_movelh_ps(v0, _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans)))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        v1 = _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        v1 = _mm_movelh_ps(v1, _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans)))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        v2 = _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        v2 = _mm_movelh_ps(v2, _mm_unpacklo_ps(_mm_load_ss(in), _mm_load_ss(in + @as(usize, @bitCast(@as(isize, @intCast(chans)))))));
        in += @as(usize, @bitCast(@as(isize, @intCast(chans + chans))));
        var out: __m128 = _mm_mul_ps(f0, v0);
        _ = &out;
        out = _mm_add_ps(out, _mm_mul_ps(f1, v1));
        out = _mm_add_ps(out, _mm_mul_ps(f2, v2));
        var shuf: __m128 = __builtin.shufps(out, out, (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1));
        _ = &shuf;
        out = _mm_add_ps(out, shuf);
        out = _mm_add_ss(out, _mm_movehl_ps(shuf, out));
        _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(chan)))], out);
    }
}
pub fn CubicLeastSquares(coeffs: [*c]Cubic, y0_1: f32, y1_2: f32, y2: f32, y3: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    coeffs.*.v[@as(c_int, 0)] = y0_1;
    coeffs.*.v[@as(c_int, 1)] = (((-@as(f32, 5.5) * y0_1) + (@as(f32, 9.0) * y1_2)) - (@as(f32, 4.5) * y2)) + y3;
    coeffs.*.v[@as(c_int, 2)] = (((@as(f32, 9.0) * y0_1) - (@as(f32, 22.5) * y1_2)) + (@as(f32, 18.0) * y2)) - (@as(f32, 4.5) * y3);
    coeffs.*.v[@as(c_int, 3)] = (((-@as(f32, 4.5) * y0_1) + (@as(f32, 13.5) * y1_2)) - (@as(f32, 13.5) * y2)) + (@as(f32, 4.5) * y3);
}
pub fn BesselI0(arg_x: f32) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var sum: f32 = 0.0;
    _ = &sum;
    var i: f32 = 1.0;
    _ = &i;
    var t: f32 = 1.0;
    _ = &t;
    x *= x * @as(f32, 0.25);
    while (t >= (sum * __FLT_EPSILON__)) {
        sum += t;
        t *= x / (i * i);
        i += 1;
    }
    return sum;
}
pub fn SincTable(table: [*c]f32, len: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < len) : (i += 1) {
            table[@bitCast(@as(isize, @intCast(i)))] = SDL_sinf_REAL(@as(f32, @floatFromInt(i)) * (SDL_PI_F / @as(f32, @floatFromInt(len)))) / SDL_PI_F;
        }
    }
}
pub fn Sinc(table: [*c]const f32, x: c_int, y: c_int) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var s: f32 = table[@bitCast(@as(isize, @intCast(__helpers.signedRemainder(x, y))))];
    _ = &s;
    s = if ((@divTrunc(x, y) & @as(c_int, 1)) != 0) -s else s;
    return (s * @as(f32, @floatFromInt(y))) / @as(f32, @floatFromInt(x));
}
pub var ResamplerFilter: [8][12]Cubic = @import("std").mem.zeroes([8][12]Cubic);
pub fn GenerateResamplerFilter() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const TABLE_SAMPLES_PER_ZERO_CROSSING: c_int = 24;
    _ = &TABLE_SAMPLES_PER_ZERO_CROSSING;
    const TABLE_SIZE: c_int = 144;
    _ = &TABLE_SIZE;
    const enum_unnamed_15 = c_uint;
    _ = &enum_unnamed_15;
    const dB: f32 = 80.0;
    _ = &dB;
    const beta: f32 = @as(f32, 0.1102) * (dB - @as(f32, 8.7));
    _ = &beta;
    const bessel_beta: f32 = BesselI0(beta);
    _ = &bessel_beta;
    const lensqr: f32 = @floatFromInt(TABLE_SIZE * TABLE_SIZE);
    _ = &lensqr;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var sinc: [24]f32 = undefined;
    _ = &sinc;
    SincTable(@ptrCast(@alignCast(&sinc)), TABLE_SAMPLES_PER_ZERO_CROSSING);
    var filter: [145]f32 = undefined;
    _ = &filter;
    filter[@as(c_int, 0)] = 1.0;
    {
        i = 1;
        while (i <= TABLE_SIZE) : (i += 1) {
            var b: f32 = BesselI0(beta * SDL_sqrtf_REAL((lensqr - @as(f32, @floatFromInt(i * i))) / lensqr)) / bessel_beta;
            _ = &b;
            var s: f32 = Sinc(@ptrCast(@alignCast(&sinc)), i, TABLE_SAMPLES_PER_ZERO_CROSSING);
            _ = &s;
            filter[@bitCast(@as(isize, @intCast(i)))] = b * s;
        }
    }
    {
        i = 0;
        while (i < (@as(c_int, 1) << @intCast(RESAMPLER_BITS_PER_ZERO_CROSSING))) : (i += 1) {
            {
                j = 0;
                while (j < RESAMPLER_ZERO_CROSSINGS) : (j += 1) {
                    var ys: [*c]const f32 = &filter[@bitCast(@as(isize, @intCast(((j * (@as(c_int, 1) << @intCast(RESAMPLER_BITS_PER_ZERO_CROSSING))) + i) * @as(c_int, 3))))];
                    _ = &ys;
                    var fwd: [*c]Cubic = &ResamplerFilter[@bitCast(@as(isize, @intCast(i)))][@bitCast(@as(isize, @intCast((RESAMPLER_ZERO_CROSSINGS - j) - @as(c_int, 1))))];
                    _ = &fwd;
                    var rev: [*c]Cubic = &ResamplerFilter[@bitCast(@as(isize, @intCast(((@as(c_int, 1) << @intCast(RESAMPLER_BITS_PER_ZERO_CROSSING)) - i) - @as(c_int, 1))))][@bitCast(@as(isize, @intCast(RESAMPLER_ZERO_CROSSINGS + j)))];
                    _ = &rev;
                    CubicLeastSquares(fwd, ys[@as(c_int, 0)], ys[@as(c_int, 1)], ys[@as(c_int, 2)], ys[@as(c_int, 3)]);
                    CubicLeastSquares(rev, ys[@as(c_int, 3)], ys[@as(c_int, 2)], ys[@as(c_int, 1)], ys[@as(c_int, 0)]);
                }
            }
        }
    }
}
pub const ResampleFrameFunc = ?*const fn (src: [*c]const f32, dst: [*c]f32, filter: [*c]const Cubic, frac: f32, chans: c_int) callconv(.c) void;
pub var ResampleFrame: [8]ResampleFrameFunc = @import("std").mem.zeroes([8]ResampleFrameFunc);
pub fn Transpose4x4(data: [*c]Cubic) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var temp: [4]Cubic = [4]Cubic{
        data[@as(c_int, 0)],
        data[@as(c_int, 1)],
        data[@as(c_int, 2)],
        data[@as(c_int, 3)],
    };
    _ = &temp;
    {
        i = 0;
        while (i < @as(c_int, 4)) : (i += 1) {
            {
                j = 0;
                while (j < @as(c_int, 4)) : (j += 1) {
                    data[@bitCast(@as(isize, @intCast(i)))].v[@bitCast(@as(isize, @intCast(j)))] = temp[@bitCast(@as(isize, @intCast(j)))].v[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    }
}
pub fn SetupAudioResampler() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var transpose: bool = @"false" != 0;
    _ = &transpose;
    GenerateResamplerFilter();
    if (SDL_HasSSE_REAL()) {
        {
            i = 0;
            while (i < @as(c_int, 8)) : (i += 1) {
                ResampleFrame[@bitCast(@as(isize, @intCast(i)))] = ResampleFrame_Generic_SSE;
            }
        }
        transpose = @"true" != 0;
    } else {
        {
            i = 0;
            while (i < @as(c_int, 8)) : (i += 1) {
                ResampleFrame[@bitCast(@as(isize, @intCast(i)))] = ResampleFrame_Generic;
            }
        }
        ResampleFrame[@as(c_int, 0)] = ResampleFrame_Mono;
        ResampleFrame[@as(c_int, 1)] = ResampleFrame_Stereo;
    }
    if (transpose) {
        {
            i = 0;
            while (i < (@as(c_int, 1) << @intCast(RESAMPLER_BITS_PER_ZERO_CROSSING))) : (i += 1) {
                {
                    j = 0;
                    while ((j + @as(c_int, 4)) <= (RESAMPLER_ZERO_CROSSINGS * @as(c_int, 2))) : (j += 4) {
                        Transpose4x4(&ResamplerFilter[@bitCast(@as(isize, @intCast(i)))][@bitCast(@as(isize, @intCast(j)))]);
                    }
                }
            }
        }
    }
}
pub export fn SDL_SetupAudioResampler() void {
    @setEvalBranchQuota(100000);
    const static_local_init = struct {
        var init: SDL_InitState = @import("std").mem.zeroes(SDL_InitState);
    };
    _ = &static_local_init;
    if (SDL_ShouldInit_REAL(&static_local_init.init)) {
        SetupAudioResampler();
        SDL_SetInitialized_REAL(&static_local_init.init, @"true" != 0);
    }
}
pub inline fn ResamplerAdd(a: Sint64, b: Sint64, ret: [*c]Sint64) bool {
    @setEvalBranchQuota(100000);
    if ((b > @as(Sint64, 0)) and (a > (@as(c_long, 9223372036854775807) - b))) {
        return @"false" != 0;
    }
    ret.* = a + b;
    return @"true" != 0;
}
pub inline fn ResamplerMul(a: Sint64, b: Sint64, ret: [*c]Sint64) bool {
    @setEvalBranchQuota(100000);
    if ((b > @as(Sint64, 0)) and (a > @divTrunc(@as(c_long, 9223372036854775807), b))) {
        return @"false" != 0;
    }
    ret.* = a * b;
    return @"true" != 0;
}
pub const RESAMPLER_ZERO_CROSSINGS = @as(c_int, 6);
pub const RESAMPLER_BITS_PER_ZERO_CROSSING = @as(c_int, 3);
