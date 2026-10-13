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
pub const Uint32 = u32;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_DisplayID = Uint32;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub export fn SDL_GetDXGIOutputInfo_REAL(arg_displayID: SDL_DisplayID, arg_adapterIndex: [*c]c_int, arg_outputIndex: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var displayID = arg_displayID;
    _ = &displayID;
    var adapterIndex = arg_adapterIndex;
    _ = &adapterIndex;
    var outputIndex = arg_outputIndex;
    _ = &outputIndex;
    _ = &displayID;
    _ = &adapterIndex;
    _ = &outputIndex;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_GetDirect3D9AdapterIndex_REAL(arg_displayID: SDL_DisplayID) c_int {
    @setEvalBranchQuota(100000);
    var displayID = arg_displayID;
    _ = &displayID;
    _ = &displayID;
    _ = SDL_SetError_REAL("That operation is not supported");
    return -@as(c_int, 1);
}
pub const struct_XTaskQueueHandle = opaque {
};
pub const XTaskQueueHandle = struct_XTaskQueueHandle;
pub export fn SDL_GetGDKTaskQueue_REAL(arg_outTaskQueue: ?*XTaskQueueHandle) bool {
    @setEvalBranchQuota(100000);
    var outTaskQueue = arg_outTaskQueue;
    _ = &outTaskQueue;
    _ = &outTaskQueue;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_OnApplicationDidChangeStatusBarOrientation_REAL() void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
}
pub const SDL_iOSAnimationCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub export fn SDL_SetiOSAnimationCallback_REAL(arg_window: ?*SDL_Window, arg_interval: c_int, arg_callback: SDL_iOSAnimationCallback, arg_callbackParam: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var window = arg_window;
    _ = &window;
    var interval = arg_interval;
    _ = &interval;
    var callback = arg_callback;
    _ = &callback;
    var callbackParam = arg_callbackParam;
    _ = &callbackParam;
    _ = &window;
    _ = &interval;
    _ = &callback;
    _ = &callbackParam;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SetiOSEventPump_REAL(arg_enabled: bool) void {
    @setEvalBranchQuota(100000);
    var enabled = arg_enabled;
    _ = &enabled;
    _ = &enabled;
    _ = SDL_SetError_REAL("That operation is not supported");
}

pub const SDL_GetDirect3D9AdapterIndex = SDL_GetDirect3D9AdapterIndex_REAL;
pub const SDL_GetGDKTaskQueue = SDL_GetGDKTaskQueue_REAL;
pub const SDL_SetWindowsMessageHook = @compileError("unable to translate macro: undefined identifier `SDL_SetWindowsMessageHook_REAL`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/dynapi/SDL_dynapi_overrides.h:921:9
pub const SDL_SetiOSAnimationCallback = SDL_SetiOSAnimationCallback_REAL;
pub const SDL_SetiOSEventPump = SDL_SetiOSEventPump_REAL;
pub const SDL_UnregisterApp = @compileError("unable to translate macro: undefined identifier `SDL_UnregisterApp_REAL`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/dynapi/SDL_dynapi_overrides.h:976:9
