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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub const SDL_AUDIO_UNKNOWN: c_int = 0;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S8: c_int = 32776;
pub const SDL_AUDIO_S16LE: c_int = 32784;
pub const SDL_AUDIO_S16BE: c_int = 36880;
pub const SDL_AUDIO_S32LE: c_int = 32800;
pub const SDL_AUDIO_S32BE: c_int = 36896;
pub const SDL_AUDIO_F32LE: c_int = 33056;
pub const SDL_AUDIO_F32BE: c_int = 37152;
pub const SDL_AUDIO_F32: c_int = 33056;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub const SDL_AudioDeviceID = Uint32;
pub const struct_SDL_AudioSpec = extern struct {
    format: SDL_AudioFormat = @import("std").mem.zeroes(SDL_AudioFormat),
    channels: c_int = 0,
    freq: c_int = 0,
};
pub const SDL_AudioSpec = struct_SDL_AudioSpec;
pub const SDL_AudioStream = struct_SDL_AudioStream;
pub const SDL_AudioStreamCallback = ?*const fn (userdata: ?*anyopaque, stream: [*c]SDL_AudioStream, additional_amount: c_int, total_amount: c_int) callconv(.c) void;
pub const struct_SDL_AudioQueue = opaque {
};
pub const struct_SDL_PrivateAudioData_8 = opaque {};
pub const struct_SDL_AudioDevice = extern struct {
    lock: ?*SDL_Mutex = null,
    close_cond: ?*SDL_Condition = null,
    refcount: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    WaitDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    PlayDevice: ?*const fn (device: [*c]SDL_AudioDevice, buffer: [*c]const Uint8, buflen: c_int) callconv(.c) bool = null,
    GetDeviceBuf: ?*const fn (device: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 = null,
    WaitRecordingDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    RecordDevice: ?*const fn (device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int = null,
    FlushRecording: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    name: [*c]u8 = null,
    unique_id: [*c]u8 = null,
    instance_id: SDL_AudioDeviceID = 0,
    handle: ?*anyopaque = null,
    spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    buffer_size: c_int = 0,
    chmap: [*c]c_int = null,
    default_spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    sample_frames: c_int = 0,
    silence_value: c_int = 0,
    shutdown: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    zombie: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    recording: bool = false,
    simple_copy: bool = false,
    work_buffer: [*c]Uint8 = null,
    mix_buffer: [*c]Uint8 = null,
    postmix_buffer: [*c]f32 = null,
    work_buffer_size: c_int = 0,
    thread: ?*SDL_Thread = null,
    currently_opened: bool = false,
    props: SDL_PropertiesID = 0,
    hidden: ?*struct_SDL_PrivateAudioData_8 = null,
    logical_devices: [*c]SDL_LogicalAudioDevice = null,
};
pub const SDL_AudioDevice = struct_SDL_AudioDevice;
pub const SDL_AudioPostmixCallback = ?*const fn (userdata: ?*anyopaque, spec: [*c]const SDL_AudioSpec, buffer: [*c]f32, buflen: c_int) callconv(.c) void;
pub const struct_SDL_LogicalAudioDevice = extern struct {
    instance_id: SDL_AudioDeviceID = 0,
    physical_device: [*c]SDL_AudioDevice = null,
    paused: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    gain: f32 = 0,
    bound_streams: [*c]SDL_AudioStream = null,
    opened_as_default: bool = false,
    simplified: bool = false,
    postmix: SDL_AudioPostmixCallback = null,
    postmix_userdata: ?*anyopaque = null,
    props: SDL_PropertiesID = 0,
    next: [*c]SDL_LogicalAudioDevice = null,
    prev: [*c]SDL_LogicalAudioDevice = null,
};
pub const SDL_LogicalAudioDevice = struct_SDL_LogicalAudioDevice;
pub const struct_SDL_AudioStream = extern struct {
    lock: ?*SDL_Mutex = null,
    props: SDL_PropertiesID = 0,
    get_callback: SDL_AudioStreamCallback = null,
    get_callback_userdata: ?*anyopaque = null,
    put_callback: SDL_AudioStreamCallback = null,
    put_callback_userdata: ?*anyopaque = null,
    src_spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    dst_spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    src_chmap: [*c]c_int = null,
    dst_chmap: [*c]c_int = null,
    freq_ratio: f32 = 0,
    gain: f32 = 0,
    queue: ?*struct_SDL_AudioQueue = null,
    input_spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    input_chmap: [*c]c_int = null,
    input_chmap_storage: [8]c_int = @import("std").mem.zeroes([8]c_int),
    resample_offset: Sint64 = 0,
    work_buffer: [*c]Uint8 = null,
    work_buffer_allocation: usize = 0,
    simplified: bool = false,
    bound_device: [*c]SDL_LogicalAudioDevice = null,
    next_binding: [*c]SDL_AudioStream = null,
    prev_binding: [*c]SDL_AudioStream = null,
    prev: [*c]SDL_AudioStream = null,
    next: [*c]SDL_AudioStream = null,
};
pub extern fn SDL_CloseAudioDevice_REAL(devid: SDL_AudioDeviceID) void;
pub extern fn SDL_UnbindAudioStream_REAL(stream: [*c]SDL_AudioStream) void;
pub const SDL_AudioStreamDataCompleteCallback = ?*const fn (userdata: ?*anyopaque, buf: ?*const anyopaque, buflen: c_int) callconv(.c) void;
pub extern fn SDL_GetSilenceValueForFormat_REAL(format: SDL_AudioFormat) c_int;
pub extern fn SDL_HasSSE_REAL() bool;
pub extern fn SDL_HasSSE3_REAL() bool;
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const __m128 = @Vector(4, f32);
pub const __m128_u = @Vector(4, f32);
pub inline fn _mm_mul_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return __a * __b;
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
pub const _mm_hadd_ps = @import("simd")._mm_hadd_ps;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/pmmintrin.h:109:10: warning: TODO implement function '__builtin_ia32_hsubps' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/pmmintrin.h:107:55: warning: unable to translate function, demoted to extern
pub extern fn SDL_ChooseAudioConverters() void;
pub extern fn SDL_SetupAudioResampler() void;
pub extern fn ConvertAudioToFloat(dst: [*c]f32, src: ?*const anyopaque, num_samples: c_int, src_fmt: SDL_AudioFormat) void;
pub extern fn ConvertAudioFromFloat(dst: ?*anyopaque, src: [*c]const f32, num_samples: c_int, dst_fmt: SDL_AudioFormat) void;
pub extern fn ConvertAudioSwapEndian(dst: ?*anyopaque, src: ?*const anyopaque, num_samples: c_int, bitsize: c_int) void;
pub extern fn SDL_AudioSpecsEqual(a: [*c]const SDL_AudioSpec, b: [*c]const SDL_AudioSpec, channel_map_a: [*c]const c_int, channel_map_b: [*c]const c_int) bool;
pub extern fn SDL_AudioChannelMapsEqual(channels: c_int, channel_map_a: [*c]const c_int, channel_map_b: [*c]const c_int) bool;
pub extern fn SDL_ChannelMapDup(origchmap: [*c]const c_int, channels: c_int) [*c]c_int;
pub extern fn OnAudioStreamCreated(stream: [*c]SDL_AudioStream) void;
pub extern fn OnAudioStreamDestroy(stream: [*c]SDL_AudioStream) void;
pub const SDL_ReleaseAudioBufferCallback = SDL_AudioStreamDataCompleteCallback;
pub const SDL_AudioQueue = struct_SDL_AudioQueue;
pub const struct_SDL_AudioTrack = opaque {};
pub const SDL_AudioTrack = struct_SDL_AudioTrack;
pub extern fn SDL_CreateAudioQueue(chunk_size: usize) ?*SDL_AudioQueue;
pub extern fn SDL_DestroyAudioQueue(queue: ?*SDL_AudioQueue) void;
pub extern fn SDL_ClearAudioQueue(queue: ?*SDL_AudioQueue) void;
pub extern fn SDL_FlushAudioQueue(queue: ?*SDL_AudioQueue) void;
pub extern fn SDL_PopAudioQueueHead(queue: ?*SDL_AudioQueue) void;
pub extern fn SDL_WriteToAudioQueue(queue: ?*SDL_AudioQueue, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int, data: [*c]const Uint8, len: usize) bool;
pub extern fn SDL_CreateAudioTrack(queue: ?*SDL_AudioQueue, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int, data: [*c]Uint8, len: usize, capacity: usize, callback: SDL_ReleaseAudioBufferCallback, userdata: ?*anyopaque) ?*SDL_AudioTrack;
pub extern fn SDL_AddTrackToAudioQueue(queue: ?*SDL_AudioQueue, track: ?*SDL_AudioTrack) void;
pub extern fn SDL_BeginAudioQueueIter(queue: ?*SDL_AudioQueue) ?*anyopaque;
pub extern fn SDL_NextAudioQueueIter(queue: ?*SDL_AudioQueue, inout_iter: [*c]?*anyopaque, out_spec: [*c]SDL_AudioSpec, out_chmap: [*c][*c]c_int, out_flushed: [*c]bool) usize;
pub extern fn SDL_ReadFromAudioQueue(queue: ?*SDL_AudioQueue, dst: [*c]Uint8, dst_format: SDL_AudioFormat, dst_channels: c_int, dst_map: [*c]const c_int, past_frames: c_int, present_frames: c_int, future_frames: c_int, scratch: [*c]Uint8, gain: f32) [*c]const Uint8;
pub extern fn SDL_GetAudioQueueQueued(queue: ?*SDL_AudioQueue) usize;
pub extern fn SDL_ResetAudioQueueHistory(queue: ?*SDL_AudioQueue, num_frames: c_int) bool;
pub extern fn SDL_GetResampleRate(src_rate: c_int, dst_rate: c_int) Sint64;
pub extern fn SDL_GetResamplerHistoryFrames() c_int;
pub extern fn SDL_GetResamplerPaddingFrames(resample_rate: Sint64) c_int;
pub extern fn SDL_GetResamplerInputFrames(output_frames: Sint64, resample_rate: Sint64, resample_offset: Sint64) Sint64;
pub extern fn SDL_GetResamplerOutputFrames(input_frames: Sint64, resample_rate: Sint64, inout_resample_offset: [*c]Sint64) Sint64;
pub extern fn SDL_ResampleAudio(chans: c_int, src: [*c]const f32, inframes: c_int, dst: [*c]f32, outframes: c_int, resample_rate: Sint64, inout_resample_offset: [*c]Sint64) void;
pub fn SDL_ConvertStereoToMono_SSE3(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    const divby2: __m128 = _mm_set1_ps(0.5);
    _ = &divby2;
    var i: c_int = num_frames;
    _ = &i;
    while (i >= @as(c_int, 4)) {
        _mm_storeu_ps(dst, _mm_mul_ps(_mm_hadd_ps(_mm_loadu_ps(src), _mm_loadu_ps(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))), divby2));
        i -= 4;
        src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    }
    while (i != 0) {
        dst.* = (src[@as(c_int, 0)] + src[@as(c_int, 1)]) * @as(f32, 0.5);
        dst += 1;
        i -= 1;
        src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    }
}
pub fn SDL_ConvertMonoToStereo_SSE(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 4)) * @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 4)) * @as(c_int, 2)))));
    var i: c_int = num_frames;
    _ = &i;
    while (i >= @as(c_int, 4)) {
        const input: __m128 = _mm_loadu_ps(src);
        _ = &input;
        _mm_storeu_ps(dst, _mm_unpacklo_ps(input, input));
        _mm_storeu_ps(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), _mm_unpackhi_ps(input, input));
        i -= 4;
        src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
    }
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
    while (i != 0) {
        const srcFC: f32 = src[@as(c_int, 0)];
        _ = &srcFC;
        dst[@as(c_int, 1)] = srcFC;
        dst[@as(c_int, 0)] = srcFC;
        i -= 1;
        src -= 1;
        dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    }
}
pub const SDL_AudioChannelConverter = ?*const fn (dst: [*c]f32, src: [*c]const f32, num_frames: c_int) callconv(.c) void;
pub fn SDL_ConvertMonoToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoTo21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoTo41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoTo51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoTo61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertMonoTo71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast(num_frames - @as(c_int, 1)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= 1;
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 0)];
            _ = &srcFC;
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = srcFC;
            dst[@as(c_int, 0)] = srcFC;
        }
    }
}
pub fn SDL_ConvertStereoToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.5)) + (src[@as(c_int, 1)] * @as(f32, 0.5));
        }
    }
}
pub fn SDL_ConvertStereoTo21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertStereoToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertStereoTo41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertStereoTo51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertStereoTo61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertStereoTo71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 2)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert21ToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.333333)) + (src[@as(c_int, 1)] * @as(f32, 0.333333))) + (src[@as(c_int, 2)] * @as(f32, 0.333333));
        }
    }
}
pub fn SDL_Convert21ToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcLFE: f32 = src[@as(c_int, 2)];
            _ = &srcLFE;
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.8)) + (srcLFE * @as(f32, 0.2));
            dst[@as(c_int, 1)] = (src[@as(c_int, 1)] * @as(f32, 0.8)) + (srcLFE * @as(f32, 0.2));
        }
    }
}
pub fn SDL_Convert21ToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcLFE: f32 = src[@as(c_int, 2)];
            _ = &srcLFE;
            dst[@as(c_int, 3)] = srcLFE * @as(f32, 0.111111);
            dst[@as(c_int, 2)] = srcLFE * @as(f32, 0.111111);
            dst[@as(c_int, 1)] = (srcLFE * @as(f32, 0.111111)) + (src[@as(c_int, 1)] * @as(f32, 0.888889));
            dst[@as(c_int, 0)] = (srcLFE * @as(f32, 0.111111)) + (src[@as(c_int, 0)] * @as(f32, 0.888889));
        }
    }
}
pub fn SDL_Convert21To41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = src[@as(c_int, 2)];
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert21To51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert21To61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert21To71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 3)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = 0.0;
            dst[@as(c_int, 4)] = 0.0;
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertQuadToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = (((src[@as(c_int, 0)] * @as(f32, 0.25)) + (src[@as(c_int, 1)] * @as(f32, 0.25))) + (src[@as(c_int, 2)] * @as(f32, 0.25))) + (src[@as(c_int, 3)] * @as(f32, 0.25));
        }
    }
}
pub fn SDL_ConvertQuadToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 2)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 3)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.359))) + (srcBR * @as(f32, 0.22));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.22))) + (srcBR * @as(f32, 0.359));
        }
    }
}
pub fn SDL_ConvertQuadTo21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 2)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 3)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.359))) + (srcBR * @as(f32, 0.22));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.22))) + (srcBR * @as(f32, 0.359));
            dst[@as(c_int, 2)] = 0.0;
        }
    }
}
pub fn SDL_ConvertQuadTo41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            dst[@as(c_int, 4)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertQuadTo51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            dst[@as(c_int, 5)] = src[@as(c_int, 3)];
            dst[@as(c_int, 4)] = src[@as(c_int, 2)];
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_ConvertQuadTo61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 2)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 3)];
            _ = &srcBR;
            dst[@as(c_int, 6)] = srcBR * @as(f32, 0.796);
            dst[@as(c_int, 5)] = srcBL * @as(f32, 0.796);
            dst[@as(c_int, 4)] = (srcBR * @as(f32, 0.5)) + (srcBL * @as(f32, 0.5));
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)] * @as(f32, 0.94);
            dst[@as(c_int, 0)] = src[@as(c_int, 0)] * @as(f32, 0.94);
        }
    }
}
pub fn SDL_ConvertQuadTo71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 4)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = src[@as(c_int, 3)];
            dst[@as(c_int, 4)] = src[@as(c_int, 2)];
            dst[@as(c_int, 3)] = 0.0;
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert41ToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = ((((src[@as(c_int, 0)] * @as(f32, 0.2)) + (src[@as(c_int, 1)] * @as(f32, 0.2))) + (src[@as(c_int, 2)] * @as(f32, 0.2))) + (src[@as(c_int, 3)] * @as(f32, 0.2))) + (src[@as(c_int, 4)] * @as(f32, 0.2));
        }
    }
}
pub fn SDL_Convert41ToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcLFE: f32 = src[@as(c_int, 2)];
            _ = &srcLFE;
            const srcBL: f32 = src[@as(c_int, 3)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 4)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = (((src[@as(c_int, 0)] * @as(f32, 0.374222)) + (srcLFE * @as(f32, 0.111111))) + (srcBL * @as(f32, 0.319111))) + (srcBR * @as(f32, 0.195556));
            dst[@as(c_int, 1)] = (((src[@as(c_int, 1)] * @as(f32, 0.374222)) + (srcLFE * @as(f32, 0.111111))) + (srcBL * @as(f32, 0.195556))) + (srcBR * @as(f32, 0.319111));
        }
    }
}
pub fn SDL_Convert41To21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 3)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 4)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.359))) + (srcBR * @as(f32, 0.22));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.421)) + (srcBL * @as(f32, 0.22))) + (srcBR * @as(f32, 0.359));
            dst[@as(c_int, 2)] = src[@as(c_int, 2)];
        }
    }
}
pub fn SDL_Convert41ToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcLFE: f32 = src[@as(c_int, 2)];
            _ = &srcLFE;
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.941176)) + (srcLFE * @as(f32, 0.058824));
            dst[@as(c_int, 1)] = (src[@as(c_int, 1)] * @as(f32, 0.941176)) + (srcLFE * @as(f32, 0.058824));
            dst[@as(c_int, 2)] = (srcLFE * @as(f32, 0.058824)) + (src[@as(c_int, 3)] * @as(f32, 0.941176));
            dst[@as(c_int, 3)] = (srcLFE * @as(f32, 0.058824)) + (src[@as(c_int, 4)] * @as(f32, 0.941176));
        }
    }
}
pub fn SDL_Convert41To51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            dst[@as(c_int, 5)] = src[@as(c_int, 4)];
            dst[@as(c_int, 4)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert41To61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 3)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 4)];
            _ = &srcBR;
            dst[@as(c_int, 6)] = srcBR * @as(f32, 0.796);
            dst[@as(c_int, 5)] = srcBL * @as(f32, 0.796);
            dst[@as(c_int, 4)] = (srcBR * @as(f32, 0.5)) + (srcBL * @as(f32, 0.5));
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)] * @as(f32, 0.94);
            dst[@as(c_int, 0)] = src[@as(c_int, 0)] * @as(f32, 0.94);
        }
    }
}
pub fn SDL_Convert41To71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 5)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = src[@as(c_int, 4)];
            dst[@as(c_int, 4)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = src[@as(c_int, 2)];
            dst[@as(c_int, 2)] = 0.0;
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert51ToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = (((((src[@as(c_int, 0)] * @as(f32, 0.166667)) + (src[@as(c_int, 1)] * @as(f32, 0.166667))) + (src[@as(c_int, 2)] * @as(f32, 0.166667))) + (src[@as(c_int, 3)] * @as(f32, 0.166667))) + (src[@as(c_int, 4)] * @as(f32, 0.166667))) + (src[@as(c_int, 5)] * @as(f32, 0.166667));
        }
    }
}
pub fn SDL_Convert51ToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = ((((src[@as(c_int, 0)] * @as(f32, 0.294545)) + (srcFC * @as(f32, 0.208182))) + (srcLFE * @as(f32, 0.090909))) + (srcBL * @as(f32, 0.251818))) + (srcBR * @as(f32, 0.154545));
            dst[@as(c_int, 1)] = ((((src[@as(c_int, 1)] * @as(f32, 0.294545)) + (srcFC * @as(f32, 0.208182))) + (srcLFE * @as(f32, 0.090909))) + (srcBL * @as(f32, 0.154545))) + (srcBR * @as(f32, 0.251818));
        }
    }
}
pub fn SDL_Convert51To21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = (((src[@as(c_int, 0)] * @as(f32, 0.324)) + (srcFC * @as(f32, 0.229))) + (srcBL * @as(f32, 0.277))) + (srcBR * @as(f32, 0.17));
            dst[@as(c_int, 1)] = (((src[@as(c_int, 1)] * @as(f32, 0.324)) + (srcFC * @as(f32, 0.229))) + (srcBL * @as(f32, 0.17))) + (srcBR * @as(f32, 0.277));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
        }
    }
}
pub fn SDL_Convert51ToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.558095)) + (srcFC * @as(f32, 0.394286))) + (srcLFE * @as(f32, 0.047619));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.558095)) + (srcFC * @as(f32, 0.394286))) + (srcLFE * @as(f32, 0.047619));
            dst[@as(c_int, 2)] = (srcLFE * @as(f32, 0.047619)) + (src[@as(c_int, 4)] * @as(f32, 0.558095));
            dst[@as(c_int, 3)] = (srcLFE * @as(f32, 0.047619)) + (src[@as(c_int, 5)] * @as(f32, 0.558095));
        }
    }
}
pub fn SDL_Convert51To41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.586)) + (srcFC * @as(f32, 0.414));
            dst[@as(c_int, 1)] = (src[@as(c_int, 1)] * @as(f32, 0.586)) + (srcFC * @as(f32, 0.414));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = src[@as(c_int, 4)] * @as(f32, 0.586);
            dst[@as(c_int, 4)] = src[@as(c_int, 5)] * @as(f32, 0.586);
        }
    }
}
pub fn SDL_Convert51To61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            dst[@as(c_int, 6)] = srcBR * @as(f32, 0.796);
            dst[@as(c_int, 5)] = srcBL * @as(f32, 0.796);
            dst[@as(c_int, 4)] = (srcBR * @as(f32, 0.5)) + (srcBL * @as(f32, 0.5));
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 2)] = src[@as(c_int, 2)] * @as(f32, 0.94);
            dst[@as(c_int, 1)] = src[@as(c_int, 1)] * @as(f32, 0.94);
            dst[@as(c_int, 0)] = src[@as(c_int, 0)] * @as(f32, 0.94);
        }
    }
}
pub fn SDL_Convert51To71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 6)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            dst[@as(c_int, 7)] = 0.0;
            dst[@as(c_int, 6)] = 0.0;
            dst[@as(c_int, 5)] = src[@as(c_int, 5)];
            dst[@as(c_int, 4)] = src[@as(c_int, 4)];
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 2)] = src[@as(c_int, 2)];
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert61ToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = ((((((src[@as(c_int, 0)] * @as(f32, 0.143143)) + (src[@as(c_int, 1)] * @as(f32, 0.143143))) + (src[@as(c_int, 2)] * @as(f32, 0.143143))) + (src[@as(c_int, 3)] * @as(f32, 0.142857))) + (src[@as(c_int, 4)] * @as(f32, 0.143143))) + (src[@as(c_int, 5)] * @as(f32, 0.143143))) + (src[@as(c_int, 6)] * @as(f32, 0.143143));
        }
    }
}
pub fn SDL_Convert61ToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            const srcSL: f32 = src[@as(c_int, 5)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 6)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (((((src[@as(c_int, 0)] * @as(f32, 0.247385)) + (srcFC * @as(f32, 0.174462))) + (srcLFE * @as(f32, 0.076923))) + (srcBC * @as(f32, 0.174462))) + (srcSL * @as(f32, 0.226154))) + (srcSR * @as(f32, 0.100615));
            dst[@as(c_int, 1)] = (((((src[@as(c_int, 1)] * @as(f32, 0.247385)) + (srcFC * @as(f32, 0.174462))) + (srcLFE * @as(f32, 0.076923))) + (srcBC * @as(f32, 0.174462))) + (srcSL * @as(f32, 0.100615))) + (srcSR * @as(f32, 0.226154));
        }
    }
}
pub fn SDL_Convert61To21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            const srcSL: f32 = src[@as(c_int, 5)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 6)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = ((((src[@as(c_int, 0)] * @as(f32, 0.268)) + (srcFC * @as(f32, 0.189))) + (srcBC * @as(f32, 0.189))) + (srcSL * @as(f32, 0.245))) + (srcSR * @as(f32, 0.109));
            dst[@as(c_int, 1)] = ((((src[@as(c_int, 1)] * @as(f32, 0.268)) + (srcFC * @as(f32, 0.189))) + (srcBC * @as(f32, 0.189))) + (srcSL * @as(f32, 0.109))) + (srcSR * @as(f32, 0.245));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
        }
    }
}
pub fn SDL_Convert61ToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            const srcSL: f32 = src[@as(c_int, 5)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 6)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (((src[@as(c_int, 0)] * @as(f32, 0.46368)) + (srcFC * @as(f32, 0.32736))) + (srcLFE * @as(f32, 0.04))) + (srcSL * @as(f32, 0.16896));
            dst[@as(c_int, 1)] = (((src[@as(c_int, 1)] * @as(f32, 0.46368)) + (srcFC * @as(f32, 0.32736))) + (srcLFE * @as(f32, 0.04))) + (srcSR * @as(f32, 0.16896));
            dst[@as(c_int, 2)] = ((srcLFE * @as(f32, 0.04)) + (srcBC * @as(f32, 0.32736))) + (srcSL * @as(f32, 0.43104));
            dst[@as(c_int, 3)] = ((srcLFE * @as(f32, 0.04)) + (srcBC * @as(f32, 0.32736))) + (srcSR * @as(f32, 0.43104));
        }
    }
}
pub fn SDL_Convert61To41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            const srcSL: f32 = src[@as(c_int, 5)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 6)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.483)) + (srcFC * @as(f32, 0.341))) + (srcSL * @as(f32, 0.176));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.483)) + (srcFC * @as(f32, 0.341))) + (srcSR * @as(f32, 0.176));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = (srcBC * @as(f32, 0.341)) + (srcSL * @as(f32, 0.449));
            dst[@as(c_int, 4)] = (srcBC * @as(f32, 0.341)) + (srcSR * @as(f32, 0.449));
        }
    }
}
pub fn SDL_Convert61To51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            const srcSL: f32 = src[@as(c_int, 5)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 6)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.611)) + (srcSL * @as(f32, 0.223));
            dst[@as(c_int, 1)] = (src[@as(c_int, 1)] * @as(f32, 0.611)) + (srcSR * @as(f32, 0.223));
            dst[@as(c_int, 2)] = src[@as(c_int, 2)] * @as(f32, 0.611);
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 4)] = (srcBC * @as(f32, 0.432)) + (srcSL * @as(f32, 0.568));
            dst[@as(c_int, 5)] = (srcBC * @as(f32, 0.432)) + (srcSR * @as(f32, 0.568));
        }
    }
}
pub fn SDL_Convert61To71(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    src += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 7)))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((num_frames - @as(c_int, 1)) * @as(c_int, 8)))));
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
            dst -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
        }) {
            const srcBC: f32 = src[@as(c_int, 4)];
            _ = &srcBC;
            dst[@as(c_int, 7)] = src[@as(c_int, 6)];
            dst[@as(c_int, 6)] = src[@as(c_int, 5)];
            dst[@as(c_int, 5)] = srcBC * @as(f32, 0.707);
            dst[@as(c_int, 4)] = srcBC * @as(f32, 0.707);
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 2)] = src[@as(c_int, 2)];
            dst[@as(c_int, 1)] = src[@as(c_int, 1)];
            dst[@as(c_int, 0)] = src[@as(c_int, 0)];
        }
    }
}
pub fn SDL_Convert71ToMono(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += 1;
        }) {
            dst[@as(c_int, 0)] = (((((((src[@as(c_int, 0)] * @as(f32, 0.125125)) + (src[@as(c_int, 1)] * @as(f32, 0.125125))) + (src[@as(c_int, 2)] * @as(f32, 0.125125))) + (src[@as(c_int, 3)] * @as(f32, 0.125))) + (src[@as(c_int, 4)] * @as(f32, 0.125125))) + (src[@as(c_int, 5)] * @as(f32, 0.125125))) + (src[@as(c_int, 6)] * @as(f32, 0.125125))) + (src[@as(c_int, 7)] * @as(f32, 0.125125));
        }
    }
}
pub fn SDL_Convert71ToStereo(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            const srcSL: f32 = src[@as(c_int, 6)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 7)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = ((((((src[@as(c_int, 0)] * @as(f32, 0.211867)) + (srcFC * @as(f32, 0.150267))) + (srcLFE * @as(f32, 0.066667))) + (srcBL * @as(f32, 0.181067))) + (srcBR * @as(f32, 0.111067))) + (srcSL * @as(f32, 0.194133))) + (srcSR * @as(f32, 0.085867));
            dst[@as(c_int, 1)] = ((((((src[@as(c_int, 1)] * @as(f32, 0.211867)) + (srcFC * @as(f32, 0.150267))) + (srcLFE * @as(f32, 0.066667))) + (srcBL * @as(f32, 0.111067))) + (srcBR * @as(f32, 0.181067))) + (srcSL * @as(f32, 0.085867))) + (srcSR * @as(f32, 0.194133));
        }
    }
}
pub fn SDL_Convert71To21(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            const srcSL: f32 = src[@as(c_int, 6)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 7)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (((((src[@as(c_int, 0)] * @as(f32, 0.227)) + (srcFC * @as(f32, 0.161))) + (srcBL * @as(f32, 0.194))) + (srcBR * @as(f32, 0.119))) + (srcSL * @as(f32, 0.208))) + (srcSR * @as(f32, 0.092));
            dst[@as(c_int, 1)] = (((((src[@as(c_int, 1)] * @as(f32, 0.227)) + (srcFC * @as(f32, 0.161))) + (srcBL * @as(f32, 0.119))) + (srcBR * @as(f32, 0.194))) + (srcSL * @as(f32, 0.092))) + (srcSR * @as(f32, 0.208));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
        }
    }
}
pub fn SDL_Convert71ToQuad(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcLFE: f32 = src[@as(c_int, 3)];
            _ = &srcLFE;
            const srcSL: f32 = src[@as(c_int, 6)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 7)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (((src[@as(c_int, 0)] * @as(f32, 0.466345)) + (srcFC * @as(f32, 0.329241))) + (srcLFE * @as(f32, 0.034483))) + (srcSL * @as(f32, 0.169931));
            dst[@as(c_int, 1)] = (((src[@as(c_int, 1)] * @as(f32, 0.466345)) + (srcFC * @as(f32, 0.329241))) + (srcLFE * @as(f32, 0.034483))) + (srcSR * @as(f32, 0.169931));
            dst[@as(c_int, 2)] = ((srcLFE * @as(f32, 0.034483)) + (src[@as(c_int, 4)] * @as(f32, 0.466345))) + (srcSL * @as(f32, 0.433517));
            dst[@as(c_int, 3)] = ((srcLFE * @as(f32, 0.034483)) + (src[@as(c_int, 5)] * @as(f32, 0.466345))) + (srcSR * @as(f32, 0.433517));
        }
    }
}
pub fn SDL_Convert71To41(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5)))));
        }) {
            const srcFC: f32 = src[@as(c_int, 2)];
            _ = &srcFC;
            const srcSL: f32 = src[@as(c_int, 6)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 7)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = ((src[@as(c_int, 0)] * @as(f32, 0.483)) + (srcFC * @as(f32, 0.341))) + (srcSL * @as(f32, 0.176));
            dst[@as(c_int, 1)] = ((src[@as(c_int, 1)] * @as(f32, 0.483)) + (srcFC * @as(f32, 0.341))) + (srcSR * @as(f32, 0.176));
            dst[@as(c_int, 2)] = src[@as(c_int, 3)];
            dst[@as(c_int, 3)] = (src[@as(c_int, 4)] * @as(f32, 0.483)) + (srcSL * @as(f32, 0.449));
            dst[@as(c_int, 4)] = (src[@as(c_int, 5)] * @as(f32, 0.483)) + (srcSR * @as(f32, 0.449));
        }
    }
}
pub fn SDL_Convert71To51(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
        }) {
            const srcSL: f32 = src[@as(c_int, 6)];
            _ = &srcSL;
            const srcSR: f32 = src[@as(c_int, 7)];
            _ = &srcSR;
            dst[@as(c_int, 0)] = (src[@as(c_int, 0)] * @as(f32, 0.518)) + (srcSL * @as(f32, 0.189));
            dst[@as(c_int, 1)] = (src[@as(c_int, 1)] * @as(f32, 0.518)) + (srcSR * @as(f32, 0.189));
            dst[@as(c_int, 2)] = src[@as(c_int, 2)] * @as(f32, 0.518);
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 4)] = (src[@as(c_int, 4)] * @as(f32, 0.518)) + (srcSL * @as(f32, 0.482));
            dst[@as(c_int, 5)] = (src[@as(c_int, 5)] * @as(f32, 0.518)) + (srcSR * @as(f32, 0.482));
        }
    }
}
pub fn SDL_Convert71To61(arg_dst: [*c]f32, arg_src: [*c]const f32, num_frames: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_frames;
        while (i != 0) : ({
            i -= 1;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7)))));
        }) {
            const srcBL: f32 = src[@as(c_int, 4)];
            _ = &srcBL;
            const srcBR: f32 = src[@as(c_int, 5)];
            _ = &srcBR;
            dst[@as(c_int, 0)] = src[@as(c_int, 0)] * @as(f32, 0.541);
            dst[@as(c_int, 1)] = src[@as(c_int, 1)] * @as(f32, 0.541);
            dst[@as(c_int, 2)] = src[@as(c_int, 2)] * @as(f32, 0.541);
            dst[@as(c_int, 3)] = src[@as(c_int, 3)];
            dst[@as(c_int, 4)] = (srcBL * @as(f32, 0.288)) + (srcBR * @as(f32, 0.288));
            dst[@as(c_int, 5)] = (srcBL * @as(f32, 0.459)) + (src[@as(c_int, 6)] * @as(f32, 0.541));
            dst[@as(c_int, 6)] = (srcBR * @as(f32, 0.459)) + (src[@as(c_int, 7)] * @as(f32, 0.541));
        }
    }
}
pub var channel_converters: [8][8]SDL_AudioChannelConverter = [8][8]SDL_AudioChannelConverter{
    [8]SDL_AudioChannelConverter{
        null,
        SDL_ConvertMonoToStereo,
        SDL_ConvertMonoTo21,
        SDL_ConvertMonoToQuad,
        SDL_ConvertMonoTo41,
        SDL_ConvertMonoTo51,
        SDL_ConvertMonoTo61,
        SDL_ConvertMonoTo71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_ConvertStereoToMono,
        null,
        SDL_ConvertStereoTo21,
        SDL_ConvertStereoToQuad,
        SDL_ConvertStereoTo41,
        SDL_ConvertStereoTo51,
        SDL_ConvertStereoTo61,
        SDL_ConvertStereoTo71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_Convert21ToMono,
        SDL_Convert21ToStereo,
        null,
        SDL_Convert21ToQuad,
        SDL_Convert21To41,
        SDL_Convert21To51,
        SDL_Convert21To61,
        SDL_Convert21To71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_ConvertQuadToMono,
        SDL_ConvertQuadToStereo,
        SDL_ConvertQuadTo21,
        null,
        SDL_ConvertQuadTo41,
        SDL_ConvertQuadTo51,
        SDL_ConvertQuadTo61,
        SDL_ConvertQuadTo71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_Convert41ToMono,
        SDL_Convert41ToStereo,
        SDL_Convert41To21,
        SDL_Convert41ToQuad,
        null,
        SDL_Convert41To51,
        SDL_Convert41To61,
        SDL_Convert41To71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_Convert51ToMono,
        SDL_Convert51ToStereo,
        SDL_Convert51To21,
        SDL_Convert51ToQuad,
        SDL_Convert51To41,
        null,
        SDL_Convert51To61,
        SDL_Convert51To71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_Convert61ToMono,
        SDL_Convert61ToStereo,
        SDL_Convert61To21,
        SDL_Convert61ToQuad,
        SDL_Convert61To41,
        SDL_Convert61To51,
        null,
        SDL_Convert61To71,
    },
    [8]SDL_AudioChannelConverter{
        SDL_Convert71ToMono,
        SDL_Convert71ToStereo,
        SDL_Convert71To21,
        SDL_Convert71ToQuad,
        SDL_Convert71To41,
        SDL_Convert71To51,
        SDL_Convert71To61,
        null,
    },
};
pub fn SDL_IsSupportedAudioFormat(fmt: SDL_AudioFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &fmt;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (fmt) {
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16LE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16BE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32LE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32BE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32LE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32BE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                return @"true" != 0;
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_IsSupportedChannelCount(channels: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &channels;
    return (channels >= @as(c_int, 1)) and (channels <= @as(c_int, 8));
}
pub export fn SDL_ChannelMapIsBogus(chmap: [*c]const c_int, channels: c_int) bool {
    @setEvalBranchQuota(100000);
    if (chmap != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < channels) : (i += 1) {
                const mapping: c_int = chmap[@bitCast(@as(isize, @intCast(i)))];
                _ = &mapping;
                if ((mapping < -@as(c_int, 1)) or (mapping >= channels)) {
                    return @"true" != 0;
                }
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_ChannelMapIsDefault(chmap: [*c]const c_int, channels: c_int) bool {
    @setEvalBranchQuota(100000);
    if (chmap != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < channels) : (i += 1) {
                if (chmap[@bitCast(@as(isize, @intCast(i)))] != i) {
                    return @"false" != 0;
                }
            }
        }
    }
    return @"true" != 0;
}
pub fn SwizzleAudio(num_frames: c_int, dst: ?*anyopaque, src: ?*const anyopaque, channels: c_int, map: [*c]const c_int, fmt: SDL_AudioFormat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &num_frames;
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SwizzleAudio".*;
    };
    _ = &static_local___func__;
    var bitsize: c_int = undefined;
    _ = &bitsize;
    var has_null_mappings: bool = undefined;
    _ = &has_null_mappings;
    var i: c_int = undefined;
    _ = &i;
    var tdst: [*c]Uint8 = undefined;
    _ = &tdst;
    var tsrc: [*c]const Uint8 = undefined;
    _ = &tsrc;
    var silence: Uint8 = undefined;
    _ = &silence;
    var i_1: c_int = undefined;
    _ = &i_1;
    var ch: c_int = undefined;
    _ = &ch;
    var m: c_int = undefined;
    _ = &m;
    var i_2: c_int = undefined;
    _ = &i_2;
    var ch_3: c_int = undefined;
    _ = &ch_3;
    var isstack: bool = undefined;
    _ = &isstack;
    var tmp: [*c]Uint8 = undefined;
    _ = &tmp;
    var silence_4: Uint8 = undefined;
    _ = &silence_4;
    var i_5: c_int = undefined;
    _ = &i_5;
    var ch_6: c_int = undefined;
    _ = &ch_6;
    var m_7: c_int = undefined;
    _ = &m_7;
    var ch_8: c_int = undefined;
    _ = &ch_8;
    var i_9: c_int = undefined;
    _ = &i_9;
    var ch_10: c_int = undefined;
    _ = &ch_10;
    var ch_11: c_int = undefined;
    _ = &ch_11;
    var tdst_12: [*c]Uint16 = undefined;
    _ = &tdst_12;
    var tsrc_13: [*c]const Uint16 = undefined;
    _ = &tsrc_13;
    var silence_14: Uint16 = undefined;
    _ = &silence_14;
    var i_15: c_int = undefined;
    _ = &i_15;
    var ch_16: c_int = undefined;
    _ = &ch_16;
    var m_17: c_int = undefined;
    _ = &m_17;
    var i_18: c_int = undefined;
    _ = &i_18;
    var ch_19: c_int = undefined;
    _ = &ch_19;
    var isstack_20: bool = undefined;
    _ = &isstack_20;
    var tmp_21: [*c]Uint16 = undefined;
    _ = &tmp_21;
    var silence_22: Uint16 = undefined;
    _ = &silence_22;
    var i_23: c_int = undefined;
    _ = &i_23;
    var ch_24: c_int = undefined;
    _ = &ch_24;
    var m_25: c_int = undefined;
    _ = &m_25;
    var ch_26: c_int = undefined;
    _ = &ch_26;
    var i_27: c_int = undefined;
    _ = &i_27;
    var ch_28: c_int = undefined;
    _ = &ch_28;
    var ch_29: c_int = undefined;
    _ = &ch_29;
    var tdst_30: [*c]Uint32 = undefined;
    _ = &tdst_30;
    var tsrc_31: [*c]const Uint32 = undefined;
    _ = &tsrc_31;
    var silence_32: Uint32 = undefined;
    _ = &silence_32;
    var i_33: c_int = undefined;
    _ = &i_33;
    var ch_34: c_int = undefined;
    _ = &ch_34;
    var m_35: c_int = undefined;
    _ = &m_35;
    var i_36: c_int = undefined;
    _ = &i_36;
    var ch_37: c_int = undefined;
    _ = &ch_37;
    var isstack_38: bool = undefined;
    _ = &isstack_38;
    var tmp_39: [*c]Uint32 = undefined;
    _ = &tmp_39;
    var silence_40: Uint32 = undefined;
    _ = &silence_40;
    var i_41: c_int = undefined;
    _ = &i_41;
    var ch_42: c_int = undefined;
    _ = &ch_42;
    var m_43: c_int = undefined;
    _ = &m_43;
    var ch_44: c_int = undefined;
    _ = &ch_44;
    var i_45: c_int = undefined;
    _ = &i_45;
    var ch_46: c_int = undefined;
    _ = &ch_46;
    var ch_47: c_int = undefined;
    _ = &ch_47;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unsupported audio datatype size\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    i_1 += 1;
    tsrc += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_2 += 1;
    tsrc += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_5 += 1;
    tsrc += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_9 += 1;
    tsrc += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_15 += 1;
    tsrc_13 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_18 += 1;
    tsrc_13 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_23 += 1;
    tsrc_13 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_27 += 1;
    tsrc_13 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_33 += 1;
    tsrc_31 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_36 += 1;
    tsrc_31 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_41 += 1;
    tsrc_31 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    i_45 += 1;
    tsrc_31 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                bitsize = @bitCast(fmt & @as(c_uint, 255));
                has_null_mappings = @"false" != 0;
                i = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (i < channels) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (map[@bitCast(@as(isize, @intCast(i)))] == -@as(c_int, 1)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                i += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                switch (bitsize) {
                    @as(c_int, 8) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 121;
                        continue;
                    },
                    else => {
                        sdl_pc = 177;
                        continue;
                    },
                }
            },
            5 => {
                has_null_mappings = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                {}
            },
            9 => {
                tdst = @ptrCast(@alignCast(dst));
                tsrc = @ptrCast(@alignCast(src));
                if (src != dst) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (has_null_mappings) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                tmp = @ptrCast(@alignCast(blk: {
                    (&isstack).* = (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&isstack).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels))))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))))));
                }));
                if (tmp != null) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            13 => {
                silence = @bitCast(@as(i8, @truncate(SDL_GetSilenceValueForFormat_REAL(fmt))));
                i_1 = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                i_2 = 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (i_1 < num_frames) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                ch = 0;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                tdst += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                if (ch < channels) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                m = map[@bitCast(@as(isize, @intCast(ch)))];
                tdst[@bitCast(@as(isize, @intCast(ch)))] = @bitCast(@as(i8, @truncate(if (m == -@as(c_int, 1)) @as(c_int, silence) else @as(c_int, tsrc[@bitCast(@as(isize, @intCast(m)))]))));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                ch += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            24 => {
                if (i_2 < num_frames) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                ch_3 = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                tdst += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            28 => {
                if (ch_3 < channels) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                tdst[@bitCast(@as(isize, @intCast(ch_3)))] = tsrc[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_3)))])))];
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                ch_3 += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            32 => {
                if (has_null_mappings) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            35 => {
                silence_4 = @bitCast(@as(i8, @truncate(SDL_GetSilenceValueForFormat_REAL(fmt))));
                i_5 = 0;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                i_9 = 0;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            37 => {
                if (isstack) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            38 => {
                if (i_5 < num_frames) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                ch_6 = 0;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                tdst += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                if (ch_6 < channels) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                m_7 = map[@bitCast(@as(isize, @intCast(ch_6)))];
                tmp[@bitCast(@as(isize, @intCast(ch_6)))] = @bitCast(@as(i8, @truncate(if (m_7 == -@as(c_int, 1)) @as(c_int, silence_4) else @as(c_int, tsrc[@bitCast(@as(isize, @intCast(m_7)))]))));
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                ch_6 += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            45 => {
                ch_8 = 0;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (ch_8 < channels) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                tdst[@bitCast(@as(isize, @intCast(ch_8)))] = tmp[@bitCast(@as(isize, @intCast(ch_8)))];
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                ch_8 += 1;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            50 => {
                if (i_9 < num_frames) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                ch_10 = 0;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                tdst += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            54 => {
                if (ch_10 < channels) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                tmp[@bitCast(@as(isize, @intCast(ch_10)))] = tsrc[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_10)))])))];
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                ch_10 += 1;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                ch_11 = 0;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (ch_11 < channels) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                tdst[@bitCast(@as(isize, @intCast(ch_11)))] = tmp[@bitCast(@as(isize, @intCast(ch_11)))];
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                ch_11 += 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            62 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp)));
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp)));
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            65 => {
                tdst_12 = @ptrCast(@alignCast(dst));
                tsrc_13 = @ptrCast(@alignCast(src));
                if (src != dst) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                if (has_null_mappings) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                tmp_21 = @ptrCast(@alignCast(blk: {
                    (&isstack_20).* = (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&isstack_20).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels))))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))))));
                }));
                if (tmp_21 != null) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            69 => {
                silence_14 = @bitCast(@as(c_short, @truncate(SDL_GetSilenceValueForFormat_REAL(fmt))));
                i_15 = 0;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                i_18 = 0;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                if (i_15 < num_frames) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                ch_16 = 0;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                tdst_12 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            76 => {
                if (ch_16 < channels) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            77 => {
                m_17 = map[@bitCast(@as(isize, @intCast(ch_16)))];
                tdst_12[@bitCast(@as(isize, @intCast(ch_16)))] = @bitCast(@as(c_short, @truncate(if (m_17 == -@as(c_int, 1)) @as(c_int, silence_14) else @as(c_int, tsrc_13[@bitCast(@as(isize, @intCast(m_17)))]))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                ch_16 += 1;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            80 => {
                if (i_18 < num_frames) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                ch_19 = 0;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                tdst_12 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            84 => {
                if (ch_19 < channels) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                tdst_12[@bitCast(@as(isize, @intCast(ch_19)))] = tsrc_13[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_19)))])))];
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                ch_19 += 1;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            88 => {
                if (has_null_mappings) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            91 => {
                silence_22 = @bitCast(@as(c_short, @truncate(SDL_GetSilenceValueForFormat_REAL(fmt))));
                i_23 = 0;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                i_27 = 0;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            93 => {
                if (isstack_20) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            94 => {
                if (i_23 < num_frames) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            95 => {
                ch_24 = 0;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            96 => {
                tdst_12 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            98 => {
                if (ch_24 < channels) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            99 => {
                m_25 = map[@bitCast(@as(isize, @intCast(ch_24)))];
                tmp_21[@bitCast(@as(isize, @intCast(ch_24)))] = @bitCast(@as(c_short, @truncate(if (m_25 == -@as(c_int, 1)) @as(c_int, silence_22) else @as(c_int, tsrc_13[@bitCast(@as(isize, @intCast(m_25)))]))));
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                ch_24 += 1;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            101 => {
                ch_26 = 0;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                if (ch_26 < channels) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                tdst_12[@bitCast(@as(isize, @intCast(ch_26)))] = tmp_21[@bitCast(@as(isize, @intCast(ch_26)))];
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                ch_26 += 1;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            106 => {
                if (i_27 < num_frames) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                ch_28 = 0;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                tdst_12 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            110 => {
                if (ch_28 < channels) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            111 => {
                tmp_21[@bitCast(@as(isize, @intCast(ch_28)))] = tsrc_13[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_28)))])))];
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                ch_28 += 1;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            113 => {
                ch_29 = 0;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                if (ch_29 < channels) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                tdst_12[@bitCast(@as(isize, @intCast(ch_29)))] = tmp_21[@bitCast(@as(isize, @intCast(ch_29)))];
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                ch_29 += 1;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            118 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp_21)));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp_21)));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            121 => {
                tdst_30 = @ptrCast(@alignCast(dst));
                tsrc_31 = @ptrCast(@alignCast(src));
                if (src != dst) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                if (has_null_mappings) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            123 => {
                tmp_39 = @ptrCast(@alignCast(blk: {
                    (&isstack_38).* = (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&isstack_38).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels))))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, channels)))))));
                }));
                if (tmp_39 != null) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            125 => {
                silence_32 = @bitCast(@as(c_int, SDL_GetSilenceValueForFormat_REAL(fmt)));
                i_33 = 0;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            126 => {
                i_36 = 0;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            128 => {
                if (i_33 < num_frames) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            129 => {
                ch_34 = 0;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            130 => {
                tdst_30 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            132 => {
                if (ch_34 < channels) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                m_35 = map[@bitCast(@as(isize, @intCast(ch_34)))];
                tdst_30[@bitCast(@as(isize, @intCast(ch_34)))] = if (m_35 == -@as(c_int, 1)) silence_32 else tsrc_31[@bitCast(@as(isize, @intCast(m_35)))];
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                ch_34 += 1;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            136 => {
                if (i_36 < num_frames) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                ch_37 = 0;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            138 => {
                tdst_30 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            140 => {
                if (ch_37 < channels) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            141 => {
                tdst_30[@bitCast(@as(isize, @intCast(ch_37)))] = tsrc_31[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_37)))])))];
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                ch_37 += 1;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            144 => {
                if (has_null_mappings) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            147 => {
                silence_40 = @bitCast(@as(c_int, SDL_GetSilenceValueForFormat_REAL(fmt)));
                i_41 = 0;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            148 => {
                i_45 = 0;
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            149 => {
                if (isstack_38) {
                    sdl_pc = 174;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            150 => {
                if (i_41 < num_frames) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            151 => {
                ch_42 = 0;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            152 => {
                tdst_30 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            154 => {
                if (ch_42 < channels) {
                    sdl_pc = 155;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            155 => {
                m_43 = map[@bitCast(@as(isize, @intCast(ch_42)))];
                tmp_39[@bitCast(@as(isize, @intCast(ch_42)))] = if (m_43 == -@as(c_int, 1)) silence_40 else tsrc_31[@bitCast(@as(isize, @intCast(m_43)))];
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            156 => {
                ch_42 += 1;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            157 => {
                ch_44 = 0;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                if (ch_44 < channels) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            159 => {
                tdst_30[@bitCast(@as(isize, @intCast(ch_44)))] = tmp_39[@bitCast(@as(isize, @intCast(ch_44)))];
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                ch_44 += 1;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            162 => {
                if (i_45 < num_frames) {
                    sdl_pc = 163;
                    continue;
                } else {
                    sdl_pc = 165;
                    continue;
                }
            },
            163 => {
                ch_46 = 0;
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            164 => {
                tdst_30 += @as(usize, @bitCast(@as(isize, @intCast(channels))));
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            165 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            166 => {
                if (ch_46 < channels) {
                    sdl_pc = 167;
                    continue;
                } else {
                    sdl_pc = 169;
                    continue;
                }
            },
            167 => {
                tmp_39[@bitCast(@as(isize, @intCast(ch_46)))] = tsrc_31[@bitCast(@as(isize, @intCast(map[@bitCast(@as(isize, @intCast(ch_46)))])))];
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                ch_46 += 1;
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            169 => {
                ch_47 = 0;
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                if (ch_47 < channels) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            171 => {
                tdst_30[@bitCast(@as(isize, @intCast(ch_47)))] = tmp_39[@bitCast(@as(isize, @intCast(ch_47)))];
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            172 => {
                ch_47 += 1;
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            174 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp_39)));
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                SDL_free_REAL(@ptrCast(@alignCast(tmp_39)));
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            179 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 178;
                    continue;
                } else {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            181 => {
                if (!!(@intFromPtr("Unsupported audio datatype size") != 0)) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 183;
                    continue;
                }
            },
            182 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 219);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 185;
                    continue;
                }
            },
            183 => {
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            184 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            185 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 187;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            186 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            187 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            188 => {
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn ConvertAudio(num_frames: c_int, arg_src: ?*const anyopaque, src_format: SDL_AudioFormat, src_channels: c_int, arg_src_map: [*c]const c_int, dst: ?*anyopaque, dst_format: SDL_AudioFormat, dst_channels: c_int, arg_dst_map: [*c]const c_int, arg_scratch: ?*anyopaque, gain: f32) void {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var src_map = arg_src_map;
    _ = &src_map;
    var dst_map = arg_dst_map;
    _ = &dst_map;
    var scratch = arg_scratch;
    _ = &scratch;
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "ConvertAudio".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(src != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "src != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 242);
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
        while (!(dst != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dst != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 243);
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
        while (!SDL_IsSupportedAudioFormat(src_format)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsSupportedAudioFormat(src_format)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 244);
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
        while (!SDL_IsSupportedAudioFormat(dst_format)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsSupportedAudioFormat(dst_format)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 245);
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
        while (!SDL_IsSupportedChannelCount(src_channels)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsSupportedChannelCount(src_channels)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 246);
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
        while (!SDL_IsSupportedChannelCount(dst_channels)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsSupportedChannelCount(dst_channels)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 247);
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
    if (!(num_frames != 0)) {
        return;
    }
    const dst_bitsize: c_int = @bitCast(dst_format & @as(c_uint, 255));
    _ = &dst_bitsize;
    const dst_sample_frame_size: c_int = @divTrunc(dst_bitsize, @as(c_int, 8)) * dst_channels;
    _ = &dst_sample_frame_size;
    const chmaps_match: bool = (src_channels == dst_channels) and SDL_AudioChannelMapsEqual(src_channels, src_map, dst_map);
    _ = &chmaps_match;
    if (chmaps_match) {
        src_map = blk: {
            const tmp = @as([*c]const c_int, null);
            dst_map = tmp;
            break :blk tmp;
        };
    }
    if (src_map != null) {
        var buf: ?*anyopaque = if (scratch != null) scratch else dst;
        _ = &buf;
        SwizzleAudio(num_frames, buf, src, src_channels, src_map, src_format);
        src = buf;
    }
    if ((src_channels == dst_channels) and (gain == @as(f32, 1.0))) {
        if (src_format == dst_format) {
            if (dst_map != null) {
                SwizzleAudio(num_frames, dst, src, dst_channels, dst_map, dst_format);
            } else if (src != dst) {
                _ = memcpy(dst, src, @bitCast(@as(c_long, num_frames * dst_sample_frame_size)));
            }
            return;
        }
        if ((src_format ^ dst_format) == (@as(c_uint, 1) << @intCast(@as(c_uint, 12)))) {
            if (dst_map != null) {
                SwizzleAudio(num_frames, dst, src, dst_channels, dst_map, dst_format);
                src = dst;
            }
            ConvertAudioSwapEndian(dst, src, num_frames * dst_channels, dst_bitsize);
            return;
        }
    }
    if (!(scratch != null)) {
        scratch = dst;
    }
    const srcconvert: bool = src_format != @as(SDL_AudioFormat, SDL_AUDIO_F32);
    _ = &srcconvert;
    const channelconvert: bool = src_channels != dst_channels;
    _ = &channelconvert;
    const dstconvert: bool = dst_format != @as(SDL_AudioFormat, SDL_AUDIO_F32);
    _ = &dstconvert;
    if (srcconvert) {
        var buf: ?*anyopaque = if (channelconvert or dstconvert) scratch else dst;
        _ = &buf;
        ConvertAudioToFloat(@ptrCast(@alignCast(buf)), src, num_frames * src_channels, src_format);
        src = buf;
    }
    if (gain != @as(f32, 1.0)) {
        var buf: [*c]f32 = @ptrCast(@alignCast(if (channelconvert or dstconvert) scratch else dst));
        _ = &buf;
        const total_samples: c_int = num_frames * src_channels;
        _ = &total_samples;
        if (src == @as(?*const anyopaque, @ptrCast(@alignCast(buf)))) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < total_samples) : (i += 1) {
                    buf[@bitCast(@as(isize, @intCast(i)))] *= gain;
                }
            }
        } else {
            var fsrc: [*c]const f32 = @ptrCast(@alignCast(src));
            _ = &fsrc;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < total_samples) : (i += 1) {
                    buf[@bitCast(@as(isize, @intCast(i)))] = fsrc[@bitCast(@as(isize, @intCast(i)))] * gain;
                }
            }
        }
        src = @ptrCast(@alignCast(buf));
    }
    if (channelconvert) {
        var channel_converter: SDL_AudioChannelConverter = undefined;
        _ = &channel_converter;
        var override: SDL_AudioChannelConverter = null;
        _ = &override;
        while (true) {
            while (!(@as(c_ulong, @bitCast(@as(c_long, src_channels))) <= (@sizeOf(@TypeOf(channel_converters)) / @sizeOf(@TypeOf(channel_converters[@as(c_int, 0)]))))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "src_channels <= (sizeof(channel_converters)/sizeof(channel_converters[0]))",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 350);
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
            while (!(@as(c_ulong, @bitCast(@as(c_long, dst_channels))) <= (@sizeOf(@TypeOf(channel_converters[@as(c_int, 0)])) / @sizeOf(@TypeOf(channel_converters[@as(c_int, 0)][@as(c_int, 0)]))))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "dst_channels <= (sizeof(channel_converters[0])/sizeof(channel_converters[0][0]))",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 351);
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
        channel_converter = channel_converters[@bitCast(@as(isize, @intCast(src_channels - @as(c_int, 1))))][@bitCast(@as(isize, @intCast(dst_channels - @as(c_int, 1))))];
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(channel_converter)))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "channel_converter != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 354);
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
        if (channel_converter == SDL_ConvertStereoToMono) {
            if (!(override != null) and SDL_HasSSE3_REAL()) {
                override = SDL_ConvertStereoToMono_SSE3;
            }
        } else if (channel_converter == SDL_ConvertMonoToStereo) {
            if (!(override != null) and SDL_HasSSE_REAL()) {
                override = SDL_ConvertMonoToStereo_SSE;
            }
        }
        if (override != null) {
            channel_converter = override;
        }
        var buf: ?*anyopaque = if (dstconvert) scratch else dst;
        _ = &buf;
        channel_converter.?(@ptrCast(@alignCast(buf)), @ptrCast(@alignCast(src)), num_frames);
        src = buf;
    }
    if (dstconvert) {
        ConvertAudioFromFloat(dst, @ptrCast(@alignCast(src)), num_frames * dst_channels, dst_format);
        src = dst;
    }
    while (true) {
        while (!(src == dst)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "src == dst",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 384);
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
    if (dst_map != null) {
        SwizzleAudio(num_frames, dst, src, dst_channels, dst_map, dst_format);
    }
}
pub fn CalculateMaxFrameSize(src_format: SDL_AudioFormat, src_channels: c_int, dst_format: SDL_AudioFormat, dst_channels: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const src_format_size: c_int = @bitCast((src_format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8));
    _ = &src_format_size;
    const dst_format_size: c_int = @bitCast((dst_format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8));
    _ = &dst_format_size;
    const max_app_format_size: c_int = if (src_format_size > dst_format_size) src_format_size else dst_format_size;
    _ = &max_app_format_size;
    const max_format_size: c_int = @bitCast(@as(c_uint, @truncate(if (@as(c_ulong, @bitCast(@as(c_long, max_app_format_size))) > @sizeOf(f32)) @as(c_ulong, @bitCast(@as(c_long, max_app_format_size))) else @sizeOf(f32))));
    _ = &max_format_size;
    const max_channels: c_int = if (src_channels > dst_channels) src_channels else dst_channels;
    _ = &max_channels;
    return max_format_size * max_channels;
}
pub fn GetAudioStreamResampleRate(stream: [*c]SDL_AudioStream, arg_src_freq: c_int, resample_offset: Sint64) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var src_freq = arg_src_freq;
    _ = &src_freq;
    src_freq = @intFromFloat(@as(f32, @floatFromInt(src_freq)) * stream.*.freq_ratio);
    var resample_rate: Sint64 = SDL_GetResampleRate(src_freq, stream.*.dst_spec.freq);
    _ = &resample_rate;
    if ((resample_rate == @as(c_long, 4294967296)) and (resample_offset == @as(Sint64, 0))) {
        resample_rate = 0;
    }
    return resample_rate;
}
pub fn UpdateAudioStreamInputSpec(stream: [*c]SDL_AudioStream, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_AudioSpecsEqual(&stream.*.input_spec, spec, stream.*.input_chmap, chmap)) {
        return @"true" != 0;
    }
    if (!SDL_ResetAudioQueueHistory(stream.*.queue, SDL_GetResamplerHistoryFrames())) {
        return @"false" != 0;
    }
    if (!(chmap != null)) {
        stream.*.input_chmap = null;
    } else {
        const chmaplen: usize = @sizeOf(@TypeOf(chmap.*)) *% @as(c_ulong, @bitCast(@as(c_long, spec.*.channels)));
        _ = &chmaplen;
        stream.*.input_chmap = @ptrCast(@alignCast(&stream.*.input_chmap_storage));
        _ = memcpy(@ptrCast(@alignCast(stream.*.input_chmap)), @ptrCast(@alignCast(chmap)), chmaplen);
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&stream.*.input_spec).*)) == @sizeOf(@TypeOf(spec.*)))) @compileError("static assertion failed \"sizeof (*(&stream->input_spec)) == sizeof (*( spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&stream.*.input_spec)), @ptrCast(@alignCast(spec)), @sizeOf(@TypeOf(spec.*)));
    return @"true" != 0;
}
pub export fn SDL_CreateAudioStream_REAL(src_spec: [*c]const SDL_AudioSpec, dst_spec: [*c]const SDL_AudioSpec) [*c]SDL_AudioStream {
    @setEvalBranchQuota(100000);
    SDL_ChooseAudioConverters();
    SDL_SetupAudioResampler();
    var result: [*c]SDL_AudioStream = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_AudioStream))));
    _ = &result;
    if (!(result != null)) {
        return null;
    }
    result.*.freq_ratio = 1.0;
    result.*.gain = 1.0;
    result.*.queue = SDL_CreateAudioQueue(8192);
    if (!(result.*.queue != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(result)));
        return null;
    }
    result.*.lock = SDL_CreateMutex_REAL();
    if (!(result.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(result.*.queue)));
        SDL_free_REAL(@ptrCast(@alignCast(result)));
        return null;
    }
    OnAudioStreamCreated(result);
    if (!SDL_SetAudioStreamFormat_REAL(result, src_spec, dst_spec)) {
        SDL_DestroyAudioStream_REAL(result);
        return null;
    }
    return result;
}
pub export fn SDL_GetAudioStreamProperties_REAL(stream: [*c]SDL_AudioStream) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return 0;
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (stream.*.props == @as(SDL_PropertiesID, 0)) {
        stream.*.props = SDL_CreateProperties_REAL();
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return stream.*.props;
}
pub export fn SDL_SetAudioStreamGetCallback_REAL(stream: [*c]SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    stream.*.get_callback = callback;
    stream.*.get_callback_userdata = userdata;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_SetAudioStreamPutCallback_REAL(stream: [*c]SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    stream.*.put_callback = callback;
    stream.*.put_callback_userdata = userdata;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_LockAudioStream_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_UnlockAudioStream_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_GetAudioStreamFormat_REAL(stream: [*c]SDL_AudioStream, src_spec: [*c]SDL_AudioSpec, dst_spec: [*c]SDL_AudioSpec) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        if (src_spec != null) {
            _ = memset(@ptrCast(@alignCast(src_spec)), 0, @sizeOf(@TypeOf(src_spec.*)));
        }
        if (dst_spec != null) {
            _ = memset(@ptrCast(@alignCast(dst_spec)), 0, @sizeOf(@TypeOf(dst_spec.*)));
        }
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (src_spec != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(src_spec.*)) == @sizeOf(@TypeOf((&stream.*.src_spec).*)))) @compileError("static assertion failed \"sizeof (*(src_spec)) == sizeof (*( &stream->src_spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(src_spec)), @ptrCast(@alignCast(&stream.*.src_spec)), @sizeOf(@TypeOf((&stream.*.src_spec).*)));
    }
    if (dst_spec != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(dst_spec.*)) == @sizeOf(@TypeOf((&stream.*.dst_spec).*)))) @compileError("static assertion failed \"sizeof (*(dst_spec)) == sizeof (*( &stream->dst_spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(dst_spec)), @ptrCast(@alignCast(&stream.*.dst_spec)), @sizeOf(@TypeOf((&stream.*.dst_spec).*)));
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    if ((src_spec != null) and (src_spec.*.format == @as(SDL_AudioFormat, 0))) {
        return SDL_SetError_REAL("Stream has no source format");
    } else if ((dst_spec != null) and (dst_spec.*.format == @as(SDL_AudioFormat, 0))) {
        return SDL_SetError_REAL("Stream has no destination format");
    }
    return @"true" != 0;
}
pub export fn SDL_SetAudioStreamFormat_REAL(stream: [*c]SDL_AudioStream, arg_src_spec: [*c]const SDL_AudioSpec, arg_dst_spec: [*c]const SDL_AudioSpec) bool {
    @setEvalBranchQuota(100000);
    var src_spec = arg_src_spec;
    _ = &src_spec;
    var dst_spec = arg_dst_spec;
    _ = &dst_spec;
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    if (src_spec != null) {
        if (!SDL_IsSupportedAudioFormat(src_spec.*.format)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_spec->format"))));
        }
        if (!SDL_IsSupportedChannelCount(src_spec.*.channels)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_spec->channels"))));
        }
        if (src_spec.*.freq <= @as(c_int, 0)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_spec->freq"))));
        }
    }
    if (dst_spec != null) {
        if (!SDL_IsSupportedAudioFormat(dst_spec.*.format)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_spec->format"))));
        }
        if (!SDL_IsSupportedChannelCount(dst_spec.*.channels)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_spec->channels"))));
        }
        if (dst_spec.*.freq <= @as(c_int, 0)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_spec->freq"))));
        }
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (stream.*.bound_device != null) {
        if (stream.*.bound_device.*.physical_device.*.recording) {
            src_spec = null;
        } else {
            dst_spec = null;
        }
    }
    if (src_spec != null) {
        if (src_spec.*.channels != stream.*.src_spec.channels) {
            SDL_free_REAL(@ptrCast(@alignCast(stream.*.src_chmap)));
            stream.*.src_chmap = null;
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&stream.*.src_spec).*)) == @sizeOf(@TypeOf(src_spec.*)))) @compileError("static assertion failed \"sizeof (*(&stream->src_spec)) == sizeof (*( src_spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&stream.*.src_spec)), @ptrCast(@alignCast(src_spec)), @sizeOf(@TypeOf(src_spec.*)));
    }
    if (dst_spec != null) {
        if (dst_spec.*.channels != stream.*.dst_spec.channels) {
            SDL_free_REAL(@ptrCast(@alignCast(stream.*.dst_chmap)));
            stream.*.dst_chmap = null;
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&stream.*.dst_spec).*)) == @sizeOf(@TypeOf(dst_spec.*)))) @compileError("static assertion failed \"sizeof (*(&stream->dst_spec)) == sizeof (*( dst_spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&stream.*.dst_spec)), @ptrCast(@alignCast(dst_spec)), @sizeOf(@TypeOf(dst_spec.*)));
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SetAudioStreamChannelMap(stream: [*c]SDL_AudioStream, spec: [*c]const SDL_AudioSpec, stream_chmap: [*c][*c]c_int, arg_chmap: [*c]const c_int, channels: c_int, _: c_int) bool {
    @setEvalBranchQuota(100000);
    var chmap = arg_chmap;
    _ = &chmap;
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    var result: bool = @"true" != 0;
    _ = &result;
    SDL_LockMutex_REAL(stream.*.lock);
    if (channels != spec.*.channels) {
        result = SDL_SetError_REAL("Wrong number of channels");
    } else if (!(stream_chmap.* != null) and !(chmap != null)) {} else if (((stream_chmap.* != null) and (chmap != null)) and (SDL_memcmp_REAL(@ptrCast(@alignCast(stream_chmap.*)), @ptrCast(@alignCast(chmap)), @sizeOf(@TypeOf(chmap.*)) *% @as(c_ulong, @bitCast(@as(c_long, channels)))) == @as(c_int, 0))) {} else if (SDL_ChannelMapIsBogus(chmap, channels)) {
        result = SDL_SetError_REAL("Invalid channel mapping");
    } else {
        if (SDL_ChannelMapIsDefault(chmap, channels)) {
            chmap = null;
        }
        if (chmap != null) {
            var dupmap: [*c]c_int = SDL_ChannelMapDup(chmap, channels);
            _ = &dupmap;
            if (!(dupmap != null)) {
                result = SDL_SetError_REAL("Invalid channel mapping");
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(stream_chmap.*)));
                stream_chmap.* = dupmap;
            }
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(stream_chmap.*)));
            stream_chmap.* = null;
        }
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return result;
}
pub export fn SDL_SetAudioStreamInputChannelMap_REAL(stream: [*c]SDL_AudioStream, chmap: [*c]const c_int, channels: c_int) bool {
    @setEvalBranchQuota(100000);
    return SetAudioStreamChannelMap(stream, &stream.*.src_spec, &stream.*.src_chmap, chmap, channels, 1);
}
pub export fn SDL_SetAudioStreamOutputChannelMap_REAL(stream: [*c]SDL_AudioStream, chmap: [*c]const c_int, channels: c_int) bool {
    @setEvalBranchQuota(100000);
    return SetAudioStreamChannelMap(stream, &stream.*.dst_spec, &stream.*.dst_chmap, chmap, channels, 0);
}
pub export fn SDL_GetAudioStreamInputChannelMap_REAL(stream: [*c]SDL_AudioStream, count: [*c]c_int) [*c]c_int {
    @setEvalBranchQuota(100000);
    var result: [*c]c_int = null;
    _ = &result;
    var channels: c_int = 0;
    _ = &channels;
    if (stream != null) {
        SDL_LockMutex_REAL(stream.*.lock);
        channels = stream.*.src_spec.channels;
        result = SDL_ChannelMapDup(stream.*.src_chmap, channels);
        SDL_UnlockMutex_REAL(stream.*.lock);
    }
    if (count != null) {
        count.* = channels;
    }
    return result;
}
pub export fn SDL_GetAudioStreamOutputChannelMap_REAL(stream: [*c]SDL_AudioStream, count: [*c]c_int) [*c]c_int {
    @setEvalBranchQuota(100000);
    var result: [*c]c_int = null;
    _ = &result;
    var channels: c_int = 0;
    _ = &channels;
    if (stream != null) {
        SDL_LockMutex_REAL(stream.*.lock);
        channels = stream.*.dst_spec.channels;
        result = SDL_ChannelMapDup(stream.*.dst_chmap, channels);
        SDL_UnlockMutex_REAL(stream.*.lock);
    }
    if (count != null) {
        count.* = channels;
    }
    return result;
}
pub export fn SDL_GetAudioStreamFrequencyRatio_REAL(stream: [*c]SDL_AudioStream) f32 {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return 0.0;
    }
    SDL_LockMutex_REAL(stream.*.lock);
    const freq_ratio: f32 = stream.*.freq_ratio;
    _ = &freq_ratio;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return freq_ratio;
}
pub export fn SDL_SetAudioStreamFrequencyRatio_REAL(stream: [*c]SDL_AudioStream, freq_ratio: f32) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    const min_freq_ratio: f32 = 0.01;
    _ = &min_freq_ratio;
    const max_freq_ratio: f32 = 100.0;
    _ = &max_freq_ratio;
    if (freq_ratio < min_freq_ratio) {
        return SDL_SetError_REAL("Frequency ratio is too low");
    } else if (freq_ratio > max_freq_ratio) {
        return SDL_SetError_REAL("Frequency ratio is too high");
    }
    SDL_LockMutex_REAL(stream.*.lock);
    stream.*.freq_ratio = freq_ratio;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_GetAudioStreamGain_REAL(stream: [*c]SDL_AudioStream) f32 {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return -@as(f32, 1.0);
    }
    SDL_LockMutex_REAL(stream.*.lock);
    const gain: f32 = stream.*.gain;
    _ = &gain;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return gain;
}
pub export fn SDL_SetAudioStreamGain_REAL(stream: [*c]SDL_AudioStream, gain: f32) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    if (gain < @as(f32, 0.0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gain"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    stream.*.gain = gain;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub fn CheckAudioStreamIsFullySetup(stream: [*c]SDL_AudioStream) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (stream.*.src_spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN)) {
        return SDL_SetError_REAL("Stream has no source format");
    } else if (stream.*.dst_spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN)) {
        return SDL_SetError_REAL("Stream has no destination format");
    }
    return @"true" != 0;
}
pub fn PutAudioStreamBufferInternal(stream: [*c]SDL_AudioStream, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int, buf: ?*const anyopaque, len: c_int, callback: SDL_ReleaseAudioBufferCallback, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var track: ?*SDL_AudioTrack = null;
    _ = &track;
    if (callback != null) {
        track = SDL_CreateAudioTrack(stream.*.queue, spec, chmap, @ptrCast(@alignCast(@constCast(buf))), @bitCast(@as(c_long, len)), @bitCast(@as(c_long, len)), callback, userdata);
        if (!(track != null)) {
            return @"false" != 0;
        }
    }
    const prev_available: c_int = if (stream.*.put_callback != null) SDL_GetAudioStreamAvailable_REAL(stream) else @as(c_int, 0);
    _ = &prev_available;
    var retval: bool = @"true" != 0;
    _ = &retval;
    if (track != null) {
        SDL_AddTrackToAudioQueue(stream.*.queue, track);
    } else {
        retval = SDL_WriteToAudioQueue(stream.*.queue, spec, chmap, @ptrCast(@alignCast(buf)), @bitCast(@as(c_long, len)));
    }
    if (retval) {
        if (stream.*.put_callback != null) {
            const newavail: c_int = SDL_GetAudioStreamAvailable_REAL(stream) - prev_available;
            _ = &newavail;
            stream.*.put_callback.?(stream.*.put_callback_userdata, stream, newavail, newavail);
        }
    }
    return retval;
}
pub fn PutAudioStreamBuffer(stream: [*c]SDL_AudioStream, buf: ?*const anyopaque, len: c_int, callback: SDL_ReleaseAudioBufferCallback, userdata: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(stream.*.lock);
    if (!CheckAudioStreamIsFullySetup(stream)) {
        SDL_UnlockMutex_REAL(stream.*.lock);
        return @"false" != 0;
    }
    if (__helpers.signedRemainder(len, @as(c_int, @bitCast(((stream.*.src_spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(stream.*.src_spec.channels))))) != @as(c_int, 0)) {
        SDL_UnlockMutex_REAL(stream.*.lock);
        return SDL_SetError_REAL("Can't add partial sample frames");
    }
    const retval: bool = PutAudioStreamBufferInternal(stream, &stream.*.src_spec, stream.*.src_chmap, buf, len, callback, userdata);
    _ = &retval;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return retval;
}
pub fn FreeAllocatedAudioBuffer(_: ?*anyopaque, buf: ?*const anyopaque, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(buf))));
}
pub export fn SDL_PutAudioStreamData_REAL(stream: [*c]SDL_AudioStream, buf: ?*const anyopaque, arg_len: c_int) bool {
    @setEvalBranchQuota(100000);
    var len = arg_len;
    _ = &len;
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    if (!(buf != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buf"))));
    }
    if (len < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("len"))));
    }
    if (len == @as(c_int, 0)) {
        return @"true" != 0;
    }
    const large_input_thresh: c_int = @as(c_int, 64) * @as(c_int, 1024);
    _ = &large_input_thresh;
    if (len >= large_input_thresh) {
        var data: ?*anyopaque = SDL_malloc_REAL(@bitCast(@as(c_long, len)));
        _ = &data;
        if (!(data != null)) {
            return @"false" != 0;
        }
        _ = memcpy(data, buf, @bitCast(@as(c_long, len)));
        var ret: bool = PutAudioStreamBuffer(stream, data, len, FreeAllocatedAudioBuffer, null);
        _ = &ret;
        if (!ret) {
            SDL_free_REAL(data);
        }
        return ret;
    }
    return PutAudioStreamBuffer(stream, buf, len, null, null);
}
pub fn InterleaveAudioChannelsGeneric8(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    var dst: [*c]Uint8 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint8 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))];
                }
            }
        }
    }
}
pub fn InterleaveAudioChannelsGeneric16(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    var dst: [*c]Uint16 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint16 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))];
                }
            }
        }
    }
}
pub fn InterleaveAudioChannelsGeneric32(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    var dst: [*c]Uint32 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint32 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))];
                }
            }
        }
    }
}
pub fn InterleaveAudioChannelsWithNullsGeneric8(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int, isilence: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    _ = &isilence;
    const silence: Uint8 = @bitCast(@as(i8, @truncate(isilence)));
    _ = &silence;
    var dst: [*c]Uint8 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint8 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @bitCast(@as(i8, @truncate(if (srcs[@bitCast(@as(isize, @intCast(channel)))] != null) @as(c_int, srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))]) else @as(c_int, silence))));
                }
            }
        }
    }
}
pub fn InterleaveAudioChannelsWithNullsGeneric16(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int, isilence: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    _ = &isilence;
    const silence: Uint16 = @bitCast(@as(c_short, @truncate(isilence)));
    _ = &silence;
    var dst: [*c]Uint16 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint16 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @bitCast(@as(c_short, @truncate(if (srcs[@bitCast(@as(isize, @intCast(channel)))] != null) @as(c_int, srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))]) else @as(c_int, silence))));
                }
            }
        }
    }
}
pub fn InterleaveAudioChannelsWithNullsGeneric32(output: ?*anyopaque, channel_buffers: [*c]const ?*const anyopaque, channels: c_int, num_samples: c_int, isilence: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &channels;
    _ = &isilence;
    const silence: Uint32 = @bitCast(@as(c_int, isilence));
    _ = &silence;
    var dst: [*c]Uint32 = @ptrCast(@alignCast(output));
    _ = &dst;
    var srcs: [*c]const [*c]const Uint32 = @ptrCast(@alignCast(channel_buffers));
    _ = &srcs;
    {
        var frame: c_int = 0;
        _ = &frame;
        while (frame < num_samples) : (frame += 1) {
            {
                var channel: c_int = 0;
                _ = &channel;
                while (channel < channels) : (channel += 1) {
                    (blk: {
                        const ref = &dst;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = if (srcs[@bitCast(@as(isize, @intCast(channel)))] != null) srcs[@bitCast(@as(isize, @intCast(channel)))][@bitCast(@as(isize, @intCast(frame)))] else silence;
                }
            }
        }
    }
}
pub fn InterleaveAudioChannels(output: ?*anyopaque, arg_channel_buffers: [*c]const ?*const anyopaque, arg_channels: c_int, num_samples: c_int, spec: [*c]const SDL_AudioSpec) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var channel_buffers = arg_channel_buffers;
    _ = &channel_buffers;
    var channels = arg_channels;
    _ = &channels;
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "InterleaveAudioChannels".*;
    };
    _ = &static_local___func__;
    var have_null_channel: bool = undefined;
    _ = &have_null_channel;
    var channels_full: [16]?*anyopaque = undefined;
    _ = &channels_full;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "SDL_IsSupportedChannelCount(spec->channels)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "spec->channels <= (sizeof(channels_full)/sizeof(channels_full[0]))",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var i: c_int = undefined;
    _ = &i;
    var silence: c_int = undefined;
    _ = &silence;
    const static_local_sdl_assert_data_3 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Missing needed generic audio interleave function!\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_3;
    var sdl_assert_state_4: SDL_AssertState = undefined;
    _ = &sdl_assert_state_4;
    const static_local_sdl_assert_data_5 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Missing needed generic audio interleave function!\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_5;
    var sdl_assert_state_6: SDL_AssertState = undefined;
    _ = &sdl_assert_state_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                have_null_channel = @"false" != 0;
                if ((channels >= @as(c_int, 0)) and (channels < spec.*.channels)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                have_null_channel = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                channels = spec.*.channels;
                if (!have_null_channel) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            7 => {
                if (!SDL_IsSupportedChannelCount(spec.*.channels)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 941);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]?*anyopaque, @ptrCast(@alignCast(&channels_full))))), @ptrCast(@alignCast(channel_buffers)), @as(c_ulong, @bitCast(@as(c_long, channels))) *% @sizeOf(@TypeOf(channel_buffers.*)));
                _ = memset(@ptrCast(@alignCast(@as([*c]?*anyopaque, @ptrCast(@alignCast(&channels_full))) + @as(usize, @bitCast(@as(isize, @intCast(channels)))))), 0, @as(c_ulong, @bitCast(@as(c_long, spec.*.channels - channels))) *% @sizeOf(@TypeOf(channel_buffers.*)));
                channel_buffers = @ptrCast(@alignCast(@as([*c]?*anyopaque, @ptrCast(@alignCast(&channels_full)))));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            19 => {
                if (!(@as(c_ulong, @bitCast(@as(c_long, spec.*.channels))) <= (@sizeOf(@TypeOf(channels_full)) / @sizeOf(@TypeOf(channels_full[@as(c_int, 0)]))))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 942);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                i = 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if (have_null_channel) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            31 => {
                if (i < channels) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                if (channel_buffers[@bitCast(@as(isize, @intCast(i)))] == @as(?*anyopaque, null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                i += 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            35 => {
                have_null_channel = @"true" != 0;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                silence = SDL_GetSilenceValueForFormat_REAL(spec.*.format);
                switch (spec.*.format & @as(c_uint, 255)) {
                    @as(SDL_AudioFormat, 8) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_AudioFormat, 16) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_AudioFormat, 32) => {
                        sdl_pc = 44;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            39 => {
                switch (spec.*.format & @as(c_uint, 255)) {
                    @as(SDL_AudioFormat, 8) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_AudioFormat, 16) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_AudioFormat, 32) => {
                        sdl_pc = 61;
                        continue;
                    },
                    else => {
                        sdl_pc = 62;
                        continue;
                    },
                }
            },
            40 => {
                {}
            },
            41 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            42 => {
                InterleaveAudioChannelsWithNullsGeneric8(output, channel_buffers, channels, num_samples, silence);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            43 => {
                InterleaveAudioChannelsWithNullsGeneric16(output, channel_buffers, channels, num_samples, silence);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            44 => {
                InterleaveAudioChannelsWithNullsGeneric32(output, channel_buffers, channels, num_samples, silence);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                _ = memset(output, 0, (((spec.*.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.*.channels))) *% @as(SDL_AudioFormat, @bitCast(num_samples)));
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            49 => {
                if (!!(@intFromPtr("Missing needed generic audio interleave function!") != 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                sdl_assert_state_4 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_3.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 966);
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            53 => {
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            59 => {
                InterleaveAudioChannelsGeneric8(output, channel_buffers, channels, num_samples);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            60 => {
                InterleaveAudioChannelsGeneric16(output, channel_buffers, channels, num_samples);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                InterleaveAudioChannelsGeneric32(output, channel_buffers, channels, num_samples);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                _ = memset(output, 0, (((spec.*.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.*.channels))) *% @as(SDL_AudioFormat, @bitCast(num_samples)));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            66 => {
                if (!!(@intFromPtr("Missing needed generic audio interleave function!") != 0)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                sdl_assert_state_6 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_5.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 975);
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            70 => {
                if (sdl_assert_state_6 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_PutAudioStreamPlanarData_REAL(stream: [*c]SDL_AudioStream, channel_buffers: [*c]const ?*const anyopaque, num_channels: c_int, num_samples: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    if (!(channel_buffers != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("channel_buffers"))));
    }
    if (num_samples < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("num_samples"))));
    }
    if (num_samples == @as(c_int, 0)) {
        return @"true" != 0;
    }
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    var chmap_copy: [8]c_int = undefined;
    _ = &chmap_copy;
    var chmap: [*c]c_int = null;
    _ = &chmap;
    SDL_LockMutex_REAL(stream.*.lock);
    if (!CheckAudioStreamIsFullySetup(stream)) {
        SDL_UnlockMutex_REAL(stream.*.lock);
        return @"false" != 0;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&spec).*)) == @sizeOf(@TypeOf((&stream.*.src_spec).*)))) @compileError("static assertion failed \"sizeof (*(&spec)) == sizeof (*( &stream->src_spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&spec)), @ptrCast(@alignCast(&stream.*.src_spec)), @sizeOf(@TypeOf((&stream.*.src_spec).*)));
    if (stream.*.src_chmap != null) {
        chmap = @ptrCast(@alignCast(&chmap_copy));
        _ = memcpy(@ptrCast(@alignCast(chmap)), @ptrCast(@alignCast(stream.*.src_chmap)), @sizeOf(@TypeOf(chmap.*)) *% @as(c_ulong, @bitCast(@as(c_long, spec.channels))));
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    if (spec.channels == @as(c_int, 1)) {
        return SDL_PutAudioStreamData_REAL(stream, channel_buffers[@as(c_int, 0)], @bitCast((((spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.channels))) *% @as(SDL_AudioFormat, @bitCast(num_samples))));
    }
    var retval: bool = @"false" != 0;
    _ = &retval;
    const len: c_int = @bitCast((((spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.channels))) *% @as(SDL_AudioFormat, @bitCast(num_samples)));
    _ = &len;
    var stackbuf: [1024]Uint8 = undefined;
    _ = &stackbuf;
    var data: ?*anyopaque = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&stackbuf)))));
    _ = &data;
    var callback: SDL_ReleaseAudioBufferCallback = null;
    _ = &callback;
    if (len > INTERLEAVE_STACK_SIZE) {
        data = SDL_malloc_REAL(@bitCast(@as(c_long, len)));
        if (!(data != null)) {
            return @"false" != 0;
        }
        callback = FreeAllocatedAudioBuffer;
    }
    InterleaveAudioChannels(data, channel_buffers, num_channels, num_samples, &spec);
    SDL_LockMutex_REAL(stream.*.lock);
    retval = PutAudioStreamBufferInternal(stream, &spec, chmap, data, len, callback, null);
    SDL_UnlockMutex_REAL(stream.*.lock);
    return retval;
}
pub fn DontFreeThisAudioBuffer(_: ?*anyopaque, _: ?*const anyopaque, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_PutAudioStreamDataNoCopy_REAL(stream: [*c]SDL_AudioStream, buf: ?*const anyopaque, len: c_int, callback: SDL_AudioStreamDataCompleteCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    if (!(buf != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buf"))));
    }
    if (len < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("len"))));
    }
    if (len == @as(c_int, 0)) {
        if (callback != null) {
            callback.?(userdata, buf, len);
        }
        return @"true" != 0;
    }
    return PutAudioStreamBuffer(stream, buf, len, if (callback != null) callback else DontFreeThisAudioBuffer, userdata);
}
pub export fn SDL_FlushAudioStream_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    SDL_FlushAudioQueue(stream.*.queue);
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub fn EnsureAudioStreamWorkBufferSize(stream: [*c]SDL_AudioStream, newlen: usize) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    if (stream.*.work_buffer_allocation >= newlen) {
        return stream.*.work_buffer;
    }
    var ptr: [*c]Uint8 = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), newlen)));
    _ = &ptr;
    if (!(ptr != null)) {
        return null;
    }
    SDL_aligned_free_REAL(@ptrCast(@alignCast(stream.*.work_buffer)));
    stream.*.work_buffer = ptr;
    stream.*.work_buffer_allocation = newlen;
    return ptr;
}
pub fn NextAudioStreamIter(stream: [*c]SDL_AudioStream, inout_iter: [*c]?*anyopaque, inout_resample_offset: [*c]Sint64, out_spec: [*c]SDL_AudioSpec, out_chmap: [*c][*c]c_int, out_flushed: [*c]bool) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    var flushed: bool = undefined;
    _ = &flushed;
    var chmap: [*c]c_int = undefined;
    _ = &chmap;
    var queued_bytes: usize = SDL_NextAudioQueueIter(stream.*.queue, inout_iter, &spec, &chmap, &flushed);
    _ = &queued_bytes;
    if (out_spec != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(out_spec.*)) == @sizeOf(@TypeOf((&spec).*)))) @compileError("static assertion failed \"sizeof (*(out_spec)) == sizeof (*( &spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(out_spec)), @ptrCast(@alignCast(&spec)), @sizeOf(@TypeOf((&spec).*)));
    }
    if (out_chmap != null) {
        out_chmap.* = chmap;
    }
    if (queued_bytes == @as(c_ulong, 18446744073709551615)) {
        inout_resample_offset.* = 0;
        if (out_flushed != null) {
            out_flushed.* = @"false" != 0;
        }
        return @as(c_int, 2147483647);
    }
    var resample_offset: Sint64 = inout_resample_offset.*;
    _ = &resample_offset;
    var resample_rate: Sint64 = GetAudioStreamResampleRate(stream, spec.freq, resample_offset);
    _ = &resample_rate;
    var output_frames: Sint64 = @bitCast(@as(c_ulong, @truncate(queued_bytes / @as(usize, ((spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.channels))))));
    _ = &output_frames;
    if (resample_rate != 0) {
        if (!flushed) {
            output_frames -= SDL_GetResamplerPaddingFrames(resample_rate);
        }
        output_frames = SDL_GetResamplerOutputFrames(output_frames, resample_rate, &resample_offset);
    }
    if (flushed) {
        resample_offset = 0;
    }
    inout_resample_offset.* = resample_offset;
    if (out_flushed != null) {
        out_flushed.* = flushed;
    }
    return output_frames;
}
pub fn GetAudioStreamAvailableFrames(stream: [*c]SDL_AudioStream, out_resample_offset: [*c]Sint64) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iter: ?*anyopaque = SDL_BeginAudioQueueIter(stream.*.queue);
    _ = &iter;
    var resample_offset: Sint64 = stream.*.resample_offset;
    _ = &resample_offset;
    var output_frames: Sint64 = 0;
    _ = &output_frames;
    while (iter != null) {
        output_frames += NextAudioStreamIter(stream, &iter, &resample_offset, null, null, null);
        if (output_frames >= @as(Sint64, @as(c_int, 2147483647))) {
            output_frames = @as(c_int, 2147483647);
            break;
        }
    }
    if (out_resample_offset != null) {
        out_resample_offset.* = resample_offset;
    }
    return output_frames;
}
pub fn GetAudioStreamHead(stream: [*c]SDL_AudioStream, out_spec: [*c]SDL_AudioSpec, out_chmap: [*c][*c]c_int, out_flushed: [*c]bool) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var iter: ?*anyopaque = SDL_BeginAudioQueueIter(stream.*.queue);
    _ = &iter;
    if (!(iter != null)) {
        _ = memset(@ptrCast(@alignCast(out_spec)), 0, @sizeOf(@TypeOf(out_spec.*)));
        out_flushed.* = @"false" != 0;
        return 0;
    }
    var resample_offset: Sint64 = stream.*.resample_offset;
    _ = &resample_offset;
    return NextAudioStreamIter(stream, &iter, &resample_offset, out_spec, out_chmap, out_flushed);
}
pub fn GetAudioStreamDataInternal(stream: [*c]SDL_AudioStream, buf: ?*anyopaque, output_frames: c_int, gain: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "GetAudioStreamDataInternal".*;
    };
    _ = &static_local___func__;
    var src_spec: [*c]const SDL_AudioSpec = &stream.*.input_spec;
    _ = &src_spec;
    var dst_spec: [*c]const SDL_AudioSpec = &stream.*.dst_spec;
    _ = &dst_spec;
    const src_format: SDL_AudioFormat = src_spec.*.format;
    _ = &src_format;
    const src_channels: c_int = src_spec.*.channels;
    _ = &src_channels;
    const dst_format: SDL_AudioFormat = dst_spec.*.format;
    _ = &dst_format;
    const dst_channels: c_int = dst_spec.*.channels;
    _ = &dst_channels;
    var dst_map: [*c]const c_int = stream.*.dst_chmap;
    _ = &dst_map;
    const max_frame_size: c_int = CalculateMaxFrameSize(src_format, src_channels, dst_format, dst_channels);
    _ = &max_frame_size;
    const resample_rate: Sint64 = GetAudioStreamResampleRate(stream, src_spec.*.freq, stream.*.resample_offset);
    _ = &resample_rate;
    while (true) {
        while (!(output_frames > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "output_frames > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 1226);
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
    if (resample_rate == @as(Sint64, 0)) {
        var work_buffer: [*c]Uint8 = null;
        _ = &work_buffer;
        if (((src_format != dst_format) or (src_channels != dst_channels)) or (gain != @as(f32, 1.0))) {
            work_buffer = EnsureAudioStreamWorkBufferSize(stream, @bitCast(@as(c_long, output_frames * max_frame_size)));
            if (!(work_buffer != null)) {
                return @"false" != 0;
            }
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(SDL_ReadFromAudioQueue(stream.*.queue, @ptrCast(@alignCast(buf)), dst_format, dst_channels, dst_map, 0, output_frames, 0, work_buffer, gain))))) != buf) {
            return SDL_SetError_REAL("Not enough data in queue");
        }
        return @"true" != 0;
    }
    const input_frames: c_int = @truncate(SDL_GetResamplerInputFrames(output_frames, resample_rate, stream.*.resample_offset));
    _ = &input_frames;
    const padding_frames: c_int = SDL_GetResamplerPaddingFrames(resample_rate);
    _ = &padding_frames;
    const resample_format: SDL_AudioFormat = SDL_AUDIO_F32;
    _ = &resample_format;
    const resample_channels: c_int = if (src_channels < dst_channels) src_channels else dst_channels;
    _ = &resample_channels;
    const resample_frame_size: c_int = @bitCast(((resample_format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(resample_channels)));
    _ = &resample_frame_size;
    const work_buffer_frames: c_int = input_frames + (padding_frames * @as(c_int, 2));
    _ = &work_buffer_frames;
    var work_buffer_capacity: c_int = work_buffer_frames * max_frame_size;
    _ = &work_buffer_capacity;
    var resample_buffer_offset: c_int = -@as(c_int, 1);
    _ = &resample_buffer_offset;
    if ((dst_format != resample_format) or (dst_channels != resample_channels)) {
        var resample_convert_bytes: c_int = output_frames * max_frame_size;
        _ = &resample_convert_bytes;
        work_buffer_capacity = if (work_buffer_capacity > resample_convert_bytes) work_buffer_capacity else resample_convert_bytes;
        var simd_alignment: c_int = @bitCast(@as(c_uint, @truncate(SDL_GetSIMDAlignment_REAL())));
        _ = &simd_alignment;
        work_buffer_capacity += simd_alignment - @as(c_int, 1);
        work_buffer_capacity -= __helpers.signedRemainder(work_buffer_capacity, simd_alignment);
        var resample_bytes: c_int = output_frames * resample_frame_size;
        _ = &resample_bytes;
        resample_buffer_offset = work_buffer_capacity;
        work_buffer_capacity += resample_bytes;
    }
    var work_buffer: [*c]Uint8 = EnsureAudioStreamWorkBufferSize(stream, @bitCast(@as(c_long, work_buffer_capacity)));
    _ = &work_buffer;
    if (!(work_buffer != null)) {
        return @"false" != 0;
    }
    const preresample_gain: f32 = if (input_frames > output_frames) @as(f32, 1.0) else gain;
    _ = &preresample_gain;
    const postresample_gain: f32 = if (input_frames > output_frames) gain else @as(f32, 1.0);
    _ = &postresample_gain;
    var input_buffer: [*c]const Uint8 = SDL_ReadFromAudioQueue(stream.*.queue, null, resample_format, resample_channels, null, padding_frames, input_frames, padding_frames, work_buffer, preresample_gain);
    _ = &input_buffer;
    if (!(input_buffer != null)) {
        return SDL_SetError_REAL("Not enough data in queue (resample)");
    }
    input_buffer += @as(usize, @bitCast(@as(isize, @intCast(padding_frames * resample_frame_size))));
    var resample_buffer: ?*anyopaque = if (resample_buffer_offset != -@as(c_int, 1)) @as(?*anyopaque, @ptrCast(@alignCast(work_buffer + @as(usize, @bitCast(@as(isize, @intCast(resample_buffer_offset))))))) else buf;
    _ = &resample_buffer;
    SDL_ResampleAudio(resample_channels, @ptrCast(@alignCast(input_buffer)), input_frames, @ptrCast(@alignCast(resample_buffer)), output_frames, resample_rate, &stream.*.resample_offset);
    ConvertAudio(output_frames, resample_buffer, resample_format, resample_channels, null, buf, dst_format, dst_channels, dst_map, @ptrCast(@alignCast(work_buffer)), postresample_gain);
    return @"true" != 0;
}
pub export fn SDL_GetAudioStreamDataAdjustGain(stream: [*c]SDL_AudioStream, voidbuf: ?*anyopaque, arg_len: c_int, extra_gain: f32) c_int {
    @setEvalBranchQuota(100000);
    var len = arg_len;
    _ = &len;
    var buf: [*c]Uint8 = @ptrCast(@alignCast(voidbuf));
    _ = &buf;
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return -@as(c_int, 1);
    }
    if (!(buf != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buf"))));
        return -@as(c_int, 1);
    }
    if (len < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("len"))));
        return -@as(c_int, 1);
    }
    if (len == @as(c_int, 0)) {
        return 0;
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (!CheckAudioStreamIsFullySetup(stream)) {
        SDL_UnlockMutex_REAL(stream.*.lock);
        return -@as(c_int, 1);
    }
    const gain: f32 = stream.*.gain * extra_gain;
    _ = &gain;
    const dst_frame_size: c_int = @bitCast(((stream.*.dst_spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(stream.*.dst_spec.channels)));
    _ = &dst_frame_size;
    len -= __helpers.signedRemainder(len, dst_frame_size);
    if (stream.*.get_callback != null) {
        var total_request: Sint64 = @divTrunc(len, dst_frame_size);
        _ = &total_request;
        var additional_request: Sint64 = total_request;
        _ = &additional_request;
        var resample_offset: Sint64 = 0;
        _ = &resample_offset;
        var available_frames: Sint64 = GetAudioStreamAvailableFrames(stream, &resample_offset);
        _ = &available_frames;
        additional_request -= if (additional_request < available_frames) additional_request else available_frames;
        var resample_rate: Sint64 = GetAudioStreamResampleRate(stream, stream.*.src_spec.freq, resample_offset);
        _ = &resample_rate;
        if (resample_rate != 0) {
            total_request = SDL_GetResamplerInputFrames(total_request, resample_rate, resample_offset);
            additional_request = SDL_GetResamplerInputFrames(additional_request, resample_rate, resample_offset);
        }
        total_request *= ((stream.*.src_spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(stream.*.src_spec.channels));
        additional_request *= ((stream.*.src_spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(stream.*.src_spec.channels));
        stream.*.get_callback.?(stream.*.get_callback_userdata, stream, @truncate(if (additional_request < @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))) additional_request else @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))), @truncate(if (total_request < @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))) total_request else @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))));
    }
    const chunk_size: c_int = 4096;
    _ = &chunk_size;
    var total: c_int = 0;
    _ = &total;
    while (total < len) {
        var input_spec: SDL_AudioSpec = undefined;
        _ = &input_spec;
        var input_chmap: [*c]c_int = undefined;
        _ = &input_chmap;
        var flushed: bool = undefined;
        _ = &flushed;
        const available_frames: Sint64 = GetAudioStreamHead(stream, &input_spec, &input_chmap, &flushed);
        _ = &available_frames;
        if (available_frames == @as(Sint64, 0)) {
            if (flushed) {
                SDL_PopAudioQueueHead(stream.*.queue);
                _ = memset(@ptrCast(@alignCast(&stream.*.input_spec)), 0, @sizeOf(@TypeOf(stream.*.input_spec)));
                stream.*.resample_offset = 0;
                stream.*.input_chmap = null;
                continue;
            }
            break;
        }
        if (!UpdateAudioStreamInputSpec(stream, &input_spec, input_chmap)) {
            total = if (total != 0) total else -@as(c_int, 1);
            break;
        }
        var output_frames: c_int = @divTrunc(len - total, dst_frame_size);
        _ = &output_frames;
        output_frames = if (output_frames < chunk_size) output_frames else chunk_size;
        output_frames = @truncate(if (@as(Sint64, output_frames) < available_frames) @as(Sint64, output_frames) else available_frames);
        if (!GetAudioStreamDataInternal(stream, @ptrCast(@alignCast(&buf[@bitCast(@as(isize, @intCast(total)))])), output_frames, gain)) {
            total = if (total != 0) total else -@as(c_int, 1);
            break;
        }
        total += output_frames * dst_frame_size;
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return total;
}
pub export fn SDL_GetAudioStreamData_REAL(stream: [*c]SDL_AudioStream, voidbuf: ?*anyopaque, len: c_int) c_int {
    @setEvalBranchQuota(100000);
    return SDL_GetAudioStreamDataAdjustGain(stream, voidbuf, len, 1.0);
}
pub export fn SDL_GetAudioStreamAvailable_REAL(stream: [*c]SDL_AudioStream) c_int {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return -@as(c_int, 1);
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (!CheckAudioStreamIsFullySetup(stream)) {
        SDL_UnlockMutex_REAL(stream.*.lock);
        return 0;
    }
    var count: Sint64 = GetAudioStreamAvailableFrames(stream, null);
    _ = &count;
    count *= ((stream.*.dst_spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(stream.*.dst_spec.channels));
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @truncate(if (count < @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))) count else @as(Sint64, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1))))))));
}
pub export fn SDL_GetAudioStreamQueued_REAL(stream: [*c]SDL_AudioStream) c_int {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return -@as(c_int, 1);
    }
    SDL_LockMutex_REAL(stream.*.lock);
    var total: usize = SDL_GetAudioQueueQueued(stream.*.queue);
    _ = &total;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @bitCast(@as(c_uint, @truncate(if (total < @as(usize, @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1)))))))))) total else @as(usize, @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(~@as(c_uint, 0) >> @intCast(@as(c_uint, 1))))))))))));
}
pub export fn SDL_ClearAudioStream_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    if (!(stream != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
    }
    SDL_LockMutex_REAL(stream.*.lock);
    SDL_ClearAudioQueue(stream.*.queue);
    _ = memset(@ptrCast(@alignCast(&stream.*.input_spec)), 0, @sizeOf(@TypeOf(stream.*.input_spec)));
    stream.*.input_chmap = null;
    stream.*.resample_offset = 0;
    SDL_UnlockMutex_REAL(stream.*.lock);
    return @"true" != 0;
}
pub export fn SDL_DestroyAudioStream_REAL(stream: [*c]SDL_AudioStream) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_DestroyAudioStream_REAL".*;
    };
    _ = &static_local___func__;
    if (!(stream != null)) {
        return;
    }
    SDL_DestroyProperties_REAL(stream.*.props);
    OnAudioStreamDestroy(stream);
    const simplified: bool = stream.*.simplified;
    _ = &simplified;
    if (simplified) {
        if (stream.*.bound_device != null) {
            while (true) {
                while (!stream.*.bound_device.*.simplified) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "stream->bound_device->simplified",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiocvt.c", 1527);
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
            SDL_CloseAudioDevice_REAL(stream.*.bound_device.*.instance_id);
        }
    } else {
        SDL_UnbindAudioStream_REAL(stream);
    }
    SDL_aligned_free_REAL(@ptrCast(@alignCast(stream.*.work_buffer)));
    SDL_DestroyAudioQueue(stream.*.queue);
    SDL_DestroyMutex_REAL(stream.*.lock);
    SDL_free_REAL(@ptrCast(@alignCast(stream)));
}
pub export fn SDL_ConvertAudioSamples_REAL(src_spec: [*c]const SDL_AudioSpec, src_data: [*c]const Uint8, src_len: c_int, dst_spec: [*c]const SDL_AudioSpec, dst_data: [*c][*c]Uint8, dst_len: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (dst_data != null) {
        dst_data.* = null;
    }
    if (dst_len != null) {
        dst_len.* = 0;
    }
    if (!(src_data != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_data"))));
    }
    if (src_len < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_len"))));
    }
    if (!(dst_data != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_data"))));
    }
    if (!(dst_len != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_len"))));
    }
    var result: bool = @"false" != 0;
    _ = &result;
    var dst: [*c]Uint8 = null;
    _ = &dst;
    var dstlen: c_int = 0;
    _ = &dstlen;
    var stream: [*c]SDL_AudioStream = SDL_CreateAudioStream_REAL(src_spec, dst_spec);
    _ = &stream;
    if (stream != null) {
        if (SDL_PutAudioStreamDataNoCopy_REAL(stream, @ptrCast(@alignCast(src_data)), src_len, null, null) and SDL_FlushAudioStream_REAL(stream)) {
            dstlen = SDL_GetAudioStreamAvailable_REAL(stream);
            if (dstlen >= @as(c_int, 0)) {
                dst = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, dstlen)))));
                if (dst != null) {
                    result = SDL_GetAudioStreamData_REAL(stream, @ptrCast(@alignCast(dst)), dstlen) == dstlen;
                }
            }
        }
    }
    if (result) {
        dst_data.* = dst;
        dst_len.* = dstlen;
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(dst)));
    }
    SDL_DestroyAudioStream_REAL(stream);
    return result;
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_ClearAudioStream = SDL_ClearAudioStream_REAL;
pub const SDL_ConvertAudioSamples = SDL_ConvertAudioSamples_REAL;
pub const SDL_CreateAudioStream = SDL_CreateAudioStream_REAL;
pub const SDL_DestroyAudioStream = SDL_DestroyAudioStream_REAL;
pub const SDL_FlushAudioStream = SDL_FlushAudioStream_REAL;
pub const SDL_GetAudioStreamAvailable = SDL_GetAudioStreamAvailable_REAL;
pub const SDL_GetAudioStreamData = SDL_GetAudioStreamData_REAL;
pub const SDL_GetAudioStreamFormat = SDL_GetAudioStreamFormat_REAL;
pub const SDL_GetAudioStreamFrequencyRatio = SDL_GetAudioStreamFrequencyRatio_REAL;
pub const SDL_GetAudioStreamGain = SDL_GetAudioStreamGain_REAL;
pub const SDL_GetAudioStreamInputChannelMap = SDL_GetAudioStreamInputChannelMap_REAL;
pub const SDL_GetAudioStreamOutputChannelMap = SDL_GetAudioStreamOutputChannelMap_REAL;
pub const SDL_GetAudioStreamProperties = SDL_GetAudioStreamProperties_REAL;
pub const SDL_GetAudioStreamQueued = SDL_GetAudioStreamQueued_REAL;
pub const SDL_LockAudioStream = SDL_LockAudioStream_REAL;
pub const SDL_PutAudioStreamData = SDL_PutAudioStreamData_REAL;
pub const SDL_SetAudioStreamFormat = SDL_SetAudioStreamFormat_REAL;
pub const SDL_SetAudioStreamFrequencyRatio = SDL_SetAudioStreamFrequencyRatio_REAL;
pub const SDL_SetAudioStreamGain = SDL_SetAudioStreamGain_REAL;
pub const SDL_SetAudioStreamGetCallback = SDL_SetAudioStreamGetCallback_REAL;
pub const SDL_SetAudioStreamInputChannelMap = SDL_SetAudioStreamInputChannelMap_REAL;
pub const SDL_SetAudioStreamOutputChannelMap = SDL_SetAudioStreamOutputChannelMap_REAL;
pub const SDL_SetAudioStreamPutCallback = SDL_SetAudioStreamPutCallback_REAL;
pub const SDL_UnlockAudioStream = SDL_UnlockAudioStream_REAL;
pub const SDL_PutAudioStreamPlanarData = SDL_PutAudioStreamPlanarData_REAL;
pub const SDL_PutAudioStreamDataNoCopy = SDL_PutAudioStreamDataNoCopy_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_INT_MAX = __helpers.cast(c_int, ~@as(c_uint, 0) >> @as(c_int, 1));
pub const INTERLEAVE_STACK_SIZE = @as(c_int, 1024);
