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
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_DialogFileCallback = ?*const fn (userdata: ?*anyopaque, filelist: [*c]const [*c]const u8, filter: c_int) callconv(.c) void;
pub const enum_SDL_FileDialogType = c_uint;
pub const SDL_FileDialogType = enum_SDL_FileDialogType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_Portal_ShowFileDialogWithProperties(@"type": SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void;
pub extern fn SDL_Portal_detect() bool;
pub extern fn SDL_Zenity_ShowFileDialogWithProperties(@"type": SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void;
pub extern fn SDL_Zenity_detect() bool;
pub var detected_function: ?*const fn (@"type": SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) callconv(.c) void = null;
pub fn set_callback() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_is_set = struct {
        var is_set: bool = @"false" != 0;
    };
    _ = &static_local_is_set;
    if (@as(c_int, @intFromBool(static_local_is_set.is_set)) == @"false") {
        static_local_is_set.is_set = @"true" != 0;
        _ = SDL_AddHintCallback_REAL("SDL_FILE_DIALOG_DRIVER", hint_callback, null);
    }
}
pub fn detect_available_methods(value: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var driver: [*c]const u8 = if (value != null) value else SDL_GetHint_REAL("SDL_FILE_DIALOG_DRIVER");
    _ = &driver;
    set_callback();
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(driver)))) == @as(?*anyopaque, null)) or (SDL_strcmp_REAL(driver, "portal") == @as(c_int, 0))) {
        if (SDL_Portal_detect()) {
            detected_function = SDL_Portal_ShowFileDialogWithProperties;
            return 1;
        }
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(driver)))) == @as(?*anyopaque, null)) or (SDL_strcmp_REAL(driver, "zenity") == @as(c_int, 0))) {
        if (SDL_Zenity_detect()) {
            detected_function = SDL_Zenity_ShowFileDialogWithProperties;
            return 2;
        }
    }
    _ = SDL_SetError_REAL("File dialog driver unsupported (supported values for SDL_HINT_FILE_DIALOG_DRIVER are 'zenity' and 'portal')");
    return 0;
}
pub export fn hint_callback(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, newValue: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    _ = detect_available_methods(newValue);
}
pub export fn SDL_SYS_ShowFileDialogWithProperties(arg_type: SDL_FileDialogType, callback: SDL_DialogFileCallback, userdata: ?*anyopaque, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(detected_function != null) and !(detect_available_methods(null) != 0)) {
        callback.?(userdata, null, -@as(c_int, 1));
        return;
    }
    detected_function.?(@"type", callback, userdata, props);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
