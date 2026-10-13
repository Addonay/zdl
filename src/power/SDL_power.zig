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
pub const SDL_POWERSTATE_UNKNOWN: c_int = 0;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub extern fn SDL_GetPowerInfo_Linux_org_freedesktop_upower([*c]SDL_PowerState, [*c]c_int, [*c]c_int) bool;
pub extern fn SDL_GetPowerInfo_Linux_sys_class_power_supply([*c]SDL_PowerState, [*c]c_int, [*c]c_int) bool;
pub extern fn SDL_GetPowerInfo_Linux_proc_acpi([*c]SDL_PowerState, [*c]c_int, [*c]c_int) bool;
pub extern fn SDL_GetPowerInfo_Linux_proc_apm([*c]SDL_PowerState, [*c]c_int, [*c]c_int) bool;
pub const SDL_GetPowerInfo_Impl = ?*const fn (state: [*c]SDL_PowerState, seconds: [*c]c_int, percent: [*c]c_int) callconv(.c) bool;
pub var implementations: [4]SDL_GetPowerInfo_Impl = [4]SDL_GetPowerInfo_Impl{
    SDL_GetPowerInfo_Linux_org_freedesktop_upower,
    SDL_GetPowerInfo_Linux_sys_class_power_supply,
    SDL_GetPowerInfo_Linux_proc_acpi,
    SDL_GetPowerInfo_Linux_proc_apm,
};
pub export fn SDL_GetPowerInfo_REAL(arg_seconds: [*c]c_int, arg_percent: [*c]c_int) SDL_PowerState {
    @setEvalBranchQuota(100000);
    var seconds = arg_seconds;
    _ = &seconds;
    var percent = arg_percent;
    _ = &percent;
    const total: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(implementations)) / @sizeOf(@TypeOf(implementations[@as(c_int, 0)])))));
    _ = &total;
    var result: SDL_PowerState = SDL_POWERSTATE_UNKNOWN;
    _ = &result;
    var i: c_int = undefined;
    _ = &i;
    var _seconds: c_int = undefined;
    _ = &_seconds;
    var _percent: c_int = undefined;
    _ = &_percent;
    if (!(seconds != null)) {
        seconds = &_seconds;
    }
    if (!(percent != null)) {
        percent = &_percent;
    }
    {
        i = 0;
        while (i < total) : (i += 1) {
            if (implementations[@bitCast(@as(isize, @intCast(i)))].?(&result, seconds, percent)) {
                return result;
            }
        }
    }
    seconds.* = -@as(c_int, 1);
    percent.* = -@as(c_int, 1);
    return SDL_POWERSTATE_UNKNOWN;
}

pub const SDL_GetPowerInfo = SDL_GetPowerInfo_REAL;
