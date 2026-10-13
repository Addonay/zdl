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
pub const pthread_t = c_ulong;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicPointer_REAL(a: [*c]?*anyopaque) ?*anyopaque;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_ThreadID = Uint64;
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
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const enum_SDL_ThreadPriority = c_uint;
pub const SDL_ThreadPriority = enum_SDL_ThreadPriority;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) [*c]SDL_Thread;
pub extern fn SDL_SetCurrentThreadPriority_REAL(priority: SDL_ThreadPriority) bool;
pub extern fn SDL_WaitThread_REAL(thread: [*c]SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_RWLock = opaque {
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_CreateRWLock_REAL() ?*SDL_RWLock;
pub extern fn SDL_LockRWLockForReading_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_UnlockRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_DestroyRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub const struct_SDL_Condition = opaque {
};
pub const SDL_Condition = struct_SDL_Condition;
pub extern fn SDL_CreateCondition_REAL() ?*SDL_Condition;
pub extern fn SDL_DestroyCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_BroadcastCondition_REAL(cond: ?*SDL_Condition) void;
pub extern fn SDL_WaitCondition_REAL(cond: ?*SDL_Condition, mutex: ?*SDL_Mutex) void;
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
pub const SDL_AUDIO_S32: c_int = 32800;
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
    thread: [*c]SDL_Thread = null,
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
pub extern fn SDL_CreateAudioStream_REAL(src_spec: [*c]const SDL_AudioSpec, dst_spec: [*c]const SDL_AudioSpec) [*c]SDL_AudioStream;
pub extern fn SDL_PutAudioStreamData_REAL(stream: [*c]SDL_AudioStream, buf: ?*const anyopaque, len: c_int) bool;
pub extern fn SDL_SetAudioStreamGetCallback_REAL(stream: [*c]SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_SetAudioStreamPutCallback_REAL(stream: [*c]SDL_AudioStream, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_DestroyAudioStream_REAL(stream: [*c]SDL_AudioStream) void;
pub extern fn SDL_MixAudio_REAL(dst: [*c]Uint8, src: [*c]const Uint8, format: SDL_AudioFormat, len: Uint32, volume: f32) bool;
pub const SDL_CameraID = Uint32;
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_AUDIO_DEVICE_ADDED: c_int = 4352;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED: c_int = 4353;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED: c_int = 4354;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub extern fn SDL_PumpEvents_REAL() void;
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_MainThreadCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_RunOnMainThread_REAL(callback: SDL_MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) bool;
pub const SDL_LOG_CATEGORY_AUDIO: c_int = 4;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_IterateHashTable(table: ?*const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_KeyMatchID(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_ChooseAudioConverters() void;
pub extern fn SDL_SetupAudioResampler() void;
pub extern fn ConvertAudio(num_frames: c_int, src: ?*const anyopaque, src_format: SDL_AudioFormat, src_channels: c_int, src_map: [*c]const c_int, dst: ?*anyopaque, dst_format: SDL_AudioFormat, dst_channels: c_int, dst_map: [*c]const c_int, scratch: ?*anyopaque, gain: f32) void;
pub extern fn SDL_GetAudioStreamDataAdjustGain(stream: [*c]SDL_AudioStream, voidbuf: ?*anyopaque, len: c_int, extra_gain: f32) c_int;
pub extern fn SetAudioStreamChannelMap(stream: [*c]SDL_AudioStream, spec: [*c]const SDL_AudioSpec, stream_chmap: [*c][*c]c_int, chmap: [*c]const c_int, channels: c_int, isinput: c_int) bool;
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
pub const struct_SDL_PendingAudioDeviceEvent = extern struct {
    type: Uint32 = 0,
    devid: SDL_AudioDeviceID = 0,
    next: [*c]struct_SDL_PendingAudioDeviceEvent = null,
};
pub const SDL_PendingAudioDeviceEvent = struct_SDL_PendingAudioDeviceEvent;
pub const struct_SDL_AudioDriver = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    impl: SDL_AudioDriverImpl = @import("std").mem.zeroes(SDL_AudioDriverImpl),
    subsystem_rwlock: ?*SDL_RWLock = null,
    device_hash_physical: ?*SDL_HashTable = null,
    device_hash_logical: ?*SDL_HashTable = null,
    existing_streams: [*c]SDL_AudioStream = null,
    default_playback_device_id: SDL_AudioDeviceID = 0,
    default_recording_device_id: SDL_AudioDeviceID = 0,
    pending_events: SDL_PendingAudioDeviceEvent = @import("std").mem.zeroes(SDL_PendingAudioDeviceEvent),
    pending_events_tail: [*c]SDL_PendingAudioDeviceEvent = null,
    playback_device_count: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    recording_device_count: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    shutting_down: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub const SDL_AudioDriver = struct_SDL_AudioDriver;
pub const struct_AudioBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    init: ?*const fn (impl: [*c]SDL_AudioDriverImpl) callconv(.c) bool = null,
    demand_only: bool = false,
    is_preferred: bool = false,
};
pub const AudioBootStrap = struct_AudioBootStrap;
pub extern var PIPEWIRE_PREFERRED_bootstrap: AudioBootStrap;
pub extern var PIPEWIRE_bootstrap: AudioBootStrap;
pub extern var PULSEAUDIO_bootstrap: AudioBootStrap;
pub extern var ALSA_bootstrap: AudioBootStrap;
pub extern var JACK_bootstrap: AudioBootStrap;
pub extern var DISKAUDIO_bootstrap: AudioBootStrap;
pub extern var DUMMYAUDIO_bootstrap: AudioBootStrap;
pub const SDL_ErrorCode = c_uint;
pub const bootstrap: [8][*c]const AudioBootStrap = [8][*c]const AudioBootStrap{
    &PIPEWIRE_PREFERRED_bootstrap,
    &PULSEAUDIO_bootstrap,
    &PIPEWIRE_bootstrap,
    &ALSA_bootstrap,
    &JACK_bootstrap,
    &DISKAUDIO_bootstrap,
    &DUMMYAUDIO_bootstrap,
    null,
};
pub var current_audio: SDL_AudioDriver = @import("std").mem.zeroes(SDL_AudioDriver);
pub var deduped_bootstrap: [7][*c]const AudioBootStrap = @import("std").mem.zeroes([7][*c]const AudioBootStrap);
pub fn GetShortAudioFormatName(fmt: SDL_AudioFormat) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var fmtstr: [*c]const u8 = SDL_GetAudioFormatName_REAL(fmt);
    _ = &fmtstr;
    if (fmtstr != null) {
        fmtstr += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 10)))));
    }
    return fmtstr;
}
pub export fn SDL_GetNumAudioDrivers_REAL() c_int {
    @setEvalBranchQuota(100000);
    const static_local_num_drivers = struct {
        var num_drivers: c_int = -@as(c_int, 1);
    };
    _ = &static_local_num_drivers;
    if (static_local_num_drivers.num_drivers >= @as(c_int, 0)) {
        return static_local_num_drivers.num_drivers;
    }
    static_local_num_drivers.num_drivers = 0;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(bootstrap[@bitCast(@as(isize, @intCast(i)))])))) != @as(?*anyopaque, null)) : (i += 1) {
            var duplicate: bool = @"false" != 0;
            _ = &duplicate;
            {
                var j: c_int = 0;
                _ = &j;
                while (j < i) : (j += 1) {
                    if (SDL_strcmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, bootstrap[@bitCast(@as(isize, @intCast(j)))].*.name) == @as(c_int, 0)) {
                        duplicate = @"true" != 0;
                        break;
                    }
                }
            }
            if (!duplicate) {
                deduped_bootstrap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &static_local_num_drivers.num_drivers;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = bootstrap[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    return static_local_num_drivers.num_drivers;
}
pub export fn SDL_GetAudioDriver_REAL(arg_index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var index_1 = arg_index_1;
    _ = &index_1;
    if ((index_1 < @as(c_int, 0)) or (index_1 >= SDL_GetNumAudioDrivers_REAL())) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("index"))));
        return null;
    }
    return deduped_bootstrap[@bitCast(@as(isize, @intCast(index_1)))].*.name;
}
pub export fn SDL_GetCurrentAudioDriver_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    return current_audio.name;
}
pub export fn SDL_GetDefaultSampleFramesFromFreq(freq: c_int) c_int {
    @setEvalBranchQuota(100000);
    _ = &freq;
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_AUDIO_DEVICE_SAMPLE_FRAMES");
    _ = &hint;
    if (hint != null) {
        const val: c_int = SDL_atoi_REAL(hint);
        _ = &val;
        if (val > @as(c_int, 0)) {
            return val;
        }
    }
    if (freq <= @as(c_int, 22050)) {
        return 512;
    } else if (freq <= @as(c_int, 48000)) {
        return 1024;
    } else if (freq <= @as(c_int, 96000)) {
        return 2048;
    } else {
        return 4096;
    }
}
pub export fn SDL_ChannelMapDup(origchmap: [*c]const c_int, channels: c_int) [*c]c_int {
    @setEvalBranchQuota(100000);
    var chmap: [*c]c_int = null;
    _ = &chmap;
    if ((channels > @as(c_int, 0)) and (origchmap != null)) {
        const chmaplen: usize = @sizeOf(@TypeOf(origchmap.*)) *% @as(c_ulong, @bitCast(@as(c_long, channels)));
        _ = &chmaplen;
        chmap = @ptrCast(@alignCast(SDL_malloc_REAL(chmaplen)));
        if (chmap != null) {
            _ = memcpy(@ptrCast(@alignCast(chmap)), @ptrCast(@alignCast(origchmap)), chmaplen);
        }
    }
    return chmap;
}
pub export fn OnAudioStreamCreated(stream: [*c]SDL_AudioStream) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "OnAudioStreamCreated".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(stream))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "stream != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 202);
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
    if (current_audio.subsystem_rwlock != null) {
        SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
        if (current_audio.existing_streams != null) {
            current_audio.existing_streams.*.prev = stream;
        }
        stream.*.prev = null;
        stream.*.next = current_audio.existing_streams;
        current_audio.existing_streams = stream;
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    }
}
pub export fn OnAudioStreamDestroy(stream: [*c]SDL_AudioStream) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "OnAudioStreamDestroy".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(stream))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "stream != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 221);
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
    if (current_audio.subsystem_rwlock != null) {
        SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
        if (stream.*.prev != null) {
            stream.*.prev.*.next = stream.*.next;
        }
        if (stream.*.next != null) {
            stream.*.next.*.prev = stream.*.prev;
        }
        if (stream == current_audio.existing_streams) {
            current_audio.existing_streams = stream.*.next;
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    }
}
pub fn AudioDeviceCanUseSimpleCopy(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "AudioDeviceCanUseSimpleCopy".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 244);
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
    return ((((device.*.logical_devices != null) and !(device.*.logical_devices.*.next != null)) and !(device.*.logical_devices.*.postmix != null)) and (device.*.logical_devices.*.bound_streams != null)) and !(device.*.logical_devices.*.bound_streams.*.next_binding != null);
}
pub fn UpdateAudioStreamFormatsPhysical(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device != null)) {
        return;
    }
    const recording: bool = device.*.recording;
    _ = &recording;
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&spec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&spec)) == sizeof (*( &device->spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
    const devformat: SDL_AudioFormat = spec.format;
    _ = &devformat;
    if (!recording) {
        const simple_copy: bool = AudioDeviceCanUseSimpleCopy(device);
        _ = &simple_copy;
        device.*.simple_copy = simple_copy;
        if (!simple_copy) {
            spec.format = SDL_AUDIO_F32;
        }
    }
    {
        var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
        _ = &logdev;
        while (logdev != null) : (logdev = logdev.*.next) {
            if (recording) {
                const need_float32: bool = (logdev.*.postmix != null) or (logdev.*.gain != @as(f32, 1.0));
                _ = &need_float32;
                spec.format = @bitCast(if (need_float32) SDL_AUDIO_F32 else @as(c_int, @bitCast(devformat)));
            }
            {
                var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
                _ = &stream;
                while (stream != null) : (stream = stream.*.next_binding) {
                    var streamspec: [*c]SDL_AudioSpec = if (recording) &stream.*.src_spec else &stream.*.dst_spec;
                    _ = &streamspec;
                    var streamchmap: [*c][*c]c_int = if (recording) &stream.*.src_chmap else &stream.*.dst_chmap;
                    _ = &streamchmap;
                    SDL_LockMutex_REAL(stream.*.lock);
                    {
                        comptime {
                            if (!(@sizeOf(@TypeOf(streamspec.*)) == @sizeOf(@TypeOf((&spec).*)))) @compileError("static assertion failed \"sizeof (*(streamspec)) == sizeof (*( &spec))\"");
                        }
                    }
                    _ = memcpy(@ptrCast(@alignCast(streamspec)), @ptrCast(@alignCast(&spec)), @sizeOf(@TypeOf((&spec).*)));
                    _ = SetAudioStreamChannelMap(stream, streamspec, streamchmap, device.*.chmap, device.*.spec.channels, -@as(c_int, 1));
                    SDL_UnlockMutex_REAL(stream.*.lock);
                }
            }
        }
    }
}
pub export fn SDL_AudioSpecsEqual(a: [*c]const SDL_AudioSpec, b: [*c]const SDL_AudioSpec, channel_map_a: [*c]const c_int, channel_map_b: [*c]const c_int) bool {
    @setEvalBranchQuota(100000);
    if ((((a.*.format != b.*.format) or (a.*.channels != b.*.channels)) or (a.*.freq != b.*.freq)) or (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(channel_map_a)))) != @as(?*anyopaque, null)) != @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(channel_map_b)))) != @as(?*anyopaque, null)))) {
        return @"false" != 0;
    } else if ((channel_map_a != null) and (SDL_memcmp_REAL(@ptrCast(@alignCast(channel_map_a)), @ptrCast(@alignCast(channel_map_b)), @sizeOf(@TypeOf(channel_map_a.*)) *% @as(c_ulong, @bitCast(@as(c_long, a.*.channels)))) != @as(c_int, 0))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_AudioChannelMapsEqual(channels: c_int, channel_map_a: [*c]const c_int, channel_map_b: [*c]const c_int) bool {
    @setEvalBranchQuota(100000);
    if (channel_map_a == channel_map_b) {
        return @"true" != 0;
    } else if (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(channel_map_a)))) != @as(?*anyopaque, null)) != @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(channel_map_b)))) != @as(?*anyopaque, null))) {
        return @"false" != 0;
    } else if ((channel_map_a != null) and (SDL_memcmp_REAL(@ptrCast(@alignCast(channel_map_a)), @ptrCast(@alignCast(channel_map_b)), @sizeOf(@TypeOf(channel_map_a.*)) *% @as(c_ulong, @bitCast(@as(c_long, channels)))) != @as(c_int, 0))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn ZombieWaitDevice(device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0)) {
        const frames: c_int = @divTrunc(device.*.buffer_size, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)))));
        _ = &frames;
        SDL_Delay_REAL(@bitCast(@as(c_int, @divTrunc(frames * @as(c_int, 1000), device.*.spec.freq))));
    }
    return @"true" != 0;
}
pub fn ZombiePlayDevice(_: [*c]SDL_AudioDevice, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn ZombieGetDeviceBuf(device: [*c]SDL_AudioDevice, _: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    return device.*.work_buffer;
}
pub fn ZombieRecordDevice(device: [*c]SDL_AudioDevice, buffer: ?*anyopaque, buflen: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = memset(buffer, device.*.silence_value, @bitCast(@as(c_long, buflen)));
    return buflen;
}
pub fn ZombieFlushRecording(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
comptime {
    if (!(@as(c_uint, 4294967294) < @as(c_uint, 4294967295))) @compileError("static assertion failed \"SDL_AUDIO_DEVICE_DEFAULT_RECORDING < SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK\"");
}
pub var last_device_instance_id: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub fn AssignAudioDeviceInstanceId(recording: bool, islogical: bool) callconv(.c) SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "AssignAudioDeviceInstanceId".*;
    };
    _ = &static_local___func__;
    const flags: SDL_AudioDeviceID = @bitCast(@as(c_int, (if (recording) @as(c_int, 0) else @as(c_int, 1) << @intCast(@as(c_int, 0))) | (if (islogical) @as(c_int, 0) else @as(c_int, 1) << @intCast(@as(c_int, 1)))));
    _ = &flags;
    const instance_id: SDL_AudioDeviceID = (@as(SDL_AudioDeviceID, @bitCast(@as(c_int, SDL_AddAtomicInt_REAL(&last_device_instance_id, 1) + @as(c_int, 1)))) << @intCast(@as(SDL_AudioDeviceID, 2))) | flags;
    _ = &instance_id;
    while (true) {
        while (!((instance_id >= @as(SDL_AudioDeviceID, 2)) and (instance_id < @as(c_uint, 4294967294)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(instance_id >= 2) && (instance_id < ((SDL_AudioDeviceID) 0xFFFFFFFEu))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 382);
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
    return instance_id;
}
pub export fn SDL_IsAudioDevicePhysical_REAL(devid: SDL_AudioDeviceID) bool {
    @setEvalBranchQuota(100000);
    return (devid & @as(SDL_AudioDeviceID, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != @as(SDL_AudioDeviceID, 0);
}
pub fn SDL_IsAudioDeviceLogical(devid: SDL_AudioDeviceID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (devid & @as(SDL_AudioDeviceID, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) == @as(SDL_AudioDeviceID, 0);
}
pub export fn SDL_IsAudioDevicePlayback_REAL(devid: SDL_AudioDeviceID) bool {
    @setEvalBranchQuota(100000);
    return (devid & @as(SDL_AudioDeviceID, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != @as(SDL_AudioDeviceID, 0);
}
pub fn SDL_IsAudioDeviceRecording(devid: SDL_AudioDeviceID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (devid & @as(SDL_AudioDeviceID, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) == @as(SDL_AudioDeviceID, 0);
}
pub fn ObtainPhysicalAudioDeviceObj(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        RefPhysicalAudioDevice(device);
        SDL_LockMutex_REAL(device.*.lock);
    }
}
pub fn ReleaseAudioDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        SDL_UnlockMutex_REAL(device.*.lock);
        UnrefPhysicalAudioDevice(device);
    }
}
pub fn ObtainLogicalAudioDevice(devid: SDL_AudioDeviceID, _device: [*c][*c]SDL_AudioDevice) callconv(.c) [*c]SDL_LogicalAudioDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "ObtainLogicalAudioDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(_device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "_device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 429);
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
    if (!(SDL_GetCurrentAudioDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
        _device.* = null;
        return null;
    }
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = null;
    _ = &logdev;
    if (SDL_IsAudioDeviceLogical(devid)) {
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        _ = SDL_FindInHashTable(current_audio.device_hash_logical, @ptrFromInt(@as(usize, devid)), @ptrCast(@alignCast(&logdev)));
        if (logdev != null) {
            while (true) {
                while (!(logdev.*.instance_id == devid)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "logdev->instance_id == devid",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 444);
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
            device = logdev.*.physical_device;
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "device != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 446);
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
            RefPhysicalAudioDevice(device);
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        if (logdev != null) {
            while (true) {
                SDL_LockMutex_REAL(device.*.lock);
                var recheck_device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(SDL_GetAtomicPointer_REAL(@ptrCast(@alignCast(&logdev.*.physical_device)))));
                _ = &recheck_device;
                if (device == recheck_device) {
                    break;
                }
                RefPhysicalAudioDevice(recheck_device);
                SDL_UnlockMutex_REAL(device.*.lock);
                UnrefPhysicalAudioDevice(device);
                device = recheck_device;
            }
        }
    }
    if (!(logdev != null)) {
        _ = SDL_SetError_REAL("Invalid audio device instance ID");
    }
    _device.* = device;
    return logdev;
}
pub fn ObtainPhysicalAudioDevice(devid: SDL_AudioDeviceID) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "ObtainPhysicalAudioDevice".*;
    };
    _ = &static_local___func__;
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    if (SDL_IsAudioDeviceLogical(devid)) {
        _ = ObtainLogicalAudioDevice(devid, &device);
    } else if (!(SDL_GetCurrentAudioDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
    } else {
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        _ = SDL_FindInHashTable(current_audio.device_hash_physical, @ptrFromInt(@as(usize, devid)), @ptrCast(@alignCast(&device)));
        while (true) {
            while (!(!(device != null) or (device.*.instance_id == devid))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!device || (device->instance_id == devid)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 492);
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
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        if (!(device != null)) {
            _ = SDL_SetError_REAL("Invalid audio device instance ID");
        } else {
            ObtainPhysicalAudioDeviceObj(device);
        }
    }
    return device;
}
pub fn ObtainPhysicalAudioDeviceDefaultAllowed(arg_devid: SDL_AudioDeviceID) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    var devid = arg_devid;
    _ = &devid;
    const wants_default: bool = (devid == @as(c_uint, 4294967295)) or (devid == @as(c_uint, 4294967294));
    _ = &wants_default;
    if (!wants_default) {
        return ObtainPhysicalAudioDevice(devid);
    }
    const orig_devid: SDL_AudioDeviceID = devid;
    _ = &orig_devid;
    while (true) {
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        if (orig_devid == @as(c_uint, 4294967295)) {
            devid = current_audio.default_playback_device_id;
        } else if (orig_devid == @as(c_uint, 4294967294)) {
            devid = current_audio.default_recording_device_id;
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        if (devid == @as(SDL_AudioDeviceID, 0)) {
            _ = SDL_SetError_REAL("No default audio device available");
            break;
        }
        var device: [*c]SDL_AudioDevice = ObtainPhysicalAudioDevice(devid);
        _ = &device;
        if (!(device != null)) {
            break;
        }
        var got_it: bool = @"false" != 0;
        _ = &got_it;
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        if ((orig_devid == @as(c_uint, 4294967295)) and (devid == current_audio.default_playback_device_id)) {
            got_it = @"true" != 0;
        } else if ((orig_devid == @as(c_uint, 4294967294)) and (devid == current_audio.default_recording_device_id)) {
            got_it = @"true" != 0;
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        if (got_it) {
            return device;
        }
        ReleaseAudioDevice(device);
    }
    return null;
}
pub fn DestroyLogicalAudioDevice(logdev: [*c]SDL_LogicalAudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (current_audio.device_hash_logical != null) {
        SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
        _ = SDL_RemoveFromHashTable(current_audio.device_hash_logical, @ptrFromInt(@as(usize, logdev.*.instance_id)));
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    }
    if (logdev.*.next != null) {
        logdev.*.next.*.prev = logdev.*.prev;
    }
    if (logdev.*.prev != null) {
        logdev.*.prev.*.next = logdev.*.next;
    }
    if (logdev.*.physical_device.*.logical_devices == logdev) {
        logdev.*.physical_device.*.logical_devices = logdev.*.next;
    }
    var next: [*c]SDL_AudioStream = undefined;
    _ = &next;
    {
        var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
        _ = &stream;
        while (stream != null) : (stream = next) {
            SDL_LockMutex_REAL(stream.*.lock);
            next = stream.*.next_binding;
            stream.*.next_binding = null;
            stream.*.prev_binding = null;
            stream.*.bound_device = null;
            SDL_UnlockMutex_REAL(stream.*.lock);
        }
    }
    UpdateAudioStreamFormatsPhysical(logdev.*.physical_device);
    if (logdev.*.props != 0) {
        SDL_DestroyProperties_REAL(logdev.*.props);
    }
    SDL_free_REAL(@ptrCast(@alignCast(logdev)));
}
pub fn DestroyPhysicalAudioDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(device != null)) {
        return;
    }
    SDL_LockMutex_REAL(device.*.lock);
    while (device.*.logical_devices != null) {
        DestroyLogicalAudioDevice(device.*.logical_devices);
    }
    ClosePhysicalAudioDevice(device);
    current_audio.impl.FreeDeviceHandle.?(device);
    SDL_UnlockMutex_REAL(device.*.lock);
    if (device.*.props != 0) {
        SDL_DestroyProperties_REAL(device.*.props);
    }
    SDL_DestroyMutex_REAL(device.*.lock);
    SDL_DestroyCondition_REAL(device.*.close_cond);
    SDL_free_REAL(@ptrCast(@alignCast(device.*.work_buffer)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.chmap)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.unique_id)));
    SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(device)));
}
pub export fn UnrefPhysicalAudioDevice(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    if (SDL_AddAtomicInt_REAL(&device.*.refcount, -@as(c_int, 1)) == @as(c_int, 1)) {
        SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
        if (SDL_RemoveFromHashTable(current_audio.device_hash_physical, @ptrFromInt(@as(usize, device.*.instance_id)))) {
            _ = SDL_AddAtomicInt_REAL(if (device.*.recording) &current_audio.recording_device_count else &current_audio.playback_device_count, -@as(c_int, 1));
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        DestroyPhysicalAudioDevice(device);
    }
}
pub export fn RefPhysicalAudioDevice(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    _ = SDL_AddAtomicInt_REAL(&device.*.refcount, 1);
}
pub fn CreatePhysicalAudioDevice(name: [*c]const u8, unique_id: [*c]const u8, recording: bool, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque, device_count: [*c]SDL_AtomicInt) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "CreatePhysicalAudioDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(name)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "name != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 648);
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
    SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
    const shutting_down: c_int = SDL_GetAtomicInt_REAL(&current_audio.shutting_down);
    _ = &shutting_down;
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    if (shutting_down != 0) {
        return null;
    }
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_AudioDevice))));
    _ = &device;
    if (!(device != null)) {
        return null;
    }
    device.*.name = SDL_strdup_REAL(name);
    if (!(device.*.name != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    if (unique_id != null) {
        device.*.unique_id = SDL_strdup_REAL(unique_id);
        if (!(device.*.unique_id != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
            SDL_free_REAL(@ptrCast(@alignCast(device)));
            return null;
        }
    }
    device.*.lock = SDL_CreateMutex_REAL();
    if (!(device.*.lock != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.unique_id)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    device.*.close_cond = SDL_CreateCondition_REAL();
    if (!(device.*.close_cond != null)) {
        SDL_DestroyMutex_REAL(device.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(device.*.unique_id)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        return null;
    }
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 0);
    _ = SDL_SetAtomicInt_REAL(&device.*.zombie, 0);
    device.*.recording = recording;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.spec).*)) == @sizeOf(@TypeOf(spec.*)))) @compileError("static assertion failed \"sizeof (*(&device->spec)) == sizeof (*( spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.spec)), @ptrCast(@alignCast(spec)), @sizeOf(@TypeOf(spec.*)));
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.default_spec).*)) == @sizeOf(@TypeOf(spec.*)))) @compileError("static assertion failed \"sizeof (*(&device->default_spec)) == sizeof (*( spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.default_spec)), @ptrCast(@alignCast(spec)), @sizeOf(@TypeOf(spec.*)));
    device.*.sample_frames = SDL_GetDefaultSampleFramesFromFreq(device.*.spec.freq);
    device.*.silence_value = SDL_GetSilenceValueForFormat_REAL(device.*.spec.format);
    device.*.handle = handle;
    device.*.instance_id = AssignAudioDeviceInstanceId(recording, @"false" != 0);
    SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
    if (SDL_InsertIntoHashTable(current_audio.device_hash_physical, @ptrFromInt(@as(usize, device.*.instance_id)), @ptrCast(@alignCast(device)), @"false" != 0)) {
        _ = SDL_AddAtomicInt_REAL(device_count, 1);
    } else {
        SDL_DestroyCondition_REAL(device.*.close_cond);
        SDL_DestroyMutex_REAL(device.*.lock);
        SDL_free_REAL(@ptrCast(@alignCast(device.*.unique_id)));
        SDL_free_REAL(@ptrCast(@alignCast(device.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(device)));
        device = null;
    }
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    RefPhysicalAudioDevice(device);
    return device;
}
pub fn CreateAudioRecordingDevice(name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "CreateAudioRecordingDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!current_audio.impl.HasRecordingSupport) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "current_audio.impl.HasRecordingSupport",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 724);
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
    return CreatePhysicalAudioDevice(name, unique_id, @"true" != 0, spec, handle, &current_audio.recording_device_count);
}
pub fn CreateAudioPlaybackDevice(name: [*c]const u8, unique_id: [*c]const u8, spec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    return CreatePhysicalAudioDevice(name, unique_id, @"false" != 0, spec, handle, &current_audio.playback_device_count);
}
pub export fn SDL_AddAudioDevice(recording: bool, name: [*c]const u8, unique_id: [*c]const u8, inspec: [*c]const SDL_AudioSpec, handle: ?*anyopaque) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_AddAudioDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(SDL_FindPhysicalAudioDeviceByHandle(handle)))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_FindPhysicalAudioDeviceByHandle(handle) == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 737);
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
    const default_format: SDL_AudioFormat = @bitCast(if (recording) SDL_AUDIO_S16 else SDL_AUDIO_S16);
    _ = &default_format;
    const default_channels: c_int = if (recording) DEFAULT_AUDIO_RECORDING_CHANNELS else DEFAULT_AUDIO_PLAYBACK_CHANNELS;
    _ = &default_channels;
    const default_freq: c_int = if (recording) DEFAULT_AUDIO_RECORDING_FREQUENCY else DEFAULT_AUDIO_PLAYBACK_FREQUENCY;
    _ = &default_freq;
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    _ = memset(@ptrCast(@alignCast(&spec)), 0, @sizeOf(@TypeOf(spec)));
    if (!(inspec != null)) {
        spec.format = default_format;
        spec.channels = default_channels;
        spec.freq = default_freq;
    } else {
        spec.format = if (inspec.*.format != @as(SDL_AudioFormat, 0)) inspec.*.format else default_format;
        spec.channels = if (inspec.*.channels != @as(c_int, 0)) inspec.*.channels else default_channels;
        spec.freq = if (inspec.*.freq != @as(c_int, 0)) inspec.*.freq else default_freq;
    }
    var device: [*c]SDL_AudioDevice = if (recording) CreateAudioRecordingDevice(name, unique_id, &spec, handle) else CreateAudioPlaybackDevice(name, unique_id, &spec, handle);
    _ = &device;
    if (device != null) {
        var p: [*c]SDL_PendingAudioDeviceEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
        _ = &p;
        if (p != null) {
            p.*.type = SDL_EVENT_AUDIO_DEVICE_ADDED;
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 765);
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
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail->next == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 766);
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
            current_audio.pending_events_tail.*.next = p;
            current_audio.pending_events_tail = p;
            SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        }
    }
    return device;
}
pub fn SetAudioDeviceZombieFunctions(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    device.*.WaitDevice = ZombieWaitDevice;
    device.*.GetDeviceBuf = ZombieGetDeviceBuf;
    device.*.PlayDevice = ZombiePlayDevice;
    device.*.WaitRecordingDevice = ZombieWaitDevice;
    device.*.RecordDevice = ZombieRecordDevice;
    device.*.FlushRecording = ZombieFlushRecording;
}
pub fn SDL_AudioDeviceDisconnected_OnMainThread(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [40:0]u8 = "SDL_AudioDeviceDisconnected_OnMainThread".*;
    };
    _ = &static_local___func__;
    const devid: SDL_AudioDeviceID = @truncate(@as(usize, @intCast(@intFromPtr(userdata))));
    _ = &devid;
    var device: [*c]SDL_AudioDevice = ObtainPhysicalAudioDevice(devid);
    _ = &device;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        return;
    }
    var pending: SDL_PendingAudioDeviceEvent = undefined;
    _ = &pending;
    pending.next = null;
    var pending_tail: [*c]SDL_PendingAudioDeviceEvent = &pending;
    _ = &pending_tail;
    SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
    const is_default_device: bool = (devid == current_audio.default_playback_device_id) or (devid == current_audio.default_recording_device_id);
    _ = &is_default_device;
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    const first_disconnect: bool = SDL_CompareAndSwapAtomicInt_REAL(&device.*.zombie, 0, 2) or SDL_CompareAndSwapAtomicInt_REAL(&device.*.zombie, 1, 2);
    _ = &first_disconnect;
    if (first_disconnect) {
        SetAudioDeviceZombieFunctions(device);
        {
            var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
            _ = &logdev;
            while (logdev != null) : (logdev = logdev.*.next) {
                if (!is_default_device or !logdev.*.opened_as_default) {
                    var p: [*c]SDL_PendingAudioDeviceEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
                    _ = &p;
                    if (p != null) {
                        p.*.type = SDL_EVENT_AUDIO_DEVICE_REMOVED;
                        p.*.devid = logdev.*.instance_id;
                        p.*.next = null;
                        pending_tail.*.next = p;
                        pending_tail = p;
                    }
                }
            }
        }
        var p: [*c]SDL_PendingAudioDeviceEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
        _ = &p;
        if (p != null) {
            p.*.type = SDL_EVENT_AUDIO_DEVICE_REMOVED;
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            pending_tail.*.next = p;
            pending_tail = p;
        }
    }
    ReleaseAudioDevice(device);
    if (first_disconnect) {
        if (pending.next != null) {
            SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 848);
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
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail->next == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 849);
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
            current_audio.pending_events_tail.*.next = pending.next;
            current_audio.pending_events_tail = pending_tail;
            SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        }
        UnrefPhysicalAudioDevice(device);
    }
    UnrefPhysicalAudioDevice(device);
}
pub export fn SDL_AudioDeviceDisconnected(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    if (device != null) {
        RefPhysicalAudioDevice(device);
        _ = SDL_CompareAndSwapAtomicInt_REAL(&device.*.zombie, 0, 1);
        _ = SDL_RunOnMainThread_REAL(SDL_AudioDeviceDisconnected_OnMainThread, @ptrFromInt(@as(usize, device.*.instance_id)), @"false" != 0);
    }
}
pub fn SDL_AudioThreadDeinit_Default(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_AudioWaitDevice_Default(_: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_AudioPlayDevice_Default(_: [*c]SDL_AudioDevice, _: [*c]const Uint8, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_AudioWaitRecordingDevice_Default(_: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_AudioFlushRecording_Default(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_AudioCloseDevice_Default(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_AudioDeinitializeStart_Default() callconv(.c) void {}
pub fn SDL_AudioDeinitialize_Default() callconv(.c) void {}
pub fn SDL_AudioFreeDeviceHandle_Default(_: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_AudioThreadInit_Default(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetCurrentThreadPriority_REAL(@bitCast(if (device.*.recording) SDL_THREAD_PRIORITY_HIGH else SDL_THREAD_PRIORITY_TIME_CRITICAL));
}
pub fn SDL_AudioDetectDevices_Default(default_playback: [*c][*c]SDL_AudioDevice, default_recording: [*c][*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_AudioDetectDevices_Default".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!current_audio.impl.OnlyHasDefaultPlaybackDevice) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "current_audio.impl.OnlyHasDefaultPlaybackDevice",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 900);
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
        while (!(current_audio.impl.OnlyHasDefaultRecordingDevice or !current_audio.impl.HasRecordingSupport)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "current_audio.impl.OnlyHasDefaultRecordingDevice || !current_audio.impl.HasRecordingSupport",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 901);
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
    default_playback.* = SDL_AddAudioDevice(@"false" != 0, "System audio playback device", null, null, @ptrFromInt(@as(usize, @bitCast(@as(c_long, @as(c_int, 1))))));
    if (current_audio.impl.HasRecordingSupport) {
        default_recording.* = SDL_AddAudioDevice(@"true" != 0, "System audio recording device", null, null, @ptrFromInt(@as(usize, @bitCast(@as(c_long, @as(c_int, 2))))));
    }
}
pub fn SDL_AudioGetDeviceBuf_Default(_: [*c]SDL_AudioDevice, buffer_size: [*c]c_int) callconv(.c) [*c]Uint8 {
    @setEvalBranchQuota(100000);
    buffer_size.* = 0;
    return null;
}
pub fn SDL_AudioRecordDevice_Default(_: [*c]SDL_AudioDevice, _: ?*anyopaque, _: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return -@as(c_int, 1);
}
pub fn SDL_AudioOpenDevice_Default(_: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn CompleteAudioEntryPoints() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(current_audio.impl.DetectDevices != null)) {
        current_audio.impl.DetectDevices = SDL_AudioDetectDevices_Default;
    }
    if (!(current_audio.impl.OpenDevice != null)) {
        current_audio.impl.OpenDevice = SDL_AudioOpenDevice_Default;
    }
    if (!(current_audio.impl.ThreadInit != null)) {
        current_audio.impl.ThreadInit = SDL_AudioThreadInit_Default;
    }
    if (!(current_audio.impl.ThreadDeinit != null)) {
        current_audio.impl.ThreadDeinit = SDL_AudioThreadDeinit_Default;
    }
    if (!(current_audio.impl.WaitDevice != null)) {
        current_audio.impl.WaitDevice = SDL_AudioWaitDevice_Default;
    }
    if (!(current_audio.impl.PlayDevice != null)) {
        current_audio.impl.PlayDevice = SDL_AudioPlayDevice_Default;
    }
    if (!(current_audio.impl.GetDeviceBuf != null)) {
        current_audio.impl.GetDeviceBuf = SDL_AudioGetDeviceBuf_Default;
    }
    if (!(current_audio.impl.WaitRecordingDevice != null)) {
        current_audio.impl.WaitRecordingDevice = SDL_AudioWaitRecordingDevice_Default;
    }
    if (!(current_audio.impl.RecordDevice != null)) {
        current_audio.impl.RecordDevice = SDL_AudioRecordDevice_Default;
    }
    if (!(current_audio.impl.FlushRecording != null)) {
        current_audio.impl.FlushRecording = SDL_AudioFlushRecording_Default;
    }
    if (!(current_audio.impl.CloseDevice != null)) {
        current_audio.impl.CloseDevice = SDL_AudioCloseDevice_Default;
    }
    if (!(current_audio.impl.FreeDeviceHandle != null)) {
        current_audio.impl.FreeDeviceHandle = SDL_AudioFreeDeviceHandle_Default;
    }
    if (!(current_audio.impl.DeinitializeStart != null)) {
        current_audio.impl.DeinitializeStart = SDL_AudioDeinitializeStart_Default;
    }
    if (!(current_audio.impl.Deinitialize != null)) {
        current_audio.impl.Deinitialize = SDL_AudioDeinitialize_Default;
    }
}
pub const struct_FindLowestDeviceIDData = extern struct {
    recording: bool = false,
    highest: SDL_AudioDeviceID = 0,
    result: [*c]SDL_AudioDevice = null,
};
pub const FindLowestDeviceIDData = struct_FindLowestDeviceIDData;
pub fn FindLowestDeviceID(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "FindLowestDeviceID".*;
    };
    _ = &static_local___func__;
    var data: [*c]FindLowestDeviceIDData = @ptrCast(@alignCast(userdata));
    _ = &data;
    const devid: SDL_AudioDeviceID = @truncate(@as(usize, @intCast(@intFromPtr(key))));
    _ = &devid;
    while (true) {
        while (!SDL_IsAudioDevicePhysical_REAL(devid)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsAudioDevicePhysical_REAL(devid)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 958);
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
    if ((@as(c_int, @intFromBool(SDL_IsAudioDeviceRecording(devid))) == @as(c_int, @intFromBool(data.*.recording))) and (devid < data.*.highest)) {
        data.*.highest = devid;
        data.*.result = @ptrCast(@alignCast(@constCast(value)));
        while (true) {
            while (!(data.*.result.*.instance_id == devid)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "data->result->instance_id == devid",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 962);
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
    }
    return @"true" != 0;
}
pub fn GetFirstAddedAudioDevice(recording: bool) callconv(.c) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    _ = &recording;
    const highest: SDL_AudioDeviceID = @as(c_uint, 4294967295);
    _ = &highest;
    var data: FindLowestDeviceIDData = FindLowestDeviceIDData{
        .recording = recording,
        .highest = highest,
        .result = null,
    };
    _ = &data;
    SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
    _ = SDL_IterateHashTable(current_audio.device_hash_physical, FindLowestDeviceID, @ptrCast(@alignCast(&data)));
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    return data.result;
}
pub fn HashAudioDeviceID(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return @as(Uint32, @truncate(@as(usize, @intCast(@intFromPtr(key))))) >> @intCast(@as(Uint32, 2));
}
pub export fn SDL_InitAudio(arg_driver_name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var driver_name = arg_driver_name;
    _ = &driver_name;
    if (SDL_GetCurrentAudioDriver_REAL() != null) {
        SDL_QuitAudio();
    }
    _ = SDL_CompareAndSwapAtomicInt_REAL(&last_device_instance_id, 0, 2);
    SDL_ChooseAudioConverters();
    SDL_SetupAudioResampler();
    var subsystem_rwlock: ?*SDL_RWLock = SDL_CreateRWLock_REAL();
    _ = &subsystem_rwlock;
    if (!(subsystem_rwlock != null)) {
        return @"false" != 0;
    }
    var device_hash_physical: ?*SDL_HashTable = SDL_CreateHashTable(0, @"false" != 0, HashAudioDeviceID, SDL_KeyMatchID, null, null);
    _ = &device_hash_physical;
    if (!(device_hash_physical != null)) {
        SDL_DestroyRWLock_REAL(subsystem_rwlock);
        return @"false" != 0;
    }
    var device_hash_logical: ?*SDL_HashTable = SDL_CreateHashTable(0, @"false" != 0, HashAudioDeviceID, SDL_KeyMatchID, null, null);
    _ = &device_hash_logical;
    if (!(device_hash_logical != null)) {
        SDL_DestroyHashTable(device_hash_physical);
        SDL_DestroyRWLock_REAL(subsystem_rwlock);
        return @"false" != 0;
    }
    if (!(driver_name != null)) {
        driver_name = SDL_GetHint_REAL("SDL_AUDIO_DRIVER");
    }
    var initialized: bool = @"false" != 0;
    _ = &initialized;
    var tried_to_init: bool = @"false" != 0;
    _ = &tried_to_init;
    if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
        var driver_name_copy: [*c]u8 = SDL_strdup_REAL(driver_name);
        _ = &driver_name_copy;
        var driver_attempt: [*c]const u8 = driver_name_copy;
        _ = &driver_attempt;
        if (!(driver_name_copy != null)) {
            SDL_DestroyRWLock_REAL(subsystem_rwlock);
            SDL_DestroyHashTable(device_hash_physical);
            SDL_DestroyHashTable(device_hash_logical);
            return @"false" != 0;
        }
        while (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !initialized) {
            var driver_attempt_end: [*c]u8 = SDL_strchr_REAL(driver_attempt, ',');
            _ = &driver_attempt_end;
            if (driver_attempt_end != null) {
                driver_attempt_end.* = '\x00';
            }
            if (SDL_strcmp_REAL(driver_attempt, "dsound") == @as(c_int, 0)) {
                driver_attempt = "directsound";
            } else if (SDL_strcmp_REAL(driver_attempt, "pulse") == @as(c_int, 0)) {
                driver_attempt = "pulseaudio";
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    if (!bootstrap[@bitCast(@as(isize, @intCast(i)))].*.is_preferred and (SDL_strcasecmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt) == @as(c_int, 0))) {
                        tried_to_init = @"true" != 0;
                        _ = memset(@ptrCast(@alignCast(&current_audio)), 0, @sizeOf(@TypeOf(current_audio)));
                        current_audio.pending_events_tail = &current_audio.pending_events;
                        current_audio.subsystem_rwlock = subsystem_rwlock;
                        current_audio.device_hash_physical = device_hash_physical;
                        current_audio.device_hash_logical = device_hash_logical;
                        if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.init.?(&current_audio.impl)) {
                            current_audio.name = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name;
                            current_audio.desc = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.desc;
                            initialized = @"true" != 0;
                            break;
                        }
                    }
                }
            }
            driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*anyopaque, null)));
        }
        SDL_free_REAL(@ptrCast(@alignCast(driver_name_copy)));
    } else {
        {
            var i: c_int = 0;
            _ = &i;
            while (!initialized and (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null)) : (i += 1) {
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.demand_only) {
                    continue;
                }
                tried_to_init = @"true" != 0;
                _ = memset(@ptrCast(@alignCast(&current_audio)), 0, @sizeOf(@TypeOf(current_audio)));
                current_audio.pending_events_tail = &current_audio.pending_events;
                current_audio.subsystem_rwlock = subsystem_rwlock;
                current_audio.device_hash_physical = device_hash_physical;
                current_audio.device_hash_logical = device_hash_logical;
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.init.?(&current_audio.impl)) {
                    current_audio.name = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name;
                    current_audio.desc = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.desc;
                    initialized = @"true" != 0;
                }
            }
        }
    }
    if (initialized) {
        SDL_DebugLogBackend("audio", current_audio.name);
    } else {
        if (!tried_to_init) {
            if (driver_name != null) {
                _ = SDL_SetError_REAL("Audio target '%s' not available", driver_name);
            } else {
                _ = SDL_SetError_REAL("No available audio device");
            }
        }
        SDL_DestroyRWLock_REAL(subsystem_rwlock);
        SDL_DestroyHashTable(device_hash_physical);
        SDL_DestroyHashTable(device_hash_logical);
        _ = memset(@ptrCast(@alignCast(&current_audio)), 0, @sizeOf(@TypeOf(current_audio)));
        return @"false" != 0;
    }
    CompleteAudioEntryPoints();
    var default_playback: [*c]SDL_AudioDevice = null;
    _ = &default_playback;
    var default_recording: [*c]SDL_AudioDevice = null;
    _ = &default_recording;
    current_audio.impl.DetectDevices.?(&default_playback, &default_recording);
    if (!(default_playback != null)) {
        default_playback = GetFirstAddedAudioDevice(@"false" != 0);
    }
    if (!(default_recording != null)) {
        default_recording = GetFirstAddedAudioDevice(@"true" != 0);
    }
    if (default_playback != null) {
        current_audio.default_playback_device_id = default_playback.*.instance_id;
        RefPhysicalAudioDevice(default_playback);
    }
    if (default_recording != null) {
        current_audio.default_recording_device_id = default_recording.*.instance_id;
        RefPhysicalAudioDevice(default_recording);
    }
    return @"true" != 0;
}
pub fn DestroyOnePhysicalAudioDevice(_: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "DestroyOnePhysicalAudioDevice".*;
    };
    _ = &static_local___func__;
    const devid: SDL_AudioDeviceID = @truncate(@as(usize, @intCast(@intFromPtr(key))));
    _ = &devid;
    while (true) {
        while (!SDL_IsAudioDevicePhysical_REAL(devid)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsAudioDevicePhysical_REAL(devid)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1140);
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
    var dev: [*c]SDL_AudioDevice = @ptrCast(@alignCast(@constCast(value)));
    _ = &dev;
    while (true) {
        while (!(dev.*.instance_id == devid)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dev->instance_id == devid",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1142);
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
    DestroyPhysicalAudioDevice(dev);
    return @"true" != 0;
}
pub export fn SDL_QuitAudio() void {
    @setEvalBranchQuota(100000);
    if (!(current_audio.name != null)) {
        return;
    }
    current_audio.impl.DeinitializeStart.?();
    var next: [*c]SDL_AudioStream = null;
    _ = &next;
    {
        var i: [*c]SDL_AudioStream = current_audio.existing_streams;
        _ = &i;
        while (i != null) : (i = next) {
            next = i.*.next;
            if (i.*.simplified or SDL_GetBooleanProperty_REAL(i.*.props, "SDL.audiostream.auto_cleanup", @"true" != 0)) {
                SDL_DestroyAudioStream_REAL(i);
            } else {
                i.*.prev = null;
                i.*.next = null;
            }
        }
    }
    SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
    _ = SDL_SetAtomicInt_REAL(&current_audio.shutting_down, 1);
    var device_hash_physical: ?*SDL_HashTable = current_audio.device_hash_physical;
    _ = &device_hash_physical;
    var device_hash_logical: ?*SDL_HashTable = current_audio.device_hash_logical;
    _ = &device_hash_logical;
    current_audio.device_hash_physical = blk: {
        const tmp = @as(?*SDL_HashTable, null);
        current_audio.device_hash_logical = tmp;
        break :blk tmp;
    };
    var pending_events: [*c]SDL_PendingAudioDeviceEvent = current_audio.pending_events.next;
    _ = &pending_events;
    current_audio.pending_events.next = null;
    _ = SDL_SetAtomicInt_REAL(&current_audio.playback_device_count, 0);
    _ = SDL_SetAtomicInt_REAL(&current_audio.recording_device_count, 0);
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    var pending_next: [*c]SDL_PendingAudioDeviceEvent = null;
    _ = &pending_next;
    {
        var i: [*c]SDL_PendingAudioDeviceEvent = pending_events;
        _ = &i;
        while (i != null) : (i = pending_next) {
            pending_next = i.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(i)));
        }
    }
    _ = SDL_IterateHashTable(device_hash_physical, DestroyOnePhysicalAudioDevice, null);
    current_audio.impl.Deinitialize.?();
    SDL_DestroyRWLock_REAL(current_audio.subsystem_rwlock);
    SDL_DestroyHashTable(device_hash_physical);
    SDL_DestroyHashTable(device_hash_logical);
    _ = memset(@ptrCast(@alignCast(&current_audio)), 0, @sizeOf(@TypeOf(current_audio)));
}
pub export fn SDL_AudioThreadFinalize(_: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
}
pub fn MixFloat32Audio(dst: [*c]f32, src: [*c]const f32, buffer_size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &buffer_size;
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "MixFloat32Audio".*;
    };
    _ = &static_local___func__;
    if (!SDL_MixAudio_REAL(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), SDL_AUDIO_F32, @bitCast(@as(c_int, buffer_size)), 1.0)) {
        while (true) {
            while (!!(@intFromPtr("This shouldn't happen.") != 0)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!\"This shouldn't happen.\"",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1205);
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
    }
}
pub export fn SDL_PlaybackAudioThreadSetup(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "SDL_PlaybackAudioThreadSetup".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1214);
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
    current_audio.impl.ThreadInit.?(device);
}
pub export fn SDL_PlaybackAudioThreadIterate(device: [*c]SDL_AudioDevice) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_PlaybackAudioThreadIterate".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1220);
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
    SDL_LockMutex_REAL(device.*.lock);
    if (SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) {
        SDL_UnlockMutex_REAL(device.*.lock);
        return @"false" != 0;
    }
    if (SDL_GetAtomicInt_REAL(&device.*.zombie) == @as(c_int, 1)) {
        SetAudioDeviceZombieFunctions(device);
    }
    var failed: bool = @"false" != 0;
    _ = &failed;
    var buffer_size: c_int = device.*.buffer_size;
    _ = &buffer_size;
    var device_buffer: [*c]Uint8 = device.*.GetDeviceBuf.?(device, &buffer_size);
    _ = &device_buffer;
    if (buffer_size == @as(c_int, 0)) {} else if (!(device_buffer != null)) {
        failed = @"true" != 0;
    } else {
        while (true) {
            while (!(buffer_size <= device.*.buffer_size)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "buffer_size <= device->buffer_size",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1242);
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
            while (!(@as(c_int, @intFromBool(AudioDeviceCanUseSimpleCopy(device))) == @as(c_int, @intFromBool(device.*.simple_copy)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "AudioDeviceCanUseSimpleCopy(device) == device->simple_copy",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1243);
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
        if (device.*.simple_copy) {
            var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
            _ = &logdev;
            var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
            _ = &stream;
            while (true) {
                while (!SDL_AudioSpecsEqual(&stream.*.dst_spec, &device.*.spec, null, null)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "SDL_AudioSpecsEqual(&stream->dst_spec, &device->spec, ((void*)0), ((void*)0))",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1251);
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
                while (!(stream.*.src_spec.format != @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "stream->src_spec.format != SDL_AUDIO_UNKNOWN",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1252);
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
            const br: c_int = if (SDL_GetAtomicInt_REAL(&logdev.*.paused) != 0) @as(c_int, 0) else SDL_GetAudioStreamDataAdjustGain(stream, @ptrCast(@alignCast(device_buffer)), buffer_size, logdev.*.gain);
            _ = &br;
            if (br < @as(c_int, 0)) {
                failed = @"true" != 0;
                _ = memset(@ptrCast(@alignCast(device_buffer)), device.*.silence_value, @bitCast(@as(c_long, buffer_size)));
            } else if (br < buffer_size) {
                _ = memset(@ptrCast(@alignCast(device_buffer + @as(usize, @bitCast(@as(isize, @intCast(br)))))), device.*.silence_value, @bitCast(@as(c_long, buffer_size - br)));
            }
            if ((br > @as(c_int, 0)) and !SDL_AudioChannelMapsEqual(device.*.spec.channels, stream.*.dst_chmap, device.*.chmap)) {
                ConvertAudio(@divTrunc(br, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels))))), @ptrCast(@alignCast(device_buffer)), device.*.spec.format, device.*.spec.channels, null, @ptrCast(@alignCast(device_buffer)), device.*.spec.format, device.*.spec.channels, device.*.chmap, null, 1.0);
            }
        } else {
            var final_mix_buffer: [*c]f32 = @ptrCast(@alignCast(if (device.*.spec.format == @as(SDL_AudioFormat, SDL_AUDIO_F32)) device_buffer else device.*.mix_buffer));
            _ = &final_mix_buffer;
            const needed_samples: c_int = @divTrunc(buffer_size, @as(c_int, @bitCast((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8))));
            _ = &needed_samples;
            const work_buffer_size: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, needed_samples))) *% @sizeOf(f32))));
            _ = &work_buffer_size;
            var outspec: SDL_AudioSpec = undefined;
            _ = &outspec;
            while (true) {
                while (!(work_buffer_size <= device.*.work_buffer_size)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "work_buffer_size <= device->work_buffer_size",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1273);
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
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&outspec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&outspec)) == sizeof (*( &device->spec))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&outspec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
            outspec.format = SDL_AUDIO_F32;
            _ = memset(@ptrCast(@alignCast(final_mix_buffer)), '\x00', @bitCast(@as(c_long, work_buffer_size)));
            {
                var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
                _ = &logdev;
                while (logdev != null) : (logdev = logdev.*.next) {
                    if (SDL_GetAtomicInt_REAL(&logdev.*.paused) != 0) {
                        continue;
                    }
                    const postmix: SDL_AudioPostmixCallback = logdev.*.postmix;
                    _ = &postmix;
                    var mix_buffer: [*c]f32 = final_mix_buffer;
                    _ = &mix_buffer;
                    if (postmix != null) {
                        mix_buffer = device.*.postmix_buffer;
                        _ = memset(@ptrCast(@alignCast(mix_buffer)), '\x00', @bitCast(@as(c_long, work_buffer_size)));
                    }
                    {
                        var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
                        _ = &stream;
                        while (stream != null) : (stream = stream.*.next_binding) {
                            while (true) {
                                while (!SDL_AudioSpecsEqual(&stream.*.dst_spec, &outspec, null, null)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "SDL_AudioSpecsEqual(&stream->dst_spec, &outspec, ((void*)0), ((void*)0))",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1294);
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
                                while (!(stream.*.src_spec.format != @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "stream->src_spec.format != SDL_AUDIO_UNKNOWN",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1296);
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
                            const br: c_int = SDL_GetAudioStreamDataAdjustGain(stream, @ptrCast(@alignCast(device.*.work_buffer)), work_buffer_size, logdev.*.gain);
                            _ = &br;
                            if (br < @as(c_int, 0)) {
                                failed = @"true" != 0;
                                break;
                            } else if (br > @as(c_int, 0)) {
                                if (!SDL_AudioChannelMapsEqual(device.*.spec.channels, stream.*.dst_chmap, device.*.chmap)) {
                                    ConvertAudio(@divTrunc(br, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels))))), @ptrCast(@alignCast(device.*.work_buffer)), device.*.spec.format, device.*.spec.channels, null, @ptrCast(@alignCast(device.*.work_buffer)), device.*.spec.format, device.*.spec.channels, device.*.chmap, null, 1.0);
                                }
                                MixFloat32Audio(mix_buffer, @ptrCast(@alignCast(device.*.work_buffer)), br);
                            }
                        }
                    }
                    if (postmix != null) {
                        while (true) {
                            while (!(mix_buffer == device.*.postmix_buffer)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "mix_buffer == device->postmix_buffer",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1317);
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
                        postmix.?(logdev.*.postmix_userdata, &outspec, mix_buffer, work_buffer_size);
                        MixFloat32Audio(final_mix_buffer, mix_buffer, work_buffer_size);
                    }
                }
            }
            if (@as([*c]Uint8, @ptrCast(@alignCast(final_mix_buffer))) != device_buffer) {
                ConvertAudio(@divTrunc(needed_samples, device.*.spec.channels), @ptrCast(@alignCast(final_mix_buffer)), SDL_AUDIO_F32, device.*.spec.channels, null, @ptrCast(@alignCast(device.*.work_buffer)), device.*.spec.format, device.*.spec.channels, null, null, 1.0);
                _ = memcpy(@ptrCast(@alignCast(device_buffer)), @ptrCast(@alignCast(device.*.work_buffer)), @bitCast(@as(c_long, buffer_size)));
            }
        }
        if (!device.*.PlayDevice.?(device, device_buffer, buffer_size)) {
            failed = @"true" != 0;
        }
    }
    SDL_UnlockMutex_REAL(device.*.lock);
    if (failed) {
        SDL_AudioDeviceDisconnected(device);
    }
    return @"true" != 0;
}
pub export fn SDL_PlaybackAudioThreadShutdown(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_PlaybackAudioThreadShutdown".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1348);
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
    const frames: c_int = @divTrunc(device.*.buffer_size, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)))));
    _ = &frames;
    if (!(SDL_GetAtomicInt_REAL(&device.*.zombie) != 0)) {
        var delay: c_int = @divTrunc(frames * @as(c_int, 1000), device.*.spec.freq) * @as(c_int, 2);
        _ = &delay;
        if (delay > @as(c_int, 100)) {
            delay = 100;
        }
        SDL_Delay_REAL(@bitCast(@as(c_int, delay)));
    }
    current_audio.impl.ThreadDeinit.?(device);
    SDL_AudioThreadFinalize(device);
}
pub fn PlaybackAudioThread(devicep: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "PlaybackAudioThread".*;
    };
    _ = &static_local___func__;
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(devicep));
    _ = &device;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1365);
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
        while (!!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1366);
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
    SDL_PlaybackAudioThreadSetup(device);
    while (SDL_PlaybackAudioThreadIterate(device)) {
        if (!device.*.WaitDevice.?(device)) {
            SDL_AudioDeviceDisconnected(device);
        }
    }
    SDL_PlaybackAudioThreadShutdown(device);
    return 0;
}
pub export fn SDL_RecordingAudioThreadSetup(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_RecordingAudioThreadSetup".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1385);
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
    current_audio.impl.ThreadInit.?(device);
}
pub export fn SDL_RecordingAudioThreadIterate(device: [*c]SDL_AudioDevice) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_RecordingAudioThreadIterate".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1391);
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
    SDL_LockMutex_REAL(device.*.lock);
    if (SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) {
        SDL_UnlockMutex_REAL(device.*.lock);
        return @"false" != 0;
    }
    if (SDL_GetAtomicInt_REAL(&device.*.zombie) == @as(c_int, 1)) {
        SetAudioDeviceZombieFunctions(device);
    }
    var failed: bool = @"false" != 0;
    _ = &failed;
    if (!(device.*.logical_devices != null)) {
        device.*.FlushRecording.?(device);
    } else {
        var br: c_int = device.*.RecordDevice.?(device, @ptrCast(@alignCast(device.*.work_buffer)), device.*.buffer_size);
        _ = &br;
        if (br < @as(c_int, 0)) {
            failed = @"true" != 0;
        } else if (br > @as(c_int, 0)) {
            {
                var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
                _ = &logdev;
                while (logdev != null) : (logdev = logdev.*.next) {
                    if (SDL_GetAtomicInt_REAL(&logdev.*.paused) != 0) {
                        continue;
                    }
                    var output_buffer: ?*anyopaque = @ptrCast(@alignCast(device.*.work_buffer));
                    _ = &output_buffer;
                    if ((logdev.*.postmix != null) or (logdev.*.gain != @as(f32, 1.0))) {
                        var outspec: SDL_AudioSpec = undefined;
                        _ = &outspec;
                        {
                            comptime {
                                if (!(@sizeOf(@TypeOf((&outspec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&outspec)) == sizeof (*( &device->spec))\"");
                            }
                        }
                        _ = memcpy(@ptrCast(@alignCast(&outspec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
                        outspec.format = SDL_AUDIO_F32;
                        output_buffer = @ptrCast(@alignCast(device.*.postmix_buffer));
                        const frames: c_int = @divTrunc(br, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels)))));
                        _ = &frames;
                        br = frames * @as(c_int, @bitCast(((outspec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(outspec.channels))));
                        ConvertAudio(frames, @ptrCast(@alignCast(device.*.work_buffer)), device.*.spec.format, outspec.channels, null, @ptrCast(@alignCast(device.*.postmix_buffer)), SDL_AUDIO_F32, outspec.channels, null, null, logdev.*.gain);
                        if (logdev.*.postmix != null) {
                            logdev.*.postmix.?(logdev.*.postmix_userdata, &outspec, device.*.postmix_buffer, br);
                        }
                    }
                    {
                        var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
                        _ = &stream;
                        while (stream != null) : (stream = stream.*.next_binding) {
                            while (true) {
                                while (!(stream.*.src_spec.format == @as(SDL_AudioFormat, @bitCast(if ((logdev.*.postmix != null) or (logdev.*.gain != @as(f32, 1.0))) SDL_AUDIO_F32 else @as(c_int, @bitCast(device.*.spec.format)))))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "stream->src_spec.format == ((logdev->postmix || (logdev->gain != 1.0f)) ? SDL_AUDIO_F32 : device->spec.format)",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1439);
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
                                while (!(stream.*.src_spec.channels == device.*.spec.channels)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "stream->src_spec.channels == device->spec.channels",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1440);
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
                                while (!(stream.*.src_spec.freq == device.*.spec.freq)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "stream->src_spec.freq == device->spec.freq",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1441);
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
                                while (!(stream.*.dst_spec.format != @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "stream->dst_spec.format != SDL_AUDIO_UNKNOWN",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1442);
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
                            var final_buf: ?*anyopaque = output_buffer;
                            _ = &final_buf;
                            if (!SDL_AudioChannelMapsEqual(device.*.spec.channels, stream.*.src_chmap, device.*.chmap)) {
                                final_buf = @ptrCast(@alignCast(device.*.mix_buffer));
                                ConvertAudio(@divTrunc(br, @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels))))), output_buffer, device.*.spec.format, device.*.spec.channels, null, final_buf, device.*.spec.format, device.*.spec.channels, stream.*.src_chmap, null, 1.0);
                            }
                            if (!SDL_PutAudioStreamData_REAL(stream, final_buf, br)) {
                                failed = @"true" != 0;
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(device.*.lock);
    if (failed) {
        SDL_AudioDeviceDisconnected(device);
    }
    return @"true" != 0;
}
pub export fn SDL_RecordingAudioThreadShutdown(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_RecordingAudioThreadShutdown".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1478);
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
    device.*.FlushRecording.?(device);
    current_audio.impl.ThreadDeinit.?(device);
    SDL_AudioThreadFinalize(device);
}
pub fn RecordingAudioThread(devicep: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "RecordingAudioThread".*;
    };
    _ = &static_local___func__;
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(devicep));
    _ = &device;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1487);
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
        while (!device.*.recording) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device->recording",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1488);
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
    SDL_RecordingAudioThreadSetup(device);
    while (true) {
        if (!device.*.WaitRecordingDevice.?(device)) {
            SDL_AudioDeviceDisconnected(device);
        }
        if (!SDL_RecordingAudioThreadIterate(device)) break;
    }
    SDL_RecordingAudioThreadShutdown(device);
    return 0;
}
pub const struct_CountAudioDevicesData = extern struct {
    devs_seen: c_int = 0,
    devs_skipped: c_int = 0,
    num_devices: c_int = 0,
    result: [*c]SDL_AudioDeviceID = null,
    recording: bool = false,
};
pub const CountAudioDevicesData = struct_CountAudioDevicesData;
pub fn CountAudioDevices(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "CountAudioDevices".*;
    };
    _ = &static_local___func__;
    var data: [*c]CountAudioDevicesData = @ptrCast(@alignCast(userdata));
    _ = &data;
    const devid: SDL_AudioDeviceID = @truncate(@as(usize, @intCast(@intFromPtr(key))));
    _ = &devid;
    while (true) {
        while (!SDL_IsAudioDevicePhysical_REAL(devid)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsAudioDevicePhysical_REAL(devid)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1514);
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
    if (@as(c_int, @intFromBool(SDL_IsAudioDeviceRecording(devid))) == @as(c_int, @intFromBool(data.*.recording))) {
        while (true) {
            while (!(data.*.devs_seen < data.*.num_devices)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "data->devs_seen < data->num_devices",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1516);
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
        var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(@constCast(value)));
        _ = &device;
        const zombie: bool = SDL_GetAtomicInt_REAL(&device.*.zombie) != @as(c_int, 0);
        _ = &zombie;
        if (zombie) {
            data.*.devs_skipped += 1;
        } else {
            data.*.result[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &data.*.devs_seen;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = devid;
        }
    }
    return @"true" != 0;
}
pub fn GetAudioDevices(count: [*c]c_int, recording: bool) callconv(.c) [*c]SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "GetAudioDevices".*;
    };
    _ = &static_local___func__;
    var result: [*c]SDL_AudioDeviceID = null;
    _ = &result;
    var num_devices: c_int = 0;
    _ = &num_devices;
    if (SDL_GetCurrentAudioDriver_REAL() != null) {
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        {
            num_devices = SDL_GetAtomicInt_REAL(if (recording) &current_audio.recording_device_count else &current_audio.playback_device_count);
            result = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_devices + @as(c_int, 1)))) *% @sizeOf(SDL_AudioDeviceID))));
            if (result != null) {
                var data: CountAudioDevicesData = CountAudioDevicesData{
                    .devs_seen = 0,
                    .devs_skipped = 0,
                    .num_devices = num_devices,
                    .result = result,
                    .recording = recording,
                };
                _ = &data;
                _ = SDL_IterateHashTable(current_audio.device_hash_physical, CountAudioDevices, @ptrCast(@alignCast(&data)));
                while (true) {
                    while (!((data.devs_seen + data.devs_skipped) == num_devices)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "(data.devs_seen + data.devs_skipped) == num_devices",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1541);
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
                num_devices = data.devs_seen;
                result[@bitCast(@as(isize, @intCast(num_devices)))] = 0;
            }
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    } else {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
    }
    if (count != null) {
        if (result != null) {
            count.* = num_devices;
        } else {
            count.* = 0;
        }
    }
    return result;
}
pub export fn SDL_GetAudioPlaybackDevices_REAL(count: [*c]c_int) [*c]SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    return GetAudioDevices(count, @"false" != 0);
}
pub export fn SDL_GetAudioRecordingDevices_REAL(count: [*c]c_int) [*c]SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    return GetAudioDevices(count, @"true" != 0);
}
pub const struct_FindAudioDeviceByCallbackData = extern struct {
    callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool = null,
    userdata: ?*anyopaque = null,
    retval: [*c]SDL_AudioDevice = null,
};
pub const FindAudioDeviceByCallbackData = struct_FindAudioDeviceByCallbackData;
pub fn FindAudioDeviceByCallback(userdata: ?*anyopaque, _: ?*const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "FindAudioDeviceByCallback".*;
    };
    _ = &static_local___func__;
    var data: [*c]FindAudioDeviceByCallbackData = @ptrCast(@alignCast(userdata));
    _ = &data;
    const devid: SDL_AudioDeviceID = @truncate(@as(usize, @intCast(@intFromPtr(key))));
    _ = &devid;
    while (true) {
        while (!SDL_IsAudioDevicePhysical_REAL(devid)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsAudioDevicePhysical_REAL(devid)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1582);
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
    var device: [*c]SDL_AudioDevice = @ptrCast(@alignCast(@constCast(value)));
    _ = &device;
    if (data.*.callback.?(data.*.userdata, device)) {
        data.*.retval = device;
        while (true) {
            while (!(data.*.retval.*.instance_id == devid)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "data->retval->instance_id == devid",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1586);
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
    return @"true" != 0;
}
pub export fn SDL_FindPhysicalAudioDeviceByCallback(callback: ?*const fn (userdata: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool, userdata: ?*anyopaque) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetCurrentAudioDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
        return null;
    }
    var data: FindAudioDeviceByCallbackData = FindAudioDeviceByCallbackData{
        .callback = callback,
        .userdata = userdata,
        .retval = null,
    };
    _ = &data;
    SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
    _ = SDL_IterateHashTable(current_audio.device_hash_physical, FindAudioDeviceByCallback, @ptrCast(@alignCast(&data)));
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    if (!(data.retval != null)) {
        _ = SDL_SetError_REAL("Device not found");
    }
    return data.retval;
}
pub fn TestDeviceHandleCallback(handle: ?*anyopaque, device: [*c]SDL_AudioDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return device.*.handle == handle;
}
pub export fn SDL_FindPhysicalAudioDeviceByHandle(handle: ?*anyopaque) [*c]SDL_AudioDevice {
    @setEvalBranchQuota(100000);
    return SDL_FindPhysicalAudioDeviceByCallback(TestDeviceHandleCallback, handle);
}
pub export fn SDL_GetAudioDeviceName_REAL(arg_devid: SDL_AudioDeviceID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var devid = arg_devid;
    _ = &devid;
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_GetAudioDeviceName_REAL".*;
    };
    _ = &static_local___func__;
    var result: [*c]const u8 = null;
    _ = &result;
    if (!(SDL_GetCurrentAudioDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
    } else {
        const islogical: bool = SDL_IsAudioDeviceLogical(devid);
        _ = &islogical;
        var vdev: ?*const anyopaque = null;
        _ = &vdev;
        SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
        if (devid == @as(c_uint, 4294967295)) {
            devid = current_audio.default_playback_device_id;
        } else if (devid == @as(c_uint, 4294967294)) {
            devid = current_audio.default_recording_device_id;
        }
        _ = SDL_FindInHashTable(if (islogical) current_audio.device_hash_logical else current_audio.device_hash_physical, @ptrFromInt(@as(usize, devid)), &vdev);
        if (!(vdev != null)) {
            _ = SDL_SetError_REAL("Invalid audio device instance ID");
        } else if (islogical) {
            var logdev: [*c]const SDL_LogicalAudioDevice = @ptrCast(@alignCast(vdev));
            _ = &logdev;
            while (true) {
                while (!(logdev.*.instance_id == devid)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "logdev->instance_id == devid",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1650);
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
            result = SDL_GetPersistentString(logdev.*.physical_device.*.name);
        } else {
            var device: [*c]const SDL_AudioDevice = @ptrCast(@alignCast(vdev));
            _ = &device;
            while (true) {
                while (!(device.*.instance_id == devid)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "device->instance_id == devid",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1654);
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
            result = SDL_GetPersistentString(device.*.name);
        }
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    }
    return result;
}
pub export fn SDL_GetAudioDeviceFormat_REAL(devid: SDL_AudioDeviceID, spec: [*c]SDL_AudioSpec, sample_frames: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(spec != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("spec"))));
    }
    var result: bool = @"false" != 0;
    _ = &result;
    var device: [*c]SDL_AudioDevice = ObtainPhysicalAudioDeviceDefaultAllowed(devid);
    _ = &device;
    if (device != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(spec.*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(spec)) == sizeof (*( &device->spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
        if (sample_frames != null) {
            sample_frames.* = device.*.sample_frames;
        }
        result = @"true" != 0;
    }
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_GetAudioDeviceChannelMap_REAL(devid: SDL_AudioDeviceID, count: [*c]c_int) [*c]c_int {
    @setEvalBranchQuota(100000);
    var result: [*c]c_int = null;
    _ = &result;
    var channels: c_int = 0;
    _ = &channels;
    var device: [*c]SDL_AudioDevice = ObtainPhysicalAudioDeviceDefaultAllowed(devid);
    _ = &device;
    if (device != null) {
        channels = device.*.spec.channels;
        result = SDL_ChannelMapDup(device.*.chmap, channels);
    }
    ReleaseAudioDevice(device);
    if (count != null) {
        count.* = channels;
    }
    return result;
}
pub export fn SDL_GetAudioDeviceProperties_REAL(devid: SDL_AudioDeviceID) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = null;
    _ = &logdev;
    var props: SDL_PropertiesID = 0;
    _ = &props;
    if (SDL_IsAudioDeviceLogical(devid)) {
        logdev = ObtainLogicalAudioDevice(devid, &device);
    } else {
        device = ObtainPhysicalAudioDevice(devid);
    }
    if (device != null) {
        var propsptr: [*c]SDL_PropertiesID = if (logdev != null) &logdev.*.props else &device.*.props;
        _ = &propsptr;
        props = propsptr.*;
        if (!(props != 0)) {
            props = blk: {
                const tmp = SDL_CreateProperties_REAL();
                propsptr.* = tmp;
                break :blk tmp;
            };
            if (props != @as(SDL_PropertiesID, 0)) {
                _ = SDL_SetStringProperty_REAL(props, "SDL.audio.device.unique_id", device.*.unique_id);
            }
        }
        ReleaseAudioDevice(device);
    }
    return props;
}
pub fn SerializePhysicalDeviceClose(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    while (SDL_GetAtomicInt_REAL(&device.*.shutdown) != 0) {
        SDL_WaitCondition_REAL(device.*.close_cond, device.*.lock);
    }
}
pub fn ClosePhysicalAudioDevice(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "ClosePhysicalAudioDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "device != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 1746);
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
    SerializePhysicalDeviceClose(device);
    if (device.*.currently_opened) {
        var devtypestr: [*c]const u8 = if (device.*.recording) @as([*c]u8, @as([*c]u8, @constCast("recording"))) else @as([*c]u8, @as([*c]u8, @constCast("playback")));
        _ = &devtypestr;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: closing %s device '%s'", devtypestr, device.*.name);
    }
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 1);
    SDL_UnlockMutex_REAL(device.*.lock);
    if (device.*.thread != null) {
        SDL_WaitThread_REAL(device.*.thread, null);
        device.*.thread = null;
    }
    if (device.*.currently_opened) {
        current_audio.impl.CloseDevice.?(device);
        device.*.currently_opened = @"false" != 0;
        device.*.hidden = null;
    }
    SDL_LockMutex_REAL(device.*.lock);
    _ = SDL_SetAtomicInt_REAL(&device.*.shutdown, 0);
    SDL_BroadcastCondition_REAL(device.*.close_cond);
    SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.work_buffer)));
    device.*.work_buffer = null;
    SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.mix_buffer)));
    device.*.mix_buffer = null;
    SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.postmix_buffer)));
    device.*.postmix_buffer = null;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.spec).*)) == @sizeOf(@TypeOf((&device.*.default_spec).*)))) @compileError("static assertion failed \"sizeof (*(&device->spec)) == sizeof (*( &device->default_spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.spec)), @ptrCast(@alignCast(&device.*.default_spec)), @sizeOf(@TypeOf((&device.*.default_spec).*)));
    device.*.sample_frames = 0;
    device.*.silence_value = SDL_GetSilenceValueForFormat_REAL(device.*.spec.format);
}
pub export fn SDL_CloseAudioDevice_REAL(devid: SDL_AudioDeviceID) void {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    if (logdev != null) {
        DestroyLogicalAudioDevice(logdev);
    }
    if (device != null) {
        if (!(device.*.logical_devices != null)) {
            ClosePhysicalAudioDevice(device);
        }
        UnrefPhysicalAudioDevice(device);
    }
    ReleaseAudioDevice(device);
}
pub fn ParseAudioFormatString(string: [*c]const u8) callconv(.c) SDL_AudioFormat {
    @setEvalBranchQuota(100000);
    if (string != null) {
        if (SDL_strcmp_REAL(string, "U8") == @as(c_int, 0)) {
            return SDL_AUDIO_U8;
        }
        if (SDL_strcmp_REAL(string, "S8") == @as(c_int, 0)) {
            return SDL_AUDIO_S8;
        }
        if (SDL_strcmp_REAL(string, "S16LE") == @as(c_int, 0)) {
            return SDL_AUDIO_S16LE;
        }
        if (SDL_strcmp_REAL(string, "S16BE") == @as(c_int, 0)) {
            return SDL_AUDIO_S16BE;
        }
        if (SDL_strcmp_REAL(string, "S16") == @as(c_int, 0)) {
            return SDL_AUDIO_S16;
        }
        if (SDL_strcmp_REAL(string, "S32LE") == @as(c_int, 0)) {
            return SDL_AUDIO_S32LE;
        }
        if (SDL_strcmp_REAL(string, "S32BE") == @as(c_int, 0)) {
            return SDL_AUDIO_S32BE;
        }
        if (SDL_strcmp_REAL(string, "S32") == @as(c_int, 0)) {
            return SDL_AUDIO_S32;
        }
        if (SDL_strcmp_REAL(string, "F32LE") == @as(c_int, 0)) {
            return SDL_AUDIO_F32LE;
        }
        if (SDL_strcmp_REAL(string, "F32BE") == @as(c_int, 0)) {
            return SDL_AUDIO_F32BE;
        }
        if (SDL_strcmp_REAL(string, "F32") == @as(c_int, 0)) {
            return SDL_AUDIO_F32;
        }
    }
    return SDL_AUDIO_UNKNOWN;
}
pub fn PrepareAudioFormat(recording: bool, spec: [*c]SDL_AudioSpec) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (spec.*.freq == @as(c_int, 0)) {
        spec.*.freq = if (recording) DEFAULT_AUDIO_RECORDING_FREQUENCY else DEFAULT_AUDIO_PLAYBACK_FREQUENCY;
        var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_AUDIO_FREQUENCY");
        _ = &hint;
        if (hint != null) {
            const val: c_int = SDL_atoi_REAL(hint);
            _ = &val;
            if (val > @as(c_int, 0)) {
                spec.*.freq = val;
            }
        }
    }
    if (spec.*.channels == @as(c_int, 0)) {
        spec.*.channels = if (recording) DEFAULT_AUDIO_RECORDING_CHANNELS else DEFAULT_AUDIO_PLAYBACK_CHANNELS;
        var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_AUDIO_CHANNELS");
        _ = &hint;
        if (hint != null) {
            const val: c_int = SDL_atoi_REAL(hint);
            _ = &val;
            if (val > @as(c_int, 0)) {
                spec.*.channels = val;
            }
        }
    }
    if (spec.*.format == @as(SDL_AudioFormat, 0)) {
        const val: SDL_AudioFormat = ParseAudioFormatString(SDL_GetHint_REAL("SDL_AUDIO_FORMAT"));
        _ = &val;
        spec.*.format = if (val != @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN)) val else @as(SDL_AudioFormat, @bitCast(if (recording) SDL_AUDIO_S16 else SDL_AUDIO_S16));
    }
}
pub export fn SDL_UpdatedAudioDeviceFormat(device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    device.*.silence_value = SDL_GetSilenceValueForFormat_REAL(device.*.spec.format);
    device.*.buffer_size = device.*.sample_frames * @as(c_int, @bitCast(((device.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(device.*.spec.channels))));
}
pub fn UpdateAudioWorkBufferSize(device: [*c]SDL_AudioDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    device.*.work_buffer_size = @bitCast(@as(c_uint, @truncate((@as(c_ulong, @bitCast(@as(c_long, device.*.sample_frames))) *% @sizeOf(f32)) *% @as(c_ulong, @bitCast(@as(c_long, device.*.spec.channels))))));
    device.*.work_buffer_size = if (device.*.buffer_size > device.*.work_buffer_size) device.*.buffer_size else device.*.work_buffer_size;
}
pub export fn SDL_GetAudioThreadName(device: [*c]SDL_AudioDevice, buf: [*c]u8, buflen: usize) [*c]u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_snprintf_REAL(buf, buflen, "SDLAudio%c%d", if (device.*.recording) @as(c_int, 'C') else @as(c_int, 'P'), @as(c_int, @bitCast(@as(c_uint, @truncate(device.*.instance_id)))));
    return buf;
}
pub fn OpenPhysicalAudioDevice(device: [*c]SDL_AudioDevice, inspec: [*c]const SDL_AudioSpec) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SerializePhysicalDeviceClose(device);
    if (SDL_GetAtomicInt_REAL(&device.*.zombie) != 0) {
        return @"true" != 0;
    }
    var devtypestr: [*c]const u8 = if (device.*.recording) @as([*c]u8, @as([*c]u8, @constCast("recording"))) else @as([*c]u8, @as([*c]u8, @constCast("playback")));
    _ = &devtypestr;
    var spec: SDL_AudioSpec = undefined;
    _ = &spec;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&spec).*)) == @sizeOf(@TypeOf((if (inspec != null) inspec else @as([*c]const SDL_AudioSpec, @ptrCast(@alignCast(&device.*.default_spec)))).*)))) @compileError("static assertion failed \"sizeof (*(&spec)) == sizeof (*( inspec ? inspec : &device->default_spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&spec)), @ptrCast(@alignCast(if (inspec != null) inspec else @as([*c]const SDL_AudioSpec, @ptrCast(@alignCast(&device.*.default_spec))))), @sizeOf(@TypeOf((if (inspec != null) inspec else @as([*c]const SDL_AudioSpec, @ptrCast(@alignCast(&device.*.default_spec)))).*)));
    PrepareAudioFormat(device.*.recording, &spec);
    if (device.*.currently_opened) {
        var current: SDL_AudioSpec = undefined;
        _ = &current;
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&current).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&current)) == sizeof (*( &device->spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&current)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
        if ((((spec.format & @as(c_uint, 255)) <= (current.format & @as(c_uint, 255))) and (spec.channels <= current.channels)) and (spec.freq <= current.freq)) {
            return @"true" != 0;
        }
        spec.format = if ((spec.format & @as(c_uint, 255)) > (current.format & @as(c_uint, 255))) spec.format else current.format;
        spec.channels = if (spec.channels > current.channels) spec.channels else current.channels;
        spec.freq = if (spec.freq > current.freq) spec.freq else current.freq;
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: attempt to reopen %s device '%s' at higher spec! (%s,%d,%d => %s,%d,%d)", devtypestr, device.*.name, GetShortAudioFormatName(current.format), current.channels, current.freq, GetShortAudioFormatName(spec.format), spec.channels, spec.freq);
        ClosePhysicalAudioDevice(device);
        if (!OpenPhysicalAudioDevice(device, &spec)) {
            if (!OpenPhysicalAudioDevice(device, &current)) {
                SDL_AudioDeviceDisconnected(device);
                return @"false" != 0;
            }
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&spec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&spec)) == sizeof (*( &device->spec))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&device.*.spec).*)) == @sizeOf(@TypeOf((&current).*)))) @compileError("static assertion failed \"sizeof (*(&device->spec)) == sizeof (*( &current))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&device.*.spec)), @ptrCast(@alignCast(&current)), @sizeOf(@TypeOf((&current).*)));
        _ = SDL_AudioDeviceFormatChangedAlreadyLocked(device, &spec, device.*.sample_frames);
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: %s device '%s' is now at spec (%s,%d,%d)", devtypestr, device.*.name, GetShortAudioFormatName(device.*.spec.format), device.*.spec.channels, device.*.spec.freq);
        return @"true" != 0;
    }
    device.*.WaitDevice = current_audio.impl.WaitDevice;
    device.*.PlayDevice = current_audio.impl.PlayDevice;
    device.*.GetDeviceBuf = current_audio.impl.GetDeviceBuf;
    device.*.WaitRecordingDevice = current_audio.impl.WaitRecordingDevice;
    device.*.RecordDevice = current_audio.impl.RecordDevice;
    device.*.FlushRecording = current_audio.impl.FlushRecording;
    device.*.sample_frames = SDL_GetDefaultSampleFramesFromFreq(device.*.spec.freq);
    SDL_UpdatedAudioDeviceFormat(device);
    UpdateAudioWorkBufferSize(device);
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: attempt to open %s device '%s' at spec (%s,%d,%d)", devtypestr, device.*.name, GetShortAudioFormatName(spec.format), spec.channels, spec.freq);
    device.*.currently_opened = @"true" != 0;
    if (!current_audio.impl.OpenDevice.?(device)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: open of %s device '%s' failed: %s", devtypestr, device.*.name, SDL_GetError_REAL());
        ClosePhysicalAudioDevice(device);
        return @"false" != 0;
    }
    SDL_UpdatedAudioDeviceFormat(device);
    UpdateAudioWorkBufferSize(device);
    device.*.work_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
    if (!(device.*.work_buffer != null)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: open of %s device '%s' failed: %s", devtypestr, device.*.name, SDL_GetError_REAL());
        ClosePhysicalAudioDevice(device);
        return @"false" != 0;
    }
    if (device.*.spec.format != @as(SDL_AudioFormat, SDL_AUDIO_F32)) {
        device.*.mix_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
        if (!(device.*.mix_buffer != null)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: open of %s device '%s' failed: %s", devtypestr, device.*.name, SDL_GetError_REAL());
            ClosePhysicalAudioDevice(device);
            return @"false" != 0;
        }
    }
    if (!current_audio.impl.ProvidesOwnCallbackThread) {
        var threadname: [64]u8 = undefined;
        _ = &threadname;
        _ = SDL_GetAudioThreadName(device, @ptrCast(@alignCast(&threadname)), @sizeOf(@TypeOf(threadname)));
        device.*.thread = SDL_CreateThreadRuntime_REAL(if (device.*.recording) RecordingAudioThread else PlaybackAudioThread, @ptrCast(@alignCast(&threadname)), @ptrCast(@alignCast(device)), null, null);
        if (!(device.*.thread != null)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: open of %s device '%s' failed: %s", devtypestr, device.*.name, SDL_GetError_REAL());
            ClosePhysicalAudioDevice(device);
            return SDL_SetError_REAL("Couldn't create audio thread");
        }
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_AUDIO, "AUDIO: attempt to open %s device '%s' succeeded! Opened at spec (%s,%d,%d)", devtypestr, device.*.name, GetShortAudioFormatName(device.*.spec.format), device.*.spec.channels, device.*.spec.freq);
    return @"true" != 0;
}
pub export fn SDL_OpenAudioDevice_REAL(devid: SDL_AudioDeviceID, spec: [*c]const SDL_AudioSpec) SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    if (!(SDL_GetCurrentAudioDriver_REAL() != null)) {
        _ = SDL_SetError_REAL("Audio subsystem is not initialized");
        return 0;
    }
    var wants_default: bool = (devid == @as(c_uint, 4294967295)) or (devid == @as(c_uint, 4294967294));
    _ = &wants_default;
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    if (wants_default or SDL_IsAudioDevicePhysical_REAL(devid)) {
        device = ObtainPhysicalAudioDeviceDefaultAllowed(devid);
    } else {
        var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
        _ = &logdev;
        if (logdev != null) {
            wants_default = logdev.*.opened_as_default;
        }
    }
    var result: SDL_AudioDeviceID = 0;
    _ = &result;
    if (device != null) {
        var logdev: [*c]SDL_LogicalAudioDevice = null;
        _ = &logdev;
        if (!wants_default and (SDL_GetAtomicInt_REAL(&device.*.zombie) != 0)) {
            _ = SDL_SetError_REAL("Device was already lost and can't accept new opens");
        } else if (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
            const tmp = @as([*c]SDL_LogicalAudioDevice, @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_LogicalAudioDevice)))));
            logdev = tmp;
            break :blk tmp;
        }))) == @as(?*anyopaque, null)) {} else if (!OpenPhysicalAudioDevice(device, spec)) {
            SDL_free_REAL(@ptrCast(@alignCast(logdev)));
        } else {
            RefPhysicalAudioDevice(device);
            _ = SDL_SetAtomicInt_REAL(&logdev.*.paused, 0);
            result = blk: {
                const tmp = AssignAudioDeviceInstanceId(device.*.recording, @"true" != 0);
                logdev.*.instance_id = tmp;
                break :blk tmp;
            };
            logdev.*.physical_device = device;
            logdev.*.gain = 1.0;
            logdev.*.opened_as_default = wants_default;
            logdev.*.next = device.*.logical_devices;
            if (device.*.logical_devices != null) {
                device.*.logical_devices.*.prev = logdev;
            }
            device.*.logical_devices = logdev;
            UpdateAudioStreamFormatsPhysical(device);
        }
        ReleaseAudioDevice(device);
        if (result != 0) {
            SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
            const inserted: bool = SDL_InsertIntoHashTable(current_audio.device_hash_logical, @ptrFromInt(@as(usize, result)), @ptrCast(@alignCast(logdev)), @"false" != 0);
            _ = &inserted;
            SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
            if (!inserted) {
                SDL_CloseAudioDevice_REAL(result);
                result = 0;
            }
        }
    }
    return result;
}
pub fn SetLogicalAudioDevicePauseState(devid: SDL_AudioDeviceID, value: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    if (logdev != null) {
        _ = SDL_SetAtomicInt_REAL(&logdev.*.paused, value);
    }
    ReleaseAudioDevice(device);
    return (if (logdev != null) @"true" else @"false") != 0;
}
pub export fn SDL_PauseAudioDevice_REAL(devid: SDL_AudioDeviceID) bool {
    @setEvalBranchQuota(100000);
    return SetLogicalAudioDevicePauseState(devid, 1);
}
pub export fn SDL_ResumeAudioDevice_REAL(devid: SDL_AudioDeviceID) bool {
    @setEvalBranchQuota(100000);
    return SetLogicalAudioDevicePauseState(devid, 0);
}
pub export fn SDL_AudioDevicePaused_REAL(devid: SDL_AudioDeviceID) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    var result: bool = @"false" != 0;
    _ = &result;
    if ((logdev != null) and (SDL_GetAtomicInt_REAL(&logdev.*.paused) != 0)) {
        result = @"true" != 0;
    }
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_GetAudioDeviceGain_REAL(devid: SDL_AudioDeviceID) f32 {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    const result: f32 = if (logdev != null) logdev.*.gain else -@as(f32, 1.0);
    _ = &result;
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_SetAudioDeviceGain_REAL(devid: SDL_AudioDeviceID, gain: f32) bool {
    @setEvalBranchQuota(100000);
    if (gain < @as(f32, 0.0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("gain"))));
    }
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    var result: bool = @"false" != 0;
    _ = &result;
    if (logdev != null) {
        logdev.*.gain = gain;
        UpdateAudioStreamFormatsPhysical(device);
        result = @"true" != 0;
    }
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_SetAudioPostmixCallback_REAL(devid: SDL_AudioDeviceID, callback: SDL_AudioPostmixCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(devid, &device);
    _ = &logdev;
    var result: bool = @"false" != 0;
    _ = &result;
    if (logdev != null) {
        result = @"true" != 0;
        if ((callback != null) and !(device.*.postmix_buffer != null)) {
            device.*.postmix_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
            if (!(device.*.postmix_buffer != null)) {
                result = @"false" != 0;
            }
        }
        if (result) {
            logdev.*.postmix = callback;
            logdev.*.postmix_userdata = userdata;
        }
        UpdateAudioStreamFormatsPhysical(device);
    }
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_BindAudioStreams_REAL(devid: SDL_AudioDeviceID, streams: [*c]const [*c]SDL_AudioStream, num_streams: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_BindAudioStreams_REAL".*;
    };
    _ = &static_local___func__;
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = null;
    _ = &logdev;
    var result: bool = @"true" != 0;
    _ = &result;
    if (num_streams == @as(c_int, 0)) {
        return @"true" != 0;
    }
    if (num_streams < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("num_streams"))));
    }
    if (!(streams != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("streams"))));
    }
    if (SDL_IsAudioDevicePhysical_REAL(devid)) {
        return SDL_SetError_REAL("Audio streams are bound to device ids from SDL_OpenAudioDevice, not raw physical devices");
    }
    logdev = ObtainLogicalAudioDevice(devid, &device);
    if (!(logdev != null)) {
        result = @"false" != 0;
    } else if (logdev.*.simplified) {
        result = SDL_SetError_REAL("Cannot change stream bindings on device opened with SDL_OpenAudioDeviceStream");
    } else {
        while (true) {
            while (!(!(logdev.*.bound_streams != null) or (@as(?*anyopaque, @ptrCast(@alignCast(logdev.*.bound_streams.*.prev_binding))) == @as(?*anyopaque, null)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!logdev->bound_streams || (logdev->bound_streams->prev_binding == ((void*)0))",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2167);
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
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_streams) : (i += 1) {
                var stream: [*c]SDL_AudioStream = streams[@bitCast(@as(isize, @intCast(i)))];
                _ = &stream;
                if (!(stream != null)) {
                    _ = SDL_SetError_REAL("Stream #%d is NULL", i);
                    result = @"false" != 0;
                } else {
                    SDL_LockMutex_REAL(stream.*.lock);
                    while (true) {
                        while (!(@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(stream.*.bound_device))) == @as(?*anyopaque, null)) == @intFromBool((@as(?*anyopaque, @ptrCast(@alignCast(stream.*.prev_binding))) == @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(stream.*.next_binding))) == @as(?*anyopaque, null))))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "(stream->bound_device == ((void*)0)) == ((stream->prev_binding == ((void*)0)) || (stream->next_binding == ((void*)0)))",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2177);
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
                    if (stream.*.bound_device != null) {
                        result = SDL_SetError_REAL("Stream #%d is already bound to a device", i);
                    } else if (stream.*.simplified) {
                        result = SDL_SetError_REAL("Cannot change binding on a stream created with SDL_OpenAudioDeviceStream");
                    }
                }
                if (!result) {
                    var j: c_int = undefined;
                    _ = &j;
                    {
                        j = 0;
                        while (j < i) : (j += 1) {
                            SDL_UnlockMutex_REAL(streams[@bitCast(@as(isize, @intCast(j)))].*.lock);
                        }
                    }
                    if (stream != null) {
                        SDL_UnlockMutex_REAL(stream.*.lock);
                    }
                    break;
                }
            }
        }
    }
    if (result) {
        const recording: bool = device.*.recording;
        _ = &recording;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_streams) : (i += 1) {
                var stream: [*c]SDL_AudioStream = streams[@bitCast(@as(isize, @intCast(i)))];
                _ = &stream;
                if (stream != null) {
                    if (recording and (stream.*.dst_spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
                        {
                            comptime {
                                if (!(@sizeOf(@TypeOf((&stream.*.dst_spec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&stream->dst_spec)) == sizeof (*( &device->spec))\"");
                            }
                        }
                        _ = memcpy(@ptrCast(@alignCast(&stream.*.dst_spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
                    } else if (!recording and (stream.*.src_spec.format == @as(SDL_AudioFormat, SDL_AUDIO_UNKNOWN))) {
                        {
                            comptime {
                                if (!(@sizeOf(@TypeOf((&stream.*.src_spec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&stream->src_spec)) == sizeof (*( &device->spec))\"");
                            }
                        }
                        _ = memcpy(@ptrCast(@alignCast(&stream.*.src_spec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
                    }
                    stream.*.bound_device = logdev;
                    stream.*.prev_binding = null;
                    stream.*.next_binding = logdev.*.bound_streams;
                    if (logdev.*.bound_streams != null) {
                        logdev.*.bound_streams.*.prev_binding = stream;
                    }
                    logdev.*.bound_streams = stream;
                    SDL_UnlockMutex_REAL(stream.*.lock);
                }
            }
        }
    }
    UpdateAudioStreamFormatsPhysical(device);
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_BindAudioStream_REAL(devid: SDL_AudioDeviceID, arg_stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    var stream = arg_stream;
    _ = &stream;
    return SDL_BindAudioStreams_REAL(devid, &stream, 1);
}
pub export fn SDL_UnbindAudioStreams_REAL(streams: [*c]const [*c]SDL_AudioStream, arg_num_streams: c_int) void {
    @setEvalBranchQuota(100000);
    var num_streams = arg_num_streams;
    _ = &num_streams;
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_UnbindAudioStreams_REAL".*;
    };
    _ = &static_local___func__;
    if ((num_streams <= @as(c_int, 0)) or !(streams != null)) {
        return;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_streams) : (i += 1) {
            var stream: [*c]SDL_AudioStream = streams[@bitCast(@as(isize, @intCast(i)))];
            _ = &stream;
            if (!(stream != null)) {
                continue;
            }
            while (true) {
                SDL_LockMutex_REAL(stream.*.lock);
                var bounddev: [*c]SDL_LogicalAudioDevice = stream.*.bound_device;
                _ = &bounddev;
                SDL_UnlockMutex_REAL(stream.*.lock);
                if (bounddev != null) {
                    SDL_LockMutex_REAL(bounddev.*.physical_device.*.lock);
                }
                SDL_LockMutex_REAL(stream.*.lock);
                if (bounddev == stream.*.bound_device) {
                    break;
                } else {
                    SDL_UnlockMutex_REAL(stream.*.lock);
                    if (bounddev != null) {
                        SDL_UnlockMutex_REAL(bounddev.*.physical_device.*.lock);
                    }
                }
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_streams) : (i += 1) {
            var stream: [*c]SDL_AudioStream = streams[@bitCast(@as(isize, @intCast(i)))];
            _ = &stream;
            if (((stream != null) and (stream.*.bound_device != null)) and !stream.*.bound_device.*.simplified) {
                if (stream.*.bound_device.*.bound_streams == stream) {
                    while (true) {
                        while (!!(stream.*.prev_binding != null)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!stream->prev_binding",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2279);
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
                    stream.*.bound_device.*.bound_streams = stream.*.next_binding;
                }
                if (stream.*.prev_binding != null) {
                    stream.*.prev_binding.*.next_binding = stream.*.next_binding;
                }
                if (stream.*.next_binding != null) {
                    stream.*.next_binding.*.prev_binding = stream.*.prev_binding;
                }
                stream.*.prev_binding = blk: {
                    const tmp = @as([*c]SDL_AudioStream, null);
                    stream.*.next_binding = tmp;
                    break :blk tmp;
                };
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_streams) : (i += 1) {
            var stream: [*c]SDL_AudioStream = streams[@bitCast(@as(isize, @intCast(i)))];
            _ = &stream;
            if (stream != null) {
                var logdev: [*c]SDL_LogicalAudioDevice = stream.*.bound_device;
                _ = &logdev;
                stream.*.bound_device = null;
                SDL_UnlockMutex_REAL(stream.*.lock);
                if (logdev != null) {
                    UpdateAudioStreamFormatsPhysical(logdev.*.physical_device);
                    SDL_UnlockMutex_REAL(logdev.*.physical_device.*.lock);
                }
            }
        }
    }
}
pub export fn SDL_UnbindAudioStream_REAL(arg_stream: [*c]SDL_AudioStream) void {
    @setEvalBranchQuota(100000);
    var stream = arg_stream;
    _ = &stream;
    SDL_UnbindAudioStreams_REAL(&stream, 1);
}
pub export fn SDL_GetAudioStreamDevice_REAL(stream: [*c]SDL_AudioStream) SDL_AudioDeviceID {
    @setEvalBranchQuota(100000);
    var result: SDL_AudioDeviceID = 0;
    _ = &result;
    if (!(stream != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("stream"))));
        return 0;
    }
    SDL_LockMutex_REAL(stream.*.lock);
    if (stream.*.bound_device != null) {
        result = stream.*.bound_device.*.instance_id;
    } else {
        _ = SDL_SetError_REAL("Audio stream not bound to an audio device");
    }
    SDL_UnlockMutex_REAL(stream.*.lock);
    return result;
}
pub export fn SDL_OpenAudioDeviceStream_REAL(devid: SDL_AudioDeviceID, arg_spec: [*c]const SDL_AudioSpec, callback: SDL_AudioStreamCallback, userdata: ?*anyopaque) [*c]SDL_AudioStream {
    @setEvalBranchQuota(100000);
    var spec = arg_spec;
    _ = &spec;
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_OpenAudioDeviceStream_REAL".*;
    };
    _ = &static_local___func__;
    var logdevid: SDL_AudioDeviceID = SDL_OpenAudioDevice_REAL(devid, spec);
    _ = &logdevid;
    if (!(logdevid != 0)) {
        return null;
    }
    var failed: bool = @"false" != 0;
    _ = &failed;
    var stream: [*c]SDL_AudioStream = null;
    _ = &stream;
    var device: [*c]SDL_AudioDevice = null;
    _ = &device;
    var logdev: [*c]SDL_LogicalAudioDevice = ObtainLogicalAudioDevice(logdevid, &device);
    _ = &logdev;
    if (!(logdev != null)) {
        failed = @"true" != 0;
    } else {
        _ = SDL_SetAtomicInt_REAL(&logdev.*.paused, 1);
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(device))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "device != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2348);
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
        const recording: bool = device.*.recording;
        _ = &recording;
        var tmpspec: SDL_AudioSpec = undefined;
        _ = &tmpspec;
        if (!(spec != null)) {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&tmpspec).*)) == @sizeOf(@TypeOf((&device.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(&tmpspec)) == sizeof (*( &device->spec))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&tmpspec)), @ptrCast(@alignCast(&device.*.spec)), @sizeOf(@TypeOf((&device.*.spec).*)));
            spec = &tmpspec;
        }
        if (recording) {
            stream = SDL_CreateAudioStream_REAL(&device.*.spec, spec);
        } else {
            stream = SDL_CreateAudioStream_REAL(spec, &device.*.spec);
        }
        if (!(stream != null)) {
            failed = @"true" != 0;
        } else {
            logdev.*.bound_streams = stream;
            logdev.*.simplified = @"true" != 0;
            stream.*.bound_device = logdev;
            stream.*.simplified = @"true" != 0;
            UpdateAudioStreamFormatsPhysical(device);
            if (callback != null) {
                var rc: bool = undefined;
                _ = &rc;
                if (recording) {
                    rc = SDL_SetAudioStreamPutCallback_REAL(stream, callback, userdata);
                } else {
                    rc = SDL_SetAudioStreamGetCallback_REAL(stream, callback, userdata);
                }
                while (true) {
                    while (!rc) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "rc",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2383);
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
            }
        }
    }
    ReleaseAudioDevice(device);
    if (failed) {
        SDL_DestroyAudioStream_REAL(stream);
        SDL_CloseAudioDevice_REAL(logdevid);
        stream = null;
    }
    return stream;
}
pub export fn SDL_PauseAudioStreamDevice_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    var devid: SDL_AudioDeviceID = SDL_GetAudioStreamDevice_REAL(stream);
    _ = &devid;
    if (!(devid != 0)) {
        return @"false" != 0;
    }
    return SDL_PauseAudioDevice_REAL(devid);
}
pub export fn SDL_ResumeAudioStreamDevice_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    var devid: SDL_AudioDeviceID = SDL_GetAudioStreamDevice_REAL(stream);
    _ = &devid;
    if (!(devid != 0)) {
        return @"false" != 0;
    }
    return SDL_ResumeAudioDevice_REAL(devid);
}
pub export fn SDL_AudioStreamDevicePaused_REAL(stream: [*c]SDL_AudioStream) bool {
    @setEvalBranchQuota(100000);
    var devid: SDL_AudioDeviceID = SDL_GetAudioStreamDevice_REAL(stream);
    _ = &devid;
    if (!(devid != 0)) {
        return @"false" != 0;
    }
    return SDL_AudioDevicePaused_REAL(devid);
}
pub var format_list: [8][9]SDL_AudioFormat = [8][9]SDL_AudioFormat{
    [9]SDL_AudioFormat{
        SDL_AUDIO_U8,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S8,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_S8,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_S16LE,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_S16BE,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_S32LE,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_S32BE,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_F32LE,
        SDL_AUDIO_F32BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
    [9]SDL_AudioFormat{
        SDL_AUDIO_F32BE,
        SDL_AUDIO_F32LE,
        SDL_AUDIO_S32BE,
        SDL_AUDIO_S32LE,
        SDL_AUDIO_S16BE,
        SDL_AUDIO_S16LE,
        SDL_AUDIO_U8,
        SDL_AUDIO_S8,
        SDL_AUDIO_UNKNOWN,
    },
};
pub export fn SDL_ClosestAudioFormats(format: SDL_AudioFormat) [*c]const SDL_AudioFormat {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < NUM_FORMATS) : (i += 1) {
            if (format_list[@bitCast(@as(isize, @intCast(i)))][@as(c_int, 0)] == format) {
                return &format_list[@bitCast(@as(isize, @intCast(i)))][@as(c_int, 0)];
            }
        }
    }
    return &format_list[@as(c_int, 0)][NUM_FORMATS];
}
pub export fn SDL_GetAudioFormatName_REAL(format: SDL_AudioFormat) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
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
                return undefined;
            },
            2 => {
                return "SDL_AUDIO_U8";
            },
            3 => {
                return "SDL_AUDIO_S8";
            },
            4 => {
                return "SDL_AUDIO_S16LE";
            },
            5 => {
                return "SDL_AUDIO_S16BE";
            },
            6 => {
                return "SDL_AUDIO_S32LE";
            },
            7 => {
                return "SDL_AUDIO_S32BE";
            },
            8 => {
                return "SDL_AUDIO_F32LE";
            },
            9 => {
                return "SDL_AUDIO_F32BE";
            },
            10 => {
                return "SDL_AUDIO_UNKNOWN";
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetSilenceValueForFormat_REAL(format: SDL_AudioFormat) c_int {
    @setEvalBranchQuota(100000);
    return if (format == @as(SDL_AudioFormat, SDL_AUDIO_U8)) @as(c_int, 128) else @as(c_int, 0);
}
pub export fn SDL_DefaultAudioDeviceChanged(new_default_device: [*c]SDL_AudioDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_DefaultAudioDeviceChanged".*;
    };
    _ = &static_local___func__;
    if (!(new_default_device != null)) {
        return;
    }
    const recording: bool = new_default_device.*.recording;
    _ = &recording;
    SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
    const current_devid: SDL_AudioDeviceID = if (recording) current_audio.default_recording_device_id else current_audio.default_playback_device_id;
    _ = &current_devid;
    const is_already_default: bool = new_default_device.*.instance_id == current_devid;
    _ = &is_already_default;
    if (!is_already_default) {
        if (recording) {
            current_audio.default_recording_device_id = new_default_device.*.instance_id;
        } else {
            current_audio.default_playback_device_id = new_default_device.*.instance_id;
        }
    }
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    if (is_already_default) {
        return;
    }
    var pending: SDL_PendingAudioDeviceEvent = undefined;
    _ = &pending;
    pending.next = null;
    var pending_tail: [*c]SDL_PendingAudioDeviceEvent = &pending;
    _ = &pending_tail;
    RefPhysicalAudioDevice(new_default_device);
    ObtainPhysicalAudioDeviceObj(new_default_device);
    var current_default_device: [*c]SDL_AudioDevice = ObtainPhysicalAudioDevice(current_devid);
    _ = &current_default_device;
    if (current_default_device != null) {
        while (true) {
            while (!(@as(c_int, @intFromBool(current_default_device.*.recording)) == @as(c_int, @intFromBool(recording)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "current_default_device->recording == recording",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2530);
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
        var spec: SDL_AudioSpec = undefined;
        _ = &spec;
        var needs_migration: bool = @"false" != 0;
        _ = &needs_migration;
        _ = memset(@ptrCast(@alignCast(&spec)), 0, @sizeOf(@TypeOf(spec)));
        {
            var logdev: [*c]SDL_LogicalAudioDevice = current_default_device.*.logical_devices;
            _ = &logdev;
            while (logdev != null) : (logdev = logdev.*.next) {
                if (logdev.*.opened_as_default) {
                    needs_migration = @"true" != 0;
                    {
                        var stream: [*c]SDL_AudioStream = logdev.*.bound_streams;
                        _ = &stream;
                        while (stream != null) : (stream = stream.*.next_binding) {
                            var streamspec: [*c]const SDL_AudioSpec = if (recording) &stream.*.dst_spec else &stream.*.src_spec;
                            _ = &streamspec;
                            if ((streamspec.*.format & @as(c_uint, 255)) > (spec.format & @as(c_uint, 255))) {
                                spec.format = streamspec.*.format;
                            }
                            if (streamspec.*.channels > spec.channels) {
                                spec.channels = streamspec.*.channels;
                            }
                            if (streamspec.*.freq > spec.freq) {
                                spec.freq = streamspec.*.freq;
                            }
                        }
                    }
                }
            }
        }
        if (needs_migration) {
            if (!OpenPhysicalAudioDevice(new_default_device, &spec)) {
                needs_migration = @"false" != 0;
            }
        }
        if (needs_migration) {
            const spec_changed: bool = !SDL_AudioSpecsEqual(&current_default_device.*.spec, &new_default_device.*.spec, null, null);
            _ = &spec_changed;
            var next: [*c]SDL_LogicalAudioDevice = null;
            _ = &next;
            {
                var logdev: [*c]SDL_LogicalAudioDevice = current_default_device.*.logical_devices;
                _ = &logdev;
                while (logdev != null) : (logdev = next) {
                    next = logdev.*.next;
                    if (!logdev.*.opened_as_default) {
                        continue;
                    }
                    SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
                    if (logdev.*.next != null) {
                        logdev.*.next.*.prev = logdev.*.prev;
                    }
                    if (logdev.*.prev != null) {
                        logdev.*.prev.*.next = logdev.*.next;
                    }
                    if (current_default_device.*.logical_devices == logdev) {
                        current_default_device.*.logical_devices = logdev.*.next;
                    }
                    logdev.*.physical_device = new_default_device;
                    logdev.*.prev = null;
                    logdev.*.next = new_default_device.*.logical_devices;
                    if (new_default_device.*.logical_devices != null) {
                        new_default_device.*.logical_devices.*.prev = logdev;
                    }
                    new_default_device.*.logical_devices = logdev;
                    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
                    while (true) {
                        while (!(SDL_GetAtomicInt_REAL(&current_default_device.*.refcount) > @as(c_int, 1))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "SDL_GetAtomicInt_REAL(&current_default_device->refcount) > 1",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2594);
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
                    RefPhysicalAudioDevice(new_default_device);
                    UnrefPhysicalAudioDevice(current_default_device);
                    _ = SDL_SetAudioPostmixCallback_REAL(logdev.*.instance_id, logdev.*.postmix, logdev.*.postmix_userdata);
                    if (spec_changed) {
                        var p: [*c]SDL_PendingAudioDeviceEvent = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
                        _ = &p;
                        if (p != null) {
                            p.*.type = SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED;
                            p.*.devid = logdev.*.instance_id;
                            p.*.next = null;
                            pending_tail.*.next = p;
                            pending_tail = p;
                        }
                    }
                }
            }
            UpdateAudioStreamFormatsPhysical(current_default_device);
            UpdateAudioStreamFormatsPhysical(new_default_device);
            if (!(current_default_device.*.logical_devices != null)) {
                ClosePhysicalAudioDevice(current_default_device);
            }
        }
        ReleaseAudioDevice(current_default_device);
    }
    ReleaseAudioDevice(new_default_device);
    if (current_default_device != null) {
        UnrefPhysicalAudioDevice(current_default_device);
    }
    if (pending.next != null) {
        SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "current_audio.pending_events_tail != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2633);
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
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "current_audio.pending_events_tail->next == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2634);
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
        current_audio.pending_events_tail.*.next = pending.next;
        current_audio.pending_events_tail = pending_tail;
        SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    }
}
pub export fn SDL_AudioDeviceFormatChangedAlreadyLocked(device: [*c]SDL_AudioDevice, newspec: [*c]const SDL_AudioSpec, new_sample_frames: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [41:0]u8 = "SDL_AudioDeviceFormatChangedAlreadyLocked".*;
    };
    _ = &static_local___func__;
    const orig_work_buffer_size: c_int = device.*.work_buffer_size;
    _ = &orig_work_buffer_size;
    if (SDL_AudioSpecsEqual(&device.*.spec, newspec, null, null) and (new_sample_frames == device.*.sample_frames)) {
        return @"true" != 0;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&device.*.spec).*)) == @sizeOf(@TypeOf(newspec.*)))) @compileError("static assertion failed \"sizeof (*(&device->spec)) == sizeof (*( newspec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&device.*.spec)), @ptrCast(@alignCast(newspec)), @sizeOf(@TypeOf(newspec.*)));
    UpdateAudioStreamFormatsPhysical(device);
    var kill_device: bool = @"false" != 0;
    _ = &kill_device;
    device.*.sample_frames = new_sample_frames;
    SDL_UpdatedAudioDeviceFormat(device);
    UpdateAudioWorkBufferSize(device);
    var reallocate_work_buffer: bool = device.*.work_buffer_size > orig_work_buffer_size;
    _ = &reallocate_work_buffer;
    if (reallocate_work_buffer) {
        if (device.*.work_buffer != null) {
            SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.work_buffer)));
            device.*.work_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
            if (!(device.*.work_buffer != null)) {
                kill_device = @"true" != 0;
            }
        }
        if (device.*.postmix_buffer != null) {
            SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.postmix_buffer)));
            device.*.postmix_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
            if (!(device.*.postmix_buffer != null)) {
                kill_device = @"true" != 0;
            }
        }
    }
    var needs_mix_buffer: bool = device.*.spec.format != @as(SDL_AudioFormat, SDL_AUDIO_F32);
    _ = &needs_mix_buffer;
    if (!needs_mix_buffer) {
        SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.mix_buffer)));
        device.*.mix_buffer = null;
    } else if (reallocate_work_buffer or !(device.*.mix_buffer != null)) {
        SDL_aligned_free_REAL(@ptrCast(@alignCast(device.*.mix_buffer)));
        device.*.mix_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), @bitCast(@as(c_long, device.*.work_buffer_size)))));
        if (!(device.*.mix_buffer != null)) {
            kill_device = @"true" != 0;
        }
    }
    if (!kill_device) {
        var pending: SDL_PendingAudioDeviceEvent = undefined;
        _ = &pending;
        pending.next = null;
        var pending_tail: [*c]SDL_PendingAudioDeviceEvent = &pending;
        _ = &pending_tail;
        var p: [*c]SDL_PendingAudioDeviceEvent = undefined;
        _ = &p;
        p = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
        if (p != null) {
            p.*.type = SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED;
            p.*.devid = device.*.instance_id;
            p.*.next = null;
            pending_tail.*.next = p;
            pending_tail = p;
        }
        {
            var logdev: [*c]SDL_LogicalAudioDevice = device.*.logical_devices;
            _ = &logdev;
            while (logdev != null) : (logdev = logdev.*.next) {
                p = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_PendingAudioDeviceEvent))));
                if (p != null) {
                    p.*.type = SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED;
                    p.*.devid = logdev.*.instance_id;
                    p.*.next = null;
                    pending_tail.*.next = p;
                    pending_tail = p;
                }
            }
        }
        if (pending.next != null) {
            SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail))) != @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail != ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2723);
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
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(current_audio.pending_events_tail.*.next))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "current_audio.pending_events_tail->next == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audio.c", 2724);
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
            current_audio.pending_events_tail.*.next = pending.next;
            current_audio.pending_events_tail = pending_tail;
            SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
        }
    }
    if (kill_device) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_AudioDeviceFormatChanged(device: [*c]SDL_AudioDevice, newspec: [*c]const SDL_AudioSpec, new_sample_frames: c_int) bool {
    @setEvalBranchQuota(100000);
    ObtainPhysicalAudioDeviceObj(device);
    const result: bool = SDL_AudioDeviceFormatChangedAlreadyLocked(device, newspec, new_sample_frames);
    _ = &result;
    ReleaseAudioDevice(device);
    return result;
}
pub export fn SDL_UpdateAudio() void {
    @setEvalBranchQuota(100000);
    SDL_LockRWLockForReading_REAL(current_audio.subsystem_rwlock);
    var pending_events: [*c]SDL_PendingAudioDeviceEvent = current_audio.pending_events.next;
    _ = &pending_events;
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    if (!(pending_events != null)) {
        return;
    }
    SDL_LockRWLockForWriting_REAL(current_audio.subsystem_rwlock);
    pending_events = current_audio.pending_events.next;
    current_audio.pending_events.next = null;
    current_audio.pending_events_tail = &current_audio.pending_events;
    SDL_UnlockRWLock_REAL(current_audio.subsystem_rwlock);
    var pending_next: [*c]SDL_PendingAudioDeviceEvent = null;
    _ = &pending_next;
    {
        var i: [*c]SDL_PendingAudioDeviceEvent = pending_events;
        _ = &i;
        while (i != null) : (i = pending_next) {
            pending_next = i.*.next;
            if (SDL_EventEnabled_REAL(i.*.type)) {
                var event: SDL_Event = undefined;
                _ = &event;
                _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
                event.type = i.*.type;
                event.adevice.which = i.*.devid;
                event.adevice.recording = SDL_IsAudioDeviceRecording(i.*.devid);
                _ = SDL_PushEvent_REAL(&event);
            }
            SDL_free_REAL(@ptrCast(@alignCast(i)));
        }
    }
}

