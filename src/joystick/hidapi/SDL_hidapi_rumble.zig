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
pub const pthread_t = c_ulong;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
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
pub const struct_SDL_Semaphore = opaque {
};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn SDL_CreateSemaphore_REAL(initial_value: Uint32) ?*SDL_Semaphore;
pub extern fn SDL_DestroySemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_WaitSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_SignalSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const struct_SDL_Joystick = opaque {
};
pub const SDL_Joystick = struct_SDL_Joystick;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_JoystickType = c_uint;
pub const SDL_JoystickType = enum_SDL_JoystickType;
pub const enum_SDL_GamepadType = c_uint;
pub const SDL_GamepadType = enum_SDL_GamepadType;
pub const struct_SDL_hid_device = opaque {
};
pub const SDL_hid_device = struct_SDL_hid_device;
pub extern fn SDL_hid_write_REAL(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const struct_SDL_HIDAPI_Device = extern struct {
    name: [*c]u8 = null,
    manufacturer_string: [*c]u8 = null,
    product_string: [*c]u8 = null,
    path: [*c]u8 = null,
    vendor_id: Uint16 = 0,
    product_id: Uint16 = 0,
    version: Uint16 = 0,
    serial: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    interface_number: c_int = 0,
    interface_class: c_int = 0,
    interface_subclass: c_int = 0,
    interface_protocol: c_int = 0,
    usage_page: Uint16 = 0,
    usage: Uint16 = 0,
    is_bluetooth: bool = false,
    joystick_type: SDL_JoystickType = @import("std").mem.zeroes(SDL_JoystickType),
    type: SDL_GamepadType = @import("std").mem.zeroes(SDL_GamepadType),
    steam_virtual_gamepad_slot: c_int = 0,
    driver: [*c]struct_SDL_HIDAPI_DeviceDriver = null,
    context: ?*anyopaque = null,
    dev: ?*SDL_hid_device = null,
    rumble_pending: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    num_joysticks: c_int = 0,
    joysticks: [*c]SDL_JoystickID = null,
    seen: bool = false,
    broken: bool = false,
    parent: [*c]struct_SDL_HIDAPI_Device = null,
    num_children: c_int = 0,
    children: [*c][*c]struct_SDL_HIDAPI_Device = null,
    next: [*c]struct_SDL_HIDAPI_Device = null,
};
pub const SDL_HIDAPI_Device = struct_SDL_HIDAPI_Device;
pub const struct_SDL_HIDAPI_DeviceDriver = extern struct {
    name: [*c]const u8 = null,
    enabled: bool = false,
    RegisterHints: ?*const fn (callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void = null,
    UnregisterHints: ?*const fn (callback: SDL_HintCallback, userdata: ?*anyopaque) callconv(.c) void = null,
    IsEnabled: ?*const fn () callconv(.c) bool = null,
    IsSupportedDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device, name: [*c]const u8, @"type": SDL_GamepadType, vendor_id: Uint16, product_id: Uint16, version: Uint16, interface_number: c_int, interface_class: c_int, interface_subclass: c_int, interface_protocol: c_int) callconv(.c) bool = null,
    InitDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) bool = null,
    GetDevicePlayerIndex: ?*const fn (device: [*c]SDL_HIDAPI_Device, instance_id: SDL_JoystickID) callconv(.c) c_int = null,
    SetDevicePlayerIndex: ?*const fn (device: [*c]SDL_HIDAPI_Device, instance_id: SDL_JoystickID, player_index: c_int) callconv(.c) void = null,
    UpdateDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) bool = null,
    OpenJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick) callconv(.c) bool = null,
    RumbleJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleJoystickTriggers: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    GetJoystickCapabilities: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick) callconv(.c) Uint32 = null,
    SetJoystickLED: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendJoystickEffect: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetJoystickSensorsEnabled: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick, enabled: bool) callconv(.c) bool = null,
    CloseJoystick: ?*const fn (device: [*c]SDL_HIDAPI_Device, joystick: ?*SDL_Joystick) callconv(.c) void = null,
    FreeDevice: ?*const fn (device: [*c]SDL_HIDAPI_Device) callconv(.c) void = null,
};
pub const SDL_HIDAPI_RumbleSentCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_ErrorCode = c_uint;
pub const struct_SDL_HIDAPI_RumbleRequest = extern struct {
    device: [*c]SDL_HIDAPI_Device = null,
    data: [128]Uint8 = @import("std").mem.zeroes([128]Uint8),
    size: c_int = 0,
    callback: SDL_HIDAPI_RumbleSentCallback = null,
    userdata: ?*anyopaque = null,
    prev: [*c]struct_SDL_HIDAPI_RumbleRequest = null,
};
pub const SDL_HIDAPI_RumbleRequest = struct_SDL_HIDAPI_RumbleRequest;
pub const struct_SDL_HIDAPI_RumbleContext = extern struct {
    initialized: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    running: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    thread: [*c]SDL_Thread = null,
    request_sem: ?*SDL_Semaphore = null,
    requests_head: [*c]SDL_HIDAPI_RumbleRequest = null,
    requests_tail: [*c]SDL_HIDAPI_RumbleRequest = null,
};
pub const SDL_HIDAPI_RumbleContext = struct_SDL_HIDAPI_RumbleContext;
pub var SDL_HIDAPI_rumble_lock: ?*SDL_Mutex = null;
pub var rumble_context: SDL_HIDAPI_RumbleContext = @import("std").mem.zeroes(SDL_HIDAPI_RumbleContext);
pub fn SDL_HIDAPI_RumbleThread(data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_HIDAPI_RumbleContext = @ptrCast(@alignCast(data));
    _ = &ctx;
    _ = SDL_SetCurrentThreadPriority_REAL(SDL_THREAD_PRIORITY_HIGH);
    while (SDL_GetAtomicInt_REAL(&ctx.*.running) != 0) {
        var request: [*c]SDL_HIDAPI_RumbleRequest = null;
        _ = &request;
        SDL_WaitSemaphore_REAL(ctx.*.request_sem);
        SDL_LockMutex_REAL(SDL_HIDAPI_rumble_lock);
        request = ctx.*.requests_tail;
        if (request != null) {
            if (request == ctx.*.requests_head) {
                ctx.*.requests_head = null;
            }
            ctx.*.requests_tail = request.*.prev;
        }
        SDL_UnlockMutex_REAL(SDL_HIDAPI_rumble_lock);
        if (request != null) {
            if (request.*.device.*.dev != null) {
                _ = SDL_hid_write_REAL(request.*.device.*.dev, @ptrCast(@alignCast(&request.*.data)), @bitCast(@as(c_long, request.*.size)));
            }
            if (request.*.callback != null) {
                request.*.callback.?(request.*.userdata);
            }
            _ = SDL_AddAtomicInt_REAL(&request.*.device.*.rumble_pending, -@as(c_int, 1)) == @as(c_int, 1);
            SDL_free_REAL(@ptrCast(@alignCast(request)));
            SDL_Delay_REAL(10);
        }
    }
    return 0;
}
pub fn SDL_HIDAPI_StopRumbleThread(ctx: [*c]SDL_HIDAPI_RumbleContext) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var request: [*c]SDL_HIDAPI_RumbleRequest = undefined;
    _ = &request;
    _ = SDL_SetAtomicInt_REAL(&ctx.*.running, @"false");
    if (ctx.*.thread != null) {
        var result: c_int = undefined;
        _ = &result;
        SDL_SignalSemaphore_REAL(ctx.*.request_sem);
        SDL_WaitThread_REAL(ctx.*.thread, &result);
        ctx.*.thread = null;
    }
    SDL_LockMutex_REAL(SDL_HIDAPI_rumble_lock);
    while (ctx.*.requests_tail != null) {
        request = ctx.*.requests_tail;
        if (request == ctx.*.requests_head) {
            ctx.*.requests_head = null;
        }
        ctx.*.requests_tail = request.*.prev;
        if (request.*.callback != null) {
            request.*.callback.?(request.*.userdata);
        }
        _ = SDL_AddAtomicInt_REAL(&request.*.device.*.rumble_pending, -@as(c_int, 1)) == @as(c_int, 1);
        SDL_free_REAL(@ptrCast(@alignCast(request)));
    }
    SDL_UnlockMutex_REAL(SDL_HIDAPI_rumble_lock);
    if (ctx.*.request_sem != null) {
        SDL_DestroySemaphore_REAL(ctx.*.request_sem);
        ctx.*.request_sem = null;
    }
    if (SDL_HIDAPI_rumble_lock != null) {
        SDL_DestroyMutex_REAL(SDL_HIDAPI_rumble_lock);
        SDL_HIDAPI_rumble_lock = null;
    }
    _ = SDL_SetAtomicInt_REAL(&ctx.*.initialized, @"false");
}
pub fn SDL_HIDAPI_StartRumbleThread(ctx: [*c]SDL_HIDAPI_RumbleContext) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_HIDAPI_rumble_lock = SDL_CreateMutex_REAL();
    if (!(SDL_HIDAPI_rumble_lock != null)) {
        SDL_HIDAPI_StopRumbleThread(ctx);
        return @"false" != 0;
    }
    ctx.*.request_sem = SDL_CreateSemaphore_REAL(0);
    if (!(ctx.*.request_sem != null)) {
        SDL_HIDAPI_StopRumbleThread(ctx);
        return @"false" != 0;
    }
    _ = SDL_SetAtomicInt_REAL(&ctx.*.running, @"true");
    ctx.*.thread = SDL_CreateThreadRuntime_REAL(SDL_HIDAPI_RumbleThread, "HIDAPI Rumble", @ptrCast(@alignCast(ctx)), null, null);
    if (!(ctx.*.thread != null)) {
        SDL_HIDAPI_StopRumbleThread(ctx);
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_HIDAPI_LockRumble() bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_HIDAPI_RumbleContext = &rumble_context;
    _ = &ctx;
    if (SDL_CompareAndSwapAtomicInt_REAL(&ctx.*.initialized, @"false", @"true")) {
        if (!SDL_HIDAPI_StartRumbleThread(ctx)) {
            return @"false" != 0;
        }
    }
    SDL_LockMutex_REAL(SDL_HIDAPI_rumble_lock);
    return @"true" != 0;
}
pub export fn SDL_HIDAPI_GetPendingRumbleLocked(device: [*c]SDL_HIDAPI_Device, data: [*c][*c]Uint8, size: [*c][*c]c_int, maximum_size: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_HIDAPI_RumbleContext = &rumble_context;
    _ = &ctx;
    var request: [*c]SDL_HIDAPI_RumbleRequest = undefined;
    _ = &request;
    var found: [*c]SDL_HIDAPI_RumbleRequest = undefined;
    _ = &found;
    found = null;
    {
        request = ctx.*.requests_tail;
        while (request != null) : (request = request.*.prev) {
            if (request.*.device == device) {
                found = request;
            }
        }
    }
    if (found != null) {
        data.* = @ptrCast(@alignCast(&found.*.data));
        size.* = &found.*.size;
        maximum_size.* = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(found.*.data)))));
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_HIDAPI_SendRumbleAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int) c_int {
    @setEvalBranchQuota(100000);
    return SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(device, data, size, null, null);
}
pub export fn SDL_HIDAPI_SendRumbleWithCallbackAndUnlock(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, size: c_int, callback: SDL_HIDAPI_RumbleSentCallback, userdata: ?*anyopaque) c_int {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_HIDAPI_RumbleContext = &rumble_context;
    _ = &ctx;
    var request: [*c]SDL_HIDAPI_RumbleRequest = undefined;
    _ = &request;
    if (@as(c_ulong, @bitCast(@as(c_long, size))) > @sizeOf(@TypeOf(request.*.data))) {
        SDL_HIDAPI_UnlockRumble();
        _ = SDL_SetError_REAL("Couldn't send rumble, size %d is greater than %d", size, @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(request.*.data)))))));
        return -@as(c_int, 1);
    }
    request = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(request.*)))));
    if (!(request != null)) {
        SDL_HIDAPI_UnlockRumble();
        return -@as(c_int, 1);
    }
    request.*.device = device;
    _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&request.*.data))))), @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size)));
    request.*.size = size;
    request.*.callback = callback;
    request.*.userdata = userdata;
    _ = SDL_AddAtomicInt_REAL(&device.*.rumble_pending, 1);
    if (ctx.*.requests_head != null) {
        ctx.*.requests_head.*.prev = request;
    } else {
        ctx.*.requests_tail = request;
    }
    ctx.*.requests_head = request;
    SDL_HIDAPI_UnlockRumble();
    SDL_SignalSemaphore_REAL(ctx.*.request_sem);
    return size;
}
pub export fn SDL_HIDAPI_UnlockRumble() void {
    @setEvalBranchQuota(100000);
    SDL_UnlockMutex_REAL(SDL_HIDAPI_rumble_lock);
}
pub export fn SDL_HIDAPI_SendRumble(device: [*c]SDL_HIDAPI_Device, data: [*c]const Uint8, arg_size: c_int) c_int {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var pending_data: [*c]Uint8 = undefined;
    _ = &pending_data;
    var pending_size: [*c]c_int = undefined;
    _ = &pending_size;
    var maximum_size: c_int = undefined;
    _ = &maximum_size;
    if (size <= @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Tried to send rumble with invalid size");
        return -@as(c_int, 1);
    }
    if (!SDL_HIDAPI_LockRumble()) {
        return -@as(c_int, 1);
    }
    if ((SDL_HIDAPI_GetPendingRumbleLocked(device, &pending_data, &pending_size, &maximum_size) and (size == pending_size.*)) and (@as(c_int, data[@as(c_int, 0)]) == @as(c_int, pending_data[@as(c_int, 0)]))) {
        _ = memcpy(@ptrCast(@alignCast(pending_data)), @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size)));
        SDL_HIDAPI_UnlockRumble();
        return size;
    }
    return SDL_HIDAPI_SendRumbleAndUnlock(device, data, size);
}
pub export fn SDL_HIDAPI_QuitRumble() void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]SDL_HIDAPI_RumbleContext = &rumble_context;
    _ = &ctx;
    if (SDL_GetAtomicInt_REAL(&ctx.*.running) != 0) {
        SDL_HIDAPI_StopRumbleThread(ctx);
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
