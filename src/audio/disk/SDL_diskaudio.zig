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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_round_REAL(x: f64) f64;
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
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
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
    io: ?*SDL_IOStream = null,
    io_delay: Uint32 = 0,
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
pub extern fn SDL_GetAudioFormatName_REAL(format: SDL_AudioFormat) [*c]const u8;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_LOG_CATEGORY_AUDIO: c_int = 4;
pub extern fn SDL_LogCritical_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_AddAudioDevice(recording: bool, name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) [*c]SDL_AudioDevice;
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
pub export var DISKAUDIO_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "disk",
    .desc = "direct-to-disk audio",
    .init = DISKAUDIO_Init,
    .demand_only = @"true" != 0,
    .is_preferred = @"false" != 0,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub fn DISKAUDIO_WaitDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_Delay_REAL(device.*.hidden.*.io_delay);
    return @"true" != 0;
}
pub fn DISKAUDIO_PlayDevice(device: [*c]SDL_AudioDevice, buffer: [*c]const Uint8, buffer_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const written: c_int = @bitCast(@as(c_uint, @truncate(SDL_WriteIO_REAL(device.*.hidden.*.io, @ptrCast(@alignCast(buffer)), @bitCast(@as(c_long, buffer_size))))));
    _ = &written;
    if (written != buffer_size) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn DISKAUDIO_GetDeviceBuf(device: [*c]SDL_AudioDevice, _: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    return device.*.hidden.*.mixbuf;
}
pub fn DISKAUDIO_RecordDevice(device: [*c]SDL_AudioDevice, arg_buffer: ?*anyopaque, arg_buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var buffer = arg_buffer;
    _ = &buffer;
    var buflen = arg_buflen;
    _ = &buflen;
    var h: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &h;
    const origbuflen: c_int = buflen;
    _ = &origbuflen;
    if (h.*.io != null) {
        const br: c_int = @bitCast(@as(c_uint, @truncate(SDL_ReadIO_REAL(h.*.io, buffer, @bitCast(@as(c_long, buflen))))));
        _ = &br;
        buflen -= br;
        buffer = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(buffer))) + @as(usize, @bitCast(@as(isize, @intCast(br))))));
        if (buflen > @as(c_int, 0)) {
            _ = SDL_CloseIO_REAL(h.*.io);
            h.*.io = null;
        }
    }
    _ = memset(buffer, device.*.silence_value, @bitCast(@as(c_long, buflen)));
    return origbuflen;
}
pub fn DISKAUDIO_FlushRecording(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn DISKAUDIO_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device.*.hidden != null) {
        if (device.*.hidden.*.io != null) {
            _ = SDL_CloseIO_REAL(device.*.hidden.*.io);
        }
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.mixbuf)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
        device.*.hidden = null;
    }
}
pub fn get_filename(recording: bool) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    _ = &recording;
    var devname: [*c]const u8 = SDL_GetHint_REAL(if (recording) @as([*c]u8, @as([*c]u8, @constCast("SDL_AUDIO_DISK_INPUT_FILE"))) else @as([*c]u8, @as([*c]u8, @constCast("SDL_AUDIO_DISK_OUTPUT_FILE"))));
    _ = &devname;
    if (!(devname != null)) {
        devname = if (recording) @as([*c]u8, @as([*c]u8, @constCast("sdlaudio-in.raw"))) else @as([*c]u8, @as([*c]u8, @constCast("sdlaudio.raw")));
    }
    return devname;
}
pub fn AudioFormatString(fmt: SDL_AudioFormat) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "AudioFormatString".*;
    };
    _ = &static_local___func__;
    var str: [*c]const u8 = SDL_GetAudioFormatName_REAL(fmt);
    _ = &str;
    while (true) {
        while (!(str != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "str",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_diskaudio.c", 106);
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
    if (SDL_strncmp_REAL(str, "SDL_AUDIO_", 10) == @as(c_int, 0)) {
        str += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 10)))));
    }
    return str;
}
pub fn DISKAUDIO_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var recording: bool = device.*.recording;
    _ = &recording;
    var fname: [*c]const u8 = get_filename(recording);
    _ = &fname;
    device.*.hidden = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(device.*.hidden.*)))));
    if (!(device.*.hidden != null)) {
        return @"false" != 0;
    }
    device.*.hidden.*.io_delay = @bitCast(@as(c_int, @divTrunc(device.*.sample_frames * @as(c_int, 1000), device.*.spec.freq)));
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_AUDIO_DISK_TIMESCALE");
    _ = &hint;
    if (hint != null) {
        var scale: f64 = SDL_atof_REAL(hint);
        _ = &scale;
        if (scale >= @as(f64, 0.0)) {
            device.*.hidden.*.io_delay = @intFromFloat(SDL_round_REAL(@as(f64, @floatFromInt(device.*.hidden.*.io_delay)) * scale));
        }
    }
    device.*.hidden.*.io = SDL_IOFromFile_REAL(fname, if (recording) @as([*c]u8, @as([*c]u8, @constCast("rb"))) else @as([*c]u8, @as([*c]u8, @constCast("wb"))));
    if (!(device.*.hidden.*.io != null)) {
        return @"false" != 0;
    }
    if (!recording) {
        device.*.hidden.*.mixbuf = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, device.*.buffer_size)))));
        if (!(device.*.hidden.*.mixbuf != null)) {
            return @"false" != 0;
        }
        _ = memset(@ptrCast(@alignCast(device.*.hidden.*.mixbuf)), device.*.silence_value, @bitCast(@as(c_long, device.*.buffer_size)));
    }
    SDL_LogCritical_REAL(SDL_LOG_CATEGORY_AUDIO, "You are using the SDL disk i/o audio driver!");
    SDL_LogCritical_REAL(SDL_LOG_CATEGORY_AUDIO, " %s file [%s], format=%s channels=%d freq=%d.", if (recording) @as([*c]u8, @as([*c]u8, @constCast("Reading from"))) else @as([*c]u8, @as([*c]u8, @constCast("Writing to"))), fname, AudioFormatString(device.*.spec.format), device.*.spec.channels, device.*.spec.freq);
    return @"true" != 0;
}
pub fn DISKAUDIO_DetectDevices(default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    default_playback.* = SDL_AddAudioDevice(@"false" != 0, "System audio playback device", null, null, @ptrFromInt(@as(usize, @intCast(@as(c_int, 1)))));
    default_recording.* = SDL_AddAudioDevice(@"true" != 0, "System audio recording device", null, null, @ptrFromInt(@as(usize, @intCast(@as(c_int, 2)))));
}
pub fn DISKAUDIO_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    impl.*.OpenDevice = DISKAUDIO_OpenDevice;
    impl.*.WaitDevice = DISKAUDIO_WaitDevice;
    impl.*.WaitRecordingDevice = DISKAUDIO_WaitDevice;
    impl.*.PlayDevice = DISKAUDIO_PlayDevice;
    impl.*.GetDeviceBuf = DISKAUDIO_GetDeviceBuf;
    impl.*.RecordDevice = DISKAUDIO_RecordDevice;
    impl.*.FlushRecording = DISKAUDIO_FlushRecording;
    impl.*.CloseDevice = DISKAUDIO_CloseDevice;
    impl.*.DetectDevices = DISKAUDIO_DetectDevices;
    impl.*.HasRecordingSupport = @"true" != 0;
    return @"true" != 0;
}