pub const SDL_AudioDevicePaused = SDL_AudioDevicePaused_REAL;
pub const SDL_BindAudioStream = SDL_BindAudioStream_REAL;
pub const SDL_BindAudioStreams = SDL_BindAudioStreams_REAL;
pub const SDL_CloseAudioDevice = SDL_CloseAudioDevice_REAL;
pub const SDL_GetAudioDeviceChannelMap = SDL_GetAudioDeviceChannelMap_REAL;
pub const SDL_GetAudioDeviceFormat = SDL_GetAudioDeviceFormat_REAL;
pub const SDL_GetAudioDeviceGain = SDL_GetAudioDeviceGain_REAL;
pub const SDL_GetAudioDeviceName = SDL_GetAudioDeviceName_REAL;
pub const SDL_GetAudioDriver = SDL_GetAudioDriver_REAL;
pub const SDL_GetAudioFormatName = SDL_GetAudioFormatName_REAL;
pub const SDL_GetAudioPlaybackDevices = SDL_GetAudioPlaybackDevices_REAL;
pub const SDL_GetAudioRecordingDevices = SDL_GetAudioRecordingDevices_REAL;
pub const SDL_GetAudioStreamDevice = SDL_GetAudioStreamDevice_REAL;
pub const SDL_GetCurrentAudioDriver = SDL_GetCurrentAudioDriver_REAL;
pub const SDL_GetNumAudioDrivers = SDL_GetNumAudioDrivers_REAL;
pub const SDL_GetSilenceValueForFormat = SDL_GetSilenceValueForFormat_REAL;
pub const SDL_OpenAudioDevice = SDL_OpenAudioDevice_REAL;
pub const SDL_OpenAudioDeviceStream = SDL_OpenAudioDeviceStream_REAL;
pub const SDL_PauseAudioDevice = SDL_PauseAudioDevice_REAL;
pub const SDL_PauseAudioStreamDevice = SDL_PauseAudioStreamDevice_REAL;
pub const SDL_PumpEvents = SDL_PumpEvents_REAL;
pub const SDL_ResumeAudioDevice = SDL_ResumeAudioDevice_REAL;
pub const SDL_ResumeAudioStreamDevice = SDL_ResumeAudioStreamDevice_REAL;
pub const SDL_SetAudioDeviceGain = SDL_SetAudioDeviceGain_REAL;
pub const SDL_SetAudioPostmixCallback = SDL_SetAudioPostmixCallback_REAL;
pub const SDL_UnbindAudioStream = SDL_UnbindAudioStream_REAL;
pub const SDL_UnbindAudioStreams = SDL_UnbindAudioStreams_REAL;
pub const SDL_IsAudioDevicePhysical = SDL_IsAudioDevicePhysical_REAL;
pub const SDL_IsAudioDevicePlayback = SDL_IsAudioDevicePlayback_REAL;
pub const SDL_AudioStreamDevicePaused = SDL_AudioStreamDevicePaused_REAL;
pub const SDL_GetAudioDeviceProperties = SDL_GetAudioDeviceProperties_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const DEFAULT_AUDIO_PLAYBACK_CHANNELS = @as(c_int, 2);
pub const DEFAULT_AUDIO_PLAYBACK_FREQUENCY = __helpers.promoteIntLiteral(c_int, 44100, .decimal);
pub const DEFAULT_AUDIO_RECORDING_CHANNELS = @as(c_int, 1);
pub const DEFAULT_AUDIO_RECORDING_FREQUENCY = __helpers.promoteIntLiteral(c_int, 44100, .decimal);
pub const NUM_FORMATS = @as(c_int, 8);
