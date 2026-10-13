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
pub const __off_t = c_long;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_SetCurrentThreadPriority_REAL(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_WaitThread_REAL(thread: ?*SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S8: c_int = 32776;
pub const SDL_AUDIO_S16LE: c_int = 32784;
pub const SDL_AUDIO_S16BE: c_int = 36880;
pub const SDL_AUDIO_S32LE: c_int = 32800;
pub const SDL_AUDIO_S32BE: c_int = 36896;
pub const SDL_AUDIO_F32LE: c_int = 33056;
pub const SDL_AUDIO_F32BE: c_int = 37152;
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
pub const struct__snd_pcm = opaque {
};
pub const snd_pcm_t = struct__snd_pcm;
pub const struct_SDL_PrivateAudioData = extern struct {
    pcm: ?*snd_pcm_t = null,
    mixbuf: [*c]Uint8 = null,
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
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const SDL_LOG_CATEGORY_AUDIO: c_int = 4;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const struct__snd_pcm_info = opaque {
};
pub const snd_pcm_info_t = struct__snd_pcm_info;
pub const struct__snd_pcm_hw_params = opaque {
};
pub const snd_pcm_hw_params_t = struct__snd_pcm_hw_params;
pub const struct__snd_pcm_sw_params = opaque {
};
pub const snd_pcm_sw_params_t = struct__snd_pcm_sw_params;
pub const SND_PCM_STREAM_PLAYBACK: c_int = 0;
pub const SND_PCM_STREAM_CAPTURE: c_int = 1;
pub const enum__snd_pcm_stream = c_uint;
pub const snd_pcm_stream_t = enum__snd_pcm_stream;
pub const SND_PCM_ACCESS_RW_INTERLEAVED: c_int = 3;
pub const enum__snd_pcm_access = c_uint;
pub const snd_pcm_access_t = enum__snd_pcm_access;
pub const SND_PCM_FORMAT_S8: c_int = 0;
pub const SND_PCM_FORMAT_U8: c_int = 1;
pub const SND_PCM_FORMAT_S16_LE: c_int = 2;
pub const SND_PCM_FORMAT_S16_BE: c_int = 3;
pub const SND_PCM_FORMAT_S32_LE: c_int = 10;
pub const SND_PCM_FORMAT_S32_BE: c_int = 11;
pub const SND_PCM_FORMAT_FLOAT_LE: c_int = 14;
pub const SND_PCM_FORMAT_FLOAT_BE: c_int = 15;
pub const enum__snd_pcm_format = c_int;
pub const snd_pcm_format_t = enum__snd_pcm_format;
pub const SND_PCM_STATE_PREPARED: c_int = 2;
pub const SND_PCM_STATE_XRUN: c_int = 4;
pub const enum__snd_pcm_state = c_uint;
pub const snd_pcm_state_t = enum__snd_pcm_state;
pub const snd_pcm_uframes_t = c_ulong;
pub const snd_pcm_sframes_t = c_long;
pub const SND_CHMAP_TYPE_FIXED: c_int = 1;
pub const SND_CHMAP_TYPE_VAR: c_int = 2;
pub const SND_CHMAP_TYPE_PAIRED: c_int = 3;
pub const enum_snd_pcm_chmap_type = c_uint;
pub const SND_CHMAP_UNKNOWN: c_int = 0;
pub const SND_CHMAP_MONO: c_int = 2;
pub const SND_CHMAP_FL: c_int = 3;
pub const SND_CHMAP_FR: c_int = 4;
pub const SND_CHMAP_RL: c_int = 5;
pub const SND_CHMAP_RR: c_int = 6;
pub const SND_CHMAP_FC: c_int = 7;
pub const SND_CHMAP_LFE: c_int = 8;
pub const SND_CHMAP_SL: c_int = 9;
pub const SND_CHMAP_SR: c_int = 10;
pub const SND_CHMAP_RC: c_int = 11;
pub const enum_snd_pcm_chmap_position = c_uint;
pub const struct_snd_pcm_chmap = extern struct {
    channels: c_uint = 0,
    _pos: [0]c_uint = @import("std").mem.zeroes([0]c_uint),
    pub fn pos(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._pos)).array.child) {
        return @ptrCast(@alignCast(&_self.*._pos));
    }
};
pub const snd_pcm_chmap_t = struct_snd_pcm_chmap;
pub const struct_snd_pcm_chmap_query = extern struct {
    type: enum_snd_pcm_chmap_type = @import("std").mem.zeroes(enum_snd_pcm_chmap_type),
    map: snd_pcm_chmap_t = @import("std").mem.zeroes(snd_pcm_chmap_t),
};
pub const snd_pcm_chmap_query_t = struct_snd_pcm_chmap_query;
pub const struct__snd_ctl_card_info = opaque {
};
pub const snd_ctl_card_info_t = struct__snd_ctl_card_info;
pub const struct__snd_ctl = opaque {
};
pub const snd_ctl_t = struct__snd_ctl;
pub extern fn SDL_ClosestAudioFormats(format: SDL_AudioFormat) [*c]const SDL_AudioFormat;
pub extern fn SDL_AddAudioDevice(recording: bool, name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_AudioDeviceDisconnected(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_FindPhysicalAudioDeviceByHandle(handle: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_UpdatedAudioDeviceFormat(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_ChannelMapDup(origchmap: [*c]const c_int, channels: c_int) [*c]c_int;
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
pub export var ALSA_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "alsa",
    .desc = "ALSA PCM audio",
    .init = ALSA_Init,
    .demand_only = @"false" != 0,
    .is_preferred = @"false" != 0,
};

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_ELF_NOTE_DLOPEN = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_dlopennote.h:212:9
pub const ENOENT = @as(c_int, 2);
pub const EAGAIN = @as(c_int, 11);
pub const SND_PCM_NONBLOCK = @as(c_int, 0x00000001);
pub const SDL_AUDIO_ALSA__CHMAP_CHANS_N_MAX = @as(c_int, 8);
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub extern fn SDL_UDEV_Init() bool;
pub extern fn SDL_UDEV_Quit() void;
pub extern fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool;
pub extern fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void;
pub var ALSA_snd_pcm_open: ?*const fn ([*c]?*snd_pcm_t, [*c]const u8, snd_pcm_stream_t, c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_close: ?*const fn (pcm: ?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_start: ?*const fn (pcm: ?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_writei: ?*const fn (?*snd_pcm_t, ?*const anyopaque, snd_pcm_uframes_t) callconv(.c) snd_pcm_sframes_t = null;
pub var ALSA_snd_pcm_readi: ?*const fn (?*snd_pcm_t, ?*anyopaque, snd_pcm_uframes_t) callconv(.c) snd_pcm_sframes_t = null;
pub var ALSA_snd_pcm_recover: ?*const fn (?*snd_pcm_t, c_int, c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_prepare: ?*const fn (?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_drain: ?*const fn (?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_strerror: ?*const fn (c_int) callconv(.c) [*c]const u8 = null;
pub var ALSA_snd_pcm_hw_params_sizeof: ?*const fn () callconv(.c) usize = null;
pub var ALSA_snd_pcm_sw_params_sizeof: ?*const fn () callconv(.c) usize = null;
pub var ALSA_snd_pcm_hw_params_copy: ?*const fn (?*snd_pcm_hw_params_t, ?*const snd_pcm_hw_params_t) callconv(.c) void = null;
pub var ALSA_snd_pcm_hw_params_any: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_access: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, snd_pcm_access_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_format: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, snd_pcm_format_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_channels: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, c_uint) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_get_channels: ?*const fn (?*const snd_pcm_hw_params_t, [*c]c_uint) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_rate_near: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]c_uint, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_period_size_near: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]snd_pcm_uframes_t, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_get_period_size: ?*const fn (?*const snd_pcm_hw_params_t, [*c]snd_pcm_uframes_t, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_periods_min: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]c_uint, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_periods_first: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]c_uint, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_get_periods: ?*const fn (?*const snd_pcm_hw_params_t, [*c]c_uint, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_buffer_size_near: ?*const fn (pcm: ?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]snd_pcm_uframes_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_get_buffer_size: ?*const fn (?*const snd_pcm_hw_params_t, [*c]snd_pcm_uframes_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_sw_params_current: ?*const fn (?*snd_pcm_t, ?*snd_pcm_sw_params_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_sw_params_set_start_threshold: ?*const fn (?*snd_pcm_t, ?*snd_pcm_sw_params_t, snd_pcm_uframes_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_sw_params: ?*const fn (?*snd_pcm_t, ?*snd_pcm_sw_params_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_nonblock: ?*const fn (?*snd_pcm_t, c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_wait: ?*const fn (?*snd_pcm_t, c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_sw_params_set_avail_min: ?*const fn (?*snd_pcm_t, ?*snd_pcm_sw_params_t, snd_pcm_uframes_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_reset: ?*const fn (?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_state: ?*const fn (?*snd_pcm_t) callconv(.c) snd_pcm_state_t = null;
pub var ALSA_snd_device_name_hint: ?*const fn (c_int, [*c]const u8, [*c][*c]?*anyopaque) callconv(.c) c_int = null;
pub var ALSA_snd_device_name_get_hint: ?*const fn (?*const anyopaque, [*c]const u8) callconv(.c) [*c]u8 = null;
pub var ALSA_snd_device_name_free_hint: ?*const fn ([*c]?*anyopaque) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_avail: ?*const fn (?*snd_pcm_t) callconv(.c) snd_pcm_sframes_t = null;
pub var ALSA_snd_ctl_card_info_sizeof: ?*const fn () callconv(.c) usize = null;
pub var ALSA_snd_pcm_info_sizeof: ?*const fn () callconv(.c) usize = null;
pub var ALSA_snd_card_next: ?*const fn ([*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_ctl_open: ?*const fn ([*c]?*snd_ctl_t, [*c]const u8, c_int) callconv(.c) c_int = null;
pub var ALSA_snd_ctl_close: ?*const fn (?*snd_ctl_t) callconv(.c) c_int = null;
pub var ALSA_snd_ctl_card_info: ?*const fn (?*snd_ctl_t, ?*snd_ctl_card_info_t) callconv(.c) c_int = null;
pub var ALSA_snd_ctl_pcm_next_device: ?*const fn (?*snd_ctl_t, [*c]c_int) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_info_get_subdevices_count: ?*const fn (?*const snd_pcm_info_t) callconv(.c) c_uint = null;
pub var ALSA_snd_pcm_info_set_device: ?*const fn (?*snd_pcm_info_t, c_uint) callconv(.c) void = null;
pub var ALSA_snd_pcm_info_set_subdevice: ?*const fn (?*snd_pcm_info_t, c_uint) callconv(.c) void = null;
pub var ALSA_snd_pcm_info_set_stream: ?*const fn (?*snd_pcm_info_t, snd_pcm_stream_t) callconv(.c) void = null;
pub var ALSA_snd_ctl_pcm_info: ?*const fn (?*snd_ctl_t, ?*snd_pcm_info_t) callconv(.c) c_int = null;
pub var ALSA_snd_ctl_card_info_get_id: ?*const fn (?*const snd_ctl_card_info_t) callconv(.c) [*c]const u8 = null;
pub var ALSA_snd_pcm_info_get_name: ?*const fn (?*const snd_pcm_info_t) callconv(.c) [*c]const u8 = null;
pub var ALSA_snd_pcm_info_get_subdevice_name: ?*const fn (?*const snd_pcm_info_t) callconv(.c) [*c]const u8 = null;
pub var ALSA_snd_ctl_card_info_get_name: ?*const fn (?*const snd_ctl_card_info_t) callconv(.c) [*c]const u8 = null;
pub var ALSA_snd_ctl_card_info_clear: ?*const fn (?*snd_ctl_card_info_t) callconv(.c) void = null;
pub var ALSA_snd_pcm_hw_free: ?*const fn (?*snd_pcm_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_hw_params_set_channels_near: ?*const fn (?*snd_pcm_t, ?*snd_pcm_hw_params_t, [*c]c_uint) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_query_chmaps: ?*const fn (pcm: ?*snd_pcm_t) callconv(.c) [*c][*c]snd_pcm_chmap_query_t = null;
pub var ALSA_snd_pcm_free_chmaps: ?*const fn (maps: [*c][*c]snd_pcm_chmap_query_t) callconv(.c) void = null;
pub var ALSA_snd_pcm_set_chmap: ?*const fn (?*snd_pcm_t, [*c]const snd_pcm_chmap_t) callconv(.c) c_int = null;
pub var ALSA_snd_pcm_chmap_print: ?*const fn ([*c]const snd_pcm_chmap_t, usize, [*c]u8) callconv(.c) c_int = null;
pub var alsa_library: [*c]const u8 = "libasound.so.2";
pub var alsa_handle: ?*SDL_SharedObject = null;
pub fn load_alsa_sym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(alsa_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn load_alsa_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!load_alsa_sym("snd_pcm_open", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_open))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_close", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_close))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_start", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_start))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_writei", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_writei))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_readi", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_readi))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_recover", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_recover))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_prepare", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_prepare))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_drain", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_drain))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_strerror", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_strerror))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_sizeof", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_sizeof))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_sw_params_sizeof", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_sw_params_sizeof))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_copy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_copy))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_any", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_any))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_access", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_access))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_format", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_format))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_channels", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_channels))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_get_channels", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_get_channels))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_rate_near", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_rate_near))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_period_size_near", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_period_size_near))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_get_period_size", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_get_period_size))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_periods_min", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_periods_min))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_periods_first", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_periods_first))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_get_periods", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_get_periods))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_buffer_size_near", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_buffer_size_near))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_get_buffer_size", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_get_buffer_size))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_sw_params_current", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_sw_params_current))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_sw_params_set_start_threshold", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_sw_params_set_start_threshold))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_sw_params", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_sw_params))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_nonblock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_nonblock))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_wait", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_wait))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_sw_params_set_avail_min", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_sw_params_set_avail_min))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_reset", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_reset))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_state))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_device_name_hint", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_device_name_hint))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_device_name_get_hint", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_device_name_get_hint))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_device_name_free_hint", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_device_name_free_hint))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_avail", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_avail))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_card_info_sizeof", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_card_info_sizeof))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_sizeof", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_sizeof))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_card_next", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_card_next))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_open", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_open))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_close", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_close))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_card_info", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_card_info))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_pcm_next_device", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_pcm_next_device))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_get_subdevices_count", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_get_subdevices_count))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_set_device", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_set_device))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_set_subdevice", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_set_subdevice))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_set_stream", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_set_stream))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_pcm_info", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_pcm_info))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_get_subdevices_count", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_get_subdevices_count))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_card_info_get_id", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_card_info_get_id))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_get_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_get_name))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_info_get_subdevice_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_info_get_subdevice_name))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_card_info_get_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_card_info_get_name))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_ctl_card_info_clear", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_ctl_card_info_clear))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_free", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_free))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_hw_params_set_channels_near", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_hw_params_set_channels_near))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_query_chmaps", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_query_chmaps))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_free_chmaps", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_free_chmaps))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_set_chmap", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_set_chmap))))))) return @"false" != 0;
    if (!load_alsa_sym("snd_pcm_chmap_print", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&ALSA_snd_pcm_chmap_print))))))) return @"false" != 0;
    return @"true" != 0;
}
pub fn UnloadALSALibrary() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (alsa_handle != null) {
        SDL_UnloadObject_REAL(alsa_handle);
        alsa_handle = null;
    }
}
pub fn LoadALSALibrary() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var retval: bool = @"true" != 0;
    _ = &retval;
    if (!(alsa_handle != null)) {
        alsa_handle = SDL_LoadObject_REAL(alsa_library);
        if (!(alsa_handle != null)) {
            retval = @"false" != 0;
        } else {
            retval = load_alsa_syms();
            if (!retval) {
                UnloadALSALibrary();
            }
        }
    }
    return retval;
}
pub var ALSA_device_prefix: [*c]const u8 = null;
pub fn ALSA_guess_device_prefix() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (ALSA_device_prefix != null) {
        return;
    }
    const static_local_prefixes = struct {
        const prefixes: [3][*c]const u8 = [3][*c]const u8{
            "hw:",
            "sysdefault:",
            "default:",
        };
    };
    _ = &static_local_prefixes;
    var hints: [*c]?*anyopaque = null;
    _ = &hints;
    if (ALSA_snd_device_name_hint.?(-@as(c_int, 1), "pcm", &hints) == @as(c_int, 0)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (hints[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                var name: [*c]u8 = ALSA_snd_device_name_get_hint.?(hints[@bitCast(@as(isize, @intCast(i)))], "NAME");
                _ = &name;
                if (name != null) {
                    {
                        var j: c_int = 0;
                        _ = &j;
                        while (@as(c_ulong, @bitCast(@as(c_long, j))) < (@sizeOf(@TypeOf(static_local_prefixes.prefixes)) / @sizeOf(@TypeOf(static_local_prefixes.prefixes[@as(c_int, 0)])))) : (j += 1) {
                            var prefix: [*c]const u8 = static_local_prefixes.prefixes[@bitCast(@as(isize, @intCast(j)))];
                            _ = &prefix;
                            const prefixlen: usize = SDL_strlen_REAL(prefix);
                            _ = &prefixlen;
                            if (SDL_strncmp_REAL(name, prefix, prefixlen) == @as(c_int, 0)) {
                                ALSA_device_prefix = prefix;
                                break;
                            }
                        }
                    }
                    free(@ptrCast(@alignCast(name)));
                    if (ALSA_device_prefix != null) {
                        break;
                    }
                }
            }
        }
    }
    if (!(ALSA_device_prefix != null)) {
        ALSA_device_prefix = static_local_prefixes.prefixes[@as(c_int, 0)];
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: device prefix is probably '%s'", ALSA_device_prefix);
}
pub const struct_ALSA_Device = extern struct {
    id: [*c]u8 = null,
    device_index: c_int = 0,
    name: [*c]u8 = null,
    recording: bool = false,
    next: [*c]struct_ALSA_Device = null,
};
pub const ALSA_Device = struct_ALSA_Device;
pub const default_playback_handle: ALSA_Device = ALSA_Device{
    .id = @as([*c]u8, @as([*c]u8, @constCast(""))),
    .device_index = 0,
    .name = @as([*c]u8, @as([*c]u8, @constCast("default"))),
    .recording = @"false" != 0,
    .next = null,
};
pub const default_recording_handle: ALSA_Device = ALSA_Device{
    .id = @as([*c]u8, @as([*c]u8, @constCast(""))),
    .device_index = 0,
    .name = @as([*c]u8, @as([*c]u8, @constCast("default"))),
    .recording = @"true" != 0,
    .next = null,
};
pub fn get_pcm_str(handle: ?*anyopaque) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [11:0]u8 = "get_pcm_str".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(handle != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "handle != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 346);
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
    var dev: [*c]ALSA_Device = @ptrCast(@alignCast(handle));
    _ = &dev;
    var pcm_str: [*c]u8 = null;
    _ = &pcm_str;
    if (SDL_strlen_REAL(dev.*.id) == @as(usize, 0)) {
        var devname: [*c]const u8 = SDL_GetHint_REAL(if (dev.*.recording) @as([*c]u8, @as([*c]u8, @constCast("SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE"))) else @as([*c]u8, @as([*c]u8, @constCast("SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE"))));
        _ = &devname;
        if (!(devname != null)) {
            devname = SDL_GetHint_REAL("SDL_AUDIO_ALSA_DEFAULT_DEVICE");
            if (!(devname != null)) {
                devname = "default";
            }
        }
        pcm_str = SDL_strdup_REAL(devname);
    } else {
        _ = SDL_asprintf_REAL(&pcm_str, "%sCARD=%s,DEV=%d", ALSA_device_prefix, dev.*.id, dev.*.device_index);
    }
    return pcm_str;
}
pub fn RecoverALSADevice(pcm: ?*snd_pcm_t, errnum: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const prerecovery: snd_pcm_state_t = ALSA_snd_pcm_state.?(pcm);
    _ = &prerecovery;
    const status: c_int = ALSA_snd_pcm_recover.?(pcm, errnum, 0);
    _ = &status;
    if (status == @as(c_int, 0)) {
        const postrecovery: snd_pcm_state_t = ALSA_snd_pcm_state.?(pcm);
        _ = &postrecovery;
        if ((prerecovery == @as(snd_pcm_state_t, SND_PCM_STATE_XRUN)) and (postrecovery == @as(snd_pcm_state_t, SND_PCM_STATE_PREPARED))) {
            _ = ALSA_snd_pcm_start.?(pcm);
        }
    }
    return status;
}
pub fn ALSA_WaitDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const sample_frames: c_int = device.*.sample_frames;
    _ = &sample_frames;
    const fulldelay: c_int = @bitCast(@as(c_uint, @truncate((@as(Uint64, @bitCast(@as(c_long, sample_frames))) *% @as(Uint64, 1000)) / @as(Uint64, @bitCast(@as(c_long, device.*.spec.freq))))));
    _ = &fulldelay;
    const delay: c_int = if (fulldelay < @as(c_int, 1)) @as(c_int, 1) else if (fulldelay > @as(c_int, 5)) @as(c_int, 5) else fulldelay;
    _ = &delay;
    while (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0)) {
        const rc: c_int = @truncate(ALSA_snd_pcm_avail.?(device.*.hidden.*.pcm));
        _ = &rc;
        if (rc < @as(c_int, 0)) {
            const status: c_int = RecoverALSADevice(device.*.hidden.*.pcm, rc);
            _ = &status;
            if (status < @as(c_int, 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA wait failed (unrecoverable): %s", ALSA_snd_strerror.?(rc));
                return @"false" != 0;
            }
        }
        if (rc >= sample_frames) {
            break;
        }
        SDL_Delay_REAL(@bitCast(@as(c_int, delay)));
    }
    return @"true" != 0;
}
pub fn ALSA_PlayDevice(device: [*c]SDL_AudioDevice, buffer: [*c]const Uint8, buflen: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "ALSA_PlayDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(buffer == device.*.hidden.*.mixbuf)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "buffer == device->hidden->mixbuf",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 421);
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
    var sample_buf: [*c]Uint8 = @ptrCast(@alignCast(@constCast(buffer)));
    _ = &sample_buf;
    const frame_size: c_int = @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)));
    _ = &frame_size;
    var frames_left: snd_pcm_uframes_t = @bitCast(@as(c_long, @divTrunc(buflen, frame_size)));
    _ = &frames_left;
    while ((frames_left > @as(snd_pcm_uframes_t, 0)) and !(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0)) {
        const rc: c_int = @truncate(ALSA_snd_pcm_writei.?(device.*.hidden.*.pcm, @ptrCast(@alignCast(sample_buf)), frames_left));
        _ = &rc;
        while (true) {
            while (!(rc != @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rc != 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 429);
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
        if (rc < @as(c_int, 0)) {
            while (true) {
                while (!(rc != -EAGAIN)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "rc != -11",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 431);
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
            const status: c_int = RecoverALSADevice(device.*.hidden.*.pcm, rc);
            _ = &status;
            if (status < @as(c_int, 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA write failed (unrecoverable): %s", ALSA_snd_strerror.?(rc));
                return @"false" != 0;
            }
            continue;
        }
        sample_buf += @as(usize, @bitCast(@as(isize, @intCast(rc * frame_size))));
        frames_left -%= @bitCast(@as(c_long, rc));
    }
    return @"true" != 0;
}
pub fn ALSA_GetDeviceBuf(device: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "ALSA_GetDeviceBuf".*;
    };
    _ = &static_local___func__;
    var rc: snd_pcm_sframes_t = ALSA_snd_pcm_avail.?(device.*.hidden.*.pcm);
    _ = &rc;
    if (rc <= @as(snd_pcm_sframes_t, 0)) {
        SDL_Delay_REAL(1);
        rc = ALSA_snd_pcm_avail.?(device.*.hidden.*.pcm);
        if (rc <= @as(snd_pcm_sframes_t, 0)) {
            buffer_size.* = 0;
            return null;
        }
    }
    const requested_frames: c_int = @truncate(if (@as(snd_pcm_sframes_t, device.*.sample_frames) < rc) @as(snd_pcm_sframes_t, device.*.sample_frames) else rc);
    _ = &requested_frames;
    const requested_bytes: c_int = requested_frames * @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels))));
    _ = &requested_bytes;
    while (true) {
        while (!(requested_bytes <= buffer_size.*)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "requested_bytes <= *buffer_size",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 488);
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
    buffer_size.* = requested_bytes;
    return device.*.hidden.*.mixbuf;
}
pub fn ALSA_RecordDevice(device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "ALSA_RecordDevice".*;
    };
    _ = &static_local___func__;
    const frame_size: c_int = @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)));
    _ = &frame_size;
    while (true) {
        while (!(__helpers.signedRemainder(buflen, frame_size) == @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(buflen % frame_size) == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 498);
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
    const total_available: snd_pcm_sframes_t = ALSA_snd_pcm_avail.?(device.*.hidden.*.pcm);
    _ = &total_available;
    if (total_available == @as(snd_pcm_sframes_t, 0)) {
        return 0;
    }
    const total_frames: c_int = @truncate(if (@as(snd_pcm_sframes_t, @divTrunc(buflen, frame_size)) < total_available) @as(snd_pcm_sframes_t, @divTrunc(buflen, frame_size)) else total_available);
    _ = &total_frames;
    const rc: c_int = @truncate(ALSA_snd_pcm_readi.?(device.*.hidden.*.pcm, buffer, @bitCast(@as(c_long, total_frames))));
    _ = &rc;
    while (true) {
        while (!(rc != -EAGAIN)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "rc != -11",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 518);
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
    if (rc < @as(c_int, 0)) {
        const status: c_int = RecoverALSADevice(device.*.hidden.*.pcm, rc);
        _ = &status;
        if (status < @as(c_int, 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA read failed (unrecoverable): %s", ALSA_snd_strerror.?(rc));
            return -@as(c_int, 1);
        }
        return 0;
    }
    return rc * frame_size;
}
pub fn ALSA_FlushRecording(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = ALSA_snd_pcm_reset.?(device.*.hidden.*.pcm);
}
pub fn ALSA_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device.*.hidden != null) {
        if (device.*.hidden.*.pcm != null) {
            _ = ALSA_snd_pcm_close.?(device.*.hidden.*.pcm);
        }
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.mixbuf)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
    }
}
pub const struct_ALSA_pcm_cfg_ctx = extern struct {
    device: [*c]SDL_AudioDevice = null,
    hwparams: ?*snd_pcm_hw_params_t = null,
    swparams: ?*snd_pcm_sw_params_t = null,
    matched_sdl_format: SDL_AudioFormat = @import("std").mem.zeroes(SDL_AudioFormat),
    chans_n: c_uint = 0,
    target_chans_n: c_uint = 0,
    rate: c_uint = 0,
    persize: snd_pcm_uframes_t = 0,
    chmap_queries: [*c][*c]snd_pcm_chmap_query_t = null,
    sdl_chmap: [8]c_uint = @import("std").mem.zeroes([8]c_uint),
    alsa_chmap_installed: [8]c_uint = @import("std").mem.zeroes([8]c_uint),
    periods: c_uint = 0,
};
pub var sdl_channel_maps: [9][8]enum_snd_pcm_chmap_position = [9][8]enum_snd_pcm_chmap_position{
    [1]enum_snd_pcm_chmap_position{
        0,
    } ++ @as([7]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [1]enum_snd_pcm_chmap_position{
        SND_CHMAP_MONO,
    } ++ @as([7]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [2]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
    } ++ @as([6]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [3]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_LFE,
    } ++ @as([5]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [4]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_RL,
        SND_CHMAP_RR,
    } ++ @as([4]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [5]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_LFE,
        SND_CHMAP_RL,
        SND_CHMAP_RR,
    } ++ @as([3]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [6]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_FC,
        SND_CHMAP_LFE,
        SND_CHMAP_UNKNOWN,
        SND_CHMAP_UNKNOWN,
    } ++ @as([2]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [7]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_FC,
        SND_CHMAP_LFE,
        SND_CHMAP_RC,
        SND_CHMAP_SL,
        SND_CHMAP_SR,
    } ++ @as([1]enum_snd_pcm_chmap_position, @splat(@import("std").mem.zeroes(enum_snd_pcm_chmap_position))),
    [8]enum_snd_pcm_chmap_position{
        SND_CHMAP_FL,
        SND_CHMAP_FR,
        SND_CHMAP_FC,
        SND_CHMAP_LFE,
        SND_CHMAP_RL,
        SND_CHMAP_RR,
        SND_CHMAP_SL,
        SND_CHMAP_SR,
    },
};
pub fn has_pos(chmap: [*c]const c_uint, pos: c_uint) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [7:0]u8 = "has_pos".*;
    };
    _ = &static_local___func__;
    {
        var chan_idx: c_uint = 0;
        _ = &chan_idx;
        while (true) : (chan_idx +%= 1) {
            if (chan_idx == @as(c_uint, 6)) {
                return @"false" != 0;
            }
            if (chmap[chan_idx] == pos) {
                return @"true" != 0;
            }
        }
    }
    while (true) {
        while (!!(@intFromPtr("Shouldn't hit this code.") != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!\"Shouldn't hit this code.\"",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 657);
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
    return @"false" != 0;
}
pub fn sdl_6chans_set_rear_or_side_channels_from_alsa_6chans(sdl_6chans: [*c]c_uint, alsa_6chans: [*c]const c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (((!has_pos(alsa_6chans, SND_CHMAP_FL) or !has_pos(alsa_6chans, SND_CHMAP_FR)) or !has_pos(alsa_6chans, SND_CHMAP_FC)) or !has_pos(alsa_6chans, SND_CHMAP_LFE)) {
        sdl_6chans[@as(c_int, 4)] = SND_CHMAP_UNKNOWN;
        sdl_6chans[@as(c_int, 5)] = SND_CHMAP_UNKNOWN;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: 6channels:unsupported channel map");
        return;
    }
    var state: c_uint = 0;
    _ = &state;
    {
        var chan_idx: c_uint = 0;
        _ = &chan_idx;
        while (chan_idx < @as(c_uint, 6)) : (chan_idx +%= 1) {
            if ((alsa_6chans[chan_idx] == @as(c_uint, SND_CHMAP_SL)) or (alsa_6chans[chan_idx] == @as(c_uint, SND_CHMAP_SR))) {
                if (state == @as(c_uint, 0)) {
                    state = 2;
                } else if (state == @as(c_uint, 1)) {
                    state = 3;
                    break;
                }
            } else if ((alsa_6chans[chan_idx] == @as(c_uint, SND_CHMAP_RL)) or (alsa_6chans[chan_idx] == @as(c_uint, SND_CHMAP_RR))) {
                if (state == @as(c_uint, 0)) {
                    state = 1;
                } else if (state == @as(c_uint, 2)) {
                    state = 3;
                    break;
                }
            }
        }
    }
    if ((state == @as(c_uint, 3)) or (state == @as(c_uint, 0))) {
        sdl_6chans[@as(c_int, 4)] = SND_CHMAP_UNKNOWN;
        sdl_6chans[@as(c_int, 5)] = SND_CHMAP_UNKNOWN;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: 6channels:unsupported channel map");
    } else if (state == @as(c_uint, 1)) {
        sdl_6chans[@as(c_int, 4)] = SND_CHMAP_RL;
        sdl_6chans[@as(c_int, 5)] = SND_CHMAP_RR;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: 6channels:sdl map set to rear");
    } else {
        sdl_6chans[@as(c_int, 4)] = SND_CHMAP_SL;
        sdl_6chans[@as(c_int, 5)] = SND_CHMAP_SR;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: 6channels:sdl map set to side");
    }
}
pub fn swizzle_map_compute_alsa_subscan(ctx: [*c]const struct_ALSA_pcm_cfg_ctx, swizzle_map: [*c]c_int, sdl_pos_idx: c_uint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "swizzle_map_compute_alsa_subscan".*;
    };
    _ = &static_local___func__;
    swizzle_map[sdl_pos_idx] = -@as(c_int, 1);
    {
        var alsa_pos_idx: c_uint = 0;
        _ = &alsa_pos_idx;
        while (true) : (alsa_pos_idx +%= 1) {
            while (true) {
                while (!(alsa_pos_idx != ctx.*.chans_n)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "alsa_pos_idx != ctx->chans_n",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 723);
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
            if (ctx.*.alsa_chmap_installed[alsa_pos_idx] == ctx.*.sdl_chmap[sdl_pos_idx]) {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: swizzle SDL %u <-> alsa %u", sdl_pos_idx, alsa_pos_idx);
                swizzle_map[sdl_pos_idx] = @bitCast(@as(c_uint, @truncate(alsa_pos_idx)));
                return;
            }
        }
    }
}
pub fn swizzle_map_compute(ctx: [*c]const struct_ALSA_pcm_cfg_ctx, swizzle_map: [*c]c_int, needs_swizzle: [*c]bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    needs_swizzle.* = @"false" != 0;
    {
        var sdl_pos_idx: c_uint = 0;
        _ = &sdl_pos_idx;
        while (sdl_pos_idx != ctx.*.chans_n) : (sdl_pos_idx +%= 1) {
            swizzle_map_compute_alsa_subscan(ctx, swizzle_map, sdl_pos_idx);
            if (@as(c_uint, @bitCast(@as(c_int, swizzle_map[sdl_pos_idx]))) != sdl_pos_idx) {
                needs_swizzle.* = @"true" != 0;
            }
        }
    }
}
pub fn alsa_chmap_install(ctx: [*c]struct_ALSA_pcm_cfg_ctx, chmap: [*c]const c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var isstack: bool = undefined;
    _ = &isstack;
    var chmap_to_install: [*c]snd_pcm_chmap_t = @ptrCast(@alignCast(blk: {
        (&isstack).* = (@sizeOf(c_uint) *% @as(c_ulong, @as(c_uint, 1) +% ctx.*.chans_n)) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]c_uint, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_uint) *% @as(c_ulong, @as(c_uint, 1) +% ctx.*.chans_n))))) else @as([*c]c_uint, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_uint) *% @as(c_ulong, @as(c_uint, 1) +% ctx.*.chans_n)))));
    }));
    _ = &chmap_to_install;
    if (!(chmap_to_install != null)) {
        return -@as(c_int, 1);
    }
    chmap_to_install.*.channels = ctx.*.chans_n;
    _ = memcpy(@ptrCast(@alignCast(chmap_to_install.*.pos())), @ptrCast(@alignCast(chmap)), @sizeOf(c_uint) *% @as(c_ulong, ctx.*.chans_n));
    var logdebug_chmap_str: [128]u8 = undefined;
    _ = &logdebug_chmap_str;
    _ = ALSA_snd_pcm_chmap_print.?(chmap_to_install, @sizeOf(@TypeOf(logdebug_chmap_str)), @ptrCast(@alignCast(&logdebug_chmap_str)));
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map to install:%s", @as([*c]u8, @ptrCast(@alignCast(&logdebug_chmap_str))));
    var status: c_int = ALSA_snd_pcm_set_chmap.?(ctx.*.device.*.hidden.*.pcm, chmap_to_install);
    _ = &status;
    if (status < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("ALSA: failed to install channel map: %s", ALSA_snd_strerror.?(status));
        return -@as(c_int, 1);
    }
    _ = memcpy(@ptrCast(@alignCast(@as([*c]c_uint, @ptrCast(@alignCast(&ctx.*.alsa_chmap_installed))))), @ptrCast(@alignCast(chmap)), @as(c_ulong, ctx.*.chans_n) *% @sizeOf(c_uint));
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(chmap_to_install)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(chmap_to_install)));
    }
    return 0;
}
pub fn alsa_chmap_has_duplicate_position(ctx: [*c]const struct_ALSA_pcm_cfg_ctx, pos: [*c]const c_uint) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (ctx.*.chans_n < @as(c_uint, 2)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:no duplicate");
        return @"false" != 0;
    }
    {
        var chan_idx: c_uint = 1;
        _ = &chan_idx;
        while (chan_idx != ctx.*.chans_n) : (chan_idx +%= 1) {
            {
                var seen_idx: c_uint = 0;
                _ = &seen_idx;
                while (seen_idx != chan_idx) : (seen_idx +%= 1) {
                    if (pos[seen_idx] == pos[chan_idx]) {
                        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:have duplicate");
                        return @"true" != 0;
                    }
                }
            }
        }
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:no duplicate");
    return @"false" != 0;
}
pub fn alsa_chmap_cfg_ordered_fixed_or_paired(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var chmap_query: [*c][*c]snd_pcm_chmap_query_t = ctx.*.chmap_queries;
        _ = &chmap_query;
        while (chmap_query.* != null) : (chmap_query += 1) {
            if ((chmap_query.*.*.map.channels != ctx.*.chans_n) or ((chmap_query.*.*.type != @as(enum_snd_pcm_chmap_type, SND_CHMAP_TYPE_FIXED)) and (chmap_query.*.*.type != @as(enum_snd_pcm_chmap_type, SND_CHMAP_TYPE_PAIRED)))) {
                continue;
            }
            var logdebug_chmap_str: [128]u8 = undefined;
            _ = &logdebug_chmap_str;
            _ = ALSA_snd_pcm_chmap_print.?(&chmap_query.*.*.map, @sizeOf(@TypeOf(logdebug_chmap_str)), @ptrCast(@alignCast(&logdebug_chmap_str)));
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:ordered:fixed|paired:%s", @as([*c]u8, @ptrCast(@alignCast(&logdebug_chmap_str))));
            {
                var i: c_int = 0;
                _ = &i;
                while (@as(c_uint, @bitCast(@as(c_int, i))) < ctx.*.chans_n) : (i += 1) {
                    ctx.*.sdl_chmap[@bitCast(@as(isize, @intCast(i)))] = sdl_channel_maps[ctx.*.chans_n][@bitCast(@as(isize, @intCast(i)))];
                }
            }
            var alsa_chmap: [*c]c_uint = chmap_query.*.*.map.pos();
            _ = &alsa_chmap;
            if (ctx.*.chans_n == @as(c_uint, 6)) {
                sdl_6chans_set_rear_or_side_channels_from_alsa_6chans(@ptrCast(@alignCast(&ctx.*.sdl_chmap)), alsa_chmap);
            }
            if (alsa_chmap_has_duplicate_position(ctx, alsa_chmap)) {
                continue;
            }
            {
                var chan_idx: c_uint = 0;
                _ = &chan_idx;
                while (ctx.*.sdl_chmap[chan_idx] == alsa_chmap[chan_idx]) : (chan_idx +%= 1) {
                    if (chan_idx == ctx.*.chans_n) {
                        return alsa_chmap_install(ctx, alsa_chmap);
                    }
                }
            }
        }
    }
    return 2;
}
pub fn alsa_chmap_cfg_ordered_var(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var chmap_query: [*c][*c]snd_pcm_chmap_query_t = ctx.*.chmap_queries;
        _ = &chmap_query;
        while (chmap_query.* != null) : (chmap_query += 1) {
            if ((chmap_query.*.*.map.channels != ctx.*.chans_n) or (chmap_query.*.*.type != @as(enum_snd_pcm_chmap_type, SND_CHMAP_TYPE_VAR))) {
                continue;
            }
            var logdebug_chmap_str: [128]u8 = undefined;
            _ = &logdebug_chmap_str;
            _ = ALSA_snd_pcm_chmap_print.?(&chmap_query.*.*.map, @sizeOf(@TypeOf(logdebug_chmap_str)), @ptrCast(@alignCast(&logdebug_chmap_str)));
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:ordered:var:%s", @as([*c]u8, @ptrCast(@alignCast(&logdebug_chmap_str))));
            {
                var i: c_int = 0;
                _ = &i;
                while (@as(c_uint, @bitCast(@as(c_int, i))) < ctx.*.chans_n) : (i += 1) {
                    ctx.*.sdl_chmap[@bitCast(@as(isize, @intCast(i)))] = sdl_channel_maps[ctx.*.chans_n][@bitCast(@as(isize, @intCast(i)))];
                }
            }
            var alsa_chmap: [*c]c_uint = chmap_query.*.*.map.pos();
            _ = &alsa_chmap;
            if (ctx.*.chans_n == @as(c_uint, 6)) {
                sdl_6chans_set_rear_or_side_channels_from_alsa_6chans(@ptrCast(@alignCast(&ctx.*.sdl_chmap)), alsa_chmap);
            }
            if (alsa_chmap_has_duplicate_position(ctx, alsa_chmap)) {
                continue;
            }
            var pos_matches_n: c_uint = 0;
            _ = &pos_matches_n;
            {
                var chan_idx: c_uint = 0;
                _ = &chan_idx;
                while (chan_idx != ctx.*.chans_n) : (chan_idx +%= 1) {
                    {
                        var subscan_chan_idx: c_uint = 0;
                        _ = &subscan_chan_idx;
                        while (subscan_chan_idx != ctx.*.chans_n) : (subscan_chan_idx +%= 1) {
                            if (ctx.*.sdl_chmap[chan_idx] == alsa_chmap[subscan_chan_idx]) {
                                pos_matches_n +%= 1;
                                break;
                            }
                        }
                    }
                }
            }
            if (pos_matches_n == ctx.*.chans_n) {
                return alsa_chmap_install(ctx, @ptrCast(@alignCast(&ctx.*.sdl_chmap)));
            }
        }
    }
    return 2;
}
pub fn alsa_chmap_cfg_ordered(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const status: c_int = alsa_chmap_cfg_ordered_fixed_or_paired(ctx);
    _ = &status;
    return if (status != @as(c_int, 2)) status else alsa_chmap_cfg_ordered_var(ctx);
}
pub fn alsa_chmap_cfg_unordered(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var chmap_query: [*c][*c]snd_pcm_chmap_query_t = ctx.*.chmap_queries;
        _ = &chmap_query;
        while (chmap_query.* != null) : (chmap_query += 1) {
            if ((chmap_query.*.*.map.channels != ctx.*.chans_n) or ((chmap_query.*.*.type != @as(enum_snd_pcm_chmap_type, SND_CHMAP_TYPE_FIXED)) and (chmap_query.*.*.type != @as(enum_snd_pcm_chmap_type, SND_CHMAP_TYPE_PAIRED)))) {
                continue;
            }
            var logdebug_chmap_str: [128]u8 = undefined;
            _ = &logdebug_chmap_str;
            _ = ALSA_snd_pcm_chmap_print.?(&chmap_query.*.*.map, @sizeOf(@TypeOf(logdebug_chmap_str)), @ptrCast(@alignCast(&logdebug_chmap_str)));
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channel map:unordered:fixed|paired:%s", @as([*c]u8, @ptrCast(@alignCast(&logdebug_chmap_str))));
            {
                var i: c_int = 0;
                _ = &i;
                while (@as(c_uint, @bitCast(@as(c_int, i))) < ctx.*.chans_n) : (i += 1) {
                    ctx.*.sdl_chmap[@bitCast(@as(isize, @intCast(i)))] = sdl_channel_maps[ctx.*.chans_n][@bitCast(@as(isize, @intCast(i)))];
                }
            }
            var alsa_chmap: [*c]c_uint = chmap_query.*.*.map.pos();
            _ = &alsa_chmap;
            if (ctx.*.chans_n == @as(c_uint, 6)) {
                sdl_6chans_set_rear_or_side_channels_from_alsa_6chans(@ptrCast(@alignCast(&ctx.*.sdl_chmap)), alsa_chmap);
            }
            if (alsa_chmap_has_duplicate_position(ctx, alsa_chmap)) {
                continue;
            }
            var pos_matches_n: c_uint = 0;
            _ = &pos_matches_n;
            {
                var chan_idx: c_uint = 0;
                _ = &chan_idx;
                while (chan_idx != ctx.*.chans_n) : (chan_idx +%= 1) {
                    {
                        var subscan_chan_idx: c_uint = 0;
                        _ = &subscan_chan_idx;
                        while (subscan_chan_idx != ctx.*.chans_n) : (subscan_chan_idx +%= 1) {
                            if (ctx.*.sdl_chmap[chan_idx] == alsa_chmap[subscan_chan_idx]) {
                                pos_matches_n +%= 1;
                                break;
                            }
                        }
                    }
                }
            }
            if (pos_matches_n == ctx.*.chans_n) {
                return alsa_chmap_install(ctx, alsa_chmap);
            }
        }
    }
    return 2;
}
pub fn alsa_chmap_cfg(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var status: c_int = undefined;
    _ = &status;
    ctx.*.chmap_queries = ALSA_snd_pcm_query_chmaps.?(ctx.*.device.*.hidden.*.pcm);
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx.*.chmap_queries))) == @as(?*anyopaque, null)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: couldn't query channel map, swizzling off");
        return 0;
    }
    status = alsa_chmap_cfg_ordered(ctx);
    if (status == @as(c_int, 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: swizzling off");
        return status;
    } else if (status != @as(c_int, 2)) {
        return status;
    }
    status = alsa_chmap_cfg_unordered(ctx);
    if (status == @as(c_int, 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: swizzling on");
        var isstack: bool = undefined;
        _ = &isstack;
        var swizzle_map: [*c]c_int = blk: {
            (&isstack).* = (@sizeOf(c_int) *% @as(c_ulong, ctx.*.chans_n)) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&isstack).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, ctx.*.chans_n))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, ctx.*.chans_n)))));
        };
        _ = &swizzle_map;
        if (!(swizzle_map != null)) {
            status = -@as(c_int, 1);
        } else {
            var needs_swizzle: bool = undefined;
            _ = &needs_swizzle;
            swizzle_map_compute(ctx, swizzle_map, &needs_swizzle);
            if (needs_swizzle) {
                ctx.*.device.*.chmap = SDL_ChannelMapDup(swizzle_map, @bitCast(@as(c_uint, @truncate(ctx.*.chans_n))));
                if (!(ctx.*.device.*.chmap != null)) {
                    status = -@as(c_int, 1);
                }
            }
            if (isstack) {
                SDL_free_REAL(@ptrCast(@alignCast(swizzle_map)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(swizzle_map)));
            }
        }
    }
    if (status == @as(c_int, 2)) {
        return 1;
    }
    return status;
}
pub fn ALSA_pcm_cfg_hw_chans_n_scan(ctx: [*c]struct_ALSA_pcm_cfg_ctx, mode: c_uint) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "ALSA_pcm_cfg_hw_chans_n_scan".*;
    };
    _ = &static_local___func__;
    var target_chans_n: c_uint = undefined;
    _ = &target_chans_n;
    var status: c_int = undefined;
    _ = &status;
    var alsa_format: snd_pcm_format_t = undefined;
    _ = &alsa_format;
    var closefmts: [*c]const SDL_AudioFormat = undefined;
    _ = &closefmts;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Shouldn't reach this code.\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                target_chans_n = @bitCast(@as(c_int, ctx.*.device.*.spec.channels));
                if (mode == @as(c_uint, 1)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                target_chans_n -%= 1;
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (true) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (mode == @as(c_uint, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            7 => {
                if (target_chans_n > @as(c_uint, SDL_AUDIO_ALSA__CHMAP_CHANS_N_MAX)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (target_chans_n == @as(c_uint, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            9 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: target chans_n is %u", target_chans_n);
                status = ALSA_snd_pcm_hw_params_any.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            10 => {
                return 1;
            },
            11 => {
                {
                    sdl_pc = 12;
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
                return 1;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            16 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't get hardware config: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                status = ALSA_snd_pcm_hw_params_set_access.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, SND_PCM_ACCESS_RW_INTERLEAVED);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set interleaved access: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                alsa_format = 0;
                closefmts = SDL_ClosestAudioFormats(ctx.*.device.*.spec.format);
                ctx.*.matched_sdl_format = 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if ((blk: {
                    const tmp = (blk_1: {
                        const ref = &closefmts;
                        const tmp_2 = ref.*;
                        ref.* += 1;
                        break :blk_1 tmp_2;
                    }).*;
                    ctx.*.matched_sdl_format = tmp;
                    break :blk tmp;
                }) != @as(SDL_AudioFormat, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                switch (ctx.*.matched_sdl_format) {
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16LE) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16BE) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32LE) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32BE) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32LE) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32BE) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 34;
                        continue;
                    },
                }
            },
            24 => {
                if (ctx.*.matched_sdl_format == @as(SDL_AudioFormat, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            25 => {
                if (ALSA_snd_pcm_hw_params_set_format.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, alsa_format) >= @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            26 => {
                alsa_format = SND_PCM_FORMAT_U8;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                alsa_format = SND_PCM_FORMAT_S8;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                alsa_format = SND_PCM_FORMAT_S16_LE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                alsa_format = SND_PCM_FORMAT_S16_BE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                alsa_format = SND_PCM_FORMAT_S32_LE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            31 => {
                alsa_format = SND_PCM_FORMAT_S32_BE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            32 => {
                alsa_format = SND_PCM_FORMAT_FLOAT_LE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
                alsa_format = SND_PCM_FORMAT_FLOAT_BE;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 24;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            38 => {
                _ = SDL_SetError_REAL("ALSA: Unsupported audio format: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                ctx.*.chans_n = target_chans_n;
                status = ALSA_snd_pcm_hw_params_set_channels_near.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, &ctx.*.chans_n);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set audio channels: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                ctx.*.rate = @bitCast(@as(c_int, ctx.*.device.*.spec.freq));
                status = ALSA_snd_pcm_hw_params_set_rate_near.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, &ctx.*.rate, null);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set audio frequency: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                ctx.*.persize = @bitCast(@as(c_long, ctx.*.device.*.sample_frames));
                status = ALSA_snd_pcm_hw_params_set_period_size_near.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, &ctx.*.persize, null);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set the period size: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                ctx.*.periods = 2;
                status = ALSA_snd_pcm_hw_params_set_periods_min.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, &ctx.*.periods, null);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set the minimum number of periods per buffer: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                status = ALSA_snd_pcm_hw_params_set_periods_first.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams, &ctx.*.periods, null);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't set the number of periods per buffer: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                status = ALSA_snd_pcm_hw_params.?(ctx.*.device.*.hidden.*.pcm, ctx.*.hwparams);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                _ = SDL_SetError_REAL("ALSA: installation of hardware parameter failed: %s", ALSA_snd_strerror.?(status));
                return -@as(c_int, 1);
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                status = alsa_chmap_cfg(ctx);
                if (status < @as(c_int, 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                return status;
            },
            60 => {
                if (status == @as(c_int, 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                ALSA_snd_pcm_free_chmaps.?(ctx.*.chmap_queries);
                _ = ALSA_snd_pcm_hw_free.?(ctx.*.device.*.hidden.*.pcm);
                if (mode == @as(c_uint, 0)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            62 => {
                return 0;
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            65 => {
                target_chans_n +%= 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                target_chans_n -%= 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                return 1;
            },
            71 => {
                if (!!(@intFromPtr("Shouldn't reach this code.") != 0)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 1126);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ALSA_pcm_cfg_hw(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: target chans_n, equal or above requested chans_n mode");
    var status: c_int = ALSA_pcm_cfg_hw_chans_n_scan(ctx, 0);
    _ = &status;
    if (status < @as(c_int, 0)) {
        return @"false" != 0;
    } else if (status == @as(c_int, 0)) {
        return @"true" != 0;
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: target chans_n, below requested chans_n mode");
    status = ALSA_pcm_cfg_hw_chans_n_scan(ctx, 1);
    if (status < @as(c_int, 0)) {
        return @"false" != 0;
    } else if (status == @as(c_int, 0)) {
        return @"true" != 0;
    }
    return SDL_SetError_REAL("ALSA: Couldn't configure targeting any SDL supported channel number");
}
pub fn ALSA_pcm_cfg_sw(ctx: [*c]struct_ALSA_pcm_cfg_ctx) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var status: c_int = undefined;
    _ = &status;
    status = ALSA_snd_pcm_sw_params_current.?(ctx.*.device.*.hidden.*.pcm, ctx.*.swparams);
    if (status < @as(c_int, 0)) {
        return SDL_SetError_REAL("ALSA: Couldn't get software config: %s", ALSA_snd_strerror.?(status));
    }
    status = ALSA_snd_pcm_sw_params_set_avail_min.?(ctx.*.device.*.hidden.*.pcm, ctx.*.swparams, ctx.*.persize);
    if (status < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't set minimum available samples: %s", ALSA_snd_strerror.?(status));
    }
    status = ALSA_snd_pcm_sw_params_set_start_threshold.?(ctx.*.device.*.hidden.*.pcm, ctx.*.swparams, 1);
    if (status < @as(c_int, 0)) {
        return SDL_SetError_REAL("ALSA: Couldn't set start threshold: %s", ALSA_snd_strerror.?(status));
    }
    status = ALSA_snd_pcm_sw_params.?(ctx.*.device.*.hidden.*.pcm, ctx.*.swparams);
    if (status < @as(c_int, 0)) {
        return SDL_SetError_REAL("Couldn't set software audio parameters: %s", ALSA_snd_strerror.?(status));
    }
    return @"true" != 0;
}
pub fn ALSA_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var recording: bool = undefined;
    _ = &recording;
    var cfg_ctx: struct_ALSA_pcm_cfg_ctx = undefined;
    _ = &cfg_ctx;
    var pcm_str: [*c]u8 = undefined;
    _ = &pcm_str;
    var status: c_int = undefined;
    _ = &status;
    var bufsize: snd_pcm_uframes_t = undefined;
    _ = &bufsize;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                recording = device.*.recording;
                status = 0;
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: channels requested %u", device.*.spec.channels);
                device.*.chmap = null;
                _ = memset(@ptrCast(@alignCast(&cfg_ctx)), 0, @sizeOf(@TypeOf(cfg_ctx)));
                cfg_ctx.device = device;
                cfg_ctx.device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cfg_ctx.device.*.hidden.*)))));
                if (!(cfg_ctx.device.*.hidden != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            1 => {
                ALSA_snd_pcm_free_chmaps.?(cfg_ctx.chmap_queries);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                _ = ALSA_snd_pcm_close.?(cfg_ctx.device.*.hidden.*.pcm);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.device.*.hidden)));
                cfg_ctx.device.*.hidden = null;
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.hwparams)));
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.swparams)));
                return @"false" != 0;
            },
            4 => {
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.hwparams)));
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.swparams)));
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                pcm_str = get_pcm_str(cfg_ctx.device.*.handle);
                if (@as(?*anyopaque, @ptrCast(@alignCast(pcm_str))) == @as(?*anyopaque, null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: PCM open '%s'", pcm_str);
                status = ALSA_snd_pcm_open.?(&cfg_ctx.device.*.hidden.*.pcm, pcm_str, @bitCast(if (recording) SND_PCM_STREAM_CAPTURE else SND_PCM_STREAM_PLAYBACK), SND_PCM_NONBLOCK);
                SDL_free_REAL(@ptrCast(@alignCast(pcm_str)));
                if (status < @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                _ = SDL_SetError_REAL("ALSA: Couldn't open audio device: %s", ALSA_snd_strerror.?(status));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                cfg_ctx.hwparams = @ptrCast(@alignCast(SDL_malloc_REAL(ALSA_snd_pcm_hw_params_sizeof.?())));
                cfg_ctx.swparams = @ptrCast(@alignCast(SDL_malloc_REAL(ALSA_snd_pcm_sw_params_sizeof.?())));
                if (!(cfg_ctx.hwparams != null) or !(cfg_ctx.swparams != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                _ = SDL_OutOfMemory_REAL();
                {
                    sdl_pc = 2;
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
                if (!ALSA_pcm_cfg_hw(&cfg_ctx)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                _ = ALSA_snd_pcm_hw_params_get_buffer_size.?(cfg_ctx.hwparams, &bufsize);
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: period size = %ld, periods = %u, buffer size = %lu", cfg_ctx.persize, cfg_ctx.periods, bufsize);
                if (!ALSA_pcm_cfg_sw(&cfg_ctx)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                cfg_ctx.device.*.spec.format = cfg_ctx.matched_sdl_format;
                cfg_ctx.device.*.spec.channels = @bitCast(@as(c_uint, @truncate(cfg_ctx.chans_n)));
                cfg_ctx.device.*.spec.freq = @bitCast(@as(c_uint, @truncate(cfg_ctx.rate)));
                cfg_ctx.device.*.sample_frames = @bitCast(@as(c_uint, @truncate(cfg_ctx.persize)));
                SDL_UpdatedAudioDeviceFormat(cfg_ctx.device);
                if (!recording) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                cfg_ctx.device.*.hidden.*.mixbuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, cfg_ctx.device.*.buffer_size)))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(cfg_ctx.device.*.hidden.*.mixbuf))) == @as(?*anyopaque, null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (!recording) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 1;
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
                _ = memset(@ptrCast(@alignCast(cfg_ctx.device.*.hidden.*.mixbuf)), cfg_ctx.device.*.silence_value, @bitCast(@as(c_long, cfg_ctx.device.*.buffer_size)));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                _ = ALSA_snd_pcm_nonblock.?(cfg_ctx.device.*.hidden.*.pcm, 0);
                {
                    sdl_pc = 30;
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
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.hwparams)));
                SDL_free_REAL(@ptrCast(@alignCast(cfg_ctx.swparams)));
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn ALSA_ThreadInit(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetCurrentThreadPriority_REAL(@bitCast(if (device.*.recording) SDL_THREAD_PRIORITY_HIGH else SDL_THREAD_PRIORITY_TIME_CRITICAL));
    _ = ALSA_snd_pcm_start.?(device.*.hidden.*.pcm);
}
pub var hotplug_devices: [*c]ALSA_Device = null;
pub fn hotplug_device_process(ctl: ?*snd_ctl_t, ctl_card_info: ?*snd_ctl_card_info_t, dev_idx: c_int, direction: snd_pcm_stream_t, unseen: [*c][*c]ALSA_Device, seen: [*c][*c]ALSA_Device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "hotplug_device_process".*;
    };
    _ = &static_local___func__;
    var subdevs_n: c_uint = 1;
    _ = &subdevs_n;
    var subdev_idx: c_uint = 0;
    _ = &subdev_idx;
    const recording: bool = (if (direction == @as(snd_pcm_stream_t, SND_PCM_STREAM_CAPTURE)) @"true" else @"false") != 0;
    _ = &recording;
    var isstack: bool = undefined;
    _ = &isstack;
    var pcm_info: ?*snd_pcm_info_t = @ptrCast(@alignCast(blk: {
        (&isstack).* = (@sizeOf(Uint8) *% ALSA_snd_pcm_info_sizeof.?()) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% ALSA_snd_pcm_info_sizeof.?())))) else @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% ALSA_snd_pcm_info_sizeof.?()))));
    }));
    _ = &pcm_info;
    _ = memset(@ptrCast(@alignCast(pcm_info)), 0, ALSA_snd_pcm_info_sizeof.?());
    while (true) {
        ALSA_snd_pcm_info_set_stream.?(pcm_info, direction);
        ALSA_snd_pcm_info_set_device.?(pcm_info, @bitCast(@as(c_int, dev_idx)));
        ALSA_snd_pcm_info_set_subdevice.?(pcm_info, subdev_idx);
        const r: c_int = ALSA_snd_ctl_pcm_info.?(ctl, pcm_info);
        _ = &r;
        if (r < @as(c_int, 0)) {
            if (isstack) {
                SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
            }
            if ((subdev_idx == @as(c_uint, 0)) and (r == -ENOENT)) {
                return 0;
            }
            return -@as(c_int, 1);
        }
        if (subdev_idx == @as(c_uint, 0)) {
            subdevs_n = ALSA_snd_pcm_info_get_subdevices_count.?(pcm_info);
        }
        var unseen_prev_adev: [*c]ALSA_Device = null;
        _ = &unseen_prev_adev;
        var adev: [*c]ALSA_Device = undefined;
        _ = &adev;
        {
            adev = unseen.*;
            while (adev != null) : (adev = adev.*.next) {
                if (((SDL_strcmp_REAL(adev.*.id, ALSA_snd_ctl_card_info_get_id.?(ctl_card_info)) == @as(c_int, 0)) and (adev.*.device_index == dev_idx)) and (@as(c_int, @intFromBool(adev.*.recording)) == @as(c_int, @intFromBool(recording)))) {
                    if (unseen.* == adev) {
                        unseen.* = adev.*.next;
                    } else {
                        unseen_prev_adev.*.next = adev.*.next;
                    }
                    adev.*.next = seen.*;
                    seen.* = adev;
                    break;
                }
                unseen_prev_adev = adev;
            }
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(adev))) == @as(?*anyopaque, null)) {
            adev = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(adev.*)))));
            if (@as(?*anyopaque, @ptrCast(@alignCast(adev))) == @as(?*anyopaque, null)) {
                if (isstack) {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                } else {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                }
                return -@as(c_int, 1);
            }
            adev.*.id = SDL_strdup_REAL(ALSA_snd_ctl_card_info_get_id.?(ctl_card_info));
            if (@as(?*anyopaque, @ptrCast(@alignCast(adev.*.id))) == @as(?*anyopaque, null)) {
                if (isstack) {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                } else {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                }
                SDL_free_REAL(@ptrCast(@alignCast(adev)));
                return -@as(c_int, 1);
            }
            if (SDL_asprintf_REAL(&adev.*.name, "%s:%s", ALSA_snd_ctl_card_info_get_name.?(ctl_card_info), ALSA_snd_pcm_info_get_name.?(pcm_info)) == -@as(c_int, 1)) {
                if (isstack) {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                } else {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                }
                SDL_free_REAL(@ptrCast(@alignCast(adev.*.id)));
                SDL_free_REAL(@ptrCast(@alignCast(adev)));
                return -@as(c_int, 1);
            }
            adev.*.device_index = dev_idx;
            adev.*.recording = direction == @as(snd_pcm_stream_t, SND_PCM_STREAM_CAPTURE);
            if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_AddAudioDevice(recording, adev.*.name, null, null, @ptrCast(@alignCast(adev)))))) == @as(?*anyopaque, null)) {
                if (isstack) {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                } else {
                    SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
                }
                SDL_free_REAL(@ptrCast(@alignCast(adev.*.id)));
                SDL_free_REAL(@ptrCast(@alignCast(adev.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(adev)));
                return -@as(c_int, 1);
            }
            adev.*.next = seen.*;
            seen.* = adev;
        }
        subdev_idx +%= 1;
        if (subdev_idx == subdevs_n) {
            if (isstack) {
                SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
            }
            return 0;
        }
        _ = memset(@ptrCast(@alignCast(pcm_info)), 0, ALSA_snd_pcm_info_sizeof.?());
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(pcm_info)));
    }
    while (true) {
        while (!!(@intFromPtr("Shouldn't reach this code") != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!\"Shouldn't reach this code\"",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_alsa_audio.c", 1390);
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
    return -@as(c_int, 1);
}
pub fn ALSA_HotplugIteration(has_default_output: [*c]bool, has_default_recording: [*c]bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var isstack: bool = undefined;
    _ = &isstack;
    var ctl_card_info: ?*snd_ctl_card_info_t = undefined;
    _ = &ctl_card_info;
    var ctl: ?*snd_ctl_t = undefined;
    _ = &ctl;
    var unseen: [*c]ALSA_Device = undefined;
    _ = &unseen;
    var seen: [*c]ALSA_Device = undefined;
    _ = &seen;
    var card_idx: c_int = undefined;
    _ = &card_idx;
    var r: c_int = undefined;
    _ = &r;
    var ctl_name: [64]u8 = undefined;
    _ = &ctl_name;
    var dev_idx: c_int = undefined;
    _ = &dev_idx;
    var next: [*c]ALSA_Device = undefined;
    _ = &next;
    var next_1: [*c]ALSA_Device = undefined;
    _ = &next_1;
    var next_2: [*c]ALSA_Device = undefined;
    _ = &next_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(has_default_output))) != @as(?*anyopaque, null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (ctl != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            2 => {
                has_default_output.* = @"true" != 0;
                {
                    sdl_pc = 4;
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
                if (@as(?*anyopaque, @ptrCast(@alignCast(has_default_recording))) != @as(?*anyopaque, null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                has_default_recording.* = @"true" != 0;
                {
                    sdl_pc = 7;
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
                ctl_card_info = @ptrCast(@alignCast(blk: {
                    (&isstack).* = (@sizeOf(Uint8) *% ALSA_snd_ctl_card_info_sizeof.?()) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&isstack).*) @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% ALSA_snd_ctl_card_info_sizeof.?())))) else @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% ALSA_snd_ctl_card_info_sizeof.?()))));
                }));
                if (!(ctl_card_info != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                _ = memset(@ptrCast(@alignCast(ctl_card_info)), 0, ALSA_snd_ctl_card_info_sizeof.?());
                ctl = null;
                unseen = hotplug_devices;
                seen = null;
                card_idx = -@as(c_int, 1);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (true) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                r = ALSA_snd_card_next.?(&card_idx);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                if (card_idx == -@as(c_int, 1)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&ctl_name)), @sizeOf(@TypeOf(ctl_name)), "%s%d", ALSA_device_prefix, card_idx);
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "ALSA: hotplug ctl_name = '%s'", @as([*c]u8, @ptrCast(@alignCast(&ctl_name))));
                r = ALSA_snd_ctl_open.?(&ctl, @ptrCast(@alignCast(&ctl_name)), 0);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                r = ALSA_snd_ctl_card_info.?(ctl, ctl_card_info);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                dev_idx = -@as(c_int, 1);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (true) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                r = ALSA_snd_ctl_pcm_next_device.?(ctl, &dev_idx);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                _ = ALSA_snd_ctl_close.?(ctl);
                ALSA_snd_ctl_card_info_clear.?(ctl_card_info);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            30 => {
                if (dev_idx == -@as(c_int, 1)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                r = hotplug_device_process(ctl, ctl_card_info, dev_idx, SND_PCM_STREAM_PLAYBACK, &unseen, &seen);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 28;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 1;
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
                r = hotplug_device_process(ctl, ctl_card_info, dev_idx, SND_PCM_STREAM_CAPTURE, &unseen, &seen);
                if (r < @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            41 => {
                if (unseen != null) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                SDL_AudioDeviceDisconnected(SDL_FindPhysicalAudioDeviceByHandle(@ptrCast(@alignCast(unseen))));
                SDL_free_REAL(@ptrCast(@alignCast(unseen.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(unseen.*.id)));
                next = unseen.*.next;
                SDL_free_REAL(@ptrCast(@alignCast(unseen)));
                unseen = next;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            43 => {
                hotplug_devices = seen;
                if (isstack) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                SDL_free_REAL(@ptrCast(@alignCast(ctl_card_info)));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                SDL_free_REAL(@ptrCast(@alignCast(ctl_card_info)));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                return;
            },
            47 => {
                _ = ALSA_snd_ctl_close.?(ctl);
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if (unseen != null) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                SDL_AudioDeviceDisconnected(SDL_FindPhysicalAudioDeviceByHandle(@ptrCast(@alignCast(unseen))));
                SDL_free_REAL(@ptrCast(@alignCast(unseen.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(unseen.*.id)));
                next_1 = unseen.*.next;
                SDL_free_REAL(@ptrCast(@alignCast(unseen)));
                unseen = next_1;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (seen != null) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                SDL_AudioDeviceDisconnected(SDL_FindPhysicalAudioDeviceByHandle(@ptrCast(@alignCast(seen))));
                SDL_free_REAL(@ptrCast(@alignCast(seen.*.name)));
                SDL_free_REAL(@ptrCast(@alignCast(seen.*.id)));
                next_2 = seen.*.next;
                SDL_free_REAL(@ptrCast(@alignCast(seen)));
                seen = next_2;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            55 => {
                hotplug_devices = null;
                if (isstack) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                SDL_free_REAL(@ptrCast(@alignCast(ctl_card_info)));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                SDL_free_REAL(@ptrCast(@alignCast(ctl_card_info)));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub var ALSA_hotplug_shutdown: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var ALSA_hotplug_thread: ?*SDL_Thread = null;
pub fn ALSA_HotplugThread(_: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = SDL_SetCurrentThreadPriority_REAL(SDL_THREAD_PRIORITY_LOW);
    while (!(SDL_GetAtomicInt_REAL(&ALSA_hotplug_shutdown) != 0)) {
        const ticks: Uint64 = SDL_GetTicks_REAL() +% @as(Uint64, 5000);
        _ = &ticks;
        while (!(SDL_GetAtomicInt_REAL(&ALSA_hotplug_shutdown) != 0) and (SDL_GetTicks_REAL() < ticks)) {
            SDL_Delay_REAL(100);
        }
        ALSA_HotplugIteration(null, null);
    }
    return 0;
}
pub var udev_initialized: bool = false;
pub fn ALSA_udev_callback(udev_type: SDL_UDEV_deviceevent, _: c_int, devpath: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(devpath != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (udev_type) {
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEADDED) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEREMOVED) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                {}
            },
            5 => {
                ALSA_HotplugIteration(null, null);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                ALSA_HotplugIteration(null, null);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ALSA_start_udev() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    udev_initialized = SDL_UDEV_Init();
    if (udev_initialized) {
        if (!SDL_UDEV_AddCallback(ALSA_udev_callback)) {
            SDL_UDEV_Quit();
            udev_initialized = @"false" != 0;
        }
    }
    return udev_initialized;
}
pub fn ALSA_stop_udev() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (udev_initialized) {
        SDL_UDEV_DelCallback(ALSA_udev_callback);
        SDL_UDEV_Quit();
        udev_initialized = @"false" != 0;
    }
}
pub fn ALSA_DetectDevices(default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ALSA_guess_device_prefix();
    var has_default_playback: bool = @"false" != 0;
    _ = &has_default_playback;
    var has_default_recording: bool = @"false" != 0;
    _ = &has_default_recording;
    ALSA_HotplugIteration(&has_default_playback, &has_default_recording);
    if (has_default_playback) {
        default_playback.* = SDL_AddAudioDevice(@"false" != 0, "ALSA default playback device", null, null, @ptrCast(@alignCast(@constCast(&default_playback_handle))));
    }
    if (has_default_recording) {
        default_recording.* = SDL_AddAudioDevice(@"true" != 0, "ALSA default recording device", null, null, @ptrCast(@alignCast(@constCast(&default_recording_handle))));
    }
    if (!ALSA_start_udev()) {
        _ = SDL_SetAtomicInt_REAL(&ALSA_hotplug_shutdown, 0);
        ALSA_hotplug_thread = SDL_CreateThreadRuntime_REAL(ALSA_HotplugThread, "SDLHotplugALSA", null, null, null);
    }
}
pub fn ALSA_DeinitializeStart() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dev: [*c]ALSA_Device = undefined;
    _ = &dev;
    var next: [*c]ALSA_Device = undefined;
    _ = &next;
    if (ALSA_hotplug_thread != null) {
        _ = SDL_SetAtomicInt_REAL(&ALSA_hotplug_shutdown, 1);
        SDL_WaitThread_REAL(ALSA_hotplug_thread, null);
        ALSA_hotplug_thread = null;
    }
    ALSA_stop_udev();
    {
        dev = hotplug_devices;
        while (dev != null) : (dev = next) {
            next = dev.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(dev.*.name)));
            SDL_free_REAL(@ptrCast(@alignCast(dev)));
        }
    }
    hotplug_devices = null;
}
pub fn ALSA_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    UnloadALSALibrary();
}
pub fn ALSA_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!LoadALSALibrary()) {
        return @"false" != 0;
    }
    impl.*.DetectDevices = ALSA_DetectDevices;
    impl.*.OpenDevice = ALSA_OpenDevice;
    impl.*.ThreadInit = ALSA_ThreadInit;
    impl.*.WaitDevice = ALSA_WaitDevice;
    impl.*.GetDeviceBuf = ALSA_GetDeviceBuf;
    impl.*.PlayDevice = ALSA_PlayDevice;
    impl.*.CloseDevice = ALSA_CloseDevice;
    impl.*.DeinitializeStart = ALSA_DeinitializeStart;
    impl.*.Deinitialize = ALSA_Deinitialize;
    impl.*.WaitRecordingDevice = ALSA_WaitDevice;
    impl.*.RecordDevice = ALSA_RecordDevice;
    impl.*.FlushRecording = ALSA_FlushRecording;
    impl.*.HasRecordingSupport = @"true" != 0;
    return @"true" != 0;
}
