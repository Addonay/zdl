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
pub const pthread_t = c_ulong;
pub const jack_nframes_t = u32;
pub const struct__jack_port = opaque {
};
pub const jack_port_t = struct__jack_port;
pub const struct__jack_client = opaque {
};
pub const jack_client_t = struct__jack_client;
pub const JackNoStartServer: c_int = 1;
pub const enum_JackOptions = c_uint;
pub const jack_options_t = enum_JackOptions;
pub const enum_JackStatus = c_uint;
pub const jack_status_t = enum_JackStatus;
pub const JackProcessCallback = ?*const fn (nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int;
pub const JackBufferSizeCallback = ?*const fn (nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int;
pub const JackSampleRateCallback = ?*const fn (nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int;
pub const JackShutdownCallback = ?*const fn (arg: ?*anyopaque) callconv(.c) void;
pub const JackPortIsInput: c_int = 1;
pub const JackPortIsOutput: c_int = 2;
pub const JackPortIsPhysical: c_int = 4;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
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
pub const struct_SDL_AudioQueue = opaque {};
pub const struct_SDL_PrivateAudioData = extern struct {
    client: ?*jack_client_t = null,
    sdlports: [*c]?*jack_port_t = null,
    iobuffer: [*c]f32 = null,
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
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub extern fn SDL_AudioDeviceDisconnected(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_AudioDeviceFormatChanged(device: [*c]SDL_AudioDevice, newspec: [*c]const SDL_AudioSpec, new_sample_frames: c_int) bool;
pub extern fn SDL_UpdatedAudioDeviceFormat(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_PlaybackAudioThreadIterate(device: [*c]SDL_AudioDevice) bool;
pub extern fn SDL_RecordingAudioThreadIterate(device: [*c]SDL_AudioDevice) bool;
pub extern fn SDL_AudioThreadFinalize(device: [*c]SDL_AudioDevice) void;
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
pub export var JACK_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "jack",
    .desc = "JACK Audio Connection Kit",
    .init = JACK_Init,
    .demand_only = @"false" != 0,
    .is_preferred = @"false" != 0,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
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
pub var JACK_jack_client_open: ?*const fn ([*c]const u8, jack_options_t, [*c]jack_status_t, ...) callconv(.c) ?*jack_client_t = null;
pub var JACK_jack_client_close: ?*const fn (?*jack_client_t) callconv(.c) c_int = null;
pub var JACK_jack_on_shutdown: ?*const fn (?*jack_client_t, JackShutdownCallback, ?*anyopaque) callconv(.c) void = null;
pub var JACK_jack_activate: ?*const fn (?*jack_client_t) callconv(.c) c_int = null;
pub var JACK_jack_deactivate: ?*const fn (?*jack_client_t) callconv(.c) c_int = null;
pub var JACK_jack_port_get_buffer: ?*const fn (?*jack_port_t, jack_nframes_t) callconv(.c) ?*anyopaque = null;
pub var JACK_jack_port_unregister: ?*const fn (?*jack_client_t, ?*jack_port_t) callconv(.c) c_int = null;
pub var JACK_jack_free: ?*const fn (?*anyopaque) callconv(.c) void = null;
pub var JACK_jack_get_ports: ?*const fn (?*jack_client_t, [*c]const u8, [*c]const u8, c_ulong) callconv(.c) [*c][*c]const u8 = null;
pub var JACK_jack_get_sample_rate: ?*const fn (?*jack_client_t) callconv(.c) jack_nframes_t = null;
pub var JACK_jack_get_buffer_size: ?*const fn (?*jack_client_t) callconv(.c) jack_nframes_t = null;
pub var JACK_jack_port_register: ?*const fn (?*jack_client_t, [*c]const u8, [*c]const u8, c_ulong, c_ulong) callconv(.c) ?*jack_port_t = null;
pub var JACK_jack_port_by_name: ?*const fn (?*jack_client_t, [*c]const u8) callconv(.c) ?*jack_port_t = null;
pub var JACK_jack_port_name: ?*const fn (?*const jack_port_t) callconv(.c) [*c]const u8 = null;
pub var JACK_jack_port_type: ?*const fn (?*const jack_port_t) callconv(.c) [*c]const u8 = null;
pub var JACK_jack_connect: ?*const fn (?*jack_client_t, [*c]const u8, [*c]const u8) callconv(.c) c_int = null;
pub var JACK_jack_set_process_callback: ?*const fn (?*jack_client_t, JackProcessCallback, ?*anyopaque) callconv(.c) c_int = null;
pub var JACK_jack_set_sample_rate_callback: ?*const fn (?*jack_client_t, JackSampleRateCallback, ?*anyopaque) callconv(.c) c_int = null;
pub var JACK_jack_set_buffer_size_callback: ?*const fn (?*jack_client_t, JackBufferSizeCallback, ?*anyopaque) callconv(.c) c_int = null;
pub var jack_library: [*c]const u8 = "libjack.so.0";
pub var jack_handle: ?*SDL_SharedObject = null;
pub fn load_jack_sym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(jack_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn UnloadJackLibrary() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (jack_handle != null) {
        SDL_UnloadObject_REAL(jack_handle);
        jack_handle = null;
    }
}
pub fn LoadJackLibrary() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!(jack_handle != null)) {
        jack_handle = SDL_LoadObject_REAL(jack_library);
        if (!(jack_handle != null)) {
            result = @"false" != 0;
        } else {
            result = load_jack_syms();
            if (!result) {
                UnloadJackLibrary();
            }
        }
    }
    return result;
}
pub fn load_jack_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!load_jack_sym("jack_client_open", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_client_open))))))) return @"false" != 0;
    if (!load_jack_sym("jack_client_close", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_client_close))))))) return @"false" != 0;
    if (!load_jack_sym("jack_on_shutdown", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_on_shutdown))))))) return @"false" != 0;
    if (!load_jack_sym("jack_activate", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_activate))))))) return @"false" != 0;
    if (!load_jack_sym("jack_deactivate", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_deactivate))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_get_buffer", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_get_buffer))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_unregister", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_unregister))))))) return @"false" != 0;
    if (!load_jack_sym("jack_free", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_free))))))) return @"false" != 0;
    if (!load_jack_sym("jack_get_ports", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_get_ports))))))) return @"false" != 0;
    if (!load_jack_sym("jack_get_sample_rate", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_get_sample_rate))))))) return @"false" != 0;
    if (!load_jack_sym("jack_get_buffer_size", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_get_buffer_size))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_register", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_register))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_by_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_by_name))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_name", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_name))))))) return @"false" != 0;
    if (!load_jack_sym("jack_port_type", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_port_type))))))) return @"false" != 0;
    if (!load_jack_sym("jack_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_connect))))))) return @"false" != 0;
    if (!load_jack_sym("jack_set_process_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_set_process_callback))))))) return @"false" != 0;
    if (!load_jack_sym("jack_set_sample_rate_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_set_sample_rate_callback))))))) return @"false" != 0;
    if (!load_jack_sym("jack_set_buffer_size_callback", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&JACK_jack_set_buffer_size_callback))))))) return @"false" != 0;
    return @"true" != 0;
}
pub fn jackShutdownCallback(arg: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AudioDeviceDisconnected(@ptrCast(@alignCast(arg)));
}
pub fn jackSampleRateCallback(nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(arg));
    _ = &device;
    var newspec: SDL_AudioSpec = undefined;
    _ = &newspec;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&newspec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&newspec)) == sizeof (*( &device->spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&newspec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
    newspec.freq = @bitCast(@as(c_uint, @truncate(nframes)));
    if (!SDL_AudioDeviceFormatChanged(device, &newspec, device.*.sample_frames)) {
        SDL_AudioDeviceDisconnected(device);
    }
    return 0;
}
pub fn jackBufferSizeCallback(nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(arg));
    _ = &device;
    var newspec: SDL_AudioSpec = undefined;
    _ = &newspec;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&newspec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&newspec)) == sizeof (*( &device->spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&newspec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
    if (!SDL_AudioDeviceFormatChanged(device, &newspec, @bitCast(@as(c_uint, @truncate(nframes))))) {
        SDL_AudioDeviceDisconnected(device);
    }
    return 0;
}
pub fn jackProcessPlaybackCallback(nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "jackProcessPlaybackCallback".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(nframes == @as(jack_nframes_t, @bitCast(@as(c_int, @as([*c]SDL_AudioDevice, @ptrCast(@alignCast(arg))).*.sample_frames))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "nframes == ((SDL_AudioDevice *)arg)->sample_frames",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_jackaudio.c", 179);
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
    _ = SDL_PlaybackAudioThreadIterate(@ptrCast(@alignCast(arg)));
    return 0;
}
pub fn JACK_PlayDevice(device: [*c]SDL_AudioDevice, ui8buffer: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var buffer: [*c]const f32 = @ptrCast(@alignCast(ui8buffer));
    _ = &buffer;
    var ports: [*c]?*jack_port_t = device.*.hidden.*.sdlports;
    _ = &ports;
    const total_channels: c_int = device.*.spec.channels;
    _ = &total_channels;
    const total_frames: c_int = device.*.sample_frames;
    _ = &total_frames;
    const nframes: jack_nframes_t = @bitCast(@as(c_int, device.*.sample_frames));
    _ = &nframes;
    {
        var channelsi: c_int = 0;
        _ = &channelsi;
        while (channelsi < total_channels) : (channelsi += 1) {
            var dst: [*c]f32 = @ptrCast(@alignCast(JACK_jack_port_get_buffer.?(ports[@bitCast(@as(isize, @intCast(channelsi)))], nframes)));
            _ = &dst;
            if (dst != null) {
                var src: [*c]const f32 = buffer + @as(usize, @bitCast(@as(isize, @intCast(channelsi))));
                _ = &src;
                {
                    var framesi: c_int = 0;
                    _ = &framesi;
                    while (framesi < total_frames) : (framesi += 1) {
                        (blk: {
                            const ref = &dst;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = src.*;
                        src += @as(usize, @bitCast(@as(isize, @intCast(total_channels))));
                    }
                }
            }
        }
    }
    return @"true" != 0;
}
pub fn JACK_GetDeviceBuf(device: [*c]SDL_AudioDevice, _: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(device.*.hidden.*.iobuffer));
}
pub fn jackProcessRecordingCallback(nframes: jack_nframes_t, arg: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "jackProcessRecordingCallback".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(nframes == @as(jack_nframes_t, @bitCast(@as(c_int, @as([*c]SDL_AudioDevice, @ptrCast(@alignCast(arg))).*.sample_frames))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "nframes == ((SDL_AudioDevice *)arg)->sample_frames",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_jackaudio.c", 213);
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
    _ = SDL_RecordingAudioThreadIterate(@ptrCast(@alignCast(arg)));
    return 0;
}
pub fn JACK_RecordDevice(device: [*c]SDL_AudioDevice, vbuffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var buffer: [*c]f32 = @ptrCast(@alignCast(vbuffer));
    _ = &buffer;
    var ports: [*c]?*jack_port_t = device.*.hidden.*.sdlports;
    _ = &ports;
    const total_channels: c_int = device.*.spec.channels;
    _ = &total_channels;
    const total_frames: c_int = device.*.sample_frames;
    _ = &total_frames;
    const nframes: jack_nframes_t = @bitCast(@as(c_int, device.*.sample_frames));
    _ = &nframes;
    {
        var channelsi: c_int = 0;
        _ = &channelsi;
        while (channelsi < total_channels) : (channelsi += 1) {
            var src: [*c]const f32 = @ptrCast(@alignCast(JACK_jack_port_get_buffer.?(ports[@bitCast(@as(isize, @intCast(channelsi)))], nframes)));
            _ = &src;
            if (src != null) {
                var dst: [*c]f32 = buffer + @as(usize, @bitCast(@as(isize, @intCast(channelsi))));
                _ = &dst;
                {
                    var framesi: c_int = 0;
                    _ = &framesi;
                    while (framesi < total_frames) : (framesi += 1) {
                        dst.* = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        dst += @as(usize, @bitCast(@as(isize, @intCast(total_channels))));
                    }
                }
            }
        }
    }
    return buflen;
}
pub fn JACK_FlushRecording(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn JACK_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device.*.hidden != null) {
        if (device.*.hidden.*.client != null) {
            _ = JACK_jack_deactivate.?(device.*.hidden.*.client);
            if (device.*.hidden.*.sdlports != null) {
                const channels: c_int = device.*.spec.channels;
                _ = &channels;
                var i: c_int = undefined;
                _ = &i;
                {
                    i = 0;
                    while (i < channels) : (i += 1) {
                        _ = JACK_jack_port_unregister.?(device.*.hidden.*.client, device.*.hidden.*.sdlports[@bitCast(@as(isize, @intCast(i)))]);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.sdlports)));
            }
            _ = JACK_jack_client_close.?(device.*.hidden.*.client);
        }
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.iobuffer)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
        device.*.hidden = null;
        SDL_AudioThreadFinalize(device);
    }
}
pub fn GetJackAppName() callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
}
pub fn JACK_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const recording: bool = device.*.recording;
    _ = &recording;
    const sysportflags: c_ulong = @bitCast(@as(c_long, if (recording) JackPortIsOutput else JackPortIsInput));
    _ = &sysportflags;
    const sdlportflags: c_ulong = @bitCast(@as(c_long, if (recording) JackPortIsInput else JackPortIsOutput));
    _ = &sdlportflags;
    const callback: JackProcessCallback = if (recording) jackProcessRecordingCallback else jackProcessPlaybackCallback;
    _ = &callback;
    var sdlportstr: [*c]const u8 = if (recording) @as([*c]u8, @as([*c]u8, @constCast("input"))) else @as([*c]u8, @as([*c]u8, @constCast("output")));
    _ = &sdlportstr;
    var devports: [*c][*c]const u8 = null;
    _ = &devports;
    var audio_ports: [*c]c_int = undefined;
    _ = &audio_ports;
    var client: ?*jack_client_t = null;
    _ = &client;
    var status: jack_status_t = undefined;
    _ = &status;
    var channels: c_int = 0;
    _ = &channels;
    var ports: c_int = 0;
    _ = &ports;
    var i: c_int = undefined;
    _ = &i;
    device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(device.*.hidden.*)))));
    if (!(device.*.hidden != null)) {
        return @"false" != 0;
    }
    client = JACK_jack_client_open.?(GetJackAppName(), JackNoStartServer, &status, @as(?*anyopaque, null));
    device.*.hidden.*.client = client;
    if (!(client != null)) {
        return SDL_SetError_REAL("Can't open JACK client");
    }
    devports = JACK_jack_get_ports.?(client, null, null, @as(c_ulong, JackPortIsPhysical) | sysportflags);
    if (!(devports != null) or !(devports[@as(c_int, 0)] != null)) {
        return SDL_SetError_REAL("No physical JACK ports available");
    }
    while (devports[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &ports;
            ref.* += 1;
            break :blk ref.*;
        })))
    ] != null) {}
    audio_ports = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, ports)), @sizeOf(@TypeOf(audio_ports.*)))));
    {
        i = 0;
        while (i < ports) : (i += 1) {
            var dport: ?*const jack_port_t = JACK_jack_port_by_name.?(client, devports[@bitCast(@as(isize, @intCast(i)))]);
            _ = &dport;
            var @"type": [*c]const u8 = JACK_jack_port_type.?(dport);
            _ = &@"type";
            const len: c_int = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(@"type"))));
            _ = &len;
            if ((len >= @as(c_int, 5)) and !(SDL_memcmp_REAL(@ptrCast(@alignCast((@"type" + @as(usize, @bitCast(@as(isize, @intCast(len))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5))))))), @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("audio"))))), 5) != 0)) {
                audio_ports[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &channels;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = i;
            }
        }
    }
    if (channels == @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return SDL_SetError_REAL("No physical JACK ports available");
    }
    device.*.spec.format = SDL_AUDIO_F32;
    device.*.spec.freq = @bitCast(@as(c_uint, @truncate(JACK_jack_get_sample_rate.?(client))));
    device.*.spec.channels = channels;
    device.*.sample_frames = @bitCast(@as(c_uint, @truncate(JACK_jack_get_buffer_size.?(client))));
    SDL_UpdatedAudioDeviceFormat(device);
    if (!recording) {
        device.*.hidden.*.iobuffer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @bitCast(@as(c_long, device.*.buffer_size)))));
        if (!(device.*.hidden.*.iobuffer != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
            return @"false" != 0;
        }
    }
    device.*.hidden.*.sdlports = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, channels)), @sizeOf(?*jack_port_t))));
    if (!(device.*.hidden.*.sdlports != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < channels) : (i += 1) {
            var portname: [32]u8 = undefined;
            _ = &portname;
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&portname)), @sizeOf(@TypeOf(portname)), "sdl_jack_%s_%d", sdlportstr, i);
            device.*.hidden.*.sdlports[@bitCast(@as(isize, @intCast(i)))] = JACK_jack_port_register.?(client, @ptrCast(@alignCast(&portname)), "32 bit float mono audio", sdlportflags, 0);
            if (@as(?*anyopaque, @ptrCast(@alignCast(device.*.hidden.*.sdlports[@bitCast(@as(isize, @intCast(i)))]))) == @as(?*anyopaque, null)) {
                SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
                return SDL_SetError_REAL("jack_port_register failed");
            }
        }
    }
    if (JACK_jack_set_buffer_size_callback.?(client, jackBufferSizeCallback, @ptrCast(@alignCast(device))) != @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return SDL_SetError_REAL("JACK: Couldn't set buffer size callback");
    } else if (JACK_jack_set_sample_rate_callback.?(client, jackSampleRateCallback, @ptrCast(@alignCast(device))) != @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return SDL_SetError_REAL("JACK: Couldn't set sample rate callback");
    } else if (JACK_jack_set_process_callback.?(client, callback, @ptrCast(@alignCast(device))) != @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return SDL_SetError_REAL("JACK: Couldn't set process callback");
    }
    JACK_jack_on_shutdown.?(client, jackShutdownCallback, @ptrCast(@alignCast(device)));
    if (JACK_jack_activate.?(client) != @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
        return SDL_SetError_REAL("Failed to activate JACK client");
    }
    {
        i = 0;
        while (i < channels) : (i += 1) {
            var sdlport: [*c]const u8 = JACK_jack_port_name.?(device.*.hidden.*.sdlports[@bitCast(@as(isize, @intCast(i)))]);
            _ = &sdlport;
            var srcport: [*c]const u8 = if (recording) devports[@bitCast(@as(isize, @intCast(audio_ports[@bitCast(@as(isize, @intCast(i)))])))] else sdlport;
            _ = &srcport;
            var dstport: [*c]const u8 = if (recording) sdlport else devports[@bitCast(@as(isize, @intCast(audio_ports[@bitCast(@as(isize, @intCast(i)))])))];
            _ = &dstport;
            if (JACK_jack_connect.?(client, srcport, dstport) != @as(c_int, 0)) {
                SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
                return SDL_SetError_REAL("Couldn't connect JACK ports: %s => %s", srcport, dstport);
            }
        }
    }
    JACK_jack_free.?(@ptrCast(@alignCast(devports)));
    SDL_free_REAL(@ptrCast(@alignCast(audio_ports)));
    return @"true" != 0;
}
pub fn JACK_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    UnloadJackLibrary();
}
pub fn JACK_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!LoadJackLibrary()) {
        return @"false" != 0;
    } else {
        var status: jack_status_t = undefined;
        _ = &status;
        var client: ?*jack_client_t = JACK_jack_client_open.?("SDL", JackNoStartServer, &status, @as(?*anyopaque, null));
        _ = &client;
        if (!(client != null)) {
            UnloadJackLibrary();
            return SDL_SetError_REAL("Can't open JACK client");
        }
        _ = JACK_jack_client_close.?(client);
    }
    impl.*.OpenDevice = JACK_OpenDevice;
    impl.*.GetDeviceBuf = JACK_GetDeviceBuf;
    impl.*.PlayDevice = JACK_PlayDevice;
    impl.*.CloseDevice = JACK_CloseDevice;
    impl.*.Deinitialize = JACK_Deinitialize;
    impl.*.RecordDevice = JACK_RecordDevice;
    impl.*.FlushRecording = JACK_FlushRecording;
    impl.*.OnlyHasDefaultPlaybackDevice = @"true" != 0;
    impl.*.OnlyHasDefaultRecordingDevice = @"true" != 0;
    impl.*.HasRecordingSupport = @"true" != 0;
    impl.*.ProvidesOwnCallbackThread = @"true" != 0;
    return @"true" != 0;
}
pub const SDL_JACK_SYM = @compileError("unable to translate macro: undefined identifier `JACK_`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/audio/jack/SDL_jackaudio.c:76:9
