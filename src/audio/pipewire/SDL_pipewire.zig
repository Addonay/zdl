const EPIPE: c_int = 32;
extern fn strncpy(destination: [*c]u8, text: [*c]const u8, length: usize) [*c]u8;
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
pub const __time_t = c_long;
pub const time_t = __time_t;
pub const ptrdiff_t = c_long;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn system(__command: [*c]const u8) c_int;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
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
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
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
pub const SDL_AUDIO_S16: c_int = 32784;
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
pub const struct_pw_thread_loop = opaque {
};
pub const struct_pw_stream = opaque {
};
pub const struct_pw_context = opaque {
};
pub const struct_spa_meta = extern struct {
    type: u32 = 0,
    size: u32 = 0,
    data: ?*anyopaque = null,
};
pub const struct_spa_chunk = extern struct {
    offset: u32 = 0,
    size: u32 = 0,
    stride: i32 = 0,
    flags: i32 = 0,
};
pub const struct_spa_data = extern struct {
    type: u32 = 0,
    flags: u32 = 0,
    fd: i64 = 0,
    mapoffset: u32 = 0,
    maxsize: u32 = 0,
    data: ?*anyopaque = null,
    chunk: [*c]struct_spa_chunk = null,
};
pub const struct_spa_buffer = extern struct {
    n_metas: u32 = 0,
    n_datas: u32 = 0,
    metas: [*c]struct_spa_meta = null,
    datas: [*c]struct_spa_data = null,
};
pub const struct_pw_buffer = extern struct {
    buffer: [*c]struct_spa_buffer = null,
    user_data: ?*anyopaque = null,
    size: u64 = 0,
    requested: u64 = 0,
    time: u64 = 0,
};
pub const struct_SDL_PrivateAudioData = extern struct {
    loop: ?*struct_pw_thread_loop = null,
    stream: ?*struct_pw_stream = null,
    context: ?*struct_pw_context = null,
    node_name: [*c]u8 = null,
    stride: Sint32 = 0,
    stream_init_status: c_int = 0,
    pw_buf: [*c]struct_pw_buffer = null,
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
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub extern fn SDL_AddAudioDevice(recording: bool, name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_AudioDeviceDisconnected(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_DefaultAudioDeviceChanged(new_default_device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_FindPhysicalAudioDeviceByHandle(handle: ?*anyopaque) [*c]SDL_AudioDevice;
pub extern fn SDL_UpdatedAudioDeviceFormat(device: [*c]SDL_AudioDevice) void;
pub extern fn SDL_GetAudioThreadName(device: [*c]SDL_AudioDevice, buf: [*c]u8, buflen: usize) [*c]u8;
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
pub extern fn __errno_location() [*c]c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn sync() void;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const SPA_DIRECTION_INPUT: c_int = 0;
pub const SPA_DIRECTION_OUTPUT: c_int = 1;
pub const enum_spa_direction = c_uint;
pub const struct_spa_rectangle = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const struct_spa_fraction = extern struct {
    num: u32 = 0,
    denom: u32 = 0,
};
pub fn spa_ptrinside(p1: ?*const anyopaque, s1: usize, p2: ?*const anyopaque, arg_s2: usize, remaining: [*c]usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var s2 = arg_s2;
    _ = &s2;
    if (__builtin.expect(@as(c_long, @intFromBool(!!(((@as(usize, @intCast(@intFromPtr(p1))) <= @as(usize, @intCast(@intFromPtr(p2)))) and (s2 <= s1)) and ((@as(usize, @intCast(@intFromPtr(p2))) -% @as(usize, @intCast(@intFromPtr(p1)))) <= (s1 -% s2))))), @as(c_long, 1)) != 0) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = (@as(usize, @intCast(@intFromPtr(p1))) +% s1) -% (@as(usize, @intCast(@intFromPtr(p2))) +% s2);
        }
        return @"true" != 0;
    } else {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = 0;
        }
        return @"false" != 0;
    }
}
pub fn spa_ptr_inside_and_aligned(p1: ?*const anyopaque, s1: usize, p2: ?*const anyopaque, s2: usize, arg_align: usize, remaining: [*c]usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"align" = arg_align;
    _ = &@"align";
    if ((@as(usize, @intCast(@intFromPtr(p2))) & (@"align" -% @as(usize, 1))) == @as(usize, 0)) {
        return spa_ptrinside(p1, s1, p2, s2, remaining);
    } else {
        if (@as(?*anyopaque, @ptrCast(@alignCast(remaining))) != @as(?*anyopaque, null)) {
            remaining.* = 0;
        }
        return @"false" != 0;
    }
}
pub const struct_spa_list = extern struct {
    next: [*c]struct_spa_list = null,
    prev: [*c]struct_spa_list = null,
};
pub fn spa_list_init(list: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    list.* = @as(struct_spa_list, struct_spa_list{
        .next = list,
        .prev = list,
    });
}
pub fn spa_list_is_initialized(list: [*c]struct_spa_list) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(!!(list.*.prev != null));
}
pub fn spa_list_insert(list: [*c]struct_spa_list, elem: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    elem.*.prev = list;
    elem.*.next = list.*.next;
    list.*.next = elem;
    elem.*.next.*.prev = elem;
}
pub fn spa_list_remove(elem: [*c]struct_spa_list) callconv(.c) void {
    @setEvalBranchQuota(100000);
    elem.*.prev.*.next = elem.*.next;
    elem.*.next.*.prev = elem.*.prev;
}
pub const struct_spa_callbacks = extern struct {
    funcs: ?*const anyopaque = null,
    data: ?*anyopaque = null,
};
pub const struct_spa_interface = extern struct {
    type: [*c]const u8 = null,
    version: u32 = 0,
    cb: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
};
pub const struct_spa_hook = extern struct {
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    cb: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
    removed: ?*const fn (hook: [*c]struct_spa_hook) callconv(.c) void = null,
    priv: ?*anyopaque = null,
};
pub fn spa_hook_remove(hook: [*c]struct_spa_hook) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (spa_list_is_initialized(&hook.*.link) != 0) {
        spa_list_remove(&hook.*.link);
    }
    if (hook.*.removed != null) {
        hook.*.removed.?(hook);
    }
}
pub const struct_spa_dict_item = extern struct {
    key: [*c]const u8 = null,
    value: [*c]const u8 = null,
};
pub const struct_spa_dict = extern struct {
    flags: u32 = 0,
    n_items: u32 = 0,
    items: [*c]const struct_spa_dict_item = null,
};
pub fn spa_dict_item_compare(arg_i1: ?*const anyopaque, arg_i2: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"i1" = arg_i1;
    _ = &@"i1";
    var @"i2" = arg_i2;
    _ = &@"i2";
    var it1: [*c]const struct_spa_dict_item = @ptrCast(@alignCast(@"i1"));
    _ = &it1;
    var it2: [*c]const struct_spa_dict_item = @ptrCast(@alignCast(@"i2"));
    _ = &it2;
    return strcmp(it1.*.key, it2.*.key);
}
pub fn spa_dict_lookup_item(dict: [*c]const struct_spa_dict, key: [*c]const u8) callconv(.c) [*c]const struct_spa_dict_item {
    @setEvalBranchQuota(100000);
    var item: [*c]const struct_spa_dict_item = undefined;
    _ = &item;
    if (((dict.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) and (dict.*.n_items > @as(u32, 0))) {
        var k: struct_spa_dict_item = @as(struct_spa_dict_item, struct_spa_dict_item{
            .key = key,
            .value = null,
        });
        _ = &k;
        item = @ptrCast(@alignCast(@as(?*const anyopaque, @ptrCast(@alignCast(bsearch(@ptrCast(@alignCast(&k)), @ptrCast(@alignCast(dict.*.items)), dict.*.n_items, @sizeOf(struct_spa_dict_item), spa_dict_item_compare))))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(item)))) != @as(?*anyopaque, null)) return item;
    } else {
        {
            item = dict.*.items;
            while (item < (&dict.*.items[dict.*.n_items])) : (item += 1) {
                if (!(strcmp(item.*.key, key) != 0)) return item;
            }
        }
    }
    return null;
}
pub fn spa_dict_lookup(dict: [*c]const struct_spa_dict, key: [*c]const u8) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var item: [*c]const struct_spa_dict_item = spa_dict_lookup_item(dict, key);
    _ = &item;
    return @ptrCast(@alignCast(if (item != null) @as(?*const anyopaque, @ptrCast(@alignCast(item.*.value))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
}
pub const SPA_PARAM_EnumFormat: c_int = 3;
pub const SPA_PARAM_Format: c_int = 4;
pub const struct_spa_param_info = extern struct {
    id: u32 = 0,
    flags: u32 = 0,
    user: u32 = 0,
    seq: i32 = 0,
    padding: [4]u32 = @import("std").mem.zeroes([4]u32),
};
pub const SPA_TYPE_None: c_int = 1;
pub const SPA_TYPE_Bool: c_int = 2;
pub const SPA_TYPE_Id: c_int = 3;
pub const SPA_TYPE_Int: c_int = 4;
pub const SPA_TYPE_Long: c_int = 5;
pub const SPA_TYPE_Float: c_int = 6;
pub const SPA_TYPE_Double: c_int = 7;
pub const SPA_TYPE_String: c_int = 8;
pub const SPA_TYPE_Bytes: c_int = 9;
pub const SPA_TYPE_Rectangle: c_int = 10;
pub const SPA_TYPE_Fraction: c_int = 11;
pub const SPA_TYPE_Bitmap: c_int = 12;
pub const SPA_TYPE_Array: c_int = 13;
pub const SPA_TYPE_Struct: c_int = 14;
pub const SPA_TYPE_Object: c_int = 15;
pub const SPA_TYPE_Sequence: c_int = 16;
pub const SPA_TYPE_Pointer: c_int = 17;
pub const SPA_TYPE_Fd: c_int = 18;
pub const SPA_TYPE_Choice: c_int = 19;
pub const SPA_TYPE_Pod: c_int = 20;
pub const SPA_TYPE_OBJECT_Format: c_int = 262147;
pub const struct_pw_proxy = opaque {
};
pub const struct_pw_core = opaque {
};
pub const struct_pw_registry = opaque {
};
pub const struct_pw_core_info = extern struct {
    id: u32 = 0,
    cookie: u32 = 0,
    user_name: [*c]const u8 = null,
    host_name: [*c]const u8 = null,
    version: [*c]const u8 = null,
    name: [*c]const u8 = null,
    change_mask: u64 = 0,
    props: [*c]struct_spa_dict = null,
};
pub const struct_pw_properties = extern struct {
    dict: struct_spa_dict = @import("std").mem.zeroes(struct_spa_dict),
    flags: u32 = 0,
};
pub const struct_pw_core_events = extern struct {
    version: u32 = 0,
    info: ?*const fn (data: ?*anyopaque, info: [*c]const struct_pw_core_info) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void = null,
    ping: ?*const fn (data: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void = null,
    @"error": ?*const fn (data: ?*anyopaque, id: u32, seq: c_int, res: c_int, message: [*c]const u8) callconv(.c) void = null,
    remove_id: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
    bound_id: ?*const fn (data: ?*anyopaque, id: u32, global_id: u32) callconv(.c) void = null,
    add_mem: ?*const fn (data: ?*anyopaque, id: u32, @"type": u32, fd: c_int, flags: u32) callconv(.c) void = null,
    remove_mem: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
    bound_props: ?*const fn (data: ?*anyopaque, id: u32, global_id: u32, props: [*c]const struct_spa_dict) callconv(.c) void = null,
};
pub const struct_pw_core_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_core_events, data: ?*anyopaque) callconv(.c) c_int = null,
    hello: ?*const fn (object: ?*anyopaque, version: u32) callconv(.c) c_int = null,
    sync: ?*const fn (object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) c_int = null,
    pong: ?*const fn (object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) c_int = null,
    @"error": ?*const fn (object: ?*anyopaque, id: u32, seq: c_int, res: c_int, message: [*c]const u8) callconv(.c) c_int = null,
    get_registry: ?*const fn (object: ?*anyopaque, version: u32, user_data_size: usize) callconv(.c) ?*struct_pw_registry = null,
    create_object: ?*const fn (object: ?*anyopaque, factory_name: [*c]const u8, @"type": [*c]const u8, version: u32, props: [*c]const struct_spa_dict, user_data_size: usize) callconv(.c) ?*anyopaque = null,
    destroy: ?*const fn (object: ?*anyopaque, proxy: ?*anyopaque) callconv(.c) c_int = null,
};
pub fn pw_core_add_listener(object: ?*struct_pw_core, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_core_events, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.add_listener != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.add_listener.?((&_i.*.cb).*.data, listener, events, data);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_core_sync(object: ?*struct_pw_core, id: u32, seq: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.sync != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.sync.?((&_i.*.cb).*.data, id, seq);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_core_get_registry(core: ?*struct_pw_core, version: u32, user_data_size: usize) callconv(.c) ?*struct_pw_registry {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: ?*struct_pw_registry = null;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(core));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_core_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.get_registry != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.get_registry.?((&_i.*.cb).*.data, version, user_data_size);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub const struct_pw_registry_events = extern struct {
    version: u32 = 0,
    global: ?*const fn (data: ?*anyopaque, id: u32, permissions: u32, @"type": [*c]const u8, version: u32, props: [*c]const struct_spa_dict) callconv(.c) void = null,
    global_remove: ?*const fn (data: ?*anyopaque, id: u32) callconv(.c) void = null,
};
pub const struct_pw_registry_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_registry_events, data: ?*anyopaque) callconv(.c) c_int = null,
    bind: ?*const fn (object: ?*anyopaque, id: u32, @"type": [*c]const u8, version: u32, use_data_size: usize) callconv(.c) ?*anyopaque = null,
    destroy: ?*const fn (object: ?*anyopaque, id: u32) callconv(.c) c_int = null,
};
pub fn pw_registry_add_listener(registry: ?*struct_pw_registry, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_registry_events, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(registry));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_registry_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.add_listener != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.add_listener.?((&_i.*.cb).*.data, listener, events, data);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub fn pw_registry_bind(registry: ?*struct_pw_registry, id: u32, arg_type: [*c]const u8, version: u32, user_data_size: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return blk: {
        var _res: ?*anyopaque = null;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(registry));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_registry_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.bind != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.bind.?((&_i.*.cb).*.data, id, @"type", version, user_data_size);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub extern fn time(__timer: [*c]time_t) time_t;
pub const struct_spa_system = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop_control = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_spa_loop_utils = extern struct {
    iface: struct_spa_interface = @import("std").mem.zeroes(struct_spa_interface),
};
pub const struct_pw_loop = extern struct {
    system: [*c]struct_spa_system = null,
    loop: [*c]struct_spa_loop = null,
    control: [*c]struct_spa_loop_control = null,
    utils: [*c]struct_spa_loop_utils = null,
    name: [*c]const u8 = null,
};
pub const struct_spa_pod = extern struct {
    size: u32 = 0,
    type: u32 = 0,
};
pub const struct_spa_pod_bool = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_id = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: u32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_int = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_long = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i64 = 0,
};
pub const struct_spa_pod_float = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: f32 = 0,
    _padding: i32 = 0,
};
pub const struct_spa_pod_double = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: f64 = 0,
};
pub const struct_spa_pod_string = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_bytes = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_rectangle = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: struct_spa_rectangle = @import("std").mem.zeroes(struct_spa_rectangle),
};
pub const struct_spa_pod_fraction = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: struct_spa_fraction = @import("std").mem.zeroes(struct_spa_fraction),
};
pub const struct_spa_pod_array_body = extern struct {
    child: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_array = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_array_body = @import("std").mem.zeroes(struct_spa_pod_array_body),
};
pub const SPA_CHOICE_None: c_int = 0;
pub const SPA_CHOICE_Range: c_int = 1;
pub const SPA_CHOICE_Step: c_int = 2;
pub const SPA_CHOICE_Enum: c_int = 3;
pub const SPA_CHOICE_Flags: c_int = 4;
pub const struct_spa_pod_choice_body = extern struct {
    type: u32 = 0,
    flags: u32 = 0,
    child: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_choice = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_choice_body = @import("std").mem.zeroes(struct_spa_pod_choice_body),
};
pub const struct_spa_pod_object_body = extern struct {
    type: u32 = 0,
    id: u32 = 0,
};
pub const struct_spa_pod_object = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_object_body = @import("std").mem.zeroes(struct_spa_pod_object_body),
};
pub const struct_spa_pod_pointer_body = extern struct {
    type: u32 = 0,
    _padding: u32 = 0,
    value: ?*const anyopaque = null,
};
pub const struct_spa_pod_pointer = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_pod_pointer_body = @import("std").mem.zeroes(struct_spa_pod_pointer_body),
};
pub const struct_spa_pod_fd = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    value: i64 = 0,
};
pub const struct_spa_pod_prop = extern struct {
    key: u32 = 0,
    flags: u32 = 0,
    value: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
};
pub const struct_spa_pod_sequence_body = extern struct {
    unit: u32 = 0,
    pad: u32 = 0,
};
pub const struct_pw_permission = extern struct {
    id: u32 = 0,
    permissions: u32 = 0,
};
pub const struct_pw_client_info = extern struct {
    id: u32 = 0,
    change_mask: u64 = 0,
    props: [*c]struct_spa_dict = null,
};
pub const struct_pw_client_events = extern struct {
    version: u32 = 0,
    info: ?*const fn (data: ?*anyopaque, info: [*c]const struct_pw_client_info) callconv(.c) void = null,
    permissions: ?*const fn (data: ?*anyopaque, index: u32, n_permissions: u32, permissions: [*c]const struct_pw_permission) callconv(.c) void = null,
};
pub const struct_spa_json = extern struct {
    cur: [*c]const u8 = null,
    end: [*c]const u8 = null,
    parent: [*c]struct_spa_json = null,
    state: u32 = 0,
    depth: u32 = 0,
};
pub fn spa_json_init(iter: [*c]struct_spa_json, data: [*c]const u8, size: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    iter.* = @as(struct_spa_json, struct_spa_json{
        .cur = data,
        .end = data + size,
        .parent = null,
        .state = 0,
        .depth = 0,
    });
}
pub fn spa_json_enter(iter: [*c]struct_spa_json, sub: [*c]struct_spa_json) callconv(.c) void {
    @setEvalBranchQuota(100000);
    sub.* = @as(struct_spa_json, struct_spa_json{
        .cur = iter.*.cur,
        .end = iter.*.end,
        .parent = iter,
        .state = iter.*.state & @as(u32, 4080),
        .depth = 0,
    });
}
pub fn spa_json_next(arg_iter: [*c]struct_spa_json, value: [*c][*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var iter = arg_iter;
    _ = &iter;
    var utf8_remain: c_int = undefined;
    _ = &utf8_remain;
    var err: c_int = undefined;
    _ = &err;
    const __NONE: c_int = 0;
    _ = &__NONE;
    const __STRUCT: c_int = 1;
    _ = &__STRUCT;
    const __BARE: c_int = 2;
    _ = &__BARE;
    const __STRING_1: c_int = 3;
    _ = &__STRING_1;
    const __UTF8: c_int = 4;
    _ = &__UTF8;
    const __ESC: c_int = 5;
    _ = &__ESC;
    const __COMMENT: c_int = 6;
    _ = &__COMMENT;
    const __ARRAY_FLAG: c_int = 16;
    _ = &__ARRAY_FLAG;
    const __PREV_ARRAY_FLAG: c_int = 32;
    _ = &__PREV_ARRAY_FLAG;
    const __KEY_FLAG: c_int = 64;
    _ = &__KEY_FLAG;
    const __SUB_FLAG: c_int = 128;
    _ = &__SUB_FLAG;
    const __FLAGS: c_int = 4080;
    _ = &__FLAGS;
    const __ERROR_SYSTEM: c_int = 256;
    _ = &__ERROR_SYSTEM;
    const __ERROR_INVALID_ARRAY_SEPARATOR: c_int = 257;
    _ = &__ERROR_INVALID_ARRAY_SEPARATOR;
    const __ERROR_EXPECTED_OBJECT_KEY: c_int = 258;
    _ = &__ERROR_EXPECTED_OBJECT_KEY;
    const __ERROR_EXPECTED_OBJECT_VALUE: c_int = 259;
    _ = &__ERROR_EXPECTED_OBJECT_VALUE;
    const __ERROR_TOO_DEEP_NESTING: c_int = 260;
    _ = &__ERROR_TOO_DEEP_NESTING;
    const __ERROR_EXPECTED_ARRAY_CLOSE: c_int = 261;
    _ = &__ERROR_EXPECTED_ARRAY_CLOSE;
    const __ERROR_EXPECTED_OBJECT_CLOSE: c_int = 262;
    _ = &__ERROR_EXPECTED_OBJECT_CLOSE;
    const __ERROR_MISMATCHED_BRACKET: c_int = 263;
    _ = &__ERROR_MISMATCHED_BRACKET;
    const __ERROR_ESCAPE_NOT_ALLOWED: c_int = 264;
    _ = &__ERROR_ESCAPE_NOT_ALLOWED;
    const __ERROR_CHARACTERS_NOT_ALLOWED: c_int = 265;
    _ = &__ERROR_CHARACTERS_NOT_ALLOWED;
    const __ERROR_INVALID_ESCAPE: c_int = 266;
    _ = &__ERROR_INVALID_ESCAPE;
    const __ERROR_INVALID_STATE: c_int = 267;
    _ = &__ERROR_INVALID_STATE;
    const __ERROR_UNFINISHED_STRING: c_int = 268;
    _ = &__ERROR_UNFINISHED_STRING;
    const enum_unnamed_47 = c_uint;
    _ = &enum_unnamed_47;
    var array_stack: [8]u64 = undefined;
    _ = &array_stack;
    var cur: u8 = undefined;
    _ = &cur;
    var flag: u32 = undefined;
    _ = &flag;
    var mask: u64 = undefined;
    _ = &mask;
    var mask_2: u64 = undefined;
    _ = &mask_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                utf8_remain = 0;
                err = 0;
                array_stack = [1]u64{
                    0,
                } ++ @as([7]u64, @splat(0));
                value.* = iter.*.cur;
                if ((iter.*.state & @as(u32, SPA_JSON_ERROR_FLAG)) != 0) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                flag = iter.*.state & @as(u32, __FLAGS);
                switch (iter.*.state & @as(u32, @bitCast(@as(c_int, ~__FLAGS)))) {
                    @as(u32, __NONE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(u32, __STRUCT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(u32, __BARE) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(u32, __STRING_1) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(u32, __UTF8) => {
                        sdl_pc = 123;
                        continue;
                    },
                    @as(u32, __ESC) => {
                        sdl_pc = 130;
                        continue;
                    },
                    @as(u32, __COMMENT) => {
                        sdl_pc = 142;
                        continue;
                    },
                    else => {
                        sdl_pc = 147;
                        continue;
                    },
                }
            },
            2 => {
                iter.*.state = @bitCast(@as(c_int, err));
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            3 => {
                return -@as(c_int, 1);
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
                if (iter.*.cur < iter.*.end) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                cur = iter.*.cur.*;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                iter.*.cur += 1;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                if ((iter.*.depth != @as(u32, 0)) or (iter.*.parent != null)) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                flag &= @bitCast(@as(c_int, ~(__KEY_FLAG | __PREV_ARRAY_FLAG)));
                iter.*.state = @as(u32, __STRUCT) | flag;
                iter.*.depth = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, '\x00') => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, '\t') => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, ' ') => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, '\r') => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, '\n') => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, ',') => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, ':') => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, '=') => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, '#') => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, '"') => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, '[') => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, '{') => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, '}') => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, ']') => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, '\\') => {
                        sdl_pc = 76;
                        continue;
                    },
                    else => {
                        sdl_pc = 77;
                        continue;
                    },
                }
            },
            13 => {
                {
                    sdl_pc = 8;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 8;
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
                if ((flag & @as(u32, __ARRAY_FLAG)) != 0) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                err = __ERROR_INVALID_ARRAY_SEPARATOR;
                {
                    sdl_pc = 2;
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
                if (!((flag & @as(u32, __KEY_FLAG)) != 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                err = __ERROR_EXPECTED_OBJECT_KEY;
                {
                    sdl_pc = 2;
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
                iter.*.state |= __SUB_FLAG;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            28 => {
                iter.*.state = @as(u32, __COMMENT) | flag;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            29 => {
                if ((flag & @as(u32, __KEY_FLAG)) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                flag |= __SUB_FLAG;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (!((flag & @as(u32, __ARRAY_FLAG)) != 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if (!((flag & @as(u32, __KEY_FLAG)) != 0)) {
                    flag |= @bitCast(@as(c_int, __KEY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__KEY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG))))))) == __KEY_FLAG) else @intFromBool(@sizeOf(@TypeOf(flag)) >= @sizeOf(@TypeOf(__KEY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (flag) with ~( __KEY_FLAG)\"");
                    }
                    flag &= ~@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG)));
                }
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                value.* = iter.*.cur;
                iter.*.state = @as(u32, __STRING_1) | flag;
                {
                    sdl_pc = 8;
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
                if (!((flag & @as(u32, __ARRAY_FLAG)) != 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                if (((iter.*.state & @as(u32, __SUB_FLAG)) != 0) and (@as(u32, @bitCast(@as(c_int, @intFromBool(!((flag & @as(u32, __KEY_FLAG)) != 0))))) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                iter.*.state = @as(u32, @bitCast(@as(c_int, __STRUCT | __SUB_FLAG))) | flag;
                if (@as(c_int, cur) == @as(c_int, '[')) {
                    iter.*.state |= @bitCast(@as(c_int, __ARRAY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__ARRAY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG))))))) == __ARRAY_FLAG) else @intFromBool(@sizeOf(@TypeOf(iter.*.state)) >= @sizeOf(@TypeOf(__ARRAY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (iter->state) with ~( __ARRAY_FLAG)\"");
                    }
                    iter.*.state &= ~@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG)));
                }
                if (iter.*.depth == @as(u32, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                err = __ERROR_EXPECTED_OBJECT_KEY;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__KEY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG))))))) == __KEY_FLAG) else @intFromBool(@sizeOf(@TypeOf(flag)) >= @sizeOf(@TypeOf(__KEY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking flag with ~__KEY_FLAG\"");
                    }
                    flag &= ~@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG)));
                }
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                if ((flag & @as(u32, __ARRAY_FLAG)) != 0) {
                    iter.*.state |= @bitCast(@as(c_int, __PREV_ARRAY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__PREV_ARRAY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __PREV_ARRAY_FLAG))))))) == __PREV_ARRAY_FLAG) else @intFromBool(@sizeOf(@TypeOf(iter.*.state)) >= @sizeOf(@TypeOf(__PREV_ARRAY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (iter->state) with ~( __PREV_ARRAY_FLAG)\"");
                    }
                    iter.*.state &= ~@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __PREV_ARRAY_FLAG)));
                }
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if (@as(c_ulong, (iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))) < (@sizeOf(@TypeOf(array_stack)) / @sizeOf(@TypeOf(array_stack[@as(c_int, 0)])))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                value.* = iter.*.cur;
                if ((blk: {
                    const ref = &iter.*.depth;
                    ref.* +%= 1;
                    break :blk ref.*;
                }) > @as(u32, 1)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                mask = @truncate(@as(c_ulonglong, 1) << @intCast(@as(c_ulonglong, (iter.*.depth -% @as(u32, 1)) & @as(u32, 63))));
                if ((flag & @as(u32, __ARRAY_FLAG)) != 0) {
                    array_stack[(iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))] |= mask;
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(mask == mask) else @intFromBool(@sizeOf(@TypeOf(array_stack[(iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))])) >= @sizeOf(@TypeOf(mask)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (array_stack[(iter->depth-1) >> 6]) with ~( mask)\"");
                    }
                    array_stack[(iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))] &= ~mask;
                }
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                err = __ERROR_TOO_DEEP_NESTING;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 8;
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
                iter.*.cur += 1;
                return 1;
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (((flag & @as(u32, __ARRAY_FLAG)) != 0) and (@as(u32, @bitCast(@as(c_int, @intFromBool(@as(c_int, cur) != @as(c_int, ']'))))) != 0)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                err = __ERROR_EXPECTED_ARRAY_CLOSE;
                {
                    sdl_pc = 2;
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
                if (!((flag & @as(u32, __ARRAY_FLAG)) != 0) and (@as(c_int, cur) != @as(c_int, '}'))) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                err = __ERROR_EXPECTED_OBJECT_CLOSE;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if ((flag & @as(u32, __KEY_FLAG)) != 0) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                err = __ERROR_EXPECTED_OBJECT_VALUE;
                {
                    sdl_pc = 2;
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
                iter.*.state = @as(u32, @bitCast(@as(c_int, __STRUCT | __SUB_FLAG))) | flag;
                if (iter.*.depth == @as(u32, 0)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if (iter.*.parent != null) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                iter.*.depth -%= 1;
                if (iter.*.depth == @as(u32, 0)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            67 => {
                iter.*.parent.*.cur = iter.*.cur;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                err = __ERROR_MISMATCHED_BRACKET;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            69 => {
                return 0;
            },
            70 => {
                if ((flag & @as(u32, __PREV_ARRAY_FLAG)) != 0) {
                    iter.*.state |= @bitCast(@as(c_int, __ARRAY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__ARRAY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG))))))) == __ARRAY_FLAG) else @intFromBool(@sizeOf(@TypeOf(iter.*.state)) >= @sizeOf(@TypeOf(__ARRAY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (iter->state) with ~( __ARRAY_FLAG)\"");
                    }
                    iter.*.state &= ~@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG)));
                }
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                if (@as(c_ulong, (iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))) < (@sizeOf(@TypeOf(array_stack)) / @sizeOf(@TypeOf(array_stack[@as(c_int, 0)])))) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            73 => {
                mask_2 = @truncate(@as(c_ulonglong, 1) << @intCast(@as(c_ulonglong, (iter.*.depth -% @as(u32, 1)) & @as(u32, 63))));
                if ((array_stack[(iter.*.depth -% @as(u32, 1)) >> @intCast(@as(u32, 6))] & mask_2) == mask_2) {
                    iter.*.state |= @bitCast(@as(c_int, __ARRAY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__ARRAY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG))))))) == __ARRAY_FLAG) else @intFromBool(@sizeOf(@TypeOf(iter.*.state)) >= @sizeOf(@TypeOf(__ARRAY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (iter->state) with ~( __ARRAY_FLAG)\"");
                    }
                    iter.*.state &= ~@as(@TypeOf(iter.*.state), @bitCast(@as(c_int, __ARRAY_FLAG)));
                }
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                err = __ERROR_TOO_DEEP_NESTING;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                err = __ERROR_ESCAPE_NOT_ALLOWED;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            77 => {
                if (!((@as(c_int, cur) >= @as(c_int, 32)) and (@as(c_int, cur) <= @as(c_int, 126)))) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                err = __ERROR_CHARACTERS_NOT_ALLOWED;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                if ((flag & @as(u32, __KEY_FLAG)) != 0) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                flag |= __SUB_FLAG;
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                if (!((flag & @as(u32, __ARRAY_FLAG)) != 0)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                if (!((flag & @as(u32, __KEY_FLAG)) != 0)) {
                    flag |= @bitCast(@as(c_int, __KEY_FLAG));
                } else {
                    comptime {
                        if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(__KEY_FLAG), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG))))))) == __KEY_FLAG) else @intFromBool(@sizeOf(@TypeOf(flag)) >= @sizeOf(@TypeOf(__KEY_FLAG)))) != 0)) @compileError("static assertion failed \"truncation problem when masking (flag) with ~( __KEY_FLAG)\"");
                    }
                    flag &= ~@as(@TypeOf(flag), @bitCast(@as(c_int, __KEY_FLAG)));
                }
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                value.* = iter.*.cur;
                iter.*.state = @as(u32, __BARE) | flag;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            87 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, '\x00') => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, '\t') => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(c_int, ' ') => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(c_int, '\r') => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(c_int, '\n') => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(c_int, '"') => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(c_int, '#') => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(c_int, ':') => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(c_int, ',') => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(c_int, '=') => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(c_int, ']') => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(c_int, '}') => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(c_int, '\\') => {
                        sdl_pc = 104;
                        continue;
                    },
                    else => {
                        sdl_pc = 105;
                        continue;
                    },
                }
            },
            88 => {
                err = __ERROR_CHARACTERS_NOT_ALLOWED;
                {
                    sdl_pc = 2;
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
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                iter.*.state = @as(u32, __STRUCT) | flag;
                if (iter.*.depth > @as(u32, 0)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                return @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(iter.*.cur) -% @intFromPtr(value.*))), @sizeOf(u8)));
            },
            104 => {
                err = __ERROR_ESCAPE_NOT_ALLOWED;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            105 => {
                if ((@as(c_int, cur) >= @as(c_int, 32)) and (@as(c_int, cur) <= @as(c_int, 126))) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            109 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, '\\') => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(c_int, '"') => {
                        sdl_pc = 112;
                        continue;
                    },
                    @as(c_int, 240)...@as(c_int, 247) => {
                        sdl_pc = 116;
                        continue;
                    },
                    @as(c_int, 224)...@as(c_int, 239) => {
                        sdl_pc = 117;
                        continue;
                    },
                    @as(c_int, 192)...@as(c_int, 223) => {
                        sdl_pc = 118;
                        continue;
                    },
                    else => {
                        sdl_pc = 119;
                        continue;
                    },
                }
            },
            110 => {
                err = __ERROR_CHARACTERS_NOT_ALLOWED;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            111 => {
                iter.*.state = @as(u32, __ESC) | flag;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            112 => {
                iter.*.state = @as(u32, __STRUCT) | flag;
                if (iter.*.depth > @as(u32, 0)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                return @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(blk: {
                    const ref = &iter.*.cur;
                    ref.* += 1;
                    break :blk ref.*;
                }) -% @intFromPtr(value.*))), @sizeOf(u8)));
            },
            116 => {
                utf8_remain += 1;
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                utf8_remain += 1;
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                utf8_remain += 1;
                iter.*.state = @as(u32, __UTF8) | flag;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            119 => {
                if ((@as(c_int, cur) >= @as(c_int, 32)) and (@as(c_int, cur) <= @as(c_int, 127))) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            123 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, 128)...@as(c_int, 191) => {
                        sdl_pc = 125;
                        continue;
                    },
                    else => {
                        sdl_pc = 129;
                        continue;
                    },
                }
            },
            124 => {
                err = __ERROR_CHARACTERS_NOT_ALLOWED;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            125 => {
                if ((blk: {
                    const ref = &utf8_remain;
                    ref.* -= 1;
                    break :blk ref.*;
                }) == @as(c_int, 0)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                iter.*.state = @as(u32, __STRING_1) | flag;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            130 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, '"') => {
                        sdl_pc = 132;
                        continue;
                    },
                    @as(c_int, '\\') => {
                        sdl_pc = 133;
                        continue;
                    },
                    @as(c_int, '/') => {
                        sdl_pc = 134;
                        continue;
                    },
                    @as(c_int, 'b') => {
                        sdl_pc = 135;
                        continue;
                    },
                    @as(c_int, 'f') => {
                        sdl_pc = 136;
                        continue;
                    },
                    @as(c_int, 'n') => {
                        sdl_pc = 137;
                        continue;
                    },
                    @as(c_int, 'r') => {
                        sdl_pc = 138;
                        continue;
                    },
                    @as(c_int, 't') => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(c_int, 'u') => {
                        sdl_pc = 140;
                        continue;
                    },
                    else => {
                        sdl_pc = 141;
                        continue;
                    },
                }
            },
            131 => {
                err = __ERROR_INVALID_ESCAPE;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                iter.*.state = @as(u32, __STRING_1) | flag;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            142 => {
                switch (@as(c_int, cur)) {
                    @as(c_int, '\n') => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(c_int, '\r') => {
                        sdl_pc = 145;
                        continue;
                    },
                    else => {
                        sdl_pc = 146;
                        continue;
                    },
                }
            },
            143 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                iter.*.state = @as(u32, __STRUCT) | flag;
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            147 => {
                err = __ERROR_INVALID_STATE;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            148 => {
                err = __ERROR_MISMATCHED_BRACKET;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            150 => {
                switch (iter.*.state & @as(u32, @bitCast(@as(c_int, ~__FLAGS)))) {
                    @as(u32, __STRING_1) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(u32, __UTF8) => {
                        sdl_pc = 153;
                        continue;
                    },
                    @as(u32, __ESC) => {
                        sdl_pc = 154;
                        continue;
                    },
                    @as(u32, __COMMENT) => {
                        sdl_pc = 155;
                        continue;
                    },
                    else => {
                        sdl_pc = 156;
                        continue;
                    },
                }
            },
            151 => {
                if (((iter.*.state & @as(u32, __SUB_FLAG)) != 0) and ((iter.*.state & @as(u32, __KEY_FLAG)) != 0)) {
                    sdl_pc = 157;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            152 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                err = __ERROR_UNFINISHED_STRING;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            155 => {
                return 0;
            },
            156 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            157 => {
                err = __ERROR_EXPECTED_OBJECT_VALUE;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                if ((iter.*.state & @as(u32, @bitCast(@as(c_int, ~__FLAGS)))) != @as(u32, __STRUCT)) {
                    sdl_pc = 160;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                iter.*.state = @as(u32, __STRUCT) | (iter.*.state & @as(u32, __FLAGS));
                return @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(iter.*.cur) -% @intFromPtr(value.*))), @sizeOf(u8)));
            },
            161 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                return 0;
            },
            163 => {
                if (iter.*.parent != null) {
                    sdl_pc = 164;
                    continue;
                } else {
                    sdl_pc = 165;
                    continue;
                }
            },
            164 => {
                if ((iter.*.parent.*.state & @as(u32, SPA_JSON_ERROR_FLAG)) != 0) {
                    sdl_pc = 166;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            165 => {
                return -@as(c_int, 1);
            },
            166 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                iter.*.parent.*.state = @bitCast(@as(c_int, err));
                iter.*.parent.*.cur = iter.*.cur;
                iter = iter.*.parent;
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn spa_json_is_container(val: [*c]const u8, len: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((len > @as(c_int, 0)) and ((@as(c_int, val.*) == @as(c_int, '{')) or (@as(c_int, val.*) == @as(c_int, '['))));
}
pub fn spa_json_is_string(val: [*c]const u8, len: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (len > @as(c_int, 1)) and (@as(c_int, val.*) == @as(c_int, '"'));
}
pub fn spa_json_parse_hex(p: [*c]const u8, num: c_int, res: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    res.* = 0;
    {
        i = 0;
        while (i < num) : (i += 1) {
            var v: u8 = p[@bitCast(@as(isize, @intCast(i)))];
            _ = &v;
            if ((@as(c_int, v) >= @as(c_int, '0')) and (@as(c_int, v) <= @as(c_int, '9'))) {
                v = @bitCast(@as(i8, @truncate(@as(c_int, v) - @as(c_int, '0'))));
            } else if ((@as(c_int, v) >= @as(c_int, 'a')) and (@as(c_int, v) <= @as(c_int, 'f'))) {
                v = @bitCast(@as(i8, @truncate((@as(c_int, v) - @as(c_int, 'a')) + @as(c_int, 10))));
            } else if ((@as(c_int, v) >= @as(c_int, 'A')) and (@as(c_int, v) <= @as(c_int, 'F'))) {
                v = @bitCast(@as(i8, @truncate((@as(c_int, v) - @as(c_int, 'A')) + @as(c_int, 10))));
            } else return -@as(c_int, 1);
            res.* = (res.* << @intCast(@as(u32, 4))) | @as(u32, @bitCast(@as(c_int, @as(c_int, v))));
        }
    }
    return 1;
}
pub fn spa_json_parse_stringn(val: [*c]const u8, len: c_int, arg_result: [*c]u8, arg_maxlen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var result = arg_result;
    _ = &result;
    var maxlen = arg_maxlen;
    _ = &maxlen;
    var p: [*c]const u8 = undefined;
    _ = &p;
    if (maxlen <= len) return -ENOSPC;
    if (!spa_json_is_string(val, len)) {
        if (result != val) {
            _ = memmove(@ptrCast(@alignCast(result)), @ptrCast(@alignCast(val)), @bitCast(@as(c_long, len)));
        }
        result += @as(usize, @bitCast(@as(isize, @intCast(len))));
    } else {
        {
            p = val + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            while (p < (val + @as(usize, @bitCast(@as(isize, @intCast(len)))))) : (p += 1) {
                if (@as(c_int, p.*) == @as(c_int, '\\')) {
                    p += 1;
                    if (@as(c_int, p.*) == @as(c_int, 'n')) {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = '\n';
                    } else if (@as(c_int, p.*) == @as(c_int, 'r')) {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = '\r';
                    } else if (@as(c_int, p.*) == @as(c_int, 'b')) {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = '\x08';
                    } else if (@as(c_int, p.*) == @as(c_int, 't')) {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = '\t';
                    } else if (@as(c_int, p.*) == @as(c_int, 'f')) {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = '\x0c';
                    } else if (@as(c_int, p.*) == @as(c_int, 'u')) {
                        var prefix: [4]u8 = [4]u8{
                            0,
                            192,
                            224,
                            240,
                        };
                        _ = &prefix;
                        var idx: u32 = undefined;
                        _ = &idx;
                        var n: u32 = undefined;
                        _ = &n;
                        var v: u32 = undefined;
                        _ = &v;
                        var cp: u32 = undefined;
                        _ = &cp;
                        var enc: [3]u32 = [3]u32{
                            128,
                            2048,
                            65536,
                        };
                        _ = &enc;
                        if ((@divExact(@as(c_long, @bitCast(@intFromPtr(val + @as(usize, @bitCast(@as(isize, @intCast(len))))) -% @intFromPtr(p))), @sizeOf(u8)) < @as(c_long, 5)) or (spa_json_parse_hex(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), 4, &cp) < @as(c_int, 0))) {
                            (blk: {
                                const ref = &result;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = p.*;
                            continue;
                        }
                        p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        if ((cp >= @as(u32, 55296)) and (cp <= @as(u32, 56319))) {
                            if ((((((@divExact(@as(c_long, @bitCast(@intFromPtr(val + @as(usize, @bitCast(@as(isize, @intCast(len))))) -% @intFromPtr(p))), @sizeOf(u8)) < @as(c_long, 7)) or (@as(c_int, p[@as(c_int, 1)]) != @as(c_int, '\\'))) or (@as(c_int, p[@as(c_int, 2)]) != @as(c_int, 'u'))) or (spa_json_parse_hex(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3))))), 4, &v) < @as(c_int, 0))) or (v < @as(u32, 56320))) or (v > @as(u32, 57343))) continue;
                            p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
                            cp = @as(u32, 65536) +% (((cp & @as(u32, 1023)) << @intCast(@as(u32, 10))) | (v & @as(u32, 1023)));
                        } else if ((cp >= @as(u32, 56320)) and (cp <= @as(u32, 57343))) continue;
                        {
                            idx = 0;
                            while (idx < @as(u32, 3)) : (idx +%= 1) if (cp < enc[idx]) break;
                        }
                        {
                            n = idx;
                            while (n > @as(u32, 0)) : ({
                                n -%= 1;
                                cp >>= @intCast(@as(u32, 6));
                            }) {
                                result[n] = @truncate((cp | @as(u32, 128)) & @as(u32, 191));
                            }
                        }
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate((cp | @as(u32, @bitCast(@as(c_int, @as(c_int, prefix[idx]))))) & @as(u32, 255));
                        result += idx;
                    } else {
                        (blk: {
                            const ref = &result;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = p.*;
                    }
                } else if (@as(c_int, p.*) == @as(c_int, '"')) {
                    break;
                } else {
                    (blk: {
                        const ref = &result;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = p.*;
                }
            }
        }
    }
    result.* = '\x00';
    return 1;
}
pub const struct_spa_command_body = extern struct {
    body: struct_spa_pod_object_body = @import("std").mem.zeroes(struct_spa_pod_object_body),
};
pub const struct_spa_command = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    body: struct_spa_command_body = @import("std").mem.zeroes(struct_spa_command_body),
};
pub const struct_pw_main_loop = opaque {
};
pub const struct_pw_node = opaque {
};
pub const enum_pw_node_state = c_int;
pub const struct_pw_node_info = extern struct {
    id: u32 = 0,
    max_input_ports: u32 = 0,
    max_output_ports: u32 = 0,
    change_mask: u64 = 0,
    n_input_ports: u32 = 0,
    n_output_ports: u32 = 0,
    state: enum_pw_node_state = @import("std").mem.zeroes(enum_pw_node_state),
    @"error": [*c]const u8 = null,
    props: [*c]struct_spa_dict = null,
    params: [*c]struct_spa_param_info = null,
    n_params: u32 = 0,
};
pub const struct_pw_node_events = extern struct {
    version: u32 = 0,
    info: ?*const fn (data: ?*anyopaque, info: [*c]const struct_pw_node_info) callconv(.c) void = null,
    param: ?*const fn (data: ?*anyopaque, seq: c_int, id: u32, index: u32, next: u32, param: [*c]const struct_spa_pod) callconv(.c) void = null,
};
pub const struct_pw_node_methods = extern struct {
    version: u32 = 0,
    add_listener: ?*const fn (object: ?*anyopaque, listener: [*c]struct_spa_hook, events: [*c]const struct_pw_node_events, data: ?*anyopaque) callconv(.c) c_int = null,
    subscribe_params: ?*const fn (object: ?*anyopaque, ids: [*c]u32, n_ids: u32) callconv(.c) c_int = null,
    enum_params: ?*const fn (object: ?*anyopaque, seq: c_int, id: u32, start: u32, num: u32, filter: [*c]const struct_spa_pod) callconv(.c) c_int = null,
    set_param: ?*const fn (object: ?*anyopaque, id: u32, flags: u32, param: [*c]const struct_spa_pod) callconv(.c) c_int = null,
    send_command: ?*const fn (object: ?*anyopaque, command: [*c]const struct_spa_command) callconv(.c) c_int = null,
};
pub fn pw_node_enum_params(object: ?*struct_pw_node, seq: c_int, id: u32, start: u32, num: u32, filter: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return blk: {
        var _res: c_int = -EOPNOTSUPP;
        _ = &_res;
        var _i: [*c]struct_spa_interface = @ptrCast(@alignCast(object));
        _ = &_i;
        {
            var _f: [*c]const struct_pw_node_methods = @ptrCast(@alignCast((&_i.*.cb).*.funcs));
            _ = &_f;
            if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.enum_params != null)))), @as(c_long, 1)) != 0) {
                _res = _f.*.enum_params.?((&_i.*.cb).*.data, seq, id, start, num, filter);
            }
            _ = &_res;
        }
        break :blk _res;
    };
}
pub const PW_STREAM_STATE_ERROR: c_int = -1;
pub const PW_STREAM_STATE_STREAMING: c_int = 3;
pub const enum_pw_stream_state = c_int;
pub const struct_pw_stream_control = extern struct {
    name: [*c]const u8 = null,
    flags: u32 = 0,
    def: f32 = 0,
    min: f32 = 0,
    max: f32 = 0,
    values: [*c]f32 = null,
    n_values: u32 = 0,
    max_values: u32 = 0,
};
pub const struct_pw_stream_events = extern struct {
    version: u32 = 0,
    destroy: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    state_changed: ?*const fn (data: ?*anyopaque, old: enum_pw_stream_state, state: enum_pw_stream_state, @"error": [*c]const u8) callconv(.c) void = null,
    control_info: ?*const fn (data: ?*anyopaque, id: u32, control: [*c]const struct_pw_stream_control) callconv(.c) void = null,
    io_changed: ?*const fn (data: ?*anyopaque, id: u32, area: ?*anyopaque, size: u32) callconv(.c) void = null,
    param_changed: ?*const fn (data: ?*anyopaque, id: u32, param: [*c]const struct_spa_pod) callconv(.c) void = null,
    add_buffer: ?*const fn (data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void = null,
    remove_buffer: ?*const fn (data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void = null,
    process: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    drained: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
    command: ?*const fn (data: ?*anyopaque, command: [*c]const struct_spa_command) callconv(.c) void = null,
    trigger_done: ?*const fn (data: ?*anyopaque) callconv(.c) void = null,
};
pub const PW_STREAM_FLAG_AUTOCONNECT: c_int = 1;
pub const PW_STREAM_FLAG_MAP_BUFFERS: c_int = 4;
pub const enum_pw_stream_flags = c_uint;
pub const struct_pw_metadata_events = extern struct {
    version: u32 = 0,
    property: ?*const fn (data: ?*anyopaque, subject: u32, key: [*c]const u8, @"type": [*c]const u8, value: [*c]const u8) callconv(.c) c_int = null,
};
pub const struct_spa_pod_frame = extern struct {
    pod: struct_spa_pod = @import("std").mem.zeroes(struct_spa_pod),
    parent: [*c]struct_spa_pod_frame = null,
    offset: u32 = 0,
    flags: u32 = 0,
};
pub fn spa_pod_type_size(arg_type: u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(u32, SPA_TYPE_None) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bytes) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Struct) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Pod) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, SPA_TYPE_String) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bool) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Int) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Id) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Long) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Float) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Double) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Rectangle) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Fraction) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Bitmap) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Array) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Pointer) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Fd) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Choice) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return 0;
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
                return 0;
            },
            6 => {
                return 1;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return @truncate(@sizeOf(i32));
            },
            9 => {
                return @truncate(@sizeOf(u32));
            },
            10 => {
                return @truncate(@sizeOf(i64));
            },
            11 => {
                return @truncate(@sizeOf(f32));
            },
            12 => {
                return @truncate(@sizeOf(f64));
            },
            13 => {
                return @truncate(@sizeOf(struct_spa_rectangle));
            },
            14 => {
                return @truncate(@sizeOf(struct_spa_fraction));
            },
            15 => {
                return @truncate(@sizeOf(u8));
            },
            16 => {
                return @truncate(@sizeOf(struct_spa_pod_array_body));
            },
            17 => {
                return @truncate(@sizeOf(struct_spa_pod_object_body));
            },
            18 => {
                return @truncate(@sizeOf(struct_spa_pod_sequence_body));
            },
            19 => {
                return @truncate(@sizeOf(struct_spa_pod_pointer_body));
            },
            20 => {
                return @truncate(@sizeOf(i64));
            },
            21 => {
                return @truncate(@sizeOf(struct_spa_pod_choice_body));
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_choice_n_values(choice_type: u32, min: [*c]u32, max: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (choice_type) {
                    @as(u32, SPA_CHOICE_Enum) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Range) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Step) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_None) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, SPA_CHOICE_Flags) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                return 1;
            },
            2 => {
                min.* = 2;
                max.* = @as(c_uint, 4294967295);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                min.* = blk: {
                    const tmp = @as(u32, 3);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                min.* = blk: {
                    const tmp = @as(u32, 4);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
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
                min.* = blk: {
                    const tmp = @as(u32, 1);
                    max.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                min.* = 1;
                max.* = @as(c_uint, 4294967295);
                return 0;
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_is_none(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_None)))));
}
pub fn spa_pod_is_bool(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Bool))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(i32)));
}
pub fn spa_pod_body_get_bool(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]bool) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_bool(pod) != 0)) return -EINVAL;
    value.* = !!(__builtin.atomic_load(@as([*c]const i32, @ptrCast(@alignCast(body))), __ATOMIC_RELAXED) != 0);
    return 0;
}
pub fn spa_pod_is_id(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Id))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(u32)));
}
pub fn spa_pod_body_get_id(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_id(pod) != 0)) return -EINVAL;
    value.* = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*, __ATOMIC_RELAXED);
    return 0;
}
pub fn spa_pod_is_int(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Int))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(i32)));
}
pub fn spa_pod_body_get_int(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]i32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_int(pod) != 0)) return -EINVAL;
    value.* = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*, __ATOMIC_RELAXED);
    return 0;
}
pub fn spa_pod_is_long(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Long))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(i64)));
}
// /usr/include/spa-0.2/spa/utils/defs.h:245:21: warning: TODO asm stmt

