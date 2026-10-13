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
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_GPUDevice = opaque {
};
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const union__XEvent = opaque {};
pub const XEvent = union__XEvent;
pub const SDL_X11EventHook = ?*const fn (userdata: ?*anyopaque, xevent: ?*XEvent) callconv(.c) bool;
pub extern fn SDL_SetX11EventHook_REAL(callback: SDL_X11EventHook, userdata: ?*anyopaque) void;
pub extern fn SDL_SetLinuxThreadPriority_REAL(threadID: Sint64, priority: c_int) bool;
pub extern fn SDL_SetLinuxThreadPriorityAndPolicy_REAL(threadID: Sint64, sdlPriority: c_int, schedPolicy: c_int) bool;
pub extern fn SDL_IsUbuntuTouch_REAL() bool;
pub export fn SDL_GDKSuspendComplete_REAL() void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
}
pub const struct_XUserHandle = opaque {
};
pub const XUserHandle = struct_XUserHandle;
pub export fn SDL_GetGDKDefaultUser_REAL(_: ?*XUserHandle) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_GDKSuspendGPU_REAL(_: ?*SDL_GPUDevice) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_GDKResumeGPU_REAL(_: ?*SDL_GPUDevice) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_GDKSuspendRenderer_REAL(_: ?*SDL_Renderer) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_GDKResumeRenderer_REAL(_: ?*SDL_Renderer) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_RegisterApp_REAL(arg_name: [*c]const u8, arg_style: Uint32, arg_hInst: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var name = arg_name;
    _ = &name;
    var style = arg_style;
    _ = &style;
    var hInst = arg_hInst;
    _ = &hInst;
    _ = &name;
    _ = &style;
    _ = &hInst;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SetWindowsMessageHook_REAL(arg_callback: ?*anyopaque, arg_userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var callback = arg_callback;
    _ = &callback;
    var userdata = arg_userdata;
    _ = &userdata;
    _ = &callback;
    _ = &userdata;
    _ = SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_UnregisterApp_REAL() void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
}
pub const SDL_RequestAndroidPermissionCallback = ?*anyopaque;
pub const JavaVM = ?*anyopaque;
pub export fn SDL_SendAndroidBackButton_REAL() void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_GetAndroidActivity_REAL() ?*anyopaque {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_GetAndroidCachePath_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_GetAndroidExternalStoragePath_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_GetAndroidExternalStorageState_REAL() Uint32 {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return 0;
}
pub export fn SDL_GetAndroidInternalStoragePath_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_GetAndroidJNIEnv_REAL() ?*anyopaque {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_RequestAndroidPermission_REAL(arg_permission: [*c]const u8, arg_cb: SDL_RequestAndroidPermissionCallback, arg_userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var permission = arg_permission;
    _ = &permission;
    var cb = arg_cb;
    _ = &cb;
    var userdata = arg_userdata;
    _ = &userdata;
    _ = &permission;
    _ = &cb;
    _ = &userdata;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SendAndroidMessage_REAL(arg_command: Uint32, arg_param: c_int) bool {
    @setEvalBranchQuota(100000);
    var command = arg_command;
    _ = &command;
    var param = arg_param;
    _ = &param;
    _ = &command;
    _ = &param;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_ShowAndroidToast_REAL(arg_message: [*c]const u8, arg_duration: c_int, arg_gravity: c_int, arg_xoffset: c_int, arg_yoffset: c_int) bool {
    @setEvalBranchQuota(100000);
    var message = arg_message;
    _ = &message;
    var duration = arg_duration;
    _ = &duration;
    var gravity = arg_gravity;
    _ = &gravity;
    var xoffset = arg_xoffset;
    _ = &xoffset;
    var yoffset = arg_yoffset;
    _ = &yoffset;
    _ = &message;
    _ = &duration;
    _ = &gravity;
    _ = &xoffset;
    _ = &yoffset;
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_GetAndroidSDKVersion_REAL() c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(SDL_SetError_REAL("That operation is not supported"));
}
pub export fn SDL_IsChromebook_REAL() bool {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return @"false" != 0;
}
pub export fn SDL_IsDeXMode_REAL() bool {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return @"false" != 0;
}
pub export fn JNI_OnLoad_REAL(arg_vm: [*c]JavaVM, arg_reserved: ?*anyopaque) Sint32 {
    @setEvalBranchQuota(100000);
    var vm = arg_vm;
    _ = &vm;
    var reserved = arg_reserved;
    _ = &reserved;
    _ = &vm;
    _ = &reserved;
    return 65540;
}
pub const SDL_RequestOpenHarmonyPermissionCallback = ?*anyopaque;
pub export fn SDL_GetOpenHarmonyInternalStoragePath_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return null;
}
pub export fn SDL_GetOpenHarmonySDKVersion_REAL() c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(SDL_SetError_REAL("That operation is not supported"));
}
pub export fn SDL_RequestOpenHarmonyPermission_REAL(arg_permission: [*c]const u8, arg_cb: SDL_RequestOpenHarmonyPermissionCallback, arg_userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var permission = arg_permission;
    _ = &permission;
    var cb = arg_cb;
    _ = &cb;
    var userdata = arg_userdata;
    _ = &userdata;
    _ = &permission;
    _ = &cb;
    _ = &userdata;
    return SDL_SetError_REAL("That operation is not supported");
}

pub const SDL_GDKResumeGPU = SDL_GDKResumeGPU_REAL;
pub const SDL_GDKSuspendComplete = SDL_GDKSuspendComplete_REAL;
pub const SDL_GDKSuspendGPU = SDL_GDKSuspendGPU_REAL;
pub const SDL_GetAndroidActivity = SDL_GetAndroidActivity_REAL;
pub const SDL_GetAndroidCachePath = SDL_GetAndroidCachePath_REAL;
pub const SDL_GetAndroidExternalStoragePath = SDL_GetAndroidExternalStoragePath_REAL;
pub const SDL_GetAndroidExternalStorageState = SDL_GetAndroidExternalStorageState_REAL;
pub const SDL_GetAndroidInternalStoragePath = SDL_GetAndroidInternalStoragePath_REAL;
pub const SDL_GetAndroidJNIEnv = SDL_GetAndroidJNIEnv_REAL;
pub const SDL_GetAndroidSDKVersion = SDL_GetAndroidSDKVersion_REAL;
pub const SDL_GetGDKDefaultUser = SDL_GetGDKDefaultUser_REAL;
pub const SDL_IsChromebook = SDL_IsChromebook_REAL;
pub const SDL_IsDeXMode = SDL_IsDeXMode_REAL;
pub const SDL_RequestAndroidPermission = SDL_RequestAndroidPermission_REAL;
pub const SDL_SendAndroidBackButton = SDL_SendAndroidBackButton_REAL;
pub const SDL_SendAndroidMessage = SDL_SendAndroidMessage_REAL;
pub const SDL_SetLinuxThreadPriority = SDL_SetLinuxThreadPriority_REAL;
pub const SDL_SetLinuxThreadPriorityAndPolicy = SDL_SetLinuxThreadPriorityAndPolicy_REAL;
pub const SDL_SetWindowsMessageHook = SDL_SetWindowsMessageHook_REAL;
pub const SDL_SetX11EventHook = SDL_SetX11EventHook_REAL;
pub const SDL_ShowAndroidToast = SDL_ShowAndroidToast_REAL;
pub const SDL_UnregisterApp = SDL_UnregisterApp_REAL;
pub const JNI_OnLoad = JNI_OnLoad_REAL;
pub const SDL_GDKSuspendRenderer = SDL_GDKSuspendRenderer_REAL;
pub const SDL_GDKResumeRenderer = SDL_GDKResumeRenderer_REAL;
pub const SDL_IsUbuntuTouch = SDL_IsUbuntuTouch_REAL;
pub const SDL_GetOpenHarmonySDKVersion = SDL_GetOpenHarmonySDKVersion_REAL;
pub const SDL_GetOpenHarmonyInternalStoragePath = SDL_GetOpenHarmonyInternalStoragePath_REAL;
pub const SDL_RequestOpenHarmonyPermission = SDL_RequestOpenHarmonyPermission_REAL;
pub const @"false" = @as(c_int, 0);
