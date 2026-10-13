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
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub export fn SDL_IME_Init() bool {
    @setEvalBranchQuota(100000);
    InitIME();
    if (SDL_IME_Init_Real != null) {
        if (SDL_IME_Init_Real.?()) {
            return @"true" != 0;
        }
        SDL_IME_Init_Real = null;
        SDL_IME_Quit_Real = null;
        SDL_IME_SetFocus_Real = null;
        SDL_IME_Reset_Real = null;
        SDL_IME_ProcessKeyEvent_Real = null;
        SDL_IME_UpdateTextInputArea_Real = null;
        SDL_IME_PumpEvents_Real = null;
    }
    return @"false" != 0;
}
pub export fn SDL_IME_Quit() void {
    @setEvalBranchQuota(100000);
    if (SDL_IME_Quit_Real != null) {
        SDL_IME_Quit_Real.?();
    }
}
pub export fn SDL_IME_SetFocus(focused: bool) void {
    @setEvalBranchQuota(100000);
    if (SDL_IME_SetFocus_Real != null) {
        SDL_IME_SetFocus_Real.?(focused);
    }
}
pub export fn SDL_IME_Reset() void {
    @setEvalBranchQuota(100000);
    if (SDL_IME_Reset_Real != null) {
        SDL_IME_Reset_Real.?();
    }
}
pub export fn SDL_IME_ProcessKeyEvent(keysym: Uint32, keycode: Uint32, down: bool) bool {
    @setEvalBranchQuota(100000);
    if (SDL_IME_ProcessKeyEvent_Real != null) {
        return SDL_IME_ProcessKeyEvent_Real.?(keysym, keycode, down);
    }
    return @"false" != 0;
}
pub export fn SDL_IME_UpdateTextInputArea(window: ?*SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (SDL_IME_UpdateTextInputArea_Real != null) {
        SDL_IME_UpdateTextInputArea_Real.?(window);
    }
}
pub export fn SDL_IME_PumpEvents() void {
    @setEvalBranchQuota(100000);
    if (SDL_IME_PumpEvents_Real != null) {
        SDL_IME_PumpEvents_Real.?();
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub extern fn SDL_IBus_Init() bool;
pub extern fn SDL_IBus_Quit() void;
pub extern fn SDL_IBus_SetFocus(focused: bool) void;
pub extern fn SDL_IBus_Reset() void;
pub extern fn SDL_IBus_ProcessKeyEvent(keysym: Uint32, keycode: Uint32, down: bool) bool;
pub extern fn SDL_IBus_UpdateTextInputArea(window: ?*SDL_Window) void;
pub extern fn SDL_IBus_PumpEvents() void;
pub extern fn SDL_Fcitx_Init() bool;
pub extern fn SDL_Fcitx_Quit() void;
pub extern fn SDL_Fcitx_SetFocus(focused: bool) void;
pub extern fn SDL_Fcitx_Reset() void;
pub extern fn SDL_Fcitx_ProcessKeyEvent(keysym: Uint32, keycode: Uint32, down: bool) bool;
pub extern fn SDL_Fcitx_UpdateTextInputArea(window: ?*SDL_Window) void;
pub extern fn SDL_Fcitx_PumpEvents() void;
pub const SDL_IME_Init_t = ?*const fn () callconv(.c) bool;
pub const SDL_IME_Quit_t = ?*const fn () callconv(.c) void;
pub const SDL_IME_SetFocus_t = ?*const fn (bool) callconv(.c) void;
pub const SDL_IME_Reset_t = ?*const fn () callconv(.c) void;
pub const SDL_IME_ProcessKeyEvent_t = ?*const fn (Uint32, Uint32, down: bool) callconv(.c) bool;
pub const SDL_IME_UpdateTextInputArea_t = ?*const fn (window: ?*SDL_Window) callconv(.c) void;
pub const SDL_IME_PumpEvents_t = ?*const fn () callconv(.c) void;
pub var SDL_IME_Init_Real: SDL_IME_Init_t = null;
pub var SDL_IME_Quit_Real: SDL_IME_Quit_t = null;
pub var SDL_IME_SetFocus_Real: SDL_IME_SetFocus_t = null;
pub var SDL_IME_Reset_Real: SDL_IME_Reset_t = null;
pub var SDL_IME_ProcessKeyEvent_Real: SDL_IME_ProcessKeyEvent_t = null;
pub var SDL_IME_UpdateTextInputArea_Real: SDL_IME_UpdateTextInputArea_t = null;
pub var SDL_IME_PumpEvents_Real: SDL_IME_PumpEvents_t = null;
pub fn InitIME() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_inited = struct {
        var inited: bool = @"false" != 0;
    };
    _ = &static_local_inited;
    var im_module: [*c]const u8 = SDL_getenv_REAL("SDL_IM_MODULE");
    _ = &im_module;
    var xmodifiers: [*c]const u8 = SDL_getenv_REAL("XMODIFIERS");
    _ = &xmodifiers;
    if (@as(c_int, @intFromBool(static_local_inited.inited)) == @"true") {
        return;
    }
    static_local_inited.inited = @"true" != 0;
    if (!(SDL_IME_Init_Real != null) and (((im_module != null) and (SDL_strcmp_REAL(im_module, "fcitx") == @as(c_int, 0))) or ((!(im_module != null) and (xmodifiers != null)) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(xmodifiers, "@im=fcitx")))) != @as(?*anyopaque, null))))) {
        SDL_IME_Init_Real = SDL_Fcitx_Init;
        SDL_IME_Quit_Real = SDL_Fcitx_Quit;
        SDL_IME_SetFocus_Real = SDL_Fcitx_SetFocus;
        SDL_IME_Reset_Real = SDL_Fcitx_Reset;
        SDL_IME_ProcessKeyEvent_Real = SDL_Fcitx_ProcessKeyEvent;
        SDL_IME_UpdateTextInputArea_Real = SDL_Fcitx_UpdateTextInputArea;
        SDL_IME_PumpEvents_Real = SDL_Fcitx_PumpEvents;
    }
    if (!(SDL_IME_Init_Real != null)) {
        SDL_IME_Init_Real = SDL_IBus_Init;
        SDL_IME_Quit_Real = SDL_IBus_Quit;
        SDL_IME_SetFocus_Real = SDL_IBus_SetFocus;
        SDL_IME_Reset_Real = SDL_IBus_Reset;
        SDL_IME_ProcessKeyEvent_Real = SDL_IBus_ProcessKeyEvent;
        SDL_IME_UpdateTextInputArea_Real = SDL_IBus_UpdateTextInputArea;
        SDL_IME_PumpEvents_Real = SDL_IBus_PumpEvents;
    }
}
