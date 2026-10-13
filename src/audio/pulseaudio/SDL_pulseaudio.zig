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
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const __suseconds_t = c_long;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub const pthread_t = c_ulong;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Thread = extern struct {
    threadid: SDL_ThreadID = 0,
    handle: SYS_ThreadHandle = 0,
    status: c_int = 0,
    state: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    errbuf: SDL_error = @import("std").mem.zeroes(SDL_error),
    name: [*c]u8 = null,
    stacksize: usize = 0,
    userfunc: ?*const fn (?*anyopaque) callconv(.c) c_int = null,
    userdata: ?*anyopaque = null,
    data: ?*anyopaque = null,
    endfunc: SDL_FunctionPointer = null,
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadID = Uint64;
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread;
pub extern fn SDL_SetCurrentThreadPriority_REAL(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_Semaphore = opaque {
};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn SDL_CreateSemaphore_REAL(initial_value: Uint32) ?*SDL_Semaphore;
pub extern fn SDL_DestroySemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_WaitSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_SignalSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub const SDL_AUDIO_U8: c_int = 8;
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
pub const struct_pa_stream = opaque {
};
pub const pa_stream = struct_pa_stream;
pub const struct_SDL_PrivateAudioData = extern struct {
    stream: ?*pa_stream = null,
    mixbuf: [*c]Uint8 = null,
    bytes_requested: c_int = 0,
    recordingbuf: [*c]const Uint8 = null,
    recordinglen: c_int = 0,
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
    thread: [*c]SDL_Thread = null,
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
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const PA_SAMPLE_U8: c_int = 0;
pub const PA_SAMPLE_S16LE: c_int = 3;
pub const PA_SAMPLE_S16BE: c_int = 4;
pub const PA_SAMPLE_FLOAT32LE: c_int = 5;
pub const PA_SAMPLE_FLOAT32BE: c_int = 6;
pub const PA_SAMPLE_S32LE: c_int = 7;
pub const PA_SAMPLE_S32BE: c_int = 8;
pub const PA_SAMPLE_INVALID: c_int = -1;
pub const enum_pa_sample_format = c_int;
pub const pa_sample_format_t = enum_pa_sample_format;
pub const struct_pa_sample_spec = extern struct {
    format: pa_sample_format_t = @import("std").mem.zeroes(pa_sample_format_t),
    rate: u32 = 0,
    channels: u8 = 0,
};
pub const pa_sample_spec = struct_pa_sample_spec;
pub const pa_usec_t = u64;
pub const PA_CONTEXT_CONNECTING: c_int = 1;
pub const PA_CONTEXT_AUTHORIZING: c_int = 2;
pub const PA_CONTEXT_SETTING_NAME: c_int = 3;
pub const PA_CONTEXT_READY: c_int = 4;
pub const enum_pa_context_state = c_uint;
pub const pa_context_state_t = enum_pa_context_state;
pub fn PA_CONTEXT_IS_GOOD(x: pa_context_state_t) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((((x == @as(pa_context_state_t, PA_CONTEXT_CONNECTING)) or (x == @as(pa_context_state_t, PA_CONTEXT_AUTHORIZING))) or (x == @as(pa_context_state_t, PA_CONTEXT_SETTING_NAME))) or (x == @as(pa_context_state_t, PA_CONTEXT_READY)));
}
pub const PA_STREAM_CREATING: c_int = 1;
pub const PA_STREAM_READY: c_int = 2;
pub const enum_pa_stream_state = c_uint;
pub const pa_stream_state_t = enum_pa_stream_state;
pub fn PA_STREAM_IS_GOOD(x: pa_stream_state_t) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((x == @as(pa_stream_state_t, PA_STREAM_CREATING)) or (x == @as(pa_stream_state_t, PA_STREAM_READY)));
}
pub const PA_OPERATION_RUNNING: c_int = 0;
pub const enum_pa_operation_state = c_uint;
pub const pa_operation_state_t = enum_pa_operation_state;
pub const enum_pa_context_flags = c_uint;
pub const pa_context_flags_t = enum_pa_context_flags;
pub const PA_STREAM_ADJUST_LATENCY: c_int = 8192;
pub const enum_pa_stream_flags = c_uint;
pub const pa_stream_flags_t = enum_pa_stream_flags;
pub const struct_pa_buffer_attr = extern struct {
    maxlength: u32 = 0,
    tlength: u32 = 0,
    prebuf: u32 = 0,
    minreq: u32 = 0,
    fragsize: u32 = 0,
};
pub const pa_buffer_attr = struct_pa_buffer_attr;
pub const PA_SUBSCRIPTION_MASK_SINK: c_int = 1;
pub const PA_SUBSCRIPTION_MASK_SOURCE: c_int = 2;
pub const PA_SUBSCRIPTION_MASK_SERVER: c_int = 128;
pub const enum_pa_subscription_mask = c_uint;
pub const pa_subscription_mask_t = enum_pa_subscription_mask;
pub const PA_SUBSCRIPTION_EVENT_SINK: c_int = 0;
pub const PA_SUBSCRIPTION_EVENT_SOURCE: c_int = 1;
pub const PA_SUBSCRIPTION_EVENT_FACILITY_MASK: c_int = 15;
pub const PA_SUBSCRIPTION_EVENT_NEW: c_int = 0;
pub const PA_SUBSCRIPTION_EVENT_CHANGE: c_int = 16;
pub const PA_SUBSCRIPTION_EVENT_REMOVE: c_int = 32;
pub const PA_SUBSCRIPTION_EVENT_TYPE_MASK: c_int = 48;
pub const enum_pa_subscription_event_type = c_uint;
pub const pa_subscription_event_type_t = enum_pa_subscription_event_type;
pub const struct_pa_spawn_api = extern struct {
    prefork: ?*const fn () callconv(.c) void = null,
    postfork: ?*const fn () callconv(.c) void = null,
    atfork: ?*const fn () callconv(.c) void = null,
};
pub const pa_spawn_api = struct_pa_spawn_api;
pub const PA_SEEK_RELATIVE: c_int = 0;
pub const enum_pa_seek_mode = c_uint;
pub const pa_seek_mode_t = enum_pa_seek_mode;
pub const enum_pa_sink_flags = c_uint;
pub const pa_sink_flags_t = enum_pa_sink_flags;
pub const enum_pa_sink_state = c_int;
pub const pa_sink_state_t = enum_pa_sink_state;
pub const enum_pa_source_flags = c_uint;
pub const pa_source_flags_t = enum_pa_source_flags;
pub const enum_pa_source_state = c_int;
pub const pa_source_state_t = enum_pa_source_state;
pub const pa_free_cb_t = ?*const fn (p: ?*anyopaque) callconv(.c) void;
pub const pa_mainloop_api = struct_pa_mainloop_api;
pub const enum_pa_io_event_flags = c_uint;
pub const pa_io_event_flags_t = enum_pa_io_event_flags;
pub const struct_pa_io_event = opaque {};
pub const pa_io_event = struct_pa_io_event;
pub const pa_io_event_cb_t = ?*const fn (ea: [*c]pa_mainloop_api, e: ?*pa_io_event, fd: c_int, events: pa_io_event_flags_t, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_io_event_destroy_cb_t = ?*const fn (a: [*c]pa_mainloop_api, e: ?*pa_io_event, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_time_event = opaque {};
pub const pa_time_event = struct_pa_time_event;
pub const pa_time_event_cb_t = ?*const fn (a: [*c]pa_mainloop_api, e: ?*pa_time_event, tv: [*c]const struct_timeval, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_time_event_destroy_cb_t = ?*const fn (a: [*c]pa_mainloop_api, e: ?*pa_time_event, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_defer_event = opaque {};
pub const pa_defer_event = struct_pa_defer_event;
pub const pa_defer_event_cb_t = ?*const fn (a: [*c]pa_mainloop_api, e: ?*pa_defer_event, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_defer_event_destroy_cb_t = ?*const fn (a: [*c]pa_mainloop_api, e: ?*pa_defer_event, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_mainloop_api = extern struct {
    userdata: ?*anyopaque = null,
    io_new: ?*const fn (a: [*c]pa_mainloop_api, fd: c_int, events: pa_io_event_flags_t, cb: pa_io_event_cb_t, userdata: ?*anyopaque) callconv(.c) ?*pa_io_event = null,
    io_enable: ?*const fn (e: ?*pa_io_event, events: pa_io_event_flags_t) callconv(.c) void = null,
    io_free: ?*const fn (e: ?*pa_io_event) callconv(.c) void = null,
    io_set_destroy: ?*const fn (e: ?*pa_io_event, cb: pa_io_event_destroy_cb_t) callconv(.c) void = null,
    time_new: ?*const fn (a: [*c]pa_mainloop_api, tv: [*c]const struct_timeval, cb: pa_time_event_cb_t, userdata: ?*anyopaque) callconv(.c) ?*pa_time_event = null,
    time_restart: ?*const fn (e: ?*pa_time_event, tv: [*c]const struct_timeval) callconv(.c) void = null,
    time_free: ?*const fn (e: ?*pa_time_event) callconv(.c) void = null,
    time_set_destroy: ?*const fn (e: ?*pa_time_event, cb: pa_time_event_destroy_cb_t) callconv(.c) void = null,
    defer_new: ?*const fn (a: [*c]pa_mainloop_api, cb: pa_defer_event_cb_t, userdata: ?*anyopaque) callconv(.c) ?*pa_defer_event = null,
    defer_enable: ?*const fn (e: ?*pa_defer_event, b: c_int) callconv(.c) void = null,
    defer_free: ?*const fn (e: ?*pa_defer_event) callconv(.c) void = null,
    defer_set_destroy: ?*const fn (e: ?*pa_defer_event, cb: pa_defer_event_destroy_cb_t) callconv(.c) void = null,
    quit: ?*const fn (a: [*c]pa_mainloop_api, retval: c_int) callconv(.c) void = null,
};
pub const struct_pa_proplist = opaque {
};
pub const pa_proplist = struct_pa_proplist;
pub const PA_CHANNEL_POSITION_MONO: c_int = 0;
pub const PA_CHANNEL_POSITION_FRONT_LEFT: c_int = 1;
pub const PA_CHANNEL_POSITION_FRONT_RIGHT: c_int = 2;
pub const PA_CHANNEL_POSITION_FRONT_CENTER: c_int = 3;
pub const PA_CHANNEL_POSITION_REAR_CENTER: c_int = 4;
pub const PA_CHANNEL_POSITION_REAR_LEFT: c_int = 5;
pub const PA_CHANNEL_POSITION_REAR_RIGHT: c_int = 6;
pub const PA_CHANNEL_POSITION_LFE: c_int = 7;
pub const PA_CHANNEL_POSITION_SIDE_LEFT: c_int = 10;
pub const PA_CHANNEL_POSITION_SIDE_RIGHT: c_int = 11;
pub const enum_pa_channel_position = c_int;
pub const pa_channel_position_t = enum_pa_channel_position;
pub const enum_pa_channel_map_def = c_uint;
pub const pa_channel_map_def_t = enum_pa_channel_map_def;
pub const struct_pa_channel_map = extern struct {
    channels: u8 = 0,
    map: [32]pa_channel_position_t = @import("std").mem.zeroes([32]pa_channel_position_t),
};
pub const pa_channel_map = struct_pa_channel_map;
pub const enum_pa_encoding = c_int;
pub const pa_encoding_t = enum_pa_encoding;
pub const struct_pa_format_info = extern struct {
    encoding: pa_encoding_t = @import("std").mem.zeroes(pa_encoding_t),
    plist: ?*pa_proplist = null,
};
pub const pa_format_info = struct_pa_format_info;
pub const struct_pa_operation = opaque {
};
pub const pa_operation = struct_pa_operation;
pub const pa_operation_notify_cb_t = ?*const fn (o: ?*pa_operation, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_context = opaque {
};
pub const pa_context = struct_pa_context;
pub const pa_context_notify_cb_t = ?*const fn (c: ?*pa_context, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_context_success_cb_t = ?*const fn (c: ?*pa_context, success: c_int, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_volume_t = u32;
pub const struct_pa_cvolume = extern struct {
    channels: u8 = 0,
    values: [32]pa_volume_t = @import("std").mem.zeroes([32]pa_volume_t),
};
pub const pa_cvolume = struct_pa_cvolume;
pub const pa_stream_success_cb_t = ?*const fn (s: ?*pa_stream, success: c_int, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_stream_request_cb_t = ?*const fn (p: ?*pa_stream, nbytes: usize, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_stream_notify_cb_t = ?*const fn (p: ?*pa_stream, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_sink_port_info = extern struct {
    name: [*c]const u8 = null,
    description: [*c]const u8 = null,
    priority: u32 = 0,
    available: c_int = 0,
    availability_group: [*c]const u8 = null,
    type: u32 = 0,
};
pub const pa_sink_port_info = struct_pa_sink_port_info;
pub const struct_pa_sink_info = extern struct {
    name: [*c]const u8 = null,
    index: u32 = 0,
    description: [*c]const u8 = null,
    sample_spec: pa_sample_spec = @import("std").mem.zeroes(pa_sample_spec),
    channel_map: pa_channel_map = @import("std").mem.zeroes(pa_channel_map),
    owner_module: u32 = 0,
    volume: pa_cvolume = @import("std").mem.zeroes(pa_cvolume),
    mute: c_int = 0,
    monitor_source: u32 = 0,
    monitor_source_name: [*c]const u8 = null,
    latency: pa_usec_t = 0,
    driver: [*c]const u8 = null,
    flags: pa_sink_flags_t = @import("std").mem.zeroes(pa_sink_flags_t),
    proplist: ?*pa_proplist = null,
    configured_latency: pa_usec_t = 0,
    base_volume: pa_volume_t = 0,
    state: pa_sink_state_t = @import("std").mem.zeroes(pa_sink_state_t),
    n_volume_steps: u32 = 0,
    card: u32 = 0,
    n_ports: u32 = 0,
    ports: [*c][*c]pa_sink_port_info = null,
    active_port: [*c]pa_sink_port_info = null,
    n_formats: u8 = 0,
    formats: [*c][*c]pa_format_info = null,
};
pub const pa_sink_info = struct_pa_sink_info;
pub const pa_sink_info_cb_t = ?*const fn (c: ?*pa_context, i: [*c]const pa_sink_info, eol: c_int, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_source_port_info = extern struct {
    name: [*c]const u8 = null,
    description: [*c]const u8 = null,
    priority: u32 = 0,
    available: c_int = 0,
    availability_group: [*c]const u8 = null,
    type: u32 = 0,
};
pub const pa_source_port_info = struct_pa_source_port_info;
pub const struct_pa_source_info = extern struct {
    name: [*c]const u8 = null,
    index: u32 = 0,
    description: [*c]const u8 = null,
    sample_spec: pa_sample_spec = @import("std").mem.zeroes(pa_sample_spec),
    channel_map: pa_channel_map = @import("std").mem.zeroes(pa_channel_map),
    owner_module: u32 = 0,
    volume: pa_cvolume = @import("std").mem.zeroes(pa_cvolume),
    mute: c_int = 0,
    monitor_of_sink: u32 = 0,
    monitor_of_sink_name: [*c]const u8 = null,
    latency: pa_usec_t = 0,
    driver: [*c]const u8 = null,
    flags: pa_source_flags_t = @import("std").mem.zeroes(pa_source_flags_t),
    proplist: ?*pa_proplist = null,
    configured_latency: pa_usec_t = 0,
    base_volume: pa_volume_t = 0,
    state: pa_source_state_t = @import("std").mem.zeroes(pa_source_state_t),
    n_volume_steps: u32 = 0,
    card: u32 = 0,
    n_ports: u32 = 0,
    ports: [*c][*c]pa_source_port_info = null,
    active_port: [*c]pa_source_port_info = null,
    n_formats: u8 = 0,
    formats: [*c][*c]pa_format_info = null,
};
pub const pa_source_info = struct_pa_source_info;
pub const pa_source_info_cb_t = ?*const fn (c: ?*pa_context, i: [*c]const pa_source_info, eol: c_int, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_server_info = extern struct {
    user_name: [*c]const u8 = null,
    host_name: [*c]const u8 = null,
    server_version: [*c]const u8 = null,
    server_name: [*c]const u8 = null,
    sample_spec: pa_sample_spec = @import("std").mem.zeroes(pa_sample_spec),
    default_sink_name: [*c]const u8 = null,
    default_source_name: [*c]const u8 = null,
    cookie: u32 = 0,
    channel_map: pa_channel_map = @import("std").mem.zeroes(pa_channel_map),
};
pub const pa_server_info = struct_pa_server_info;
pub const pa_server_info_cb_t = ?*const fn (c: ?*pa_context, i: [*c]const pa_server_info, userdata: ?*anyopaque) callconv(.c) void;
pub const pa_context_subscribe_cb_t = ?*const fn (c: ?*pa_context, t: pa_subscription_event_type_t, idx: u32, userdata: ?*anyopaque) callconv(.c) void;
pub const struct_pa_threaded_mainloop = opaque {
};
pub const pa_threaded_mainloop = struct_pa_threaded_mainloop;
pub extern fn SDL_ClosestAudioFormats(format: SDL_AudioFormat) [*c]const SDL_AudioFormat;
pub extern fn SDL_AddAudioDevice(recording: bool, name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_AudioDeviceDisconnected(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_DefaultAudioDeviceChanged(new_default_device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_FindPhysicalAudioDeviceByCallback(callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool, userdata: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_UpdatedAudioDeviceFormat(device: [*c]SDL_AudioDevice) void;
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
pub export var PULSEAUDIO_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "pulseaudio",
    .desc = "PulseAudio",
    .init = PULSEAUDIO_Init,
    .demand_only = @"false" != 0,
    .is_preferred = @"false" != 0,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const PA_CHANNELS_MAX = @as(c_uint, 32);
pub const SYS_ThreadHandle = pthread_t;
pub const struct_SDL_ErrorInfo = extern struct {
    @"error": SDL_ErrorCode = @import("std").mem.zeroes(SDL_ErrorCode),
    str: [*c]u8 = null,
    len: usize = 0,
};
pub const SDL_ErrorInfo = struct_SDL_ErrorInfo;
pub const struct_SDL_error = extern struct {
    info: [2]SDL_ErrorInfo = @import("std").mem.zeroes([2]SDL_ErrorInfo),
    current: c_int = 0,
    realloc_func: SDL_realloc_func = null,
    free_func: SDL_free_func = null,
};
pub const SDL_error = struct_SDL_error;
pub const SDL_ErrorCode = c_uint;
pub const struct_PulseDeviceHandle = extern struct {
    device_path: [*c]u8 = null,
    device_index: u32 = 0,
};
pub const PulseDeviceHandle = struct_PulseDeviceHandle;
pub var include_monitors: bool = @"false" != 0;
pub var pulseaudio_threaded_mainloop: ?*pa_threaded_mainloop = null;
pub var pulseaudio_context: ?*pa_context = null;
pub var pulseaudio_hotplug_thread: [*c]SDL_Thread = null;
pub var pulseaudio_hotplug_thread_active: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var default_sink_path: [*c]u8 = null;
pub var default_source_path: [*c]u8 = null;
pub var default_sink_changed: bool = @"false" != 0;
pub var default_source_changed: bool = @"false" != 0;
pub var PULSEAUDIO_pa_get_library_version: ?*const fn () callconv(.c) [*c]const u8 = null;
pub var PULSEAUDIO_pa_channel_map_init_auto: ?*const fn ([*c]pa_channel_map, c_uint, pa_channel_map_def_t) callconv(.c) [*c]pa_channel_map = null;
pub var PULSEAUDIO_pa_strerror: ?*const fn (c_int) callconv(.c) [*c]const u8 = null;
pub var PULSEAUDIO_pa_proplist_new: ?*const fn () callconv(.c) ?*pa_proplist = null;
pub var PULSEAUDIO_pa_proplist_free: ?*const fn (?*pa_proplist) callconv(.c) void = null;
pub var PULSEAUDIO_pa_proplist_sets: ?*const fn (?*pa_proplist, [*c]const u8, [*c]const u8) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_threaded_mainloop_new: ?*const fn () callconv(.c) ?*pa_threaded_mainloop = null;
pub var PULSEAUDIO_pa_threaded_mainloop_set_name: ?*const fn (?*pa_threaded_mainloop, [*c]const u8) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_get_api: ?*const fn (?*pa_threaded_mainloop) callconv(.c) [*c]pa_mainloop_api = null;
pub var PULSEAUDIO_pa_threaded_mainloop_start: ?*const fn (?*pa_threaded_mainloop) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_threaded_mainloop_stop: ?*const fn (?*pa_threaded_mainloop) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_lock: ?*const fn (?*pa_threaded_mainloop) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_unlock: ?*const fn (?*pa_threaded_mainloop) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_wait: ?*const fn (?*pa_threaded_mainloop) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_signal: ?*const fn (?*pa_threaded_mainloop, c_int) callconv(.c) void = null;
pub var PULSEAUDIO_pa_threaded_mainloop_free: ?*const fn (?*pa_threaded_mainloop) callconv(.c) void = null;
pub var PULSEAUDIO_pa_operation_get_state: ?*const fn (?*const pa_operation) callconv(.c) pa_operation_state_t = null;
pub var PULSEAUDIO_pa_operation_set_state_callback: ?*const fn (?*pa_operation, pa_operation_notify_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_operation_cancel: ?*const fn (?*pa_operation) callconv(.c) void = null;
pub var PULSEAUDIO_pa_operation_unref: ?*const fn (?*pa_operation) callconv(.c) void = null;
pub var PULSEAUDIO_pa_context_new_with_proplist: ?*const fn ([*c]pa_mainloop_api, [*c]const u8, ?*const pa_proplist) callconv(.c) ?*pa_context = null;
pub var PULSEAUDIO_pa_context_set_state_callback: ?*const fn (?*pa_context, pa_context_notify_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_context_connect: ?*const fn (?*pa_context, [*c]const u8, pa_context_flags_t, [*c]const pa_spawn_api) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_context_get_sink_info_list: ?*const fn (?*pa_context, pa_sink_info_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_context_get_source_info_list: ?*const fn (?*pa_context, pa_source_info_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_context_get_sink_info_by_index: ?*const fn (?*pa_context, u32, pa_sink_info_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_context_get_source_info_by_index: ?*const fn (?*pa_context, u32, pa_source_info_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_context_get_state: ?*const fn (?*const pa_context) callconv(.c) pa_context_state_t = null;
pub var PULSEAUDIO_pa_context_subscribe: ?*const fn (?*pa_context, pa_subscription_mask_t, pa_context_success_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_context_set_subscribe_callback: ?*const fn (?*pa_context, pa_context_subscribe_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_context_disconnect: ?*const fn (?*pa_context) callconv(.c) void = null;
pub var PULSEAUDIO_pa_context_unref: ?*const fn (?*pa_context) callconv(.c) void = null;
pub var PULSEAUDIO_pa_stream_new: ?*const fn (?*pa_context, [*c]const u8, [*c]const pa_sample_spec, [*c]const pa_channel_map) callconv(.c) ?*pa_stream = null;
pub var PULSEAUDIO_pa_stream_set_state_callback: ?*const fn (?*pa_stream, pa_stream_notify_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_stream_connect_playback: ?*const fn (?*pa_stream, [*c]const u8, [*c]const pa_buffer_attr, pa_stream_flags_t, [*c]const pa_cvolume, ?*pa_stream) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_connect_record: ?*const fn (?*pa_stream, [*c]const u8, [*c]const pa_buffer_attr, pa_stream_flags_t) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_get_buffer_attr: ?*const fn (?*pa_stream) callconv(.c) [*c]const pa_buffer_attr = null;
pub var PULSEAUDIO_pa_stream_get_state: ?*const fn (?*const pa_stream) callconv(.c) pa_stream_state_t = null;
pub var PULSEAUDIO_pa_stream_writable_size: ?*const fn (?*const pa_stream) callconv(.c) usize = null;
pub var PULSEAUDIO_pa_stream_readable_size: ?*const fn (?*const pa_stream) callconv(.c) usize = null;
pub var PULSEAUDIO_pa_stream_write: ?*const fn (?*pa_stream, ?*const anyopaque, usize, pa_free_cb_t, i64, pa_seek_mode_t) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_begin_write: ?*const fn (?*pa_stream, [*c]?*anyopaque, [*c]usize) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_drain: ?*const fn (?*pa_stream, pa_stream_success_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_stream_peek: ?*const fn (?*pa_stream, [*c]?*const anyopaque, [*c]usize) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_drop: ?*const fn (?*pa_stream) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_flush: ?*const fn (?*pa_stream, pa_stream_success_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var PULSEAUDIO_pa_stream_disconnect: ?*const fn (?*pa_stream) callconv(.c) c_int = null;
pub var PULSEAUDIO_pa_stream_unref: ?*const fn (?*pa_stream) callconv(.c) void = null;
pub var PULSEAUDIO_pa_stream_set_write_callback: ?*const fn (?*pa_stream, pa_stream_request_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_stream_set_read_callback: ?*const fn (?*pa_stream, pa_stream_request_cb_t, ?*anyopaque) callconv(.c) void = null;
pub var PULSEAUDIO_pa_context_get_server_info: ?*const fn (?*pa_context, pa_server_info_cb_t, ?*anyopaque) callconv(.c) ?*pa_operation = null;
pub var pulseaudio_library: [*c]const u8 = "libpulse.so.0";
pub var pulseaudio_handle: ?*SDL_SharedObject = null;
pub fn load_pulseaudio_sym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(pulseaudio_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn UnloadPulseAudioLibrary() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pulseaudio_handle != null) {
        SDL_UnloadObject_REAL(pulseaudio_handle);
        pulseaudio_handle = null;
    }
}
pub fn LoadPulseAudioLibrary() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(pulseaudio_handle != null)) {
        pulseaudio_handle = SDL_LoadObject_REAL(pulseaudio_library);
        if (!(pulseaudio_handle != null)) {
            result = @"false" != 0;
        } else {
            result = load_pulseaudio_syms();
            if (!result) {
                UnloadPulseAudioLibrary();
            }
        }
    }
    return result;
}
pub fn load_pulseaudio_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!load_pulseaudio_sym("pa_get_library_version", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_get_library_version))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_new))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_get_api", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_get_api))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_start", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_start))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_stop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_stop))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_lock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_lock))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_unlock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_unlock))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_wait", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_wait))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_signal", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_signal))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_threaded_mainloop_free", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_free))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_operation_get_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_operation_get_state))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_operation_cancel", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_operation_cancel))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_operation_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_operation_unref))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_new_with_proplist", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_new_with_proplist))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_set_state_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_set_state_callback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_connect))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_sink_info_list", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_sink_info_list))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_source_info_list", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_source_info_list))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_sink_info_by_index", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_sink_info_by_index))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_source_info_by_index", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_source_info_by_index))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_state))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_subscribe", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_subscribe))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_set_subscribe_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_set_subscribe_callback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_disconnect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_disconnect))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_unref))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_new))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_set_state_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_set_state_callback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_connect_playback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_connect_playback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_connect_record", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_connect_record))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_get_buffer_attr", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_get_buffer_attr))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_get_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_get_state))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_writable_size", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_writable_size))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_readable_size", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_readable_size))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_begin_write", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_begin_write))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_write", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_write))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_drain", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_drain))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_disconnect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_disconnect))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_peek", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_peek))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_drop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_drop))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_flush", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_flush))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_unref", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_unref))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_channel_map_init_auto", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_channel_map_init_auto))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_strerror", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_strerror))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_set_write_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_set_write_callback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_stream_set_read_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_stream_set_read_callback))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_context_get_server_info", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_context_get_server_info))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_proplist_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_proplist_new))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_proplist_free", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_proplist_free))))))) return @"false" != 0;
    if (!load_pulseaudio_sym("pa_proplist_sets", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_proplist_sets))))))) return @"false" != 0;
    _ = load_pulseaudio_sym("pa_operation_set_state_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_operation_set_state_callback))))));
    _ = load_pulseaudio_sym("pa_threaded_mainloop_set_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PULSEAUDIO_pa_threaded_mainloop_set_name))))));
    return @"true" != 0;
}
pub fn getAppName() callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
}
pub fn OperationStateChangeCallback(_: ?*pa_operation, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn WaitForPulseOperation(o: ?*pa_operation) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "WaitForPulseOperation".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pulseaudio_threaded_mainloop))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pulseaudio_threaded_mainloop != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 289);
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
    if (o != null) {
        if (PULSEAUDIO_pa_operation_set_state_callback != null) {
            PULSEAUDIO_pa_operation_set_state_callback.?(o, OperationStateChangeCallback, null);
        }
        while (PULSEAUDIO_pa_operation_get_state.?(o) == @as(pa_operation_state_t, PA_OPERATION_RUNNING)) {
            PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
        }
        PULSEAUDIO_pa_operation_unref.?(o);
    }
}
pub fn DisconnectFromPulseServer() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pulseaudio_threaded_mainloop != null) {
        PULSEAUDIO_pa_threaded_mainloop_stop.?(pulseaudio_threaded_mainloop);
    }
    if (pulseaudio_context != null) {
        PULSEAUDIO_pa_context_disconnect.?(pulseaudio_context);
        PULSEAUDIO_pa_context_unref.?(pulseaudio_context);
        pulseaudio_context = null;
    }
    if (pulseaudio_threaded_mainloop != null) {
        PULSEAUDIO_pa_threaded_mainloop_free.?(pulseaudio_threaded_mainloop);
        pulseaudio_threaded_mainloop = null;
    }
}
pub fn PulseContextStateChangeCallback(_: ?*pa_context, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn ConnectToPulseServer() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "ConnectToPulseServer".*;
    };
    _ = &static_local___func__;
    var mainloop_api: [*c]pa_mainloop_api = undefined;
    _ = &mainloop_api;
    var proplist: ?*pa_proplist = undefined;
    _ = &proplist;
    var icon_name: [*c]const u8 = undefined;
    _ = &icon_name;
    var state: c_int = undefined;
    _ = &state;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "pulseaudio_threaded_mainloop == ((void*)0)",
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
            .condition = "pulseaudio_context == ((void*)0)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    const static_local_sdl_assert_data_3 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "mainloop_api != ((void*)0)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_3;
    var sdl_assert_state_4: SDL_AssertState = undefined;
    _ = &sdl_assert_state_4;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                mainloop_api = null;
                proplist = null;
                state = 0;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
                DisconnectFromPulseServer();
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            5 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(pulseaudio_threaded_mainloop))) == @as(?*anyopaque, null))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 333);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                pulseaudio_threaded_mainloop = PULSEAUDIO_pa_threaded_mainloop_new.?();
                if (!(pulseaudio_threaded_mainloop != null)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            17 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(pulseaudio_context))) == @as(?*anyopaque, null))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 334);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 25;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                return SDL_SetError_REAL("pa_threaded_mainloop_new() failed");
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (PULSEAUDIO_pa_threaded_mainloop_set_name != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                PULSEAUDIO_pa_threaded_mainloop_set_name.?(pulseaudio_threaded_mainloop, "PulseMainloop");
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (PULSEAUDIO_pa_threaded_mainloop_start.?(pulseaudio_threaded_mainloop) < @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                PULSEAUDIO_pa_threaded_mainloop_free.?(pulseaudio_threaded_mainloop);
                pulseaudio_threaded_mainloop = null;
                return SDL_SetError_REAL("pa_threaded_mainloop_start() failed");
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
                mainloop_api = PULSEAUDIO_pa_threaded_mainloop_get_api.?(pulseaudio_threaded_mainloop);
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                proplist = PULSEAUDIO_pa_proplist_new.?();
                if (!(proplist != null)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            38 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(mainloop_api))) != @as(?*anyopaque, null))) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                sdl_assert_state_4 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_3.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 355);
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 46;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                _ = SDL_SetError_REAL("pa_proplist_new() failed");
                {
                    sdl_pc = 1;
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
                icon_name = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_APP_ICON_NAME");
                if (!(icon_name != null) or (@as(c_int, icon_name.*) == @as(c_int, '\x00'))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                icon_name = "applications-games";
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                _ = PULSEAUDIO_pa_proplist_sets.?(proplist, "application.icon_name", icon_name);
                pulseaudio_context = PULSEAUDIO_pa_context_new_with_proplist.?(mainloop_api, getAppName(), proplist);
                if (!(pulseaudio_context != null)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                _ = SDL_SetError_REAL("pa_context_new_with_proplist() failed");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                PULSEAUDIO_pa_proplist_free.?(proplist);
                PULSEAUDIO_pa_context_set_state_callback.?(pulseaudio_context, PulseContextStateChangeCallback, null);
                if (PULSEAUDIO_pa_context_connect.?(pulseaudio_context, null, 0, null) < @as(c_int, 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                _ = SDL_SetError_REAL("Could not setup connection to PulseAudio");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                state = @bitCast(PULSEAUDIO_pa_context_get_state.?(pulseaudio_context));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                if ((PA_CONTEXT_IS_GOOD(@bitCast(state)) != 0) and (state != PA_CONTEXT_READY)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
                state = @bitCast(PULSEAUDIO_pa_context_get_state.?(pulseaudio_context));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            61 => {
                if (state != PA_CONTEXT_READY) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                _ = SDL_SetError_REAL("Could not connect to PulseAudio");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn WriteCallback(_: ?*pa_stream, nbytes: usize, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var h: [*c]struct_SDL_PrivateAudioData = @ptrCast(@alignCast(userdata));
    _ = &h;
    {
        const ref = &h.*.bytes_requested;
        ref.* = @bitCast(@as(c_uint, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) +% nbytes)));
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn PULSEAUDIO_WaitDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    var result: bool = @"true" != 0;
    _ = &result;
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    while (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) and (h.*.bytes_requested == @as(c_int, 0))) {
        PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
        if ((PULSEAUDIO_pa_context_get_state.?(pulseaudio_context) != @as(pa_context_state_t, PA_CONTEXT_READY)) or (PULSEAUDIO_pa_stream_get_state.?(h.*.stream) != @as(pa_stream_state_t, PA_STREAM_READY))) {
            result = @"false" != 0;
            break;
        }
    }
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    return result;
}
pub fn PULSEAUDIO_PlayDevice(device: [*c]SDL_AudioDevice, buffer: [*c]const Uint8, buffer_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "PULSEAUDIO_PlayDevice".*;
    };
    _ = &static_local___func__;
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    while (true) {
        while (!(h.*.bytes_requested >= buffer_size)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "h->bytes_requested >= buffer_size",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 445);
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
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    const rc: c_int = PULSEAUDIO_pa_stream_write.?(h.*.stream, @ptrCast(@alignCast(buffer)), @bitCast(@as(c_long, buffer_size)), null, 0, PA_SEEK_RELATIVE);
    _ = &rc;
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    if (rc < @as(c_int, 0)) {
        return @"false" != 0;
    }
    h.*.bytes_requested -= buffer_size;
    return @"true" != 0;
}
pub fn PULSEAUDIO_GetDeviceBuf(device: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    const reqsize: usize = @bitCast(@as(c_long, if (buffer_size.* < h.*.bytes_requested) buffer_size.* else h.*.bytes_requested));
    _ = &reqsize;
    var nbytes: usize = reqsize;
    _ = &nbytes;
    var data: ?*anyopaque = null;
    _ = &data;
    if (PULSEAUDIO_pa_stream_begin_write.?(h.*.stream, &data, &nbytes) == @as(c_int, 0)) {
        buffer_size.* = @bitCast(@as(c_uint, @truncate(nbytes)));
        return @ptrCast(@alignCast(data));
    }
    buffer_size.* = @bitCast(@as(c_uint, @truncate(reqsize)));
    return device.*.hidden.*.mixbuf;
}
pub fn ReadCallback(_: ?*pa_stream, _: usize, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn PULSEAUDIO_WaitRecordingDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "PULSEAUDIO_WaitRecordingDevice".*;
    };
    _ = &static_local___func__;
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    if (h.*.recordingbuf != null) {
        return @"true" != 0;
    }
    var result: bool = @"true" != 0;
    _ = &result;
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    while (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0)) {
        PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
        if ((PULSEAUDIO_pa_context_get_state.?(pulseaudio_context) != @as(pa_context_state_t, PA_CONTEXT_READY)) or (PULSEAUDIO_pa_stream_get_state.?(h.*.stream) != @as(pa_stream_state_t, PA_STREAM_READY))) {
            result = @"false" != 0;
            break;
        } else if (PULSEAUDIO_pa_stream_readable_size.?(h.*.stream) > @as(usize, 0)) {
            var data: ?*const anyopaque = null;
            _ = &data;
            var nbytes: usize = 0;
            _ = &nbytes;
            _ = PULSEAUDIO_pa_stream_peek.?(h.*.stream, &data, &nbytes);
            while (true) {
                while (!(nbytes > @as(usize, 0))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "nbytes > 0",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 507);
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
            if (!(data != null)) {
                _ = PULSEAUDIO_pa_stream_drop.?(h.*.stream);
            } else {
                h.*.recordingbuf = @ptrCast(@alignCast(data));
                h.*.recordinglen = @bitCast(@as(c_uint, @truncate(nbytes)));
                break;
            }
        }
    }
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    return result;
}
pub fn PULSEAUDIO_RecordDevice(device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    if (h.*.recordingbuf != null) {
        const cpy: c_int = if (buflen < h.*.recordinglen) buflen else h.*.recordinglen;
        _ = &cpy;
        if (cpy > @as(c_int, 0)) {
            _ = memcpy(buffer, @ptrCast(@alignCast(h.*.recordingbuf)), @bitCast(@as(c_long, cpy)));
            h.*.recordingbuf += @as(usize, @bitCast(@as(isize, @intCast(cpy))));
            h.*.recordinglen -= cpy;
        }
        if (h.*.recordinglen == @as(c_int, 0)) {
            h.*.recordingbuf = null;
            PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
            _ = PULSEAUDIO_pa_stream_drop.?(h.*.stream);
            PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
        }
        return cpy;
    }
    return 0;
}
pub fn PULSEAUDIO_FlushRecording(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    var data: ?*const anyopaque = null;
    _ = &data;
    var nbytes: usize = 0;
    _ = &nbytes;
    var buflen: usize = 0;
    _ = &buflen;
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    if (h.*.recordingbuf != null) {
        _ = PULSEAUDIO_pa_stream_drop.?(h.*.stream);
        h.*.recordingbuf = null;
        h.*.recordinglen = 0;
    }
    buflen = PULSEAUDIO_pa_stream_readable_size.?(h.*.stream);
    while (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) and (buflen > @as(usize, 0))) {
        PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
        if ((PULSEAUDIO_pa_context_get_state.?(pulseaudio_context) != @as(pa_context_state_t, PA_CONTEXT_READY)) or (PULSEAUDIO_pa_stream_get_state.?(h.*.stream) != @as(pa_stream_state_t, PA_STREAM_READY))) {
            SDL_AudioDeviceDisconnected(device);
            break;
        }
        _ = PULSEAUDIO_pa_stream_peek.?(h.*.stream, &data, &nbytes);
        _ = PULSEAUDIO_pa_stream_drop.?(h.*.stream);
        buflen -%= nbytes;
    }
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
}
pub fn PULSEAUDIO_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    if (device.*.hidden.*.stream != null) {
        if (device.*.hidden.*.recordingbuf != null) {
            _ = PULSEAUDIO_pa_stream_drop.?(device.*.hidden.*.stream);
        }
        _ = PULSEAUDIO_pa_stream_disconnect.?(device.*.hidden.*.stream);
        PULSEAUDIO_pa_stream_unref.?(device.*.hidden.*.stream);
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.mixbuf)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
}
pub fn PulseStreamStateChangeCallback(_: ?*pa_stream, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub const Pulse_map_1: [1]pa_channel_position_t = [1]pa_channel_position_t{
    PA_CHANNEL_POSITION_MONO,
};
pub const Pulse_map_2: [2]pa_channel_position_t = [2]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
};
pub const Pulse_map_3: [3]pa_channel_position_t = [3]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_LFE,
};
pub const Pulse_map_4: [4]pa_channel_position_t = [4]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_REAR_LEFT,
    PA_CHANNEL_POSITION_REAR_RIGHT,
};
pub const Pulse_map_5: [5]pa_channel_position_t = [5]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_LFE,
    PA_CHANNEL_POSITION_REAR_LEFT,
    PA_CHANNEL_POSITION_REAR_RIGHT,
};
pub const Pulse_map_6: [6]pa_channel_position_t = [6]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_FRONT_CENTER,
    PA_CHANNEL_POSITION_LFE,
    PA_CHANNEL_POSITION_REAR_LEFT,
    PA_CHANNEL_POSITION_REAR_RIGHT,
};
pub const Pulse_map_7: [7]pa_channel_position_t = [7]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_FRONT_CENTER,
    PA_CHANNEL_POSITION_LFE,
    PA_CHANNEL_POSITION_REAR_CENTER,
    PA_CHANNEL_POSITION_SIDE_LEFT,
    PA_CHANNEL_POSITION_SIDE_RIGHT,
};
pub const Pulse_map_8: [8]pa_channel_position_t = [8]pa_channel_position_t{
    PA_CHANNEL_POSITION_FRONT_LEFT,
    PA_CHANNEL_POSITION_FRONT_RIGHT,
    PA_CHANNEL_POSITION_FRONT_CENTER,
    PA_CHANNEL_POSITION_LFE,
    PA_CHANNEL_POSITION_REAR_LEFT,
    PA_CHANNEL_POSITION_REAR_RIGHT,
    PA_CHANNEL_POSITION_SIDE_LEFT,
    PA_CHANNEL_POSITION_SIDE_RIGHT,
};
pub fn PulseCreateChannelMap(pacmap: [*c]pa_channel_map, channels: u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "PulseCreateChannelMap".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "channels <= 32U",
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                pacmap.*.channels = channels;
                switch (@as(c_int, channels)) {
                    @as(c_int, 1) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            4 => {
                if (!(@as(c_uint, @bitCast(@as(c_int, @as(c_int, channels)))) <= PA_CHANNELS_MAX)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 637);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                {}
            },
            14 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_1))))), @sizeOf(@TypeOf(Pulse_map_1)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_2))))), @sizeOf(@TypeOf(Pulse_map_2)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_3))))), @sizeOf(@TypeOf(Pulse_map_3)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_4))))), @sizeOf(@TypeOf(Pulse_map_4)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_5))))), @sizeOf(@TypeOf(Pulse_map_5)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_6))))), @sizeOf(@TypeOf(Pulse_map_6)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            20 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_7))))), @sizeOf(@TypeOf(Pulse_map_7)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            21 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]pa_channel_position_t, @ptrCast(@alignCast(&pacmap.*.map))))), @ptrCast(@alignCast(@as([*c]const pa_channel_position_t, @ptrCast(@alignCast(&Pulse_map_8))))), @sizeOf(@TypeOf(Pulse_map_8)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn PULSEAUDIO_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "PULSEAUDIO_OpenDevice".*;
    };
    _ = &static_local___func__;
    var recording: bool = undefined;
    _ = &recording;
    var h: [*c]struct_SDL_PrivateAudioData = undefined;
    _ = &h;
    var test_format: SDL_AudioFormat = undefined;
    _ = &test_format;
    var closefmts: [*c]const SDL_AudioFormat = undefined;
    _ = &closefmts;
    var paspec: pa_sample_spec = undefined;
    _ = &paspec;
    var paattr: pa_buffer_attr = undefined;
    _ = &paattr;
    var pacmap: pa_channel_map = undefined;
    _ = &pacmap;
    var flags: pa_stream_flags_t = undefined;
    _ = &flags;
    var format: c_int = undefined;
    _ = &format;
    var result: bool = undefined;
    _ = &result;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "pulseaudio_threaded_mainloop != ((void*)0)",
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
            .condition = "pulseaudio_context != ((void*)0)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var name: [*c]const u8 = undefined;
    _ = &name;
    var rc: c_int = undefined;
    _ = &rc;
    var device_path: [*c]const u8 = undefined;
    _ = &device_path;
    var state: c_int = undefined;
    _ = &state;
    var actual_bufattr: [*c]const pa_buffer_attr = undefined;
    _ = &actual_bufattr;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                recording = device.*.recording;
                h = null;
                flags = 0;
                format = PA_SAMPLE_INVALID;
                result = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            4 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(pulseaudio_threaded_mainloop))) != @as(?*anyopaque, null))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 683);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                h = blk: {
                    const tmp = @as([*c]struct_SDL_PrivateAudioData, @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(device.*.hidden.*))))));
                    device.*.hidden = tmp;
                    break :blk tmp;
                };
                if (!(device.*.hidden != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            16 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(pulseaudio_context))) != @as(?*anyopaque, null))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pulseaudio.c", 684);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 14;
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
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                return @"false" != 0;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                closefmts = SDL_ClosestAudioFormats(device.*.spec.format);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if ((blk: {
                    const tmp = (blk_1: {
                        const ref = &closefmts;
                        const tmp_2 = ref.*;
                        ref.* += 1;
                        break :blk_1 tmp_2;
                    }).*;
                    test_format = tmp;
                    break :blk tmp;
                }) != @as(SDL_AudioFormat, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                switch (test_format) {
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16LE) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16BE) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32LE) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32BE) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32LE) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32BE) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            30 => {
                if (!(test_format != 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            32 => {
                format = PA_SAMPLE_U8;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            33 => {
                format = PA_SAMPLE_S16LE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                format = PA_SAMPLE_S16BE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                format = PA_SAMPLE_S32LE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                format = PA_SAMPLE_S32BE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            37 => {
                format = PA_SAMPLE_FLOAT32LE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                format = PA_SAMPLE_FLOAT32BE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            40 => {
                return SDL_SetError_REAL("pulseaudio: Unsupported audio format");
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                device.*.spec.format = test_format;
                paspec.format = format;
                SDL_UpdatedAudioDeviceFormat(device);
                if (!recording) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                h.*.mixbuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, device.*.buffer_size)))));
                if (!(h.*.mixbuf != null)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                paspec.channels = @bitCast(@as(i8, @truncate(device.*.spec.channels)));
                paspec.rate = @bitCast(@as(c_int, device.*.spec.freq));
                paattr.fragsize = @bitCast(@as(c_int, device.*.buffer_size * @as(c_int, 2)));
                paattr.tlength = @bitCast(@as(c_int, device.*.buffer_size));
                paattr.prebuf = @bitCast(@as(c_int, -@as(c_int, 1)));
                paattr.maxlength = @bitCast(@as(c_int, -@as(c_int, 1)));
                paattr.minreq = @bitCast(@as(c_int, -@as(c_int, 1)));
                flags |= PA_STREAM_ADJUST_LATENCY;
                PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
                name = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_STREAM_NAME");
                PulseCreateChannelMap(&pacmap, @bitCast(@as(i8, @truncate(device.*.spec.channels))));
                h.*.stream = PULSEAUDIO_pa_stream_new.?(pulseaudio_context, if ((name != null) and (@as(c_int, name.*) != 0)) name else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("Audio Stream")))))), &paspec, &pacmap);
                if (!(h.*.stream != null)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            46 => {
                return @"false" != 0;
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                _ = memset(@ptrCast(@alignCast(h.*.mixbuf)), device.*.silence_value, @bitCast(@as(c_long, device.*.buffer_size)));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                result = SDL_SetError_REAL("Could not set up PulseAudio stream");
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                PULSEAUDIO_pa_stream_set_state_callback.?(h.*.stream, PulseStreamStateChangeCallback, null);
                device_path = @as([*c]PulseDeviceHandle, @ptrCast(@alignCast(device.*.handle))).*.device_path;
                if (recording) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
                return result;
            },
            52 => {
                PULSEAUDIO_pa_stream_set_read_callback.?(h.*.stream, ReadCallback, @ptrCast(@alignCast(h)));
                rc = PULSEAUDIO_pa_stream_connect_record.?(h.*.stream, device_path, &paattr, flags);
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                PULSEAUDIO_pa_stream_set_write_callback.?(h.*.stream, WriteCallback, @ptrCast(@alignCast(h)));
                rc = PULSEAUDIO_pa_stream_connect_playback.?(h.*.stream, device_path, &paattr, flags, null, null);
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (rc < @as(c_int, 0)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                result = SDL_SetError_REAL("Could not connect PulseAudio stream");
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                state = @bitCast(PULSEAUDIO_pa_stream_get_state.?(h.*.stream));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            58 => {
                if ((PA_STREAM_IS_GOOD(@bitCast(state)) != 0) and (state != PA_STREAM_READY)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
                state = @bitCast(PULSEAUDIO_pa_stream_get_state.?(h.*.stream));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            60 => {
                if (!(PA_STREAM_IS_GOOD(@bitCast(state)) != 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                result = SDL_SetError_REAL("Could not connect PulseAudio stream");
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                actual_bufattr = PULSEAUDIO_pa_stream_get_buffer_attr.?(h.*.stream);
                if (!(actual_bufattr != null)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            64 => {
                result = SDL_SetError_REAL("Could not determine connected PulseAudio stream's buffer attributes");
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                device.*.buffer_size = @bitCast(@as(c_uint, @truncate(if (recording) actual_bufattr.*.fragsize else actual_bufattr.*.tlength)));
                device.*.sample_frames = @divTrunc(device.*.buffer_size, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)))));
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn PulseFormatToSDLFormat(format: pa_sample_format_t) callconv(.c) SDL_AudioFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    PA_SAMPLE_U8 => {
                        sdl_pc = 2;
                        continue;
                    },
                    PA_SAMPLE_S16LE => {
                        sdl_pc = 3;
                        continue;
                    },
                    PA_SAMPLE_S16BE => {
                        sdl_pc = 4;
                        continue;
                    },
                    PA_SAMPLE_S32LE => {
                        sdl_pc = 5;
                        continue;
                    },
                    PA_SAMPLE_S32BE => {
                        sdl_pc = 6;
                        continue;
                    },
                    PA_SAMPLE_FLOAT32LE => {
                        sdl_pc = 7;
                        continue;
                    },
                    PA_SAMPLE_FLOAT32BE => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SDL_AUDIO_U8;
            },
            3 => {
                return SDL_AUDIO_S16LE;
            },
            4 => {
                return SDL_AUDIO_S16BE;
            },
            5 => {
                return SDL_AUDIO_S32LE;
            },
            6 => {
                return SDL_AUDIO_S32BE;
            },
            7 => {
                return SDL_AUDIO_F32LE;
            },
            8 => {
                return SDL_AUDIO_F32BE;
            },
            9 => {
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn AddPulseAudioDevice(recording: bool, description: [*c]const u8, name: [*c]const u8, index_1: u32, sample_spec: [*c]const pa_sample_spec) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &recording;
    _ = &index_1;
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    _ = memset(@ptrCast(@alignCast(&spec)), 0, @sizeOf(@TypeOf(spec)));
    spec.format = PulseFormatToSDLFormat(sample_spec.*.format);
    spec.channels = sample_spec.*.channels;
    spec.freq = @bitCast(@as(c_uint, @truncate(sample_spec.*.rate)));
    var handle: [*c]PulseDeviceHandle = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(PulseDeviceHandle))));
    _ = &handle;
    if (handle != null) {
        handle.*.device_path = SDL_strdup_REAL(name);
        if (!(handle.*.device_path != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(handle)));
        } else {
            handle.*.device_index = index_1;
            _ = SDL_AddAudioDevice(recording, description, null, &spec, @ptrCast(@alignCast(handle)));
        }
    }
}
pub fn SinkInfoCallback(_: ?*pa_context, i: [*c]const pa_sink_info, _: c_int, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (i != null) {
        AddPulseAudioDevice(@"false" != 0, i.*.description, i.*.name, i.*.index, &i.*.sample_spec);
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn SourceInfoCallback(_: ?*pa_context, i: [*c]const pa_source_info, _: c_int, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((i != null) and (include_monitors or (i.*.monitor_of_sink == @as(u32, @bitCast(@as(c_int, -@as(c_int, 1))))))) {
        AddPulseAudioDevice(@"true" != 0, i.*.description, i.*.name, i.*.index, &i.*.sample_spec);
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn ServerInfoCallback(_: ?*pa_context, i: [*c]const pa_server_info, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(default_sink_path != null) or (SDL_strcmp_REAL(default_sink_path, i.*.default_sink_name) != @as(c_int, 0))) {
        var str: [*c]u8 = SDL_strdup_REAL(i.*.default_sink_name);
        _ = &str;
        if (str != null) {
            SDL_free_REAL(@ptrCast(@alignCast(default_sink_path)));
            default_sink_path = str;
            default_sink_changed = @"true" != 0;
        }
    }
    if (!(default_source_path != null) or (SDL_strcmp_REAL(default_source_path, i.*.default_source_name) != @as(c_int, 0))) {
        var str: [*c]u8 = SDL_strdup_REAL(i.*.default_source_name);
        _ = &str;
        if (str != null) {
            SDL_free_REAL(@ptrCast(@alignCast(default_source_path)));
            default_source_path = str;
            default_source_changed = @"true" != 0;
        }
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn FindAudioDeviceByIndex(userdata: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const idx: u32 = @truncate(@as(usize, @intCast(@intFromPtr(userdata))));
    _ = &idx;
    var handle: [*c]const PulseDeviceHandle = @ptrCast(@alignCast(device.*.handle));
    _ = &handle;
    return handle.*.device_index == idx;
}
pub fn FindAudioDeviceByPath(userdata: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var path: [*c]const u8 = @ptrCast(@alignCast(userdata));
    _ = &path;
    var handle: [*c]const PulseDeviceHandle = @ptrCast(@alignCast(device.*.handle));
    _ = &handle;
    return SDL_strcmp_REAL(handle.*.device_path, path) == @as(c_int, 0);
}
pub fn HotplugCallback(_: ?*pa_context, t: pa_subscription_event_type_t, idx: u32, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const added: bool = (t & @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_TYPE_MASK)) == @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_NEW);
    _ = &added;
    const removed: bool = (t & @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_TYPE_MASK)) == @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_REMOVE);
    _ = &removed;
    const changed: bool = (t & @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_TYPE_MASK)) == @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_CHANGE);
    _ = &changed;
    if ((added or removed) or changed) {
        const sink: bool = (t & @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_FACILITY_MASK)) == @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_SINK);
        _ = &sink;
        const source: bool = (t & @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_FACILITY_MASK)) == @as(pa_subscription_event_type_t, PA_SUBSCRIPTION_EVENT_SOURCE);
        _ = &source;
        if (changed) {
            PULSEAUDIO_pa_operation_unref.?(PULSEAUDIO_pa_context_get_server_info.?(pulseaudio_context, ServerInfoCallback, null));
        }
        if (added and sink) {
            PULSEAUDIO_pa_operation_unref.?(PULSEAUDIO_pa_context_get_sink_info_by_index.?(pulseaudio_context, idx, SinkInfoCallback, null));
        } else if (added and source) {
            PULSEAUDIO_pa_operation_unref.?(PULSEAUDIO_pa_context_get_source_info_by_index.?(pulseaudio_context, idx, SourceInfoCallback, null));
        } else if (removed and (sink or source)) {
            SDL_AudioDeviceDisconnected(SDL_FindPhysicalAudioDeviceByCallback(FindAudioDeviceByIndex, @ptrFromInt(@as(usize, idx))));
        }
    }
    PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
}
pub fn CheckDefaultDevice(changed: bool, device_path: [*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &changed;
    if (!changed) {
        return @"false" != 0;
    } else if (!(device_path != null)) {
        return @"true" != 0;
    }
    var device: [*c]SDL_AudioDevice = SDL_FindPhysicalAudioDeviceByCallback(FindAudioDeviceByPath, @ptrCast(@alignCast(device_path)));
    _ = &device;
    if (device != null) {
        SDL_DefaultAudioDeviceChanged(device);
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn HotplugThread(data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var op: ?*pa_operation = undefined;
    _ = &op;
    _ = SDL_SetCurrentThreadPriority_REAL(SDL_THREAD_PRIORITY_LOW);
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    PULSEAUDIO_pa_context_set_subscribe_callback.?(pulseaudio_context, HotplugCallback, null);
    op = PULSEAUDIO_pa_context_subscribe.?(pulseaudio_context, @bitCast((PA_SUBSCRIPTION_MASK_SINK | PA_SUBSCRIPTION_MASK_SOURCE) | PA_SUBSCRIPTION_MASK_SERVER), null, null);
    SDL_SignalSemaphore_REAL(@ptrCast(@alignCast(data)));
    while (SDL_GetAtomicInt_REAL(&pulseaudio_hotplug_thread_active) != 0) {
        PULSEAUDIO_pa_threaded_mainloop_wait.?(pulseaudio_threaded_mainloop);
        if ((op != null) and (PULSEAUDIO_pa_operation_get_state.?(op) != @as(pa_operation_state_t, PA_OPERATION_RUNNING))) {
            PULSEAUDIO_pa_operation_unref.?(op);
            op = null;
        }
        var check_default_sink: bool = default_sink_changed;
        _ = &check_default_sink;
        var check_default_source: bool = default_source_changed;
        _ = &check_default_source;
        var current_default_sink: [*c]u8 = @ptrCast(@alignCast(if (check_default_sink) @as(?*anyopaque, @ptrCast(@alignCast(SDL_strdup_REAL(default_sink_path)))) else @as(?*anyopaque, null)));
        _ = &current_default_sink;
        var current_default_source: [*c]u8 = @ptrCast(@alignCast(if (check_default_source) @as(?*anyopaque, @ptrCast(@alignCast(SDL_strdup_REAL(default_source_path)))) else @as(?*anyopaque, null)));
        _ = &current_default_source;
        default_sink_changed = blk: {
            const tmp = @"false" != 0;
            default_source_changed = tmp;
            break :blk tmp;
        };
        PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
        check_default_sink = CheckDefaultDevice(check_default_sink, current_default_sink);
        check_default_source = CheckDefaultDevice(check_default_source, current_default_source);
        PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
        SDL_free_REAL(@ptrCast(@alignCast(current_default_sink)));
        SDL_free_REAL(@ptrCast(@alignCast(current_default_source)));
        default_sink_changed = default_sink_changed or check_default_sink;
        default_source_changed = default_source_changed or check_default_source;
    }
    if (op != null) {
        PULSEAUDIO_pa_operation_unref.?(op);
    }
    PULSEAUDIO_pa_context_set_subscribe_callback.?(pulseaudio_context, null, null);
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    return 0;
}
pub fn PULSEAUDIO_DetectDevices(default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ready_sem: ?*SDL_Semaphore = SDL_CreateSemaphore_REAL(0);
    _ = &ready_sem;
    PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
    WaitForPulseOperation(PULSEAUDIO_pa_context_get_server_info.?(pulseaudio_context, ServerInfoCallback, null));
    WaitForPulseOperation(PULSEAUDIO_pa_context_get_sink_info_list.?(pulseaudio_context, SinkInfoCallback, null));
    WaitForPulseOperation(PULSEAUDIO_pa_context_get_source_info_list.?(pulseaudio_context, SourceInfoCallback, null));
    PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
    if (default_sink_path != null) {
        default_playback.* = SDL_FindPhysicalAudioDeviceByCallback(FindAudioDeviceByPath, @ptrCast(@alignCast(default_sink_path)));
    }
    if (default_source_path != null) {
        default_recording.* = SDL_FindPhysicalAudioDeviceByCallback(FindAudioDeviceByPath, @ptrCast(@alignCast(default_source_path)));
    }
    _ = SDL_SetAtomicInt_REAL(&pulseaudio_hotplug_thread_active, 1);
    pulseaudio_hotplug_thread = SDL_CreateThreadRuntime_REAL(HotplugThread, "PulseHotplug", @ptrCast(@alignCast(ready_sem)), null, null);
    if (pulseaudio_hotplug_thread != null) {
        SDL_WaitSemaphore_REAL(ready_sem);
    } else {
        _ = SDL_SetAtomicInt_REAL(&pulseaudio_hotplug_thread_active, 0);
    }
    SDL_DestroySemaphore_REAL(ready_sem);
}
pub fn PULSEAUDIO_FreeDeviceHandle(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var handle: [*c]PulseDeviceHandle = @ptrCast(@alignCast(device.*.handle));
    _ = &handle;
    SDL_free_REAL(@ptrCast(@alignCast(handle.*.device_path)));
    SDL_free_REAL(@ptrCast(@alignCast(handle)));
}
pub fn PULSEAUDIO_DeinitializeStart() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pulseaudio_hotplug_thread != null) {
        PULSEAUDIO_pa_threaded_mainloop_lock.?(pulseaudio_threaded_mainloop);
        _ = SDL_SetAtomicInt_REAL(&pulseaudio_hotplug_thread_active, 0);
        PULSEAUDIO_pa_threaded_mainloop_signal.?(pulseaudio_threaded_mainloop, 0);
        PULSEAUDIO_pa_threaded_mainloop_unlock.?(pulseaudio_threaded_mainloop);
        SDL_WaitThread_REAL(pulseaudio_hotplug_thread, null);
        pulseaudio_hotplug_thread = null;
    }
}
pub fn PULSEAUDIO_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    DisconnectFromPulseServer();
    SDL_free_REAL(@ptrCast(@alignCast(default_sink_path)));
    default_sink_path = null;
    default_sink_changed = @"false" != 0;
    SDL_free_REAL(@ptrCast(@alignCast(default_source_path)));
    default_source_path = null;
    default_source_changed = @"false" != 0;
    UnloadPulseAudioLibrary();
}
pub fn PULSEAUDIO_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!LoadPulseAudioLibrary()) {
        return @"false" != 0;
    } else if (!ConnectToPulseServer()) {
        UnloadPulseAudioLibrary();
        return @"false" != 0;
    }
    include_monitors = SDL_GetHintBoolean_REAL("SDL_AUDIO_INCLUDE_MONITORS", @"false" != 0);
    impl.*.DetectDevices = PULSEAUDIO_DetectDevices;
    impl.*.OpenDevice = PULSEAUDIO_OpenDevice;
    impl.*.PlayDevice = PULSEAUDIO_PlayDevice;
    impl.*.WaitDevice = PULSEAUDIO_WaitDevice;
    impl.*.GetDeviceBuf = PULSEAUDIO_GetDeviceBuf;
    impl.*.CloseDevice = PULSEAUDIO_CloseDevice;
    impl.*.DeinitializeStart = PULSEAUDIO_DeinitializeStart;
    impl.*.Deinitialize = PULSEAUDIO_Deinitialize;
    impl.*.WaitRecordingDevice = PULSEAUDIO_WaitRecordingDevice;
    impl.*.RecordDevice = PULSEAUDIO_RecordDevice;
    impl.*.FlushRecording = PULSEAUDIO_FlushRecording;
    impl.*.FreeDeviceHandle = PULSEAUDIO_FreeDeviceHandle;
    impl.*.HasRecordingSupport = @"true" != 0;
    return @"true" != 0;
}
pub const SDL_PULSEAUDIO_SYM = @compileError("unable to translate macro: undefined identifier `PULSEAUDIO_`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/audio/pulseaudio/SDL_pulseaudio.c:158:9