// /usr/include/spa-0.2/spa/pod/body.h:181:22: warning: unable to translate function, demoted to extern
pub fn spa_pod_body_get_long(arg_pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, arg_value: [*c]i64) callconv(.c) c_int {
    if (spa_pod_is_long(arg_pod) == 0) return -EINVAL;
    asm volatile ("" ::: .{ .memory = true });
    _ = memcpy(@ptrCast(arg_value), arg_body, @sizeOf(i64));
    asm volatile ("" ::: .{ .memory = true });
    return 0;
}

pub fn spa_pod_is_float(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Float))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(f32)));
}
// /usr/include/spa-0.2/spa/utils/defs.h:245:21: warning: TODO asm stmt

// /usr/include/spa-0.2/spa/pod/body.h:197:22: warning: unable to translate function, demoted to extern
pub fn spa_pod_body_get_float(arg_pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, arg_value: [*c]f32) callconv(.c) c_int {
    if (spa_pod_is_float(arg_pod) == 0) return -EINVAL;
    asm volatile ("" ::: .{ .memory = true });
    _ = memcpy(@ptrCast(arg_value), arg_body, @sizeOf(f32));
    asm volatile ("" ::: .{ .memory = true });
    return 0;
}

pub fn spa_pod_is_double(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Double))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(f64)));
}
// /usr/include/spa-0.2/spa/utils/defs.h:245:21: warning: TODO asm stmt

