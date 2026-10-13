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
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub export fn SDL_IsUbuntuTouch_REAL() bool {
    @setEvalBranchQuota(100000);
    const static_local_checked = struct {
        var checked: bool = @"false" != 0;
    };
    _ = &static_local_checked;
    const static_local_is_ubuntu_touch = struct {
        var is_ubuntu_touch: bool = @"false" != 0;
    };
    _ = &static_local_is_ubuntu_touch;
    if (!static_local_checked.checked) {
        var xdg_session_desktop: [*c]const u8 = SDL_getenv_REAL("XDG_SESSION_DESKTOP");
        _ = &xdg_session_desktop;
        if ((xdg_session_desktop != null) and (SDL_strcmp_REAL(xdg_session_desktop, "ubuntu-touch") == @as(c_int, 0))) {
            static_local_is_ubuntu_touch.is_ubuntu_touch = @"true" != 0;
        }
        static_local_checked.checked = @"true" != 0;
    }
    return static_local_is_ubuntu_touch.is_ubuntu_touch;
}
pub export fn SDL_SetupUbuntuTouchGlobalProperties(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_IsUbuntuTouch_REAL()) {
        return @"true" != 0;
    }
    var app_id: [*c]const u8 = SDL_getenv_REAL("APP_ID");
    _ = &app_id;
    if (!(app_id != null)) {
        _ = SDL_SetError_REAL("Missing APP_ID");
        return @"false" != 0;
    }
    var buffer: [*c]u8 = SDL_strdup_REAL(app_id);
    _ = &buffer;
    if (!(buffer != null)) {
        return @"false" != 0;
    }
    var it: [*c]u8 = SDL_strchr_REAL(buffer, '_');
    _ = &it;
    if (!(@as(c_int, it.*) != 0)) {
        _ = SDL_SetError_REAL("Malformed APP_ID");
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        return @as(?*anyopaque, null) != null;
    }
    var it2: [*c]u8 = SDL_strchr_REAL(it + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), '_');
    _ = &it2;
    if (!(@as(c_int, it2.*) != 0)) {
        _ = SDL_SetError_REAL("Malformed APP_ID");
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        return @as(?*anyopaque, null) != null;
    }
    (blk: {
        const ref = &it;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = '\x00';
    (blk: {
        const ref = &it2;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = '\x00';
    if ((!SDL_SetStringProperty_REAL(props, "SDL.system.ubuntu_touch.appid", buffer) or !SDL_SetStringProperty_REAL(props, "SDL.system.ubuntu_touch.hook", it)) or !SDL_SetStringProperty_REAL(props, "SDL.system.ubuntu_touch.app_version", it2)) {
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        return @"false" != 0;
    }
    SDL_free_REAL(@ptrCast(@alignCast(buffer)));
    return @"true" != 0;
}

pub const SDL_IsUbuntuTouch = SDL_IsUbuntuTouch_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
