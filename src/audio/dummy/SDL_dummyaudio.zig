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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_round_REAL(x: f64) f64;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
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
pub const struct_SDL_AudioQueue = opaque {};
pub const struct_SDL_PrivateAudioData = extern struct {
    mixbuf: [*c]Uint8 = null,
    io_delay: Uint32 = 0,
};
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
    hidden: [*c]struct_SDL_PrivateAudioData = null,
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
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const struct_SDL_AudioDriverImpl = extern struct {
    DetectDevices: ?*const fn (default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void = null,
    OpenDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    ThreadInit: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    ThreadDeinit: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    WaitDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    PlayDevice: ?*const fn (device: [*c]SDL_AudioDevice, buffer: [*c]const Uint8, buflen: c_int) callconv(.c) bool = null,
    GetDeviceBuf: ?*const fn (device: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 = null,
    WaitRecordingDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    RecordDevice: ?*const fn (device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int = null,
    FlushRecording: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    CloseDevice: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    FreeDeviceHandle: ?*const fn (device: [*c]SDL_AudioDevice) callconv(.c) void = null,
    DeinitializeStart: ?*const fn () callconv(.c) void = null,
    Deinitialize: ?*const fn () callconv(.c) void = null,
    ProvidesOwnCallbackThread: bool = false,
    HasRecordingSupport: bool = false,
    OnlyHasDefaultPlaybackDevice: bool = false,
    OnlyHasDefaultRecordingDevice: bool = false,
};
pub const SDL_AudioDriverImpl = struct_SDL_AudioDriverImpl;
pub const struct_AudioBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    init: ?*const fn (impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool = null,
    demand_only: bool = false,
    is_preferred: bool = false,
};
pub const AudioBootStrap = struct_AudioBootStrap;
pub export var DUMMYAUDIO_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "dummy",
    .desc = "SDL dummy audio driver",
    .init = DUMMYAUDIO_Init,
    .demand_only = @"true" != 0,
    .is_preferred = @"false" != 0,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub fn DUMMYAUDIO_WaitDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_Delay_REAL(device.*.hidden.*.io_delay);
    return @"true" != 0;
}
pub fn DUMMYAUDIO_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(device.*.hidden.*)))));
    if (!(device.*.hidden != null)) {
        return @"false" != 0;
    }
    if (!device.*.recording) {
        device.*.hidden.*.mixbuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, device.*.buffer_size)))));
        if (!(device.*.hidden.*.mixbuf != null)) {
            return @"false" != 0;
        }
    }
    device.*.hidden.*.io_delay = @bitCast(@as(c_int, @divTrunc(device.*.sample_frames * @as(c_int, 1000), device.*.spec.freq)));
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_AUDIO_DUMMY_TIMESCALE");
    _ = &hint;
    if (hint != null) {
        var scale: f64 = SDL_atof_REAL(hint);
        _ = &scale;
        if (scale >= @as(f64, 0.0)) {
            device.*.hidden.*.io_delay = @intFromFloat(SDL_round_REAL(@as(f64, @floatFromInt(device.*.hidden.*.io_delay)) * scale));
        }
    }
    return @"true" != 0;
}
pub fn DUMMYAUDIO_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device.*.hidden != null) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.mixbuf)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
        device.*.hidden = null;
    }
}
pub fn DUMMYAUDIO_GetDeviceBuf(device: [*c]SDL_AudioDevice, _: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    return device.*.hidden.*.mixbuf;
}
pub fn DUMMYAUDIO_RecordDevice(device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(buffer, device.*.silence_value, @bitCast(@as(c_long, buflen)));
    return buflen;
}
pub fn DUMMYAUDIO_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    impl.*.OpenDevice = DUMMYAUDIO_OpenDevice;
    impl.*.CloseDevice = DUMMYAUDIO_CloseDevice;
    impl.*.WaitDevice = DUMMYAUDIO_WaitDevice;
    impl.*.GetDeviceBuf = DUMMYAUDIO_GetDeviceBuf;
    impl.*.WaitRecordingDevice = DUMMYAUDIO_WaitDevice;
    impl.*.RecordDevice = DUMMYAUDIO_RecordDevice;
    impl.*.OnlyHasDefaultPlaybackDevice = @"true" != 0;
    impl.*.OnlyHasDefaultRecordingDevice = @"true" != 0;
    impl.*.HasRecordingSupport = @"true" != 0;
    return @"true" != 0;
}