// /usr/include/spa-0.2/spa/pod/body.h:212:22: warning: unable to translate function, demoted to extern
pub fn spa_pod_body_get_double(arg_pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, arg_value: [*c]f64) callconv(.c) c_int {
    if (spa_pod_is_double(arg_pod) == 0) return -EINVAL;
    asm volatile ("" ::: .{ .memory = true });
    _ = memcpy(@ptrCast(arg_value), arg_body, @sizeOf(f64));
    asm volatile ("" ::: .{ .memory = true });
    return 0;
}

pub fn spa_pod_is_string(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_String))))) and (pod.*.size >= @as(u32, @bitCast(@as(c_int, @as(c_int, 1))))));
}
pub fn spa_pod_body_get_string(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c][*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var s: [*c]const u8 = undefined;
    _ = &s;
    if (!(spa_pod_is_string(pod) != 0)) return -EINVAL;
    s = @ptrCast(@alignCast(body));
    if (@as(c_int, @as([*c]const volatile u8, @ptrCast(@alignCast(s)))[pod.*.size -% @as(u32, 1)]) != @as(c_int, '\x00')) return -EINVAL;
    value.* = s;
    return 0;
}
// /usr/include/spa-0.2/spa/utils/defs.h:245:21: warning: TODO asm stmt

// /usr/include/spa-0.2/spa/pod/body.h:240:22: warning: unable to translate function, demoted to extern
pub fn spa_pod_body_copy_string(arg_pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, arg_dest: [*c]u8, arg_maxlen: usize) callconv(.c) c_int {
    var string: [*c]const u8 = undefined;
    if (spa_pod_body_get_string(arg_pod, arg_body, &string) < 0 or arg_maxlen < 1) return -EINVAL;
    if (arg_pod.*.size > arg_maxlen) { arg_dest[0] = 0; return -ENOSPC; }
    asm volatile ("" ::: .{ .memory = true });
    _ = strncpy(arg_dest, string, arg_maxlen - 1);
    asm volatile ("" ::: .{ .memory = true });
    arg_dest[arg_maxlen - 1] = 0;
    return 0;
}

pub fn spa_pod_is_bytes(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Bytes)))));
}
pub fn spa_pod_body_get_bytes(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]?*const anyopaque, len: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_bytes(pod) != 0)) return -EINVAL;
    value.* = body;
    len.* = pod.*.size;
    return 0;
}
pub fn spa_pod_is_pointer(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Pointer))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_pointer_body)));
}
pub fn spa_pod_body_get_pointer(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, arg_type: [*c]u32, value: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var b: struct_spa_pod_pointer_body = undefined;
    _ = &b;
    if (!(spa_pod_is_pointer(pod) != 0)) return -EINVAL;
    (&b).*.type = __builtin.atomic_load(&@as(@TypeOf(&b), @ptrCast(@alignCast(@constCast(body)))).*.type, __ATOMIC_RELAXED);
    (&b).*.value = __builtin.atomic_load(&@as(@TypeOf(&b), @ptrCast(@alignCast(@constCast(body)))).*.value, __ATOMIC_RELAXED);
    @"type".* = b.type;
    value.* = b.value;
    return 0;
}
pub fn spa_pod_is_fd(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Fd))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(i64)));
}
// /usr/include/spa-0.2/spa/utils/defs.h:245:21: warning: TODO asm stmt

// /usr/include/spa-0.2/spa/pod/body.h:297:22: warning: unable to translate function, demoted to extern
pub fn spa_pod_body_get_fd(arg_pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, arg_value: [*c]i64) callconv(.c) c_int {
    if (spa_pod_is_fd(arg_pod) == 0) return -EINVAL;
    asm volatile ("" ::: .{ .memory = true });
    _ = memcpy(@ptrCast(arg_value), arg_body, @sizeOf(i64));
    asm volatile ("" ::: .{ .memory = true });
    return 0;
}

pub fn spa_pod_is_rectangle(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Rectangle))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_rectangle)));
}
pub fn spa_pod_body_get_rectangle(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]struct_spa_rectangle) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_rectangle(pod) != 0)) return -EINVAL;
    value.*.width = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*.width, __ATOMIC_RELAXED);
    value.*.height = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*.height, __ATOMIC_RELAXED);
    return 0;
}
pub fn spa_pod_is_fraction(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Fraction))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_fraction)));
}
pub fn spa_pod_body_get_fraction(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c]struct_spa_fraction) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_fraction(pod) != 0)) return -EINVAL;
    value.*.num = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*.num, __ATOMIC_RELAXED);
    value.*.denom = __builtin.atomic_load(&@as(@TypeOf(value), @ptrCast(@alignCast(@constCast(body)))).*.denom, __ATOMIC_RELAXED);
    return 0;
}
pub fn spa_pod_is_bitmap(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Bitmap))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(u8)));
}
pub fn spa_pod_body_get_bitmap(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, value: [*c][*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_bitmap(pod) != 0)) return -EINVAL;
    value.* = @ptrCast(@alignCast(body));
    return 0;
}
pub fn spa_pod_is_array(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Array))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_array_body)));
}
pub fn spa_pod_body_get_array(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, arr: [*c]struct_spa_pod_array, arr_body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_array(pod) != 0)) return -EINVAL;
    arr.*.pod = pod.*;
    (&arr.*.body.child).*.type = __builtin.atomic_load(&@as(@TypeOf(&arr.*.body.child), @ptrCast(@alignCast(@constCast(body)))).*.type, __ATOMIC_RELAXED);
    (&arr.*.body.child).*.size = __builtin.atomic_load(&@as(@TypeOf(&arr.*.body.child), @ptrCast(@alignCast(@constCast(body)))).*.size, __ATOMIC_RELAXED);
    arr_body.* = @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod_array_body))))))))));
    return 0;
}
pub fn spa_pod_array_body_get_values(arr: [*c]const struct_spa_pod_array, body: ?*const anyopaque, n_values: [*c]u32, val_size: [*c]u32, val_type: [*c]u32) callconv(.c) ?*const anyopaque {
    @setEvalBranchQuota(100000);
    var child_size: u32 = arr.*.body.child.size;
    _ = &child_size;
    n_values.* = @truncate(if (child_size != 0) (@as(c_ulong, arr.*.pod.size) -% @sizeOf(@TypeOf(arr.*.body))) / @as(c_ulong, child_size) else @as(c_ulong, 0));
    val_size.* = child_size;
    val_type.* = arr.*.body.child.type;
    if (val_size.* < spa_pod_type_size(val_type.*)) {
        n_values.* = 0;
    }
    return body;
}
pub fn spa_pod_body_get_array_values(pod: [*c]const struct_spa_pod, arg_body: ?*const anyopaque, n_values: [*c]u32, val_size: [*c]u32, val_type: [*c]u32) callconv(.c) ?*const anyopaque {
    @setEvalBranchQuota(100000);
    var body = arg_body;
    _ = &body;
    var arr: struct_spa_pod_array = undefined;
    _ = &arr;
    if (spa_pod_body_get_array(pod, body, &arr, &body) < @as(c_int, 0)) return null;
    return spa_pod_array_body_get_values(&arr, body, n_values, val_size, val_type);
}
pub fn spa_pod_is_choice(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Choice))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_choice_body)));
}
pub fn spa_pod_body_get_choice(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, choice: [*c]struct_spa_pod_choice, choice_body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_choice(pod) != 0)) return -EINVAL;
    choice.*.pod = pod.*;
    (&choice.*.body).*.type = __builtin.atomic_load(&@as(@TypeOf(&choice.*.body), @ptrCast(@alignCast(@constCast(body)))).*.type, __ATOMIC_RELAXED);
    (&choice.*.body).*.flags = __builtin.atomic_load(&@as(@TypeOf(&choice.*.body), @ptrCast(@alignCast(@constCast(body)))).*.flags, __ATOMIC_RELAXED);
    (&choice.*.body).*.child.size = __builtin.atomic_load(&@as(@TypeOf(&choice.*.body), @ptrCast(@alignCast(@constCast(body)))).*.child.size, __ATOMIC_RELAXED);
    (&choice.*.body).*.child.type = __builtin.atomic_load(&@as(@TypeOf(&choice.*.body), @ptrCast(@alignCast(@constCast(body)))).*.child.type, __ATOMIC_RELAXED);
    choice_body.* = @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod_choice_body))))))))));
    return 0;
}
pub fn spa_pod_choice_body_get_values(pod: [*c]const struct_spa_pod_choice, body: ?*const anyopaque, n_values: [*c]u32, choice: [*c]u32, val_size: [*c]u32, val_type: [*c]u32) callconv(.c) ?*const anyopaque {
    @setEvalBranchQuota(100000);
    var child_size: u32 = pod.*.body.child.size;
    _ = &child_size;
    var min: u32 = undefined;
    _ = &min;
    var max: u32 = undefined;
    _ = &max;
    val_size.* = child_size;
    val_type.* = pod.*.body.child.type;
    n_values.* = @truncate(if (child_size != 0) (@as(c_ulong, pod.*.pod.size) -% @sizeOf(@TypeOf(pod.*.body))) / @as(c_ulong, child_size) else @as(c_ulong, 0));
    choice.* = pod.*.body.type;
    _ = spa_pod_choice_n_values(choice.*, &min, &max);
    if ((n_values.* < min) or (val_size.* < spa_pod_type_size(val_type.*))) {
        n_values.* = 0;
    } else if (n_values.* > max) {
        n_values.* = max;
    }
    return body;
}
pub fn spa_pod_is_struct(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Struct)))));
}
pub fn spa_pod_is_object(pod: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((@as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size < (@as(c_uint, 1) << @intCast(@as(c_uint, 20)))) and (pod.*.type == @as(u32, @bitCast(@as(c_int, SPA_TYPE_Object))))) and (@as(c_ulong, pod.*.size) >= @sizeOf(struct_spa_pod_object_body)));
}
pub fn spa_pod_body_get_object(pod: [*c]const struct_spa_pod, body: ?*const anyopaque, object: [*c]struct_spa_pod_object, object_body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_object(pod) != 0)) return -EINVAL;
    object.*.pod = pod.*;
    (&object.*.body).*.type = __builtin.atomic_load(&@as(@TypeOf(&object.*.body), @ptrCast(@alignCast(@constCast(body)))).*.type, __ATOMIC_RELAXED);
    (&object.*.body).*.id = __builtin.atomic_load(&@as(@TypeOf(&object.*.body), @ptrCast(@alignCast(@constCast(body)))).*.id, __ATOMIC_RELAXED);
    object_body.* = @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod_object_body))))))))));
    return 0;
}
pub const struct_spa_pod_parser_state = extern struct {
    offset: u32 = 0,
    flags: u32 = 0,
    frame: [*c]struct_spa_pod_frame = null,
};
pub const struct_spa_pod_parser = extern struct {
    data: ?*const anyopaque = null,
    size: u32 = 0,
    _padding: u32 = 0,
    state: struct_spa_pod_parser_state = @import("std").mem.zeroes(struct_spa_pod_parser_state),
};
pub fn spa_pod_parser_init(parser: [*c]struct_spa_pod_parser, data: ?*const anyopaque, size: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    parser.* = @as(struct_spa_pod_parser, struct_spa_pod_parser{
        .data = data,
        .size = size,
        ._padding = 0,
        .state = struct_spa_pod_parser_state{
            .offset = 0,
            .flags = 0,
            .frame = null,
        },
    });
}
pub fn spa_pod_parser_init_pod_body(parser: [*c]struct_spa_pod_parser, pod: [*c]const struct_spa_pod, body: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    spa_pod_parser_init(parser, @ptrCast(@alignCast(@as([*c]const struct_spa_pod, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(-%@sizeOf(struct_spa_pod)))))))))))), @truncate(@as(c_ulong, pod.*.size) +% @sizeOf(struct_spa_pod)));
}
pub fn spa_pod_parser_read_header(arg_parser: [*c]struct_spa_pod_parser, arg_offset: u32, arg_size: u32, arg_header: ?*anyopaque, arg_header_size: u32, arg_pod_offset: u32, arg_body: [*c]?*const anyopaque) callconv(.c) c_int {
    const long_offset: u64 = @as(u64, arg_offset) + arg_header_size;
    if (long_offset <= arg_size and (arg_offset & 7) == 0) {
        asm volatile ("" ::: .{ .memory = true });
        _ = memcpy(arg_header, @ptrFromInt(@intFromPtr(arg_parser.*.data) + arg_offset), arg_header_size);
        asm volatile ("" ::: .{ .memory = true });
        const pod: *align(1) const struct_spa_pod = @ptrFromInt(@intFromPtr(arg_header) + arg_pod_offset);
        const rounded_size = (@as(u64, pod.*.size) + 7) & ~@as(u64, 7);
        if (long_offset + rounded_size <= arg_size) {
            arg_body.* = @ptrFromInt(@intFromPtr(arg_parser.*.data) + long_offset);
            return 0;
        }
    }
    return -EPIPE;
}

pub fn spa_pod_parser_push(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame, pod: [*c]const struct_spa_pod, offset: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    frame.*.pod = pod.*;
    frame.*.offset = offset;
    frame.*.parent = parser.*.state.frame;
    frame.*.flags = parser.*.state.flags;
    parser.*.state.frame = frame;
}
pub fn spa_pod_parser_get_header(parser: [*c]struct_spa_pod_parser, header: ?*anyopaque, header_size: u32, pod_offset: u32, body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var f: [*c]struct_spa_pod_frame = parser.*.state.frame;
    _ = &f;
    var size: u32 = @truncate(if (f != null) @as(u64, f.*.offset) +% (@sizeOf(struct_spa_pod) +% @as(u64, (&f.*.pod).*.size)) else @as(u64, parser.*.size));
    _ = &size;
    return spa_pod_parser_read_header(parser, parser.*.state.offset, size, header, header_size, pod_offset, body);
}
pub fn spa_pod_parser_current_body(parser: [*c]struct_spa_pod_parser, pod: [*c]struct_spa_pod, body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_pod_parser_get_header(parser, @ptrCast(@alignCast(pod)), @truncate(@sizeOf(struct_spa_pod)), 0, body);
}
pub fn spa_pod_parser_advance(parser: [*c]struct_spa_pod_parser, pod: [*c]const struct_spa_pod) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        const ref = &parser.*.state.offset;
        ref.* = @truncate(@as(u64, ref.*) +% ((((@sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size)) -% @as(u64, 1)) | @as(@TypeOf(@sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(pod)))).*.size)), @bitCast(@as(c_long, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(u64, 1)));
    }
}
pub fn spa_pod_parser_next_body(parser: [*c]struct_spa_pod_parser, pod: [*c]struct_spa_pod, body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (spa_pod_parser_current_body(parser, pod, body) < @as(c_int, 0)) return -EINVAL;
    spa_pod_parser_advance(parser, pod);
    return 0;
}
pub fn spa_pod_parser_restart(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame) callconv(.c) void {
    @setEvalBranchQuota(100000);
    parser.*.state.offset = frame.*.offset;
}
pub fn spa_pod_parser_unpush(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame) callconv(.c) void {
    @setEvalBranchQuota(100000);
    spa_pod_parser_restart(parser, frame);
    parser.*.state.frame = frame.*.parent;
}
pub fn spa_pod_parser_pop(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    spa_pod_parser_unpush(parser, frame);
    spa_pod_parser_advance(parser, &frame.*.pod);
    return 0;
}
pub fn spa_pod_parser_push_object_body(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame, object: [*c]struct_spa_pod_object, object_body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var pod: struct_spa_pod = undefined;
    _ = &pod;
    var body: ?*const anyopaque = undefined;
    _ = &body;
    if ((blk: {
        const tmp = spa_pod_parser_current_body(parser, &pod, &body);
        res = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) return res;
    if ((blk: {
        const tmp = spa_pod_body_get_object(&pod, body, object, object_body);
        res = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) return res;
    spa_pod_parser_push(parser, frame, &pod, parser.*.state.offset);
    {
        const ref = &parser.*.state.offset;
        ref.* = @truncate(@as(c_ulong, ref.*) +% @sizeOf(struct_spa_pod_object));
    }
    return 0;
}
pub fn spa_pod_parser_push_object(parser: [*c]struct_spa_pod_parser, frame: [*c]struct_spa_pod_frame, arg_type: u32, id: [*c]u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var res: c_int = undefined;
    _ = &res;
    var obj: struct_spa_pod_object = undefined;
    _ = &obj;
    var obj_body: ?*const anyopaque = undefined;
    _ = &obj_body;
    if ((blk: {
        const tmp = spa_pod_parser_push_object_body(parser, frame, &obj, &obj_body);
        res = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) return res;
    if (@"type" != obj.body.type) {
        spa_pod_parser_unpush(parser, frame);
        return -EPROTO;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(id))) != @as(?*anyopaque, null)) {
        id.* = obj.body.id;
    }
    return 0;
}
pub fn spa_pod_parser_get_prop_body(parser: [*c]struct_spa_pod_parser, prop: [*c]struct_spa_pod_prop, body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    if ((blk: {
        const tmp = spa_pod_parser_get_header(parser, @ptrCast(@alignCast(prop)), @truncate(@sizeOf(struct_spa_pod_prop)), @intFromPtr(&@as(*allowzero struct_spa_pod_prop, @ptrFromInt(0)).value), body);
        res = tmp;
        break :blk tmp;
    }) >= @as(c_int, 0)) {
        {
            const ref = &parser.*.state.offset;
            ref.* = @truncate(@as(c_ulong, ref.*) +% ((((@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, prop.*.value.size)) -% @as(c_ulong, 1)) | @as(@TypeOf(@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, prop.*.value.size)), @bitCast(@as(c_long, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(c_ulong, 1)));
        }
    }
    return res;
}
pub fn spa_pod_parser_object_find_prop(parser: [*c]struct_spa_pod_parser, key: u32, prop: [*c]struct_spa_pod_prop, body: [*c]?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var start_offset: u32 = undefined;
    _ = &start_offset;
    var f: [*c]struct_spa_pod_frame = parser.*.state.frame;
    _ = &f;
    if ((@as(?*anyopaque, @ptrCast(@alignCast(f))) == @as(?*anyopaque, null)) or (f.*.pod.type != @as(u32, SPA_TYPE_Object))) return -EINVAL;
    start_offset = f.*.offset;
    while (spa_pod_parser_get_prop_body(parser, prop, body) >= @as(c_int, 0)) {
        if (prop.*.key == key) return 0;
    }
    spa_pod_parser_restart(parser, f);
    {
        const ref = &parser.*.state.offset;
        ref.* = @truncate(@as(c_ulong, ref.*) +% @sizeOf(struct_spa_pod_object));
    }
    while ((parser.*.state.offset != start_offset) and (spa_pod_parser_get_prop_body(parser, prop, body) >= @as(c_int, 0))) {
        if (prop.*.key == key) return 0;
    }
    body.* = null;
    return -ENOENT;
}
pub fn spa_pod_parser_getv(parser: [*c]struct_spa_pod_parser, args: [*c]struct___va_list_tag_2) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var f: [*c]struct_spa_pod_frame = parser.*.state.frame;
    _ = &f;
    var count: c_int = 0;
    _ = &count;
    if (@as(?*anyopaque, @ptrCast(@alignCast(f))) == @as(?*anyopaque, null)) return -EINVAL;
    while (true) {
        var optional: bool = undefined;
        _ = &optional;
        var pod: struct_spa_pod = struct_spa_pod{
            .size = 0,
            .type = SPA_TYPE_None,
        };
        _ = &pod;
        var body: ?*const anyopaque = null;
        _ = &body;
        var format: [*c]const u8 = undefined;
        _ = &format;
        var prop: struct_spa_pod_prop = undefined;
        _ = &prop;
        if (f.*.pod.type == @as(u32, SPA_TYPE_Object)) {
            var key: u32 = __builtin.va_arg(args, u32);
            _ = &key;
            var flags: [*c]u32 = null;
            _ = &flags;
            if (key == @as(u32, 0)) break;
            if (key == @as(c_uint, 4294967295)) {
                key = __builtin.va_arg(args, u32);
                flags = __builtin.va_arg(args, [*c]u32);
            }
            if (spa_pod_parser_object_find_prop(parser, key, &prop, &body) >= @as(c_int, 0)) {
                pod = prop.value;
                if (flags != null) {
                    flags.* = prop.flags;
                }
            }
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
            const tmp = __builtin.va_arg(args, [*c]u8);
            format = tmp;
            break :blk tmp;
        })))) == @as(?*anyopaque, null)) break;
        if (f.*.pod.type == @as(u32, SPA_TYPE_Struct)) {
            _ = spa_pod_parser_next_body(parser, &pod, &body);
        }
        if (blk: {
            const tmp = @as(c_int, format.*) == @as(c_int, '?');
            optional = tmp;
            break :blk tmp;
        }) {
            format += 1;
        }
        if ((blk: {
            var res: c_int = 0;
            _ = &res;
            var choice: struct_spa_pod_choice = undefined;
            _ = &choice;
            var _p: [*c]const struct_spa_pod = &pod;
            _ = &_p;
            var _b: ?*const anyopaque = body;
            _ = &_b;
            if (((_p.*.type == @as(u32, SPA_TYPE_Choice)) and (@as(c_int, format.*) != @as(c_int, 'V'))) and (@as(c_int, format.*) != @as(c_int, 'W'))) {
                if ((spa_pod_body_get_choice(_p, _b, &choice, &_b) >= @as(c_int, 0)) and (choice.body.type == @as(u32, SPA_CHOICE_None))) {
                    _p = &choice.body.child;
                }
            }
            blk_1: {
                switch (@as(c_int, format.*)) {
                    @as(c_int, 'b') => {
                        {
                            var val: [*c]bool = __builtin.va_arg(args, [*c]bool);
                            _ = &val;
                            res = spa_pod_body_get_bool(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'I') => {
                        {
                            var val: [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &val;
                            res = spa_pod_body_get_id(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'i') => {
                        {
                            var val: [*c]i32 = __builtin.va_arg(args, [*c]i32);
                            _ = &val;
                            res = spa_pod_body_get_int(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'l') => {
                        {
                            var val: [*c]i64 = __builtin.va_arg(args, [*c]i64);
                            _ = &val;
                            res = spa_pod_body_get_long(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'f') => {
                        {
                            var val: [*c]f32 = __builtin.va_arg(args, [*c]f32);
                            _ = &val;
                            res = spa_pod_body_get_float(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'd') => {
                        {
                            var val: [*c]f64 = __builtin.va_arg(args, [*c]f64);
                            _ = &val;
                            res = spa_pod_body_get_double(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 's') => {
                        {
                            var dest: [*c][*c]const u8 = __builtin.va_arg(args, [*c][*c]const u8);
                            _ = &dest;
                            if (_p.*.type == @as(u32, SPA_TYPE_None)) {
                                dest.* = null;
                            } else {
                                res = spa_pod_body_get_string(_p, _b, dest);
                            }
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'S') => {
                        {
                            var dest: [*c]u8 = __builtin.va_arg(args, [*c]u8);
                            _ = &dest;
                            var maxlen: u32 = __builtin.va_arg(args, u32);
                            _ = &maxlen;
                            res = spa_pod_body_copy_string(_p, _b, dest, maxlen);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'y') => {
                        {
                            var value: [*c]?*const anyopaque = __builtin.va_arg(args, [*c]?*const anyopaque);
                            _ = &value;
                            var len: [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &len;
                            res = spa_pod_body_get_bytes(_p, _b, value, len);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'R') => {
                        {
                            var val: [*c]struct_spa_rectangle = __builtin.va_arg(args, [*c]struct_spa_rectangle);
                            _ = &val;
                            res = spa_pod_body_get_rectangle(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'F') => {
                        {
                            var val: [*c]struct_spa_fraction = __builtin.va_arg(args, [*c]struct_spa_fraction);
                            _ = &val;
                            res = spa_pod_body_get_fraction(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'B') => {
                        {
                            var val: [*c][*c]const u8 = __builtin.va_arg(args, [*c][*c]const u8);
                            _ = &val;
                            res = spa_pod_body_get_bitmap(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'a') => {
                        {
                            var val_size: [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &val_size;
                            var val_type: [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &val_type;
                            var n_values: [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &n_values;
                            var arr_body: [*c]?*const anyopaque = __builtin.va_arg(args, [*c]?*const anyopaque);
                            _ = &arr_body;
                            arr_body.* = spa_pod_body_get_array_values(_p, _b, n_values, val_size, val_type);
                            if (arr_body.* == @as(?*anyopaque, null)) {
                                res = -EINVAL;
                            }
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'p') => {
                        {
                            var @"type": [*c]u32 = __builtin.va_arg(args, [*c]u32);
                            _ = &@"type";
                            var value: [*c]?*const anyopaque = __builtin.va_arg(args, [*c]?*const anyopaque);
                            _ = &value;
                            res = spa_pod_body_get_pointer(_p, _b, @"type", value);
                            break :blk_1;
                        }
                    },
                    @as(c_int, 'h') => {
                        {
                            var val: [*c]i64 = __builtin.va_arg(args, [*c]i64);
                            _ = &val;
                            res = spa_pod_body_get_fd(_p, _b, val);
                            break :blk_1;
                        }
                    },
                    else => {
                        {
                            var valid: bool = @"false" != 0;
                            _ = &valid;
                            var do_body: bool = @"false" != 0;
                            _ = &do_body;
                            blk_2: {
                                switch (@as(c_int, format.*)) {
                                    @as(c_int, 'Q') => {
                                        do_body = @"true" != 0;
                                        valid = @"true" != 0;
                                        break :blk_2;
                                    },
                                    @as(c_int, 'P') => {
                                        valid = @"true" != 0;
                                        break :blk_2;
                                    },
                                    @as(c_int, 'U') => {
                                        do_body = @"true" != 0;
                                        valid = (spa_pod_is_struct(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    @as(c_int, 'T') => {
                                        valid = (spa_pod_is_struct(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    @as(c_int, 'N') => {
                                        do_body = @"true" != 0;
                                        valid = (spa_pod_is_object(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    @as(c_int, 'O') => {
                                        valid = (spa_pod_is_object(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    @as(c_int, 'W') => {
                                        do_body = @"true" != 0;
                                        valid = (spa_pod_is_choice(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    @as(c_int, 'V') => {
                                        valid = (spa_pod_is_choice(_p) != 0) or (spa_pod_is_none(_p) != 0);
                                        break :blk_2;
                                    },
                                    else => {
                                        res = -EINVAL;
                                        break :blk_2;
                                    },
                                }
                            }
                            if ((res >= @as(c_int, 0)) and do_body) {
                                var p: [*c]struct_spa_pod = __builtin.va_arg(args, [*c]struct_spa_pod);
                                _ = &p;
                                var v: [*c]?*const anyopaque = __builtin.va_arg(args, [*c]?*const anyopaque);
                                _ = &v;
                                if ((valid and (p != null)) and (v != null)) {
                                    p.* = _p.*;
                                    v.* = _b;
                                }
                            } else if (res >= @as(c_int, 0)) {
                                var d: [*c][*c]const struct_spa_pod = __builtin.va_arg(args, [*c][*c]const struct_spa_pod);
                                _ = &d;
                                if (valid and (d != null)) {
                                    d.* = @ptrCast(@alignCast(if (_p.*.type == @as(u32, SPA_TYPE_None)) @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null)))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as([*c]const struct_spa_pod, @ptrFromInt(@as(usize, @intCast(@intFromPtr(_b))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(-%@sizeOf(struct_spa_pod)))))))))))))));
                                }
                            }
                            if (!valid) {
                                res = -EINVAL;
                            }
                            break :blk_1;
                        }
                    },
                }
            }
            break :blk res;
        }) >= @as(c_int, 0)) {
            count += 1;
        } else if (!optional) {
            if (body == @as(?*anyopaque, null)) return -ESRCH else return -EPROTO;
        }
    }
    return count;
}
pub fn spa_pod_parser_get(parser: [*c]struct_spa_pod_parser, ...) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var args: va_list = undefined;
    _ = &args;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))), @cVaStart());
    res = spa_pod_parser_getv(parser, @ptrCast(@alignCast(&args)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))));
    return res;
}
pub const struct_spa_pod_builder_state = extern struct {
    offset: u32 = 0,
    flags: u32 = 0,
    frame: [*c]struct_spa_pod_frame = null,
};
pub const struct_spa_pod_builder = extern struct {
    data: ?*anyopaque = null,
    size: u32 = 0,
    _padding: u32 = 0,
    state: struct_spa_pod_builder_state = @import("std").mem.zeroes(struct_spa_pod_builder_state),
    callbacks: struct_spa_callbacks = @import("std").mem.zeroes(struct_spa_callbacks),
};
pub const struct_spa_pod_builder_callbacks = extern struct {
    version: u32 = 0,
    overflow: ?*const fn (data: ?*anyopaque, size: u32) callconv(.c) c_int = null,
};
pub fn spa_pod_builder_frame(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    if ((@as(u64, frame.*.offset) +% (@sizeOf(struct_spa_pod) +% @as(u64, (&frame.*.pod).*.size))) <= @as(u64, builder.*.size)) return @as([*c]struct_spa_pod, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, frame.*.offset))))));
    return null;
}
pub fn spa_pod_builder_push(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, pod: [*c]const struct_spa_pod, offset: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    frame.*.pod = pod.*;
    frame.*.offset = offset;
    frame.*.parent = builder.*.state.frame;
    frame.*.flags = builder.*.state.flags;
    builder.*.state.frame = frame;
    if ((frame.*.pod.type == @as(u32, SPA_TYPE_Array)) or (frame.*.pod.type == @as(u32, SPA_TYPE_Choice))) {
        builder.*.state.flags = @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(@as(c_int, 1))) | (@as(c_int, 1) << @intCast(@as(c_int, 0)))));
    }
}
pub fn spa_pod_builder_raw(builder: [*c]struct_spa_pod_builder, arg_data: ?*const anyopaque, size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var res: c_int = 0;
    _ = &res;
    var f: [*c]struct_spa_pod_frame = undefined;
    _ = &f;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var data_offset: usize = @bitCast(@as(c_long, -@as(c_int, 1)));
    _ = &data_offset;
    var total_size: u64 = @as(u64, offset) +% @as(u64, size);
    _ = &total_size;
    if (total_size > @as(u64, builder.*.size)) {
        if (total_size > @as(u64, @as(c_uint, 4294967295))) return -ENOSPC;
        if (spa_ptrinside(builder.*.data, builder.*.size, data, size, null)) {
            data_offset = @bitCast(@as(c_long, @as(isize, @intCast(@intFromPtr(data))) - @as(isize, @intCast(@intFromPtr(builder.*.data)))));
        }
        res = -ENOSPC;
        if (offset <= builder.*.size) {
            {
                var _f: [*c]const struct_spa_pod_builder_callbacks = @ptrCast(@alignCast((&builder.*.callbacks).*.funcs));
                _ = &_f;
                if (__builtin.expect(@as(c_long, @intFromBool(!!(((_f != null) and ((@as(c_int, 0) == @as(c_int, 0)) or (_f.*.version > @as(u32, @bitCast(@as(c_int, @as(c_int, 0) - @as(c_int, 1))))))) and (_f.*.overflow != null)))), @as(c_long, 1)) != 0) {
                    res = _f.*.overflow.?((&builder.*.callbacks).*.data, @truncate(total_size));
                }
                _ = &res;
            }
        }
    }
    if ((res == @as(c_int, 0)) and (data != null)) {
        if (data_offset != @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) {
            data = @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(data_offset)))))))));
        }
        _ = memcpy(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(builder.*.data))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, offset)))))), data, size);
    }
    builder.*.state.offset = @truncate(total_size);
    {
        f = builder.*.state.frame;
        while (f != null) : (f = f.*.parent) {
            f.*.pod.size +%= size;
        }
    }
    return res;
}
pub fn spa_pod_builder_pad(builder: [*c]struct_spa_pod_builder, arg_size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var zeroes: u64 = 0;
    _ = &zeroes;
    if (builder.*.state.flags == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) return 0;
    size = (((size -% @as(u32, 1)) | @as(@TypeOf(size), @bitCast(@as(c_int, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(u32, 1)) -% size;
    return if (size != 0) spa_pod_builder_raw(builder, @ptrCast(@alignCast(&zeroes)), size) else @as(c_int, 0);
}
pub fn spa_pod_builder_pop(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var pod: [*c]struct_spa_pod = undefined;
    _ = &pod;
    if ((builder.*.state.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) {
        const p: struct_spa_pod = struct_spa_pod{
            .size = 0,
            .type = SPA_TYPE_None,
        };
        _ = &p;
        _ = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = spa_pod_builder_frame(builder, frame);
        pod = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) {
        pod.* = frame.*.pod;
    }
    builder.*.state.frame = frame.*.parent;
    builder.*.state.flags = frame.*.flags;
    _ = spa_pod_builder_pad(builder, builder.*.state.offset);
    return @ptrCast(@alignCast(pod));
}
pub fn spa_pod_builder_primitive_body(builder: [*c]struct_spa_pod_builder, p: [*c]const struct_spa_pod, body: ?*const anyopaque, body_size: u32, suffix: [*c]const u8, suffix_size: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = 0;
    _ = &res;
    var r: c_int = undefined;
    _ = &r;
    var size: u32 = @truncate(((@sizeOf(struct_spa_pod) +% @as(u64, @as([*c]struct_spa_pod, @ptrCast(@alignCast(@constCast(p)))).*.size)) -% @as(u64, body_size)) -% @as(u64, suffix_size));
    _ = &size;
    if (builder.*.state.flags != @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) {
        {
            comptime {
                if (!((if (@as(c_int, 0) != 0) @intFromBool(@as(@TypeOf(@as(c_int, 1) << @intCast(@as(c_int, 1))), @bitCast(@as(c_uint, @truncate(@as(@TypeOf(builder.*.state.flags), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))))))))) == (@as(c_int, 1) << @intCast(@as(c_int, 1)))) else @intFromBool(@sizeOf(@TypeOf(builder.*.state.flags)) >= @sizeOf(@TypeOf(@as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0)) @compileError("static assertion failed \"truncation problem when masking builder->state.flags with ~SPA_POD_BUILDER_FLAG_FIRST\"");
            }
            builder.*.state.flags &= ~@as(@TypeOf(builder.*.state.flags), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))));
        }
        res = spa_pod_builder_raw(builder, @ptrCast(@alignCast(p)), size);
    }
    if ((body_size > @as(u32, 0)) and ((blk: {
        const tmp = spa_pod_builder_raw(builder, body, body_size);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0))) {
        res = r;
    }
    if ((suffix_size > @as(u32, 0)) and ((blk: {
        const tmp = spa_pod_builder_raw(builder, @ptrCast(@alignCast(suffix)), suffix_size);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0))) {
        res = r;
    }
    if ((blk: {
        const tmp = spa_pod_builder_pad(builder, builder.*.state.offset);
        r = tmp;
        break :blk tmp;
    }) < @as(c_int, 0)) {
        res = r;
    }
    return res;
}
pub fn spa_pod_builder_primitive(builder: [*c]struct_spa_pod_builder, p: [*c]const struct_spa_pod) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_pod_builder_primitive_body(builder, p, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), p.*.size, null, 0);
}
pub fn spa_pod_builder_none(builder: [*c]struct_spa_pod_builder) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod = @as(struct_spa_pod, struct_spa_pod{
        .size = @bitCast(@as(c_int, @as(c_int, 0))),
        .type = @bitCast(@as(c_int, SPA_TYPE_None)),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p);
}
pub fn spa_pod_builder_bool(builder: [*c]struct_spa_pod_builder, val: bool) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_bool = @as(struct_spa_pod_bool, struct_spa_pod_bool{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(u32)),
            .type = SPA_TYPE_Bool,
        },
        .value = if (val) @as(c_int, 1) else @as(c_int, 0),
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_id(builder: [*c]struct_spa_pod_builder, val: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_id = @as(struct_spa_pod_id, struct_spa_pod_id{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(u32)),
            .type = SPA_TYPE_Id,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_int(builder: [*c]struct_spa_pod_builder, val: i32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_int = @as(struct_spa_pod_int, struct_spa_pod_int{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i32)),
            .type = SPA_TYPE_Int,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_long(builder: [*c]struct_spa_pod_builder, val: i64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_long = @as(struct_spa_pod_long, struct_spa_pod_long{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i64)),
            .type = SPA_TYPE_Long,
        },
        .value = val,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_float(builder: [*c]struct_spa_pod_builder, val: f32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_float = @as(struct_spa_pod_float, struct_spa_pod_float{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(f32)),
            .type = SPA_TYPE_Float,
        },
        .value = val,
        ._padding = 0,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_double(builder: [*c]struct_spa_pod_builder, val: f64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_double = @as(struct_spa_pod_double, struct_spa_pod_double{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(f64)),
            .type = SPA_TYPE_Double,
        },
        .value = val,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_string_len(builder: [*c]struct_spa_pod_builder, str: [*c]const u8, len: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_string = @as(struct_spa_pod_string, struct_spa_pod_string{
        .pod = struct_spa_pod{
            .size = len +% @as(u32, 1),
            .type = SPA_TYPE_String,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, @ptrCast(@alignCast(str)), len, "", 1);
}
pub fn spa_pod_builder_bytes(builder: [*c]struct_spa_pod_builder, bytes: ?*const anyopaque, len: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_bytes = @as(struct_spa_pod_bytes, struct_spa_pod_bytes{
        .pod = struct_spa_pod{
            .size = len,
            .type = SPA_TYPE_Bytes,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, bytes, len, null, 0);
}
pub fn spa_pod_builder_pointer(builder: [*c]struct_spa_pod_builder, arg_type: u32, val: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_pointer = @as(struct_spa_pod_pointer, struct_spa_pod_pointer{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_pointer_body)),
            .type = SPA_TYPE_Pointer,
        },
        .body = struct_spa_pod_pointer_body{
            .type = @"type",
            ._padding = 0,
            .value = val,
        },
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_fd(builder: [*c]struct_spa_pod_builder, fd: i64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_fd = @as(struct_spa_pod_fd, struct_spa_pod_fd{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(i64)),
            .type = SPA_TYPE_Fd,
        },
        .value = fd,
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_rectangle(builder: [*c]struct_spa_pod_builder, width: u32, height: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_rectangle = @as(struct_spa_pod_rectangle, struct_spa_pod_rectangle{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_rectangle)),
            .type = SPA_TYPE_Rectangle,
        },
        .value = @as(struct_spa_rectangle, struct_spa_rectangle{
            .width = width,
            .height = height,
        }),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_fraction(builder: [*c]struct_spa_pod_builder, num: u32, denom: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_fraction = @as(struct_spa_pod_fraction, struct_spa_pod_fraction{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_fraction)),
            .type = SPA_TYPE_Fraction,
        },
        .value = @as(struct_spa_fraction, struct_spa_fraction{
            .num = num,
            .denom = denom,
        }),
    });
    _ = &p;
    return spa_pod_builder_primitive(builder, &p.pod);
}
pub fn spa_pod_builder_array(builder: [*c]struct_spa_pod_builder, child_size: u32, child_type: u32, n_elems: u32, elems: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const p: struct_spa_pod_array = struct_spa_pod_array{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_array_body) +% @as(c_ulong, n_elems *% child_size)),
            .type = SPA_TYPE_Array,
        },
        .body = struct_spa_pod_array_body{
            .child = struct_spa_pod{
                .size = child_size,
                .type = child_type,
            },
        },
    };
    _ = &p;
    return spa_pod_builder_primitive_body(builder, &p.pod, elems, n_elems *% child_size, null, 0);
}
pub fn spa_pod_builder_push_choice(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, arg_type: u32, flags: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_choice = struct_spa_pod_choice{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_choice_body) -% @sizeOf(struct_spa_pod)),
            .type = SPA_TYPE_Choice,
        },
        .body = struct_spa_pod_choice_body{
            .type = @"type",
            .flags = flags,
            .child = struct_spa_pod{
                .size = 0,
                .type = 0,
            },
        },
    };
    _ = &p;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var res: c_int = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p)) -% @sizeOf(struct_spa_pod)));
    _ = &res;
    spa_pod_builder_push(builder, frame, &p.pod, offset);
    return res;
}
pub fn spa_pod_builder_push_object(builder: [*c]struct_spa_pod_builder, frame: [*c]struct_spa_pod_frame, arg_type: u32, id: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const p: struct_spa_pod_object = @as(struct_spa_pod_object, struct_spa_pod_object{
        .pod = struct_spa_pod{
            .size = @truncate(@sizeOf(struct_spa_pod_object_body)),
            .type = SPA_TYPE_Object,
        },
        .body = struct_spa_pod_object_body{
            .type = @"type",
            .id = id,
        },
    });
    _ = &p;
    var offset: u32 = builder.*.state.offset;
    _ = &offset;
    var res: c_int = spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
    _ = &res;
    spa_pod_builder_push(builder, frame, &p.pod, offset);
    return res;
}
pub fn spa_pod_builder_prop(builder: [*c]struct_spa_pod_builder, key: u32, flags: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const struct_unnamed_48 = extern struct {
        key: u32 = 0,
        flags: u32 = 0,
    };
    _ = &struct_unnamed_48;
    const p: struct_unnamed_48 = struct_unnamed_48{
        .key = key,
        .flags = flags,
    };
    _ = &p;
    return spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
}
pub fn spa_pod_builder_control(builder: [*c]struct_spa_pod_builder, offset: u32, arg_type: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const struct_unnamed_49 = extern struct {
        offset: u32 = 0,
        type: u32 = 0,
    };
    _ = &struct_unnamed_49;
    const p: struct_unnamed_49 = struct_unnamed_49{
        .offset = offset,
        .type = @"type",
    };
    _ = &p;
    return spa_pod_builder_raw(builder, @ptrCast(@alignCast(&p)), @truncate(@sizeOf(@TypeOf(p))));
}
pub fn spa_choice_from_id_flags(id: u8, flags: [*c]u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, id)) {
                    @as(c_int, 'r') => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 's') => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 'e') => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 'F') => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 'f') => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 'n') => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SPA_CHOICE_Range;
            },
            3 => {
                return SPA_CHOICE_Step;
            },
            4 => {
                return SPA_CHOICE_Enum;
            },
            5 => {
                flags.* |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return SPA_CHOICE_Flags;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return SPA_CHOICE_None;
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_builder_addv(builder: [*c]struct_spa_pod_builder, args: [*c]struct___va_list_tag_2) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var frame: [*c]struct_spa_pod_frame = undefined;
    _ = &frame;
    var ftype: u32 = undefined;
    _ = &ftype;
    var format: [*c]const u8 = undefined;
    _ = &format;
    var n_values: c_int = undefined;
    _ = &n_values;
    var f: struct_spa_pod_frame = undefined;
    _ = &f;
    var choice: bool = undefined;
    _ = &choice;
    var key: u32 = undefined;
    _ = &key;
    var flags: u32 = undefined;
    _ = &flags;
    var offset: u32 = undefined;
    _ = &offset;
    var @"type": u32 = undefined;
    _ = &@"type";
    var ctype: u32 = undefined;
    _ = &ctype;
    var strval: [*c]u8 = undefined;
    _ = &strval;
    var len: usize = undefined;
    _ = &len;
    var strval_1: [*c]u8 = undefined;
    _ = &strval_1;
    var len_2: usize = undefined;
    _ = &len_2;
    var ptr: ?*anyopaque = undefined;
    _ = &ptr;
    var len_3: c_int = undefined;
    _ = &len_3;
    var rectval: [*c]struct_spa_rectangle = undefined;
    _ = &rectval;
    var fracval: [*c]struct_spa_fraction = undefined;
    _ = &fracval;
    var child_size: c_int = undefined;
    _ = &child_size;
    var child_type: c_int = undefined;
    _ = &child_type;
    var n_elems: c_int = undefined;
    _ = &n_elems;
    var elems: ?*anyopaque = undefined;
    _ = &elems;
    var t: c_int = undefined;
    _ = &t;
    var pod: [*c]struct_spa_pod = undefined;
    _ = &pod;
    var pod_4: [*c]struct_spa_pod = undefined;
    _ = &pod_4;
    var body: ?*const anyopaque = undefined;
    _ = &body;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                res = 0;
                frame = builder.*.state.frame;
                ftype = if (frame != null) frame.*.pod.type else @as(u32, @bitCast(@as(c_int, SPA_TYPE_None)));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return res;
            },
            2 => {
                n_values = 1;
                key = 0;
                flags = 0;
                offset = 0;
                @"type" = 0;
                ctype = 0;
                switch (ftype) {
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            3 => {
                if (true) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(blk: {
                    const tmp = __builtin.va_arg(args, [*c]const u8);
                    format = tmp;
                    break :blk tmp;
                })))) == @as(?*anyopaque, null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            6 => {
                key = __builtin.va_arg(args, u32);
                if (key == @as(u32, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
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
                if (key == @as(c_uint, 4294967295)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                key = __builtin.va_arg(args, u32);
                flags = __builtin.va_arg(args, u32);
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
                    sdl_pc = 5;
                    continue;
                }
            },
            13 => {
                offset = __builtin.va_arg(args, u32);
                @"type" = __builtin.va_arg(args, u32);
                if (@"type" == @as(u32, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 4;
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
                choice = @as(c_int, format.*) == @as(c_int, '?');
                if (choice) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                ctype = spa_choice_from_id_flags((blk: {
                    const ref = &format;
                    ref.* += 1;
                    break :blk ref.*;
                }).*, &flags);
                if (@as(c_int, format.*) != @as(c_int, '\x00')) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                switch (ftype) {
                    @as(u32, SPA_TYPE_Object) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(u32, SPA_TYPE_Sequence) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            23 => {
                format += 1;
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
                if (choice) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                _ = spa_pod_builder_prop(builder, key, flags);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                _ = spa_pod_builder_control(builder, offset, @"type");
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                _ = spa_pod_builder_push_choice(builder, &f, ctype, 0);
                n_values = __builtin.va_arg(args, c_int);
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
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if ((blk: {
                    const ref = &n_values;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                if (choice) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            35 => {
                switch (@as(c_int, format.*)) {
                    @as(c_int, 'b') => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 'I') => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(c_int, 'i') => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 'l') => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(c_int, 'f') => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(c_int, 'd') => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(c_int, 's') => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 'S') => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(c_int, 'y') => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 'R') => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(c_int, 'F') => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(c_int, 'a') => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, 'p') => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 'h') => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 'P') => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 'O') => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 'T') => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 'V') => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 'Q') => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(c_int, 'N') => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 'U') => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 'W') => {
                        sdl_pc = 66;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            36 => {
                if (false) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                _ = spa_pod_builder_bool(builder, !!(__builtin.va_arg(args, c_int) != 0));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            40 => {
                _ = spa_pod_builder_id(builder, __builtin.va_arg(args, u32));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                _ = spa_pod_builder_int(builder, __builtin.va_arg(args, c_int));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                _ = spa_pod_builder_long(builder, __builtin.va_arg(args, i64));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            43 => {
                _ = spa_pod_builder_float(builder, @floatCast(__builtin.va_arg(args, f64)));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            44 => {
                _ = spa_pod_builder_double(builder, __builtin.va_arg(args, f64));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            45 => {
                strval = __builtin.va_arg(args, [*c]u8);
                if (@as(?*anyopaque, @ptrCast(@alignCast(strval))) != @as(?*anyopaque, null)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                len = strlen(strval);
                _ = spa_pod_builder_string_len(builder, strval, @truncate(len));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = spa_pod_builder_none(builder);
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            49 => {
                strval_1 = __builtin.va_arg(args, [*c]u8);
                len_2 = @bitCast(@as(c_long, __builtin.va_arg(args, c_int)));
                _ = spa_pod_builder_string_len(builder, strval_1, @truncate(len_2));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            50 => {
                ptr = __builtin.va_arg(args, ?*anyopaque);
                len_3 = __builtin.va_arg(args, c_int);
                _ = spa_pod_builder_bytes(builder, ptr, @bitCast(@as(c_int, len_3)));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            51 => {
                rectval = __builtin.va_arg(args, [*c]struct_spa_rectangle);
                _ = spa_pod_builder_rectangle(builder, rectval.*.width, rectval.*.height);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            52 => {
                fracval = __builtin.va_arg(args, [*c]struct_spa_fraction);
                _ = spa_pod_builder_fraction(builder, fracval.*.num, fracval.*.denom);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            53 => {
                child_size = __builtin.va_arg(args, c_int);
                child_type = __builtin.va_arg(args, c_int);
                n_elems = __builtin.va_arg(args, c_int);
                elems = __builtin.va_arg(args, ?*anyopaque);
                _ = spa_pod_builder_array(builder, @bitCast(@as(c_int, child_size)), @bitCast(@as(c_int, child_type)), @bitCast(@as(c_int, n_elems)), elems);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            54 => {
                t = @bitCast(@as(c_uint, @truncate(__builtin.va_arg(args, u32))));
                _ = spa_pod_builder_pointer(builder, @bitCast(@as(c_int, t)), __builtin.va_arg(args, ?*anyopaque));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            55 => {
                _ = spa_pod_builder_fd(builder, __builtin.va_arg(args, c_int));
                {
                    sdl_pc = 38;
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
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pod = __builtin.va_arg(args, [*c]struct_spa_pod);
                if (@as(?*anyopaque, @ptrCast(@alignCast(pod))) == @as(?*anyopaque, null)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                _ = spa_pod_builder_none(builder);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                _ = spa_pod_builder_primitive(builder, pod);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 38;
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
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                pod_4 = __builtin.va_arg(args, [*c]struct_spa_pod);
                body = __builtin.va_arg(args, ?*const anyopaque);
                _ = spa_pod_builder_primitive_body(builder, pod_4, body, pod_4.*.size, null, 0);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            67 => {
                _ = spa_pod_builder_pop(builder, &f);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn spa_pod_builder_add(builder: [*c]struct_spa_pod_builder, ...) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    var args: va_list = undefined;
    _ = &args;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))), @cVaStart());
    res = spa_pod_builder_addv(builder, @ptrCast(@alignCast(&args)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&args))));
    return res;
}
pub const SPA_MEDIA_TYPE_audio: c_int = 1;
pub const SPA_MEDIA_SUBTYPE_raw: c_int = 1;
pub const SPA_FORMAT_mediaType: c_int = 1;
pub const SPA_FORMAT_mediaSubtype: c_int = 2;
pub const SPA_FORMAT_AUDIO_format: c_int = 65537;
pub const SPA_FORMAT_AUDIO_rate: c_int = 65539;
pub const SPA_FORMAT_AUDIO_channels: c_int = 65540;
pub const SPA_FORMAT_AUDIO_position: c_int = 65541;
pub const SPA_AUDIO_FORMAT_UNKNOWN: c_int = 0;
pub const SPA_AUDIO_FORMAT_S8: c_int = 257;
pub const SPA_AUDIO_FORMAT_U8: c_int = 258;
pub const SPA_AUDIO_FORMAT_S16_LE: c_int = 259;
pub const SPA_AUDIO_FORMAT_S16_BE: c_int = 260;
pub const SPA_AUDIO_FORMAT_S32_LE: c_int = 267;
pub const SPA_AUDIO_FORMAT_S32_BE: c_int = 268;
pub const SPA_AUDIO_FORMAT_F32_LE: c_int = 283;
pub const SPA_AUDIO_FORMAT_F32_BE: c_int = 284;
pub const enum_spa_audio_format = c_uint;
pub const SPA_AUDIO_CHANNEL_MONO: c_int = 2;
pub const SPA_AUDIO_CHANNEL_FL: c_int = 3;
pub const SPA_AUDIO_CHANNEL_FR: c_int = 4;
pub const SPA_AUDIO_CHANNEL_FC: c_int = 5;
pub const SPA_AUDIO_CHANNEL_LFE: c_int = 6;
pub const SPA_AUDIO_CHANNEL_SL: c_int = 7;
pub const SPA_AUDIO_CHANNEL_SR: c_int = 8;
pub const SPA_AUDIO_CHANNEL_RC: c_int = 11;
pub const SPA_AUDIO_CHANNEL_RL: c_int = 12;
pub const SPA_AUDIO_CHANNEL_RR: c_int = 13;
pub const enum_spa_audio_channel = c_uint;
pub const struct_spa_audio_info_raw = extern struct {
    format: enum_spa_audio_format = @import("std").mem.zeroes(enum_spa_audio_format),
    flags: u32 = 0,
    rate: u32 = 0,
    channels: u32 = 0,
    position: [64]u32 = @import("std").mem.zeroes([64]u32),
};
pub fn spa_pod_prop_first(body: [*c]const struct_spa_pod_object_body) callconv(.c) [*c]struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    return @as([*c]struct_spa_pod_prop, @ptrFromInt(@as(usize, @intCast(@intFromPtr(body))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod_object_body))))))))));
}
pub fn spa_pod_prop_is_inside(body: [*c]const struct_spa_pod_object_body, size: u32, iter: [*c]const struct_spa_pod_prop) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var remaining: usize = undefined;
    _ = &remaining;
    return spa_ptr_inside_and_aligned(@ptrCast(@alignCast(body)), size, @ptrCast(@alignCast(iter)), @sizeOf(struct_spa_pod_prop), @alignOf(struct_spa_pod_prop), &remaining) and (remaining >= @as(usize, iter.*.value.size));
}
pub fn spa_pod_prop_next(iter: [*c]const struct_spa_pod_prop) callconv(.c) [*c]struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    return @as([*c]struct_spa_pod_prop, @ptrFromInt(@as(usize, @intCast(@intFromPtr(iter))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate((((@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, iter.*.value.size)) -% @as(c_ulong, 1)) | @as(@TypeOf(@sizeOf(struct_spa_pod_prop) +% @as(c_ulong, iter.*.value.size)), @bitCast(@as(c_long, SPA_POD_ALIGN - @as(c_int, 1))))) +% @as(c_ulong, 1))))))))));
}
pub fn spa_pod_get_int(pod: [*c]const struct_spa_pod, value: [*c]i32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_pod_body_get_int(pod, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(pod))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), value);
}
pub fn spa_pod_get_array_full(pod: [*c]const struct_spa_pod, n_values: [*c]u32, val_size: [*c]u32, val_type: [*c]u32) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(@constCast(spa_pod_body_get_array_values(pod, @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(pod))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), n_values, val_size, val_type))));
}
pub fn spa_pod_copy_array_full(pod: [*c]const struct_spa_pod, arg_type: u32, size: u32, values: ?*anyopaque, max_values: u32) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var n_values: u32 = undefined;
    _ = &n_values;
    var val_size: u32 = undefined;
    _ = &val_size;
    var val_type: u32 = undefined;
    _ = &val_type;
    var v: ?*const anyopaque = spa_pod_get_array_full(pod, &n_values, &val_size, &val_type);
    _ = &v;
    if ((((v == @as(?*anyopaque, null)) or (max_values == @as(u32, 0))) or (val_type != @"type")) or (val_size != size)) return 0;
    n_values = blk: {
        var _min_a: @TypeOf(n_values) = n_values;
        _ = &_min_a;
        var _min_b: @TypeOf(max_values) = max_values;
        _ = &_min_b;
        break :blk if (__builtin.expect(@as(c_long, @intFromBool(!!(_min_a <= _min_b))), @as(c_long, 1)) != 0) _min_a else _min_b;
    };
    _ = memcpy(values, v, val_size *% n_values);
    return n_values;
}
pub fn spa_pod_get_values(pod: [*c]const struct_spa_pod, n_vals: [*c]u32, choice: [*c]u32) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    if (spa_pod_is_choice(pod) != 0) {
        var p: [*c]const struct_spa_pod_choice = @ptrCast(@alignCast(pod));
        _ = &p;
        var @"type": u32 = undefined;
        _ = &@"type";
        var size: u32 = undefined;
        _ = &size;
        _ = spa_pod_choice_body_get_values(p, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(p))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))), n_vals, choice, &size, &@"type");
        return __helpers.cast([*c]struct_spa_pod, &p.*.body.child);
    } else {
        n_vals.* = @bitCast(@as(c_int, if (pod.*.size < spa_pod_type_size(pod.*.type)) @as(c_int, 0) else @as(c_int, 1)));
        choice.* = SPA_CHOICE_None;
        return @ptrCast(@alignCast(@constCast(pod)));
    }
}
pub fn spa_pod_object_find_prop(pod: [*c]const struct_spa_pod_object, arg_start: [*c]const struct_spa_pod_prop, key: u32) callconv(.c) [*c]const struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    var start = arg_start;
    _ = &start;
    var first: [*c]const struct_spa_pod_prop = undefined;
    _ = &first;
    var res: [*c]const struct_spa_pod_prop = undefined;
    _ = &res;
    first = spa_pod_prop_first(&pod.*.body);
    start = if (start != null) @as([*c]const struct_spa_pod_prop, @ptrCast(@alignCast(spa_pod_prop_next(start)))) else first;
    {
        res = start;
        while (spa_pod_prop_is_inside(&pod.*.body, pod.*.pod.size, res)) : (res = spa_pod_prop_next(res)) {
            if (res.*.key == key) return res;
        }
    }
    {
        res = first;
        while (res != start) : (res = spa_pod_prop_next(res)) {
            if (res.*.key == key) return res;
        }
    }
    return null;
}
pub fn spa_pod_find_prop(pod: [*c]const struct_spa_pod, start: [*c]const struct_spa_pod_prop, key: u32) callconv(.c) [*c]const struct_spa_pod_prop {
    @setEvalBranchQuota(100000);
    if (!(spa_pod_is_object(pod) != 0)) return null;
    return spa_pod_object_find_prop(@ptrCast(@alignCast(pod)), start, key);
}
pub fn spa_format_audio_raw_ext_parse(format: [*c]const struct_spa_pod, info: [*c]struct_spa_audio_info_raw, arg_size: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var position: [*c]struct_spa_pod = null;
    _ = &position;
    var res: c_int = undefined;
    _ = &res;
    var max_position: u32 = @truncate((size -% @intFromPtr(&@as(*allowzero struct_spa_audio_info_raw, @ptrFromInt(0)).position)) / @sizeOf(u32));
    _ = &max_position;
    if (!(size >= @intFromPtr(&@as(*allowzero struct_spa_audio_info_raw, @ptrFromInt(0)).position))) return -EINVAL;
    info.*.flags = 0;
    res = blk: {
        var _p: struct_spa_pod_parser = undefined;
        _ = &_p;
        spa_pod_parser_init_pod_body(&_p, format, @as(?*const anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(format))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod)))))))))));
        break :blk blk_1: {
            var _f: struct_spa_pod_frame = undefined;
            _ = &_f;
            var _res: c_int = undefined;
            _ = &_res;
            if ((blk_2: {
                const tmp = spa_pod_parser_push_object(&_p, &_f, SPA_TYPE_OBJECT_Format, null);
                _res = tmp;
                break :blk_2 tmp;
            }) == @as(c_int, 0)) {
                _res = spa_pod_parser_get(&_p, SPA_FORMAT_AUDIO_format, @as([*c]u8, @as([*c]u8, @constCast("?I"))), &info.*.format, SPA_FORMAT_AUDIO_rate, @as([*c]u8, @as([*c]u8, @constCast("?i"))), &info.*.rate, SPA_FORMAT_AUDIO_channels, @as([*c]u8, @as([*c]u8, @constCast("?i"))), &info.*.channels, SPA_FORMAT_AUDIO_position, @as([*c]u8, @as([*c]u8, @constCast("?P"))), &position, @as(c_int, 0));
                _ = spa_pod_parser_pop(&_p, &_f);
            }
            break :blk_1 _res;
        };
    };
    if (info.*.channels > max_position) return -ECHRNG;
    if ((@as(?*anyopaque, @ptrCast(@alignCast(position))) == @as(?*anyopaque, null)) or (spa_pod_copy_array_full(position, SPA_TYPE_Id, @truncate(@sizeOf(@TypeOf(info.*.position[@as(c_int, 0)]))), @ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), max_position) != info.*.channels)) {
        info.*.flags |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0))));
        _ = memset(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), 0, @as(c_ulong, max_position) *% @sizeOf(@TypeOf(info.*.position[@as(c_int, 0)])));
    }
    return res;
}
pub fn spa_format_audio_raw_parse(format: [*c]const struct_spa_pod, info: [*c]struct_spa_audio_info_raw) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_format_audio_raw_ext_parse(format, info, @sizeOf(@TypeOf(info.*)));
}
pub fn spa_format_audio_raw_ext_build(builder: [*c]struct_spa_pod_builder, id: u32, info: [*c]const struct_spa_audio_info_raw, arg_size: usize) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var f: struct_spa_pod_frame = undefined;
    _ = &f;
    var max_position: u32 = @truncate((size -% @intFromPtr(&@as(*allowzero struct_spa_audio_info_raw, @ptrFromInt(0)).position)) / @sizeOf(u32));
    _ = &max_position;
    if (!(size >= @intFromPtr(&@as(*allowzero struct_spa_audio_info_raw, @ptrFromInt(0)).position))) {
        __errno_location().* = EINVAL;
        return null;
    }
    _ = spa_pod_builder_push_object(builder, &f, SPA_TYPE_OBJECT_Format, id);
    _ = spa_pod_builder_add(builder, SPA_FORMAT_mediaType, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_TYPE_audio, SPA_FORMAT_mediaSubtype, @as([*c]u8, @as([*c]u8, @constCast("I"))), SPA_MEDIA_SUBTYPE_raw, @as(c_int, 0));
    if (info.*.format != @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_UNKNOWN)) {
        _ = spa_pod_builder_add(builder, SPA_FORMAT_AUDIO_format, @as([*c]u8, @as([*c]u8, @constCast("I"))), info.*.format, @as(c_int, 0));
    }
    if (info.*.rate != @as(u32, 0)) {
        _ = spa_pod_builder_add(builder, SPA_FORMAT_AUDIO_rate, @as([*c]u8, @as([*c]u8, @constCast("i"))), info.*.rate, @as(c_int, 0));
    }
    if (info.*.channels != @as(u32, 0)) {
        _ = spa_pod_builder_add(builder, SPA_FORMAT_AUDIO_channels, @as([*c]u8, @as([*c]u8, @constCast("i"))), info.*.channels, @as(c_int, 0));
        if (!((info.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) == @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) and (info.*.channels <= max_position)) {
            _ = spa_pod_builder_add(builder, SPA_FORMAT_AUDIO_position, @as([*c]u8, @as([*c]u8, @constCast("a"))), @as(usize, @sizeOf(u32)), SPA_TYPE_Id, info.*.channels, @as([*c]u32, @ptrCast(@constCast(@alignCast(&info.*.position)))), @as(c_int, 0));
        }
    }
    return @ptrCast(@alignCast(spa_pod_builder_pop(builder, &f)));
}
pub fn spa_format_audio_raw_build(builder: [*c]struct_spa_pod_builder, id: u32, info: [*c]const struct_spa_audio_info_raw) callconv(.c) [*c]struct_spa_pod {
    @setEvalBranchQuota(100000);
    return spa_format_audio_raw_ext_build(builder, id, info, @sizeOf(@TypeOf(info.*)));
}
pub fn spa_json_get_string(iter: [*c]struct_spa_json, res: [*c]u8, maxlen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var value: [*c]const u8 = undefined;
    _ = &value;
    var len: c_int = undefined;
    _ = &len;
    if ((blk: {
        const tmp = spa_json_next(iter, &value);
        len = tmp;
        break :blk tmp;
    }) <= @as(c_int, 0)) return len;
    return spa_json_parse_stringn(value, len, res, maxlen);
}
pub fn spa_json_enter_container(iter: [*c]struct_spa_json, sub: [*c]struct_spa_json, arg_type: u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var value: [*c]const u8 = undefined;
    _ = &value;
    var len: c_int = undefined;
    _ = &len;
    if ((blk: {
        const tmp = spa_json_next(iter, &value);
        len = tmp;
        break :blk tmp;
    }) <= @as(c_int, 0)) return len;
    if (!(spa_json_is_container(value, len) != 0)) return -EPROTO;
    if (@as(c_int, value.*) != @as(c_int, @"type")) return -EINVAL;
    spa_json_enter(iter, sub);
    return 1;
}
pub fn spa_json_enter_object(iter: [*c]struct_spa_json, sub: [*c]struct_spa_json) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_json_enter_container(iter, sub, '{');
}
pub fn spa_json_enter_array(iter: [*c]struct_spa_json, sub: [*c]struct_spa_json) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return spa_json_enter_container(iter, sub, '[');
}
pub const PW_READY_FLAG_BUFFER_ADDED: c_int = 1;
pub const PW_READY_FLAG_STREAM_READY: c_int = 2;
pub const PW_READY_FLAG_ALL_PREOPEN_BITS: c_int = 3;
pub const PW_READY_FLAG_OPEN_COMPLETE: c_int = 4;
pub const PW_READY_FLAG_ALL_BITS: c_int = 7;
pub var pipewire_initialized: bool = @"false" != 0;
pub var PIPEWIRE_pw_get_library_version: ?*const fn () callconv(.c) [*c]const u8 = null;
pub var PIPEWIRE_pw_init: ?*const fn ([*c]c_int, [*c][*c][*c]u8) callconv(.c) void = null;
pub var PIPEWIRE_pw_deinit: ?*const fn () callconv(.c) void = null;
pub var PIPEWIRE_pw_main_loop_new: ?*const fn (loop: [*c]const struct_spa_dict) callconv(.c) ?*struct_pw_main_loop = null;
pub var PIPEWIRE_pw_main_loop_get_loop: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) [*c]struct_pw_loop = null;
pub var PIPEWIRE_pw_main_loop_run: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_main_loop_quit: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_main_loop_destroy: ?*const fn (loop: ?*struct_pw_main_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_new: ?*const fn ([*c]const u8, [*c]const struct_spa_dict) callconv(.c) ?*struct_pw_thread_loop = null;
pub var PIPEWIRE_pw_thread_loop_destroy: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_stop: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_get_loop: ?*const fn (?*struct_pw_thread_loop) callconv(.c) [*c]struct_pw_loop = null;
pub var PIPEWIRE_pw_thread_loop_lock: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_unlock: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_signal: ?*const fn (?*struct_pw_thread_loop, bool) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_wait: ?*const fn (?*struct_pw_thread_loop) callconv(.c) void = null;
pub var PIPEWIRE_pw_thread_loop_timed_wait: ?*const fn (?*struct_pw_thread_loop, c_int) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_thread_loop_start: ?*const fn (?*struct_pw_thread_loop) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_context_new: ?*const fn ([*c]struct_pw_loop, [*c]struct_pw_properties, usize) callconv(.c) ?*struct_pw_context = null;
pub var PIPEWIRE_pw_context_destroy: ?*const fn (?*struct_pw_context) callconv(.c) void = null;
pub var PIPEWIRE_pw_context_connect: ?*const fn (?*struct_pw_context, [*c]struct_pw_properties, usize) callconv(.c) ?*struct_pw_core = null;
pub var PIPEWIRE_pw_proxy_add_object_listener: ?*const fn (?*struct_pw_proxy, [*c]struct_spa_hook, ?*const anyopaque, ?*anyopaque) callconv(.c) void = null;
pub var PIPEWIRE_pw_proxy_get_user_data: ?*const fn (?*struct_pw_proxy) callconv(.c) ?*anyopaque = null;
pub var PIPEWIRE_pw_proxy_destroy: ?*const fn (?*struct_pw_proxy) callconv(.c) void = null;
pub var PIPEWIRE_pw_core_disconnect: ?*const fn (?*struct_pw_core) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_stream_new_simple: ?*const fn ([*c]struct_pw_loop, [*c]const u8, [*c]struct_pw_properties, [*c]const struct_pw_stream_events, ?*anyopaque) callconv(.c) ?*struct_pw_stream = null;
pub var PIPEWIRE_pw_stream_destroy: ?*const fn (?*struct_pw_stream) callconv(.c) void = null;
pub var PIPEWIRE_pw_stream_connect: ?*const fn (?*struct_pw_stream, enum_spa_direction, u32, enum_pw_stream_flags, [*c][*c]const struct_spa_pod, u32) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_stream_get_state: ?*const fn (stream: ?*struct_pw_stream, @"error": [*c][*c]const u8) callconv(.c) enum_pw_stream_state = null;
pub var PIPEWIRE_pw_stream_dequeue_buffer: ?*const fn (?*struct_pw_stream) callconv(.c) [*c]struct_pw_buffer = null;
pub var PIPEWIRE_pw_stream_queue_buffer: ?*const fn (?*struct_pw_stream, [*c]struct_pw_buffer) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_properties_new: ?*const fn ([*c]const u8, ...) callconv(.c) [*c]struct_pw_properties = null;
pub var PIPEWIRE_pw_properties_set: ?*const fn ([*c]struct_pw_properties, [*c]const u8, [*c]const u8) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_properties_setf: ?*const fn ([*c]struct_pw_properties, [*c]const u8, [*c]const u8, ...) callconv(.c) c_int = null;
pub var PIPEWIRE_pw_stream_update_properties: ?*const fn (?*struct_pw_stream, [*c]const struct_spa_dict) callconv(.c) c_int = null;
pub var pipewire_library: [*c]const u8 = "libpipewire-0.3.so.0";
pub var pipewire_handle: ?*SDL_SharedObject = null;
pub fn pipewire_dlsym(arg_fn: [*c]const u8, addr: [*c]?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"fn" = arg_fn;
    _ = &@"fn";
    addr.* = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(pipewire_handle, @"fn"))));
    if (!(addr.* != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn load_pipewire_library() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    pipewire_handle = SDL_LoadObject_REAL(pipewire_library);
    return (if (pipewire_handle != null) @"true" else @"false") != 0;
}
pub fn unload_pipewire_library() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pipewire_handle != null) {
        SDL_UnloadObject_REAL(pipewire_handle);
        pipewire_handle = null;
    }
}
pub fn load_pipewire_syms() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!pipewire_dlsym("pw_get_library_version", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_get_library_version))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_init", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_init))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_deinit", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_deinit))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_get_loop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_get_loop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_run", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_run))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_quit", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_quit))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_main_loop_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_main_loop_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_stop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_stop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_get_loop", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_get_loop))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_lock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_lock))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_unlock", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_unlock))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_signal", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_signal))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_wait", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_wait))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_timed_wait", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_timed_wait))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_thread_loop_start", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_thread_loop_start))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_context_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_context_connect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_add_object_listener", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_add_object_listener))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_get_user_data", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_get_user_data))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_proxy_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_proxy_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_core_disconnect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_core_disconnect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_new_simple", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_new_simple))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_destroy", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_destroy))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_connect", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_connect))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_get_state", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_get_state))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_dequeue_buffer", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_dequeue_buffer))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_queue_buffer", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_queue_buffer))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_new", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_new))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_set", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_set))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_properties_setf", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_properties_setf))))))) return @"false" != 0;
    if (!pipewire_dlsym("pw_stream_update_properties", @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&PIPEWIRE_pw_stream_update_properties))))))) return @"false" != 0;
    return @"true" != 0;
}
pub fn init_pipewire_library() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (load_pipewire_library()) {
        if (load_pipewire_syms()) {
            PIPEWIRE_pw_init.?(null, null);
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn deinit_pipewire_library() callconv(.c) void {
    @setEvalBranchQuota(100000);
    PIPEWIRE_pw_deinit.?();
    unload_pipewire_library();
}
pub const struct_node_object = extern struct {
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    id: Uint32 = 0,
    seq: c_int = 0,
    persist: bool = false,
    userdata: ?*anyopaque = null,
    proxy: ?*struct_pw_proxy = null,
    node_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
    core_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook),
};
pub const struct_io_node = extern struct {
    link: struct_spa_list = @import("std").mem.zeroes(struct_spa_list),
    id: Uint32 = 0,
    recording: bool = false,
    spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    name: [*c]const u8 = null,
    path: [*c]const u8 = null,
    _buf: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn buf(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._buf)).array.child) {
        return @ptrCast(@alignCast(&_self.*._buf));
    }
};
pub var hotplug_loop: ?*struct_pw_thread_loop = null;
pub var hotplug_core: ?*struct_pw_core = null;
pub var hotplug_context: ?*struct_pw_context = null;
pub var hotplug_registry: ?*struct_pw_registry = null;
pub var hotplug_registry_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook);
pub var hotplug_core_listener: struct_spa_hook = @import("std").mem.zeroes(struct_spa_hook);
pub var hotplug_pending_list: struct_spa_list = @import("std").mem.zeroes(struct_spa_list);
pub var hotplug_io_list: struct_spa_list = @import("std").mem.zeroes(struct_spa_list);
pub var hotplug_init_seq_val: c_int = 0;
pub var hotplug_init_complete: bool = false;
pub var hotplug_events_enabled: bool = false;
pub var pipewire_have_session_services: bool = false;
pub var pipewire_have_audio_service: bool = false;
pub var pipewire_version_major: c_int = 0;
pub var pipewire_version_minor: c_int = 0;
pub var pipewire_version_patch: c_int = 0;
pub var pipewire_default_sink_id: [*c]u8 = null;
pub var pipewire_default_source_id: [*c]u8 = null;
pub fn pipewire_core_version_at_least(major: c_int, minor: c_int, patch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ((pipewire_version_major >= major) and ((pipewire_version_major > major) or (pipewire_version_minor >= minor))) and (((pipewire_version_major > major) or (pipewire_version_minor > minor)) or (pipewire_version_patch >= patch));
}
pub fn io_list_check_add(node: [*c]struct_io_node) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var n: [*c]struct_io_node = undefined;
    _ = &n;
    {
        n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
        while (!((&n.*.link) == (&hotplug_io_list))) : (n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(n.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)))) {
            if (n.*.id == node.*.id) {
                return @"false" != 0;
            }
        }
    }
    spa_list_insert((&hotplug_io_list).*.prev, &node.*.link);
    if (hotplug_events_enabled) {
        _ = SDL_AddAudioDevice(node.*.recording, node.*.name, null, &node.*.spec, @ptrFromInt(@as(usize, node.*.id)));
    }
    return @"true" != 0;
}
pub fn io_list_remove(id: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var n: [*c]struct_io_node = undefined;
    _ = &n;
    var temp: [*c]struct_io_node = undefined;
    _ = &temp;
    {
        n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
        while ((blk: {
            temp = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(n.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&n.*.link) == (&hotplug_io_list)));
        }) != 0) : (n = temp) {
            if (n.*.id == id) {
                spa_list_remove(&n.*.link);
                if (hotplug_events_enabled) {
                    SDL_AudioDeviceDisconnected(SDL_FindPhysicalAudioDeviceByHandle(@ptrFromInt(@as(usize, id))));
                }
                SDL_free_REAL(@ptrCast(@alignCast(n)));
                break;
            }
        }
    }
}
pub fn io_list_clear() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var n: [*c]struct_io_node = undefined;
    _ = &n;
    var temp: [*c]struct_io_node = undefined;
    _ = &temp;
    {
        n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
        while ((blk: {
            temp = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(n.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&n.*.link) == (&hotplug_io_list)));
        }) != 0) : (n = temp) {
            spa_list_remove(&n.*.link);
            SDL_free_REAL(@ptrCast(@alignCast(n)));
        }
    }
}
pub fn io_list_get_by_id(id: Uint32) callconv(.c) [*c]struct_io_node {
    @setEvalBranchQuota(100000);
    var n: [*c]struct_io_node = undefined;
    _ = &n;
    var temp: [*c]struct_io_node = undefined;
    _ = &temp;
    {
        n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
        while ((blk: {
            temp = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(n.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&n.*.link) == (&hotplug_io_list)));
        }) != 0) : (n = temp) {
            if (n.*.id == id) {
                return n;
            }
        }
    }
    return null;
}
pub fn node_object_destroy(node: [*c]struct_node_object) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "node_object_destroy".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(node))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "node != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pipewire.c", 343);
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
    spa_list_remove(&node.*.link);
    spa_hook_remove(&node.*.node_listener);
    spa_hook_remove(&node.*.core_listener);
    SDL_free_REAL(node.*.userdata);
    PIPEWIRE_pw_proxy_destroy.?(node.*.proxy);
}
pub fn pending_list_add(node: [*c]struct_node_object) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "pending_list_add".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(node))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "node != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pipewire.c", 355);
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
    spa_list_insert((&hotplug_pending_list).*.prev, &node.*.link);
}
pub fn pending_list_remove(id: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = undefined;
    _ = &node;
    var temp: [*c]struct_node_object = undefined;
    _ = &temp;
    {
        node = @as([*c]@TypeOf(node.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_pending_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(node.*), @ptrFromInt(0)).link)));
        while ((blk: {
            temp = @as([*c]@TypeOf(node.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(node.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(node.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&node.*.link) == (&hotplug_pending_list)));
        }) != 0) : (node = temp) {
            if (node.*.id == id) {
                node_object_destroy(node);
            }
        }
    }
}
pub fn pending_list_clear() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = undefined;
    _ = &node;
    var temp: [*c]struct_node_object = undefined;
    _ = &temp;
    {
        node = @as([*c]@TypeOf(node.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_pending_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(node.*), @ptrFromInt(0)).link)));
        while ((blk: {
            temp = @as([*c]@TypeOf(node.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(node.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(node.*), @ptrFromInt(0)).link)));
            break :blk @intFromBool(!((&node.*.link) == (&hotplug_pending_list)));
        }) != 0) : (node = temp) {
            node_object_destroy(node);
        }
    }
}
pub fn node_object_new(id: Uint32, arg_type: [*c]const u8, version: Uint32, funcs: ?*const anyopaque, core_events: [*c]const struct_pw_core_events) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var proxy: ?*struct_pw_proxy = undefined;
    _ = &proxy;
    var node: [*c]struct_node_object = undefined;
    _ = &node;
    proxy = @ptrCast(@alignCast(pw_registry_bind(hotplug_registry, id, @"type", version, @sizeOf(struct_node_object))));
    if (!(proxy != null)) {
        _ = SDL_SetError_REAL("Pipewire: Failed to create proxy object (%i)", __errno_location().*);
        return null;
    }
    node = @ptrCast(@alignCast(PIPEWIRE_pw_proxy_get_user_data.?(proxy)));
    _ = memset(@ptrCast(@alignCast(node)), 0, @sizeOf(@TypeOf(node.*)));
    node.*.id = id;
    node.*.proxy = proxy;
    _ = pw_core_add_listener(hotplug_core, &node.*.core_listener, core_events, @ptrCast(@alignCast(node)));
    PIPEWIRE_pw_proxy_add_object_listener.?(node.*.proxy, &node.*.node_listener, funcs, @ptrCast(@alignCast(node)));
    pending_list_add(node);
    return @ptrCast(@alignCast(node));
}
pub fn core_events_hotplug_init_callback(_: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((id == @as(u32, PW_ID_CORE)) and (seq == hotplug_init_seq_val)) {
        spa_hook_remove(&hotplug_core_listener);
        hotplug_init_complete = @"true" != 0;
        PIPEWIRE_pw_thread_loop_signal.?(hotplug_loop, @"false" != 0);
    }
}
pub fn core_events_hotplug_info_callback(_: ?*anyopaque, info: [*c]const struct_pw_core_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_sscanf_REAL(info.*.version, "%d.%d.%d", &pipewire_version_major, &pipewire_version_minor, &pipewire_version_patch) < @as(c_int, 3)) {
        pipewire_version_major = 0;
        pipewire_version_minor = 0;
        pipewire_version_patch = 0;
    }
}
pub fn core_events_interface_callback(object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = @ptrCast(@alignCast(object));
    _ = &node;
    var io: [*c]struct_io_node = @ptrCast(@alignCast(node.*.userdata));
    _ = &io;
    if ((id == @as(u32, PW_ID_CORE)) and (seq == node.*.seq)) {
        if (io_list_check_add(io)) {
            node.*.userdata = null;
        }
        node_object_destroy(node);
    }
}
pub fn core_events_generic_callback(object: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = @ptrCast(@alignCast(object));
    _ = &node;
    if (((id == @as(u32, PW_ID_CORE)) and (seq == node.*.seq)) and !node.*.persist) {
        node_object_destroy(node);
    }
}
pub const hotplug_init_core_events: struct_pw_core_events = struct_pw_core_events{
    .version = PW_VERSION_CORE_EVENTS,
    .info = core_events_hotplug_info_callback,
    .done = core_events_hotplug_init_callback,
    .ping = null,
    .@"error" = null,
    .remove_id = null,
    .bound_id = null,
    .add_mem = null,
    .remove_mem = null,
    .bound_props = null,
};
pub const interface_core_events: struct_pw_core_events = struct_pw_core_events{
    .version = PW_VERSION_CORE_EVENTS,
    .info = null,
    .done = core_events_interface_callback,
    .ping = null,
    .@"error" = null,
    .remove_id = null,
    .bound_id = null,
    .add_mem = null,
    .remove_mem = null,
    .bound_props = null,
};
pub const generic_core_events: struct_pw_core_events = struct_pw_core_events{
    .version = PW_VERSION_CORE_EVENTS,
    .info = null,
    .done = core_events_generic_callback,
    .ping = null,
    .@"error" = null,
    .remove_id = null,
    .bound_id = null,
    .add_mem = null,
    .remove_mem = null,
    .bound_props = null,
};
pub fn hotplug_core_sync(node: [*c]struct_node_object) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (node != null) {
        node.*.seq = pw_core_sync(hotplug_core, PW_ID_CORE, node.*.seq);
    }
    if (!hotplug_init_complete) {
        hotplug_init_seq_val = pw_core_sync(hotplug_core, PW_ID_CORE, hotplug_init_seq_val);
    }
}
pub fn get_range_param(param: [*c]const struct_spa_pod, key: Uint32, def: [*c]c_int, min: [*c]c_int, max: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var value: [*c]struct_spa_pod = undefined;
    _ = &value;
    var n_values: Uint32 = undefined;
    _ = &n_values;
    var choice: Uint32 = undefined;
    _ = &choice;
    prop = spa_pod_find_prop(param, null, key);
    if ((prop != null) and (prop.*.value.type == @as(u32, SPA_TYPE_Choice))) {
        value = spa_pod_get_values(&prop.*.value, &n_values, &choice);
        if ((n_values == @as(Uint32, 3)) and (choice == @as(Uint32, SPA_CHOICE_Range))) {
            var v: [*c]Uint32 = @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(@intFromPtr(value))) +% @as(usize, @bitCast(@as(c_long, @as(ptrdiff_t, @bitCast(@as(c_ulong, @truncate(@sizeOf(struct_spa_pod))))))))))));
            _ = &v;
            if (v != null) {
                if (def != null) {
                    def.* = @bitCast(@as(c_uint, @truncate(v[@as(c_int, 0)])));
                }
                if (min != null) {
                    min.* = @bitCast(@as(c_uint, @truncate(v[@as(c_int, 1)])));
                }
                if (max != null) {
                    max.* = @bitCast(@as(c_uint, @truncate(v[@as(c_int, 2)])));
                }
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn get_int_param(param: [*c]const struct_spa_pod, key: Uint32, val: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prop: [*c]const struct_spa_pod_prop = undefined;
    _ = &prop;
    var v: Sint32 = undefined;
    _ = &v;
    prop = spa_pod_find_prop(param, null, key);
    if ((prop != null) and (spa_pod_get_int(&prop.*.value, &v) == @as(c_int, 0))) {
        if (val != null) {
            val.* = v;
        }
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn SPAFormatToSDL(spafmt: enum_spa_audio_format) callconv(.c) SDL_AudioFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (spafmt) {
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_U8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_S8) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_S16_LE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_S16_BE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_S32_LE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_S32_BE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_F32_LE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(enum_spa_audio_format, SPA_AUDIO_FORMAT_F32_BE) => {
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
                return SDL_AUDIO_UNKNOWN;
            },
            2 => {
                return SDL_AUDIO_U8;
            },
            3 => {
                return SDL_AUDIO_S8;
            },
            4 => {
                return SDL_AUDIO_S16LE;
            },
            5 => {
                return SDL_AUDIO_S16BE;
            },
            6 => {
                return SDL_AUDIO_S32LE;
            },
            7 => {
                return SDL_AUDIO_S32BE;
            },
            8 => {
                return SDL_AUDIO_F32LE;
            },
            9 => {
                return SDL_AUDIO_F32BE;
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
pub fn node_event_info(object: ?*anyopaque, info: [*c]const struct_pw_node_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = @ptrCast(@alignCast(object));
    _ = &node;
    var io: [*c]struct_io_node = @ptrCast(@alignCast(node.*.userdata));
    _ = &io;
    var prop_val: [*c]const u8 = undefined;
    _ = &prop_val;
    var i: Uint32 = undefined;
    _ = &i;
    if (info != null) {
        prop_val = spa_dict_lookup(info.*.props, "audio.channels");
        if (prop_val != null) {
            io.*.spec.channels = @as(Uint8, @bitCast(@as(i8, @truncate(SDL_atoi_REAL(prop_val)))));
        }
        {
            i = 0;
            while (i < info.*.n_params) : (i +%= 1) {
                _ = pw_node_enum_params(@ptrCast(@alignCast(node.*.proxy)), 0, info.*.params[i].id, 0, 0, null);
            }
        }
        hotplug_core_sync(node);
    }
}
pub fn node_event_param(object: ?*anyopaque, _: c_int, id: u32, _: u32, _: u32, param: [*c]const struct_spa_pod) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var node: [*c]struct_node_object = @ptrCast(@alignCast(object));
    _ = &node;
    var io: [*c]struct_io_node = @ptrCast(@alignCast(node.*.userdata));
    _ = &io;
    if ((id == @as(u32, SPA_PARAM_Format)) and (io.*.spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
        var info: struct_spa_audio_info_raw = undefined;
        _ = &info;
        _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
        if (spa_format_audio_raw_parse(param, &info) == @as(c_int, 0)) {
            io.*.spec.format = SPAFormatToSDL(info.format);
        }
    }
    if (io.*.spec.freq == @as(c_int, 0)) {
        _ = get_range_param(param, SPA_FORMAT_AUDIO_rate, &io.*.spec.freq, null, null);
    }
    if (io.*.spec.channels == @as(c_int, 0)) {
        var channels: c_int = undefined;
        _ = &channels;
        if (get_int_param(param, SPA_FORMAT_AUDIO_channels, &channels)) {
            io.*.spec.channels = @as(Uint8, @bitCast(@as(i8, @truncate(channels))));
        }
    }
}
pub const interface_node_events: struct_pw_node_events = struct_pw_node_events{
    .version = PW_VERSION_NODE_EVENTS,
    .info = node_event_info,
    .param = node_event_param,
};
pub fn get_name_from_json(json: [*c]const u8) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var parser: [2]struct_spa_json = undefined;
    _ = &parser;
    var key: [7]u8 = undefined;
    _ = &key;
    var value: [256]u8 = undefined;
    _ = &value;
    spa_json_init(&parser[@as(c_int, 0)], json, SDL_strlen_REAL(json));
    if (spa_json_enter_object(&parser[@as(c_int, 0)], &parser[@as(c_int, 1)]) <= @as(c_int, 0)) {
        return null;
    }
    if (spa_json_get_string(&parser[@as(c_int, 1)], @ptrCast(@alignCast(&key)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(key)))))) <= @as(c_int, 0)) {
        return null;
    }
    if (spa_json_get_string(&parser[@as(c_int, 1)], @ptrCast(@alignCast(&value)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(value)))))) <= @as(c_int, 0)) {
        return null;
    }
    return SDL_strdup_REAL(@ptrCast(@alignCast(&value)));
}
pub fn change_default_device(path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (hotplug_events_enabled) {
        var n: [*c]struct_io_node = undefined;
        _ = &n;
        var temp: [*c]struct_io_node = undefined;
        _ = &temp;
        {
            n = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
            while ((blk: {
                temp = @as([*c]@TypeOf(n.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(n.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(n.*), @ptrFromInt(0)).link)));
                break :blk @intFromBool(!((&n.*.link) == (&hotplug_io_list)));
            }) != 0) : (n = temp) {
                if (SDL_strcmp_REAL(n.*.path, path) == @as(c_int, 0)) {
                    SDL_DefaultAudioDeviceChanged(SDL_FindPhysicalAudioDeviceByHandle(@ptrFromInt(@as(usize, n.*.id))));
                    return;
                }
            }
        }
    }
}
pub fn metadata_property(object: ?*anyopaque, subject: Uint32, key: [*c]const u8, arg_type: [*c]const u8, value: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var node: [*c]struct_node_object = @ptrCast(@alignCast(object));
    _ = &node;
    if (((subject == @as(Uint32, PW_ID_CORE)) and (key != null)) and (value != null)) {
        if (!(SDL_strcmp_REAL(key, "default.audio.sink") != 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(pipewire_default_sink_id)));
            pipewire_default_sink_id = get_name_from_json(value);
            node.*.persist = @"true" != 0;
            change_default_device(pipewire_default_sink_id);
        } else if (!(SDL_strcmp_REAL(key, "default.audio.source") != 0)) {
            SDL_free_REAL(@ptrCast(@alignCast(pipewire_default_source_id)));
            pipewire_default_source_id = get_name_from_json(value);
            node.*.persist = @"true" != 0;
            change_default_device(pipewire_default_source_id);
        }
    }
    return 0;
}
pub const metadata_node_events: struct_pw_metadata_events = struct_pw_metadata_events{
    .version = PW_VERSION_METADATA_EVENTS,
    .property = metadata_property,
};
pub fn client_info(_: ?*anyopaque, info: [*c]const struct_pw_client_info) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var services: [*c]const u8 = spa_dict_lookup(info.*.props, "session.services");
    _ = &services;
    if (services != null) {
        pipewire_have_session_services = @"true" != 0;
        var iter: [2]struct_spa_json = undefined;
        _ = &iter;
        spa_json_init(&iter[@as(c_int, 0)], services, SDL_strlen_REAL(services));
        if (spa_json_enter_array(&iter[@as(c_int, 0)], &iter[@as(c_int, 1)]) > @as(c_int, 0)) {
            var element: [256]u8 = undefined;
            _ = &element;
            while (spa_json_get_string(&iter[@as(c_int, 1)], @ptrCast(@alignCast(&element)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(element)))))) > @as(c_int, 0)) {
                if (SDL_strcmp_REAL(@ptrCast(@alignCast(&element)), "audio") == @as(c_int, 0)) {
                    pipewire_have_audio_service = @"true" != 0;
                    break;
                }
            }
        }
    }
}
pub const client_node_events: struct_pw_client_events = struct_pw_client_events{
    .version = PW_VERSION_CLIENT_EVENTS,
    .info = client_info,
    .permissions = null,
};
pub fn registry_event_global_callback(_: ?*anyopaque, id: u32, _: u32, arg_type: [*c]const u8, version: u32, props: [*c]const struct_spa_dict) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var node: [*c]struct_node_object = undefined;
    _ = &node;
    if (!(SDL_strcmp_REAL(@"type", "PipeWire:Interface:Node") != 0)) {
        var media_class: [*c]const u8 = spa_dict_lookup(props, "media.class");
        _ = &media_class;
        if (media_class != null) {
            var node_desc: [*c]const u8 = undefined;
            _ = &node_desc;
            var node_path: [*c]const u8 = undefined;
            _ = &node_path;
            var io: [*c]struct_io_node = undefined;
            _ = &io;
            var recording: bool = undefined;
            _ = &recording;
            var desc_buffer_len: c_int = undefined;
            _ = &desc_buffer_len;
            var path_buffer_len: c_int = undefined;
            _ = &path_buffer_len;
            if (!(SDL_strcasecmp_REAL(media_class, "Audio/Sink") != 0)) {
                recording = @"false" != 0;
            } else if (!(SDL_strcasecmp_REAL(media_class, "Audio/Source") != 0) or !(SDL_strcasecmp_REAL(media_class, "Audio/Source/Virtual") != 0)) {
                recording = @"true" != 0;
            } else {
                return;
            }
            node_desc = spa_dict_lookup(props, "node.description");
            node_path = spa_dict_lookup(props, "node.name");
            if ((node_desc != null) and (node_path != null)) {
                node = @ptrCast(@alignCast(node_object_new(id, @"type", version, @ptrCast(@alignCast(&interface_node_events)), &interface_core_events)));
                if (!(node != null)) {
                    _ = SDL_SetError_REAL("Pipewire: Failed to allocate interface node");
                    return;
                }
                desc_buffer_len = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(node_desc) +% @as(usize, 1))));
                path_buffer_len = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(node_path) +% @as(usize, 1))));
                node.*.userdata = @ptrCast(@alignCast(blk: {
                    const tmp = @as([*c]struct_io_node, @ptrCast(@alignCast(SDL_calloc_REAL(1, (@sizeOf(struct_io_node) +% @as(c_ulong, @bitCast(@as(c_long, desc_buffer_len)))) +% @as(c_ulong, @bitCast(@as(c_long, path_buffer_len)))))));
                    io = tmp;
                    break :blk tmp;
                }));
                if (!(io != null)) {
                    node_object_destroy(node);
                    return;
                }
                io.*.id = id;
                io.*.recording = recording;
                if (io.*.spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN)) {
                    io.*.spec.format = SDL_AUDIO_S16;
                }
                io.*.name = io.*.buf();
                io.*.path = io.*.buf() + @as(usize, @bitCast(@as(isize, @intCast(desc_buffer_len))));
                _ = SDL_strlcpy_REAL(io.*.buf(), node_desc, @bitCast(@as(c_long, desc_buffer_len)));
                _ = SDL_strlcpy_REAL(io.*.buf() + @as(usize, @bitCast(@as(isize, @intCast(desc_buffer_len)))), node_path, @bitCast(@as(c_long, path_buffer_len)));
                hotplug_core_sync(node);
            }
        }
    } else if (!(SDL_strcmp_REAL(@"type", "PipeWire:Interface:Metadata") != 0)) {
        node = @ptrCast(@alignCast(node_object_new(id, @"type", version, @ptrCast(@alignCast(&metadata_node_events)), &generic_core_events)));
        if (!(node != null)) {
            _ = SDL_SetError_REAL("Pipewire: Failed to allocate metadata node");
            return;
        }
        hotplug_core_sync(node);
    } else if (!(SDL_strcmp_REAL(@"type", "PipeWire:Interface:Client") != 0)) {
        node = @ptrCast(@alignCast(node_object_new(id, @"type", version, @ptrCast(@alignCast(&client_node_events)), &generic_core_events)));
        if (!(node != null)) {
            _ = SDL_SetError_REAL("Pipewire: Failed to allocate client info node");
            return;
        }
        hotplug_core_sync(node);
    }
}
pub fn registry_event_remove_callback(_: ?*anyopaque, id: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    io_list_remove(id);
    pending_list_remove(id);
}
pub const registry_events: struct_pw_registry_events = struct_pw_registry_events{
    .version = PW_VERSION_REGISTRY_EVENTS,
    .global = registry_event_global_callback,
    .global_remove = registry_event_remove_callback,
};
pub fn hotplug_loop_init() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var res: c_int = undefined;
    _ = &res;
    spa_list_init(&hotplug_pending_list);
    spa_list_init(&hotplug_io_list);
    hotplug_loop = PIPEWIRE_pw_thread_loop_new.?("SDLPwAudioPlug", null);
    if (!(hotplug_loop != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create hotplug detection loop (%i)", __errno_location().*);
    }
    hotplug_context = PIPEWIRE_pw_context_new.?(PIPEWIRE_pw_thread_loop_get_loop.?(hotplug_loop), null, 0);
    if (!(hotplug_context != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create hotplug detection context (%i)", __errno_location().*);
    }
    hotplug_core = PIPEWIRE_pw_context_connect.?(hotplug_context, null, 0);
    if (!(hotplug_core != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to connect hotplug detection context (%i)", __errno_location().*);
    }
    hotplug_registry = pw_core_get_registry(hotplug_core, PW_VERSION_REGISTRY, 0);
    if (!(hotplug_registry != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to acquire hotplug detection registry (%i)", __errno_location().*);
    }
    _ = memset(@ptrCast(@alignCast(&hotplug_registry_listener)), 0, @sizeOf(@TypeOf(hotplug_registry_listener)));
    _ = pw_registry_add_listener(hotplug_registry, &hotplug_registry_listener, &registry_events, null);
    _ = memset(@ptrCast(@alignCast(&hotplug_core_listener)), 0, @sizeOf(@TypeOf(hotplug_core_listener)));
    _ = pw_core_add_listener(hotplug_core, &hotplug_core_listener, &hotplug_init_core_events, null);
    hotplug_init_seq_val = pw_core_sync(hotplug_core, PW_ID_CORE, 0);
    res = PIPEWIRE_pw_thread_loop_start.?(hotplug_loop);
    if (res != @as(c_int, 0)) {
        return SDL_SetError_REAL("Pipewire: Failed to start hotplug detection loop");
    }
    return @"true" != 0;
}
pub fn hotplug_loop_destroy() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (hotplug_loop != null) {
        PIPEWIRE_pw_thread_loop_stop.?(hotplug_loop);
    }
    pending_list_clear();
    io_list_clear();
    hotplug_init_complete = @"false" != 0;
    hotplug_events_enabled = @"false" != 0;
    if (pipewire_default_sink_id != null) {
        SDL_free_REAL(@ptrCast(@alignCast(pipewire_default_sink_id)));
        pipewire_default_sink_id = null;
    }
    if (pipewire_default_source_id != null) {
        SDL_free_REAL(@ptrCast(@alignCast(pipewire_default_source_id)));
        pipewire_default_source_id = null;
    }
    if (hotplug_registry != null) {
        PIPEWIRE_pw_proxy_destroy.?(@ptrCast(@alignCast(hotplug_registry)));
        hotplug_registry = null;
    }
    if (hotplug_core != null) {
        _ = PIPEWIRE_pw_core_disconnect.?(hotplug_core);
        hotplug_core = null;
    }
    if (hotplug_context != null) {
        PIPEWIRE_pw_context_destroy.?(hotplug_context);
        hotplug_context = null;
    }
    if (hotplug_loop != null) {
        PIPEWIRE_pw_thread_loop_destroy.?(hotplug_loop);
        hotplug_loop = null;
    }
}
pub fn PIPEWIRE_DetectDevices(default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var io: [*c]struct_io_node = undefined;
    _ = &io;
    PIPEWIRE_pw_thread_loop_lock.?(hotplug_loop);
    if (!hotplug_init_complete) {
        PIPEWIRE_pw_thread_loop_wait.?(hotplug_loop);
    }
    {
        io = @as([*c]@TypeOf(io.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr((&hotplug_io_list).*.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(io.*), @ptrFromInt(0)).link)));
        while (!((&io.*.link) == (&hotplug_io_list))) : (io = @as([*c]@TypeOf(io.*), @ptrFromInt(@as(usize, @intCast(@intFromPtr(io.*.link.next))) -% @intFromPtr(&@as(*allowzero @TypeOf(io.*), @ptrFromInt(0)).link)))) {
            var device: [*c]SDL_AudioDevice = SDL_AddAudioDevice(io.*.recording, io.*.name, null, &io.*.spec, @ptrFromInt(@as(usize, io.*.id)));
            _ = &device;
            if ((pipewire_default_sink_id != null) and (SDL_strcmp_REAL(io.*.path, pipewire_default_sink_id) == @as(c_int, 0))) {
                if (!io.*.recording) {
                    default_playback.* = device;
                }
            } else if ((pipewire_default_source_id != null) and (SDL_strcmp_REAL(io.*.path, pipewire_default_source_id) == @as(c_int, 0))) {
                if (io.*.recording) {
                    default_recording.* = device;
                }
            }
        }
    }
    hotplug_events_enabled = @"true" != 0;
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug_loop);
}
pub const PIPEWIRE_channel_map_1: [1]enum_spa_audio_channel = [1]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_MONO,
};
pub const PIPEWIRE_channel_map_2: [2]enum_spa_audio_channel = [2]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
};
pub const PIPEWIRE_channel_map_3: [3]enum_spa_audio_channel = [3]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_LFE,
};
pub const PIPEWIRE_channel_map_4: [4]enum_spa_audio_channel = [4]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_RL,
    SPA_AUDIO_CHANNEL_RR,
};
pub const PIPEWIRE_channel_map_5: [5]enum_spa_audio_channel = [5]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_FC,
    SPA_AUDIO_CHANNEL_RL,
    SPA_AUDIO_CHANNEL_RR,
};
pub const PIPEWIRE_channel_map_6: [6]enum_spa_audio_channel = [6]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_FC,
    SPA_AUDIO_CHANNEL_LFE,
    SPA_AUDIO_CHANNEL_RL,
    SPA_AUDIO_CHANNEL_RR,
};
pub const PIPEWIRE_channel_map_7: [7]enum_spa_audio_channel = [7]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_FC,
    SPA_AUDIO_CHANNEL_LFE,
    SPA_AUDIO_CHANNEL_RC,
    SPA_AUDIO_CHANNEL_RL,
    SPA_AUDIO_CHANNEL_RR,
};
pub const PIPEWIRE_channel_map_8: [8]enum_spa_audio_channel = [8]enum_spa_audio_channel{
    SPA_AUDIO_CHANNEL_FL,
    SPA_AUDIO_CHANNEL_FR,
    SPA_AUDIO_CHANNEL_FC,
    SPA_AUDIO_CHANNEL_LFE,
    SPA_AUDIO_CHANNEL_RL,
    SPA_AUDIO_CHANNEL_RR,
    SPA_AUDIO_CHANNEL_SL,
    SPA_AUDIO_CHANNEL_SR,
};
pub fn initialize_spa_info(spec: [*c]const SDL_AudioSpec, info: [*c]struct_spa_audio_info_raw) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                info.*.channels = @bitCast(@as(c_int, spec.*.channels));
                info.*.rate = @bitCast(@as(c_int, spec.*.freq));
                switch (spec.*.channels) {
                    @as(c_int, 1) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 8) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                switch (spec.*.format) {
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16LE) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16BE) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32LE) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32BE) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32LE) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_F32BE) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            2 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_1))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_1)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_2))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_2)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_3))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_3)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_4))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_4)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_5))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_5)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_6))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_6)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_7))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_7)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]u32, @ptrCast(@alignCast(&info.*.position))))), @ptrCast(@alignCast(@as([*c]const enum_spa_audio_channel, @ptrCast(@alignCast(&PIPEWIRE_channel_map_8))))), @sizeOf(@TypeOf(PIPEWIRE_channel_map_8)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                {}
            },
            11 => {
                info.*.format = SPA_AUDIO_FORMAT_U8;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                info.*.format = SPA_AUDIO_FORMAT_S8;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                info.*.format = SPA_AUDIO_FORMAT_S16_LE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                info.*.format = SPA_AUDIO_FORMAT_S16_BE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                info.*.format = SPA_AUDIO_FORMAT_S32_LE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                info.*.format = SPA_AUDIO_FORMAT_S32_BE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                info.*.format = SPA_AUDIO_FORMAT_F32_LE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                info.*.format = SPA_AUDIO_FORMAT_F32_BE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                info.*.format = SPA_AUDIO_FORMAT_UNKNOWN;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn PIPEWIRE_GetDeviceBuf(device: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    var stream: ?*struct_pw_stream = device.*.hidden.*.stream;
    _ = &stream;
    var pw_buf: [*c]struct_pw_buffer = PIPEWIRE_pw_stream_dequeue_buffer.?(stream);
    _ = &pw_buf;
    if (@as(?*anyopaque, @ptrCast(@alignCast(pw_buf))) == @as(?*anyopaque, null)) {
        buffer_size.* = 0;
        return null;
    }
    var spa_buf: [*c]struct_spa_buffer = pw_buf.*.buffer;
    _ = &spa_buf;
    if (spa_buf.*.datas[@as(c_int, 0)].data == @as(?*anyopaque, null)) {
        _ = PIPEWIRE_pw_stream_queue_buffer.?(stream, pw_buf);
        buffer_size.* = 0;
        return null;
    }
    device.*.hidden.*.pw_buf = pw_buf;
    return @ptrCast(@alignCast(spa_buf.*.datas[@as(c_int, 0)].data));
}
pub fn PIPEWIRE_PlayDevice(device: [*c]SDL_AudioDevice, _: [*c]const Uint8, buffer_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var stream: ?*struct_pw_stream = device.*.hidden.*.stream;
    _ = &stream;
    var pw_buf: [*c]struct_pw_buffer = device.*.hidden.*.pw_buf;
    _ = &pw_buf;
    var spa_buf: [*c]struct_spa_buffer = pw_buf.*.buffer;
    _ = &spa_buf;
    spa_buf.*.datas[@as(c_int, 0)].chunk.*.offset = 0;
    spa_buf.*.datas[@as(c_int, 0)].chunk.*.stride = device.*.hidden.*.stride;
    spa_buf.*.datas[@as(c_int, 0)].chunk.*.size = @bitCast(@as(c_int, buffer_size));
    _ = PIPEWIRE_pw_stream_queue_buffer.?(stream, pw_buf);
    device.*.hidden.*.pw_buf = null;
    return @"true" != 0;
}
pub fn output_callback(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(data));
    _ = &device;
    if (device.*.hidden.*.stream_init_status != PW_READY_FLAG_ALL_BITS) {
        var bufsize: c_int = 0;
        _ = &bufsize;
        var buf: [*c]Uint8 = PIPEWIRE_GetDeviceBuf(device, &bufsize);
        _ = &buf;
        if ((buf != null) and (bufsize != 0)) {
            _ = memset(@ptrCast(@alignCast(buf)), device.*.silence_value, @bitCast(@as(c_long, bufsize)));
        }
        _ = PIPEWIRE_PlayDevice(device, buf, bufsize);
        return;
    }
    _ = SDL_PlaybackAudioThreadIterate(device);
}
pub fn PIPEWIRE_FlushRecording(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var stream: ?*struct_pw_stream = device.*.hidden.*.stream;
    _ = &stream;
    var pw_buf: [*c]struct_pw_buffer = PIPEWIRE_pw_stream_dequeue_buffer.?(stream);
    _ = &pw_buf;
    if (pw_buf != null) {
        _ = PIPEWIRE_pw_stream_queue_buffer.?(stream, pw_buf);
    }
}
pub fn PIPEWIRE_RecordDevice(device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "PIPEWIRE_RecordDevice".*;
    };
    _ = &static_local___func__;
    var stream: ?*struct_pw_stream = device.*.hidden.*.stream;
    _ = &stream;
    var pw_buf: [*c]struct_pw_buffer = PIPEWIRE_pw_stream_dequeue_buffer.?(stream);
    _ = &pw_buf;
    if (!(pw_buf != null)) {
        return 0;
    }
    var spa_buf: [*c]struct_spa_buffer = pw_buf.*.buffer;
    _ = &spa_buf;
    if (!(spa_buf != null)) {
        _ = PIPEWIRE_pw_stream_queue_buffer.?(stream, pw_buf);
        return 0;
    }
    var src: [*c]const Uint8 = @ptrCast(@alignCast(spa_buf.*.datas[@as(c_int, 0)].data));
    _ = &src;
    const offset: Uint32 = blk: {
        var _min_a: @TypeOf(spa_buf.*.datas[@as(c_int, 0)].chunk.*.offset) = spa_buf.*.datas[@as(c_int, 0)].chunk.*.offset;
        _ = &_min_a;
        var _min_b: @TypeOf(spa_buf.*.datas[@as(c_int, 0)].maxsize) = spa_buf.*.datas[@as(c_int, 0)].maxsize;
        _ = &_min_b;
        break :blk if (__builtin.expect(@as(c_long, @intFromBool(!!(_min_a <= _min_b))), @as(c_long, 1)) != 0) _min_a else _min_b;
    };
    _ = &offset;
    const size: Uint32 = blk: {
        var _min_a: @TypeOf(spa_buf.*.datas[@as(c_int, 0)].chunk.*.size) = spa_buf.*.datas[@as(c_int, 0)].chunk.*.size;
        _ = &_min_a;
        var _min_b: @TypeOf(spa_buf.*.datas[@as(c_int, 0)].maxsize -% offset) = spa_buf.*.datas[@as(c_int, 0)].maxsize -% offset;
        _ = &_min_b;
        break :blk if (__builtin.expect(@as(c_long, @intFromBool(!!(_min_a <= _min_b))), @as(c_long, 1)) != 0) _min_a else _min_b;
    };
    _ = &size;
    const cpy: c_int = if (buflen < @as(c_int, @bitCast(@as(c_uint, @truncate(size))))) buflen else @as(c_int, @bitCast(@as(c_uint, @truncate(size))));
    _ = &cpy;
    while (true) {
        while (!(size <= @as(Uint32, @bitCast(@as(c_int, buflen))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "size <= buflen",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pipewire.c", 1062);
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
    _ = memcpy(buffer, @ptrCast(@alignCast(src + offset)), @bitCast(@as(c_long, cpy)));
    _ = PIPEWIRE_pw_stream_queue_buffer.?(stream, pw_buf);
    return cpy;
}
pub fn input_callback(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(data));
    _ = &device;
    if (device.*.hidden.*.stream_init_status != PW_READY_FLAG_ALL_BITS) {
        PIPEWIRE_FlushRecording(device);
        return;
    }
    _ = SDL_RecordingAudioThreadIterate(device);
}
pub fn stream_add_buffer_callback(data: ?*anyopaque, buffer: [*c]struct_pw_buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(data));
    _ = &device;
    if (@as(c_int, @intFromBool(device.*.recording)) == @"false") {
        if (@as(u32, @bitCast(@as(c_int, device.*.buffer_size))) > buffer.*.buffer.*.datas[@as(c_int, 0)].maxsize) {
            SDL_LockMutex_REAL(device.*.lock);
            device.*.sample_frames = @bitCast(@as(c_uint, @truncate(buffer.*.buffer.*.datas[@as(c_int, 0)].maxsize / @as(u32, @bitCast(@as(c_int, device.*.hidden.*.stride))))));
            device.*.buffer_size = @bitCast(@as(c_uint, @truncate(buffer.*.buffer.*.datas[@as(c_int, 0)].maxsize)));
            SDL_UnlockMutex_REAL(device.*.lock);
        }
    }
    device.*.hidden.*.stream_init_status |= PW_READY_FLAG_BUFFER_ADDED;
    PIPEWIRE_pw_thread_loop_signal.?(device.*.hidden.*.loop, @"false" != 0);
}
pub fn stream_state_changed_callback(data: ?*anyopaque, _: enum_pw_stream_state, state: enum_pw_stream_state, arg_error: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"error" = arg_error;
    _ = &@"error";
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(data));
    _ = &device;
    if (state == PW_STREAM_STATE_STREAMING) {
        device.*.hidden.*.stream_init_status |= PW_READY_FLAG_STREAM_READY;
    }
    if ((state == PW_STREAM_STATE_STREAMING) or (state == PW_STREAM_STATE_ERROR)) {
        PIPEWIRE_pw_thread_loop_signal.?(device.*.hidden.*.loop, @"false" != 0);
    }
}
pub const stream_output_events: struct_pw_stream_events = struct_pw_stream_events{
    .version = PW_VERSION_STREAM_EVENTS,
    .destroy = null,
    .state_changed = stream_state_changed_callback,
    .control_info = null,
    .io_changed = null,
    .param_changed = null,
    .add_buffer = stream_add_buffer_callback,
    .remove_buffer = null,
    .process = output_callback,
    .drained = null,
    .command = null,
    .trigger_done = null,
};
pub const stream_input_events: struct_pw_stream_events = struct_pw_stream_events{
    .version = PW_VERSION_STREAM_EVENTS,
    .destroy = null,
    .state_changed = stream_state_changed_callback,
    .control_info = null,
    .io_changed = null,
    .param_changed = null,
    .add_buffer = stream_add_buffer_callback,
    .remove_buffer = null,
    .process = input_callback,
    .drained = null,
    .command = null,
    .trigger_done = null,
};
pub fn PIPEWIRE_StreamNameChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, newValue: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(userdata));
    _ = &device;
    var priv: [*c]struct_SDL_PrivateAudioData = device.*.hidden;
    _ = &priv;
    if ((!(priv != null) or !(priv.*.stream != null)) or !(priv.*.loop != null)) {
        return;
    } else if ((newValue != null) and (SDL_strcmp_REAL(priv.*.node_name, newValue) == @as(c_int, 0))) {
        return;
    }
    var items: [1]struct_spa_dict_item = [1]struct_spa_dict_item{
        struct_spa_dict_item{
            .key = "media.name",
            .value = newValue,
        },
    };
    _ = &items;
    var dict: struct_spa_dict = @as(struct_spa_dict, struct_spa_dict{
        .flags = 0,
        .n_items = @bitCast(@as(c_int, @as(c_int, 1))),
        .items = @ptrCast(@alignCast(&items)),
    });
    _ = &dict;
    PIPEWIRE_pw_thread_loop_lock.?(priv.*.loop);
    _ = PIPEWIRE_pw_stream_update_properties.?(priv.*.stream, &dict);
    PIPEWIRE_pw_thread_loop_unlock.?(priv.*.loop);
}
pub fn PIPEWIRE_OpenDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_STREAM_FLAGS = struct {
        const STREAM_FLAGS: enum_pw_stream_flags = @bitCast(PW_STREAM_FLAG_AUTOCONNECT | PW_STREAM_FLAG_MAP_BUFFERS);
    };
    _ = &static_local_STREAM_FLAGS;
    var thread_name: [128]u8 = undefined;
    _ = &thread_name;
    var pod_buffer: [1024]Uint8 = undefined;
    _ = &pod_buffer;
    var b: struct_spa_pod_builder = @as(struct_spa_pod_builder, struct_spa_pod_builder{
        .data = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&pod_buffer))))),
        .size = @truncate(@sizeOf(@TypeOf(pod_buffer))),
        ._padding = 0,
        .state = struct_spa_pod_builder_state{
            .offset = 0,
            .flags = 0,
            .frame = null,
        },
        .callbacks = struct_spa_callbacks{
            .funcs = null,
            .data = null,
        },
    });
    _ = &b;
    var spa_info: struct_spa_audio_info_raw = struct_spa_audio_info_raw{
        .format = 0,
        .flags = 0,
        .rate = 0,
        .channels = 0,
        .position = @import("std").mem.zeroes([64]u32),
    };
    _ = &spa_info;
    var params: [*c]const struct_spa_pod = null;
    _ = &params;
    var priv: [*c]struct_SDL_PrivateAudioData = undefined;
    _ = &priv;
    var props: [*c]struct_pw_properties = undefined;
    _ = &props;
    var app_name: [*c]const u8 = undefined;
    _ = &app_name;
    var icon_name: [*c]const u8 = undefined;
    _ = &icon_name;
    var app_id: [*c]const u8 = undefined;
    _ = &app_id;
    var stream_name: [*c]const u8 = undefined;
    _ = &stream_name;
    var stream_role: [*c]const u8 = undefined;
    _ = &stream_role;
    var @"error": [*c]const u8 = undefined;
    _ = &@"error";
    var node_id: Uint32 = if (!(device.*.handle != null)) @as(c_uint, 4294967295) else @as(u32, @truncate(@as(usize, @intCast(@intFromPtr(device.*.handle)))));
    _ = &node_id;
    const recording: bool = device.*.recording;
    _ = &recording;
    var wait_for_ready_timeouted: bool = @"false" != 0;
    _ = &wait_for_ready_timeouted;
    var res: c_int = undefined;
    _ = &res;
    const min_period: c_int = PW_MIN_SAMPLES * (blk: {
        var _max_a: @TypeOf(@divTrunc(device.*.spec.freq, PW_BASE_CLOCK_RATE)) = @divTrunc(device.*.spec.freq, PW_BASE_CLOCK_RATE);
        _ = &_max_a;
        var _max_b: @TypeOf(@as(c_int, 1)) = @as(c_int, 1);
        _ = &_max_b;
        break :blk if (__builtin.expect(@as(c_long, @intFromBool(!!(_max_a >= _max_b))), @as(c_long, 1)) != 0) _max_a else _max_b;
    });
    _ = &min_period;
    app_name = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
    icon_name = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_APP_ICON_NAME");
    if (!(icon_name != null) or (@as(c_int, icon_name.*) == @as(c_int, '\x00'))) {
        icon_name = "applications-games";
    }
    app_id = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.identifier");
    stream_name = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_STREAM_NAME");
    if (!(stream_name != null) or (@as(c_int, stream_name.*) == @as(c_int, '\x00'))) {
        if (app_name != null) {
            stream_name = app_name;
        } else if (app_id != null) {
            stream_name = app_id;
        } else {
            stream_name = "SDL Audio Stream";
        }
    }
    stream_role = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_STREAM_ROLE");
    if (!(stream_role != null) or (@as(c_int, stream_role.*) == @as(c_int, '\x00'))) {
        stream_role = "Game";
    }
    initialize_spa_info(&device.*.spec, &spa_info);
    params = spa_format_audio_raw_build(&b, SPA_PARAM_EnumFormat, &spa_info);
    if (!(params != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to set audio format parameters");
    }
    priv = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_SDL_PrivateAudioData))));
    device.*.hidden = priv;
    if (!(priv != null)) {
        return @"false" != 0;
    }
    priv.*.stride = @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)));
    if (device.*.sample_frames < min_period) {
        device.*.sample_frames = min_period;
    }
    SDL_UpdatedAudioDeviceFormat(device);
    _ = SDL_GetAudioThreadName(device, @ptrCast(@alignCast(&thread_name)), @sizeOf(@TypeOf(thread_name)));
    priv.*.loop = PIPEWIRE_pw_thread_loop_new.?(@ptrCast(@alignCast(&thread_name)), null);
    if (!(priv.*.loop != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create stream loop (%i)", __errno_location().*);
    }
    props = PIPEWIRE_pw_properties_new.?("config.name", @as([*c]u8, @as([*c]u8, @constCast("client-rt.conf"))), @as(?*anyopaque, null));
    if (!(props != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create stream context properties (%i)", __errno_location().*);
    }
    priv.*.context = PIPEWIRE_pw_context_new.?(PIPEWIRE_pw_thread_loop_get_loop.?(priv.*.loop), props, 0);
    if (!(priv.*.context != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create stream context (%i)", __errno_location().*);
    }
    props = PIPEWIRE_pw_properties_new.?(null, @as(?*anyopaque, null));
    if (!(props != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create stream properties (%i)", __errno_location().*);
    }
    _ = PIPEWIRE_pw_properties_set.?(props, "media.type", "Audio");
    _ = PIPEWIRE_pw_properties_set.?(props, "media.category", if (recording) @as([*c]u8, @as([*c]u8, @constCast("Capture"))) else @as([*c]u8, @as([*c]u8, @constCast("Playback"))));
    _ = PIPEWIRE_pw_properties_set.?(props, "media.role", stream_role);
    _ = PIPEWIRE_pw_properties_set.?(props, "application.name", app_name);
    _ = PIPEWIRE_pw_properties_set.?(props, "application.icon-name", icon_name);
    if (app_id != null) {
        _ = PIPEWIRE_pw_properties_set.?(props, "application.id", app_id);
    }
    var node_name: [*c]const u8 = if ((app_name != null) and (@as(c_int, app_name.*) != 0)) app_name else stream_name;
    _ = &node_name;
    priv.*.node_name = SDL_strdup_REAL(node_name);
    if (!(priv.*.node_name != null)) {
        return @"false" != 0;
    }
    _ = PIPEWIRE_pw_properties_set.?(props, "node.name", node_name);
    _ = PIPEWIRE_pw_properties_set.?(props, "node.description", node_name);
    _ = PIPEWIRE_pw_properties_setf.?(props, "node.latency", "%u/%i", device.*.sample_frames, device.*.spec.freq);
    _ = PIPEWIRE_pw_properties_setf.?(props, "node.rate", "1/%u", device.*.spec.freq);
    _ = PIPEWIRE_pw_properties_set.?(props, "node.always-process", "true");
    if ((node_name != stream_name) and (SDL_strcmp_REAL(node_name, stream_name) != @as(c_int, 0))) {
        _ = PIPEWIRE_pw_properties_set.?(props, "media.name", stream_name);
    }
    if (node_id != @as(c_uint, 4294967295)) {
        PIPEWIRE_pw_thread_loop_lock.?(hotplug_loop);
        var node: [*c]const struct_io_node = io_list_get_by_id(node_id);
        _ = &node;
        if (node != null) {
            _ = PIPEWIRE_pw_properties_set.?(props, "target.object", node.*.path);
        }
        PIPEWIRE_pw_thread_loop_unlock.?(hotplug_loop);
    }
    _ = SDL_AddHintCallback_REAL("SDL_AUDIO_DEVICE_STREAM_NAME", PIPEWIRE_StreamNameChanged, @ptrCast(@alignCast(device)));
    priv.*.stream = PIPEWIRE_pw_stream_new_simple.?(PIPEWIRE_pw_thread_loop_get_loop.?(priv.*.loop), stream_name, props, if (recording) &stream_input_events else &stream_output_events, @ptrCast(@alignCast(device)));
    if (!(priv.*.stream != null)) {
        return SDL_SetError_REAL("Pipewire: Failed to create stream (%i)", __errno_location().*);
    }
    res = PIPEWIRE_pw_stream_connect.?(priv.*.stream, @bitCast(if (recording) SPA_DIRECTION_INPUT else SPA_DIRECTION_OUTPUT), @as(c_uint, 4294967295), static_local_STREAM_FLAGS.STREAM_FLAGS, &params, 1);
    if (res != @as(c_int, 0)) {
        return SDL_SetError_REAL("Pipewire: Failed to connect stream");
    }
    res = PIPEWIRE_pw_thread_loop_start.?(priv.*.loop);
    if (res != @as(c_int, 0)) {
        return SDL_SetError_REAL("Pipewire: Failed to start stream loop");
    }
    PIPEWIRE_pw_thread_loop_lock.?(priv.*.loop);
    while ((!wait_for_ready_timeouted and (priv.*.stream_init_status != PW_READY_FLAG_ALL_PREOPEN_BITS)) and (PIPEWIRE_pw_stream_get_state.?(priv.*.stream, null) != PW_STREAM_STATE_ERROR)) {
        wait_for_ready_timeouted = PIPEWIRE_pw_thread_loop_timed_wait.?(priv.*.loop, 2) == ETIMEDOUT;
    }
    priv.*.stream_init_status |= PW_READY_FLAG_OPEN_COMPLETE;
    PIPEWIRE_pw_thread_loop_unlock.?(priv.*.loop);
    if (wait_for_ready_timeouted) {
        return SDL_SetError_REAL("Pipewire: timeout waiting for audio device to be ready");
    }
    if (PIPEWIRE_pw_stream_get_state.?(priv.*.stream, &@"error") == PW_STREAM_STATE_ERROR) {
        return SDL_SetError_REAL("Pipewire: Stream error: %s", @"error");
    }
    return @"true" != 0;
}
pub fn PIPEWIRE_CloseDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device.*.hidden != null)) {
        return;
    }
    SDL_RemoveHintCallback_REAL("SDL_AUDIO_DEVICE_STREAM_NAME", PIPEWIRE_StreamNameChanged, @ptrCast(@alignCast(device)));
    if (device.*.hidden.*.loop != null) {
        PIPEWIRE_pw_thread_loop_stop.?(device.*.hidden.*.loop);
    }
    if (device.*.hidden.*.stream != null) {
        PIPEWIRE_pw_stream_destroy.?(device.*.hidden.*.stream);
    }
    if (device.*.hidden.*.context != null) {
        PIPEWIRE_pw_context_destroy.?(device.*.hidden.*.context);
    }
    if (device.*.hidden.*.loop != null) {
        PIPEWIRE_pw_thread_loop_destroy.?(device.*.hidden.*.loop);
    }
    SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden.*.node_name)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.hidden)));
    device.*.hidden = null;
    SDL_AudioThreadFinalize(device);
}
pub fn PIPEWIRE_DeinitializeStart() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pipewire_initialized) {
        hotplug_loop_destroy();
    }
}
pub fn PIPEWIRE_Deinitialize() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pipewire_initialized) {
        hotplug_loop_destroy();
        deinit_pipewire_library();
        pipewire_have_session_services = @"false" != 0;
        pipewire_have_audio_service = @"false" != 0;
        pipewire_initialized = @"false" != 0;
    }
}
pub fn PipewireInitialize(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!pipewire_initialized) {
        if (!init_pipewire_library()) {
            return @"false" != 0;
        }
        pipewire_initialized = @"true" != 0;
        if (!hotplug_loop_init()) {
            PIPEWIRE_Deinitialize();
            return @"false" != 0;
        }
    }
    impl.*.DetectDevices = PIPEWIRE_DetectDevices;
    impl.*.OpenDevice = PIPEWIRE_OpenDevice;
    impl.*.DeinitializeStart = PIPEWIRE_DeinitializeStart;
    impl.*.Deinitialize = PIPEWIRE_Deinitialize;
    impl.*.PlayDevice = PIPEWIRE_PlayDevice;
    impl.*.GetDeviceBuf = PIPEWIRE_GetDeviceBuf;
    impl.*.RecordDevice = PIPEWIRE_RecordDevice;
    impl.*.FlushRecording = PIPEWIRE_FlushRecording;
    impl.*.CloseDevice = PIPEWIRE_CloseDevice;
    impl.*.HasRecordingSupport = @"true" != 0;
    impl.*.ProvidesOwnCallbackThread = @"true" != 0;
    return @"true" != 0;
}
pub fn PIPEWIRE_PREFERRED_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!PipewireInitialize(impl)) {
        return @"false" != 0;
    }
    PIPEWIRE_pw_thread_loop_lock.?(hotplug_loop);
    if (!hotplug_init_complete) {
        PIPEWIRE_pw_thread_loop_wait.?(hotplug_loop);
    }
    const no_devices: bool = (&hotplug_io_list).*.next == (&hotplug_io_list);
    _ = &no_devices;
    PIPEWIRE_pw_thread_loop_unlock.?(hotplug_loop);
    if ((pipewire_have_session_services and !pipewire_have_audio_service) or (!pipewire_have_session_services and (no_devices or !pipewire_core_version_at_least(1, 0, 0)))) {
        PIPEWIRE_Deinitialize();
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn PIPEWIRE_Init(impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return PipewireInitialize(impl);
}
pub export var PIPEWIRE_PREFERRED_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "pipewire",
    .desc = "Pipewire",
    .init = PIPEWIRE_PREFERRED_Init,
    .demand_only = @"false" != 0,
    .is_preferred = @"true" != 0,
};
pub export var PIPEWIRE_bootstrap: AudioBootStrap = AudioBootStrap{
    .name = "pipewire",
    .desc = "Pipewire",
    .init = PIPEWIRE_Init,
    .demand_only = @"false" != 0,
    .is_preferred = @"false" != 0,
};

pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:15:9
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINVAL = @as(c_int, 22);
pub const ENOSPC = @as(c_int, 28);
pub const ECHRNG = @as(c_int, 44);
pub const EPROTO = @as(c_int, 71);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const ETIMEDOUT = @as(c_int, 110);
pub const PW_VERSION_REGISTRY = @as(c_int, 3);
pub const PW_ID_CORE = @as(c_int, 0);
pub const PW_VERSION_CORE_EVENTS = @as(c_int, 1);
pub const PW_VERSION_REGISTRY_EVENTS = @as(c_int, 0);
pub const SPA_POD_ALIGN = @as(c_int, 8);
pub const PW_VERSION_CLIENT_EVENTS = @as(c_int, 0);
pub const SPA_JSON_ERROR_FLAG = @as(c_int, 0x100);
pub const PW_VERSION_NODE_EVENTS = @as(c_int, 0);
pub const PW_VERSION_STREAM_EVENTS = @as(c_int, 2);
pub const PW_VERSION_METADATA_EVENTS = @as(c_int, 0);
pub const PW_MIN_SAMPLES = @as(c_int, 32);
pub const PW_BASE_CLOCK_RATE = __helpers.promoteIntLiteral(c_int, 48000, .decimal);
pub const SDL_PIPEWIRE_SYM = @compileError("unable to translate macro: undefined identifier `PIPEWIRE_`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/audio/pipewire/SDL_pipewire.c:119:9
