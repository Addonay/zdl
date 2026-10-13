// /*
//   Copyright (C) Valve Corporation
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
pub const k_eControllerType_SteamController: c_int = 2;
pub const k_eControllerType_SteamControllerV2: c_int = 3;
pub const k_eControllerType_SteamControllerNeptune: c_int = 4;
pub const k_eControllerType_SteamControllerTriton: c_int = 10;
pub const k_eControllerType_UnknownNonSteamController: c_int = 30;
pub const k_eControllerType_XBox360Controller: c_int = 31;
pub const k_eControllerType_XBoxOneController: c_int = 32;
pub const k_eControllerType_PS3Controller: c_int = 33;
pub const k_eControllerType_PS4Controller: c_int = 34;
pub const k_eControllerType_SwitchProController: c_int = 38;
pub const k_eControllerType_SwitchJoyConLeft: c_int = 39;
pub const k_eControllerType_SwitchJoyConRight: c_int = 40;
pub const k_eControllerType_SwitchJoyConPair: c_int = 41;
pub const k_eControllerType_SwitchInputOnlyController: c_int = 42;
pub const k_eControllerType_MobileTouch: c_int = 43;
pub const k_eControllerType_XInputSwitchController: c_int = 44;
pub const k_eControllerType_PS5Controller: c_int = 45;
pub const k_eControllerType_XBoxEliteController: c_int = 46;
pub const k_eControllerType_XInputPS4Controller: c_int = 47;
pub const k_eControllerType_PS5EdgeController: c_int = 48;
pub const k_eControllerType_HoriSteamController: c_int = 49;
pub const k_eControllerType_8BitDoController: c_int = 50;
pub const k_eControllerType_Switch2ProController: c_int = 51;
pub const k_eControllerType_Switch2InputOnlyController: c_int = 52;
pub const EControllerType = c_int;
pub const ControllerDescription_t = extern struct {
    m_unDeviceID: c_uint = 0,
    m_eControllerType: EControllerType = @import("std").mem.zeroes(EControllerType),
    m_pszName: [*c]const u8 = null,
};
pub export fn GuessControllerType(nVID: c_int, nPID: c_int) EControllerType {
    @setEvalBranchQuota(100000);
    var unDeviceID: c_uint = (@as(c_uint, @bitCast(@as(c_int, nVID))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, nPID)));
    _ = &unDeviceID;
    var iIndex: c_int = undefined;
    _ = &iIndex;
    var pszOverride: [*c]const u8 = GetControllerTypeOverride(nVID, nPID);
    _ = &pszOverride;
    if (pszOverride != null) {
        if (SDL_strncasecmp_REAL(pszOverride, "Xbox360", 7) == @as(c_int, 0)) {
            return k_eControllerType_XBox360Controller;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "XboxOne", 7) == @as(c_int, 0)) {
            return k_eControllerType_XBoxOneController;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "PS3", 3) == @as(c_int, 0)) {
            return k_eControllerType_PS3Controller;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "PS4", 3) == @as(c_int, 0)) {
            return k_eControllerType_PS4Controller;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "PS5", 3) == @as(c_int, 0)) {
            return k_eControllerType_PS5Controller;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "SwitchPro", 9) == @as(c_int, 0)) {
            return k_eControllerType_SwitchProController;
        }
        if (SDL_strncasecmp_REAL(pszOverride, "Steam", 5) == @as(c_int, 0)) {
            return k_eControllerType_SteamController;
        }
        return k_eControllerType_UnknownNonSteamController;
    }
    {
        iIndex = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, iIndex))) < (@sizeOf(@TypeOf(arrControllers)) / @sizeOf(@TypeOf(arrControllers[@as(c_int, 0)])))) : (iIndex += 1) {
            if (unDeviceID == arrControllers[@bitCast(@as(isize, @intCast(iIndex)))].m_unDeviceID) {
                return arrControllers[@bitCast(@as(isize, @intCast(iIndex)))].m_eControllerType;
            }
        }
    }
    return k_eControllerType_UnknownNonSteamController;
}
pub export fn GuessControllerName(nVID: c_int, nPID: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var unDeviceID: c_uint = (@as(c_uint, @bitCast(@as(c_int, nVID))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, nPID)));
    _ = &unDeviceID;
    var iIndex: c_int = undefined;
    _ = &iIndex;
    {
        iIndex = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, iIndex))) < (@sizeOf(@TypeOf(arrControllers)) / @sizeOf(@TypeOf(arrControllers[@as(c_int, 0)])))) : (iIndex += 1) {
            if (unDeviceID == arrControllers[@bitCast(@as(isize, @intCast(iIndex)))].m_unDeviceID) {
                return arrControllers[@bitCast(@as(isize, @intCast(iIndex)))].m_pszName;
            }
        }
    }
    return null;
}

pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const arrControllers: [608]ControllerDescription_t = [608]ControllerDescription_t{
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6170)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 45845)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 53255)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 51921)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 616)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1390)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8207)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1390)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8211)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1464)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4100)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1464)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4102)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1699)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63010)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12672)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12880)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13441)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33152)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 34872)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2064)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2064)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2341)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2341)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 34918)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2341)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 34952)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 265)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 286)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 296)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 532)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4884)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 25346)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3727)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3727)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12405)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3727)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12557)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 77)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 95)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 106)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 110)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 133)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 134)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 136)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3888)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4352)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4607)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13105)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 256)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 288)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 320)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 512)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 528)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 536)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1867)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9008)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9016)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9264)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9272)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9520)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4794)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9528)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4096)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24581)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21760)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 6708)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2102)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12304)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12560)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12600)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13104)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13112)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13360)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13368)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13616)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13624)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8380)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21760)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22381)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 51821)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9571)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1315)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9571)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1397)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = "Retro Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9712)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33731)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9712)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49441)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8195)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8962)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9474)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 33664)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 34952)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 776)))),
        .m_eControllerType = k_eControllerType_PS3Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6171)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 53262)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1476)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1477)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2508)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2976)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33360)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33668)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33920)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 33921)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3600)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3603)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3605)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3616)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3830)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 7414)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 7696)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 11800)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 515)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 519)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 522)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 85)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 94)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 102)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 132)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 135)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 138)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 156)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 160)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 237)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 238)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 284)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 291)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 354)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 356)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4544)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16385)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1539)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1540)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1541)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1542)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1545)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3329)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3330)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3334)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3336)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3337)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3344)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3344)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3347)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4355)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1025)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4096)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4100)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4103)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4104)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4105)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4106)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4352)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 31018)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8192)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8960)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8963)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9472)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9475)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3350)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3351)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 30021)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 260)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 39046)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 36)))),
        .m_eControllerType = k_eControllerType_XInputPS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 39046)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 37)))),
        .m_eControllerType = k_eControllerType_PS4Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3302)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3679)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 521)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 355)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 388)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4107)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4108)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4114)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4132)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4134)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3352)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3353)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13706)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 260)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13706)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 772)))),
        .m_eControllerType = k_eControllerType_PS5Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6)))),
        .m_eControllerType = k_eControllerType_UnknownNonSteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6356)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 849)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4096)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 849)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8192)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1003)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 65282)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 45862)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 654)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 655)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 657)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 672)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 673)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 674)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Wireless Racing Wheel",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 681)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1817)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Xbox 360 Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49693)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49694)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49695)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49730)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1390)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8196)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 678)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 683)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18198)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18200)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18214)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18216)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18230)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18232)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18240)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 38918)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 46886)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 48879)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 51970)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 51971)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63288)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2389)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 29200)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2389)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 46080)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2821)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6988)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 261)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 275)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 287)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Rock Candy",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 293)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP INJUSTICE FightStick",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 295)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP INJUSTICE FightPad",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 305)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP EA Soccer Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 307)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Battlefield 4 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 323)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP MK X Fight Stick",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 327)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Marvel Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 513)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 531)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 543)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Rock Candy",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 769)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 787)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 788)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1025)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "PDP Xbox 360 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1043)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1281)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63744)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 13)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 27)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 140)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 219)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "HORI Slime Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 286)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4152)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "SteelSeries Stratus Duo",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4152)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5169)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "SteelSeries Stratus Duo",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4152)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 45920)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4553)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22000)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4779)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4779)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 769)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4779)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 771)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 672)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 679)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 680)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1797)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1803)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2053)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5909)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5893)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18228)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18248)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63489)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1537)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5604)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16128)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5604)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16138)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5604)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16144)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5678)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 48879)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5769)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64768)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5769)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64769)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5769)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 65024)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 6473)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1050)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Amazon Luna Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 304)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 678)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 683)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4912)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4920)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5424)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5176)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5432)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61462)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61464)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61465)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61473)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61475)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61477)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61479)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61480)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61486)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61494)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61496)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61497)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61498)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61501)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61502)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61503)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61506)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 61568)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62721)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62722)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62723)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62724)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62725)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62726)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63744)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63745)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63746)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63747)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63748)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 63750)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64001)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64768)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64769)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8296)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8296)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 20480)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21248)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21251)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21258)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21274)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21399)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21760)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21761)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21762)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21763)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21766)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21773)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21774)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21768)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21776)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 23296)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 23298)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 23299)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 23812)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64250)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64251)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64252)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64253)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13623)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4158)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = "Gamesir Xbox Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64254)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13905)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4096)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13905)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24576)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1008)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1173)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1103)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 53266)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 721)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 733)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 736)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One S Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 746)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One S Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 765)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One S Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 767)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2826)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox Adaptive Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2828)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox Adaptive Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2834)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2835)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2848)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox One S Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2849)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Xbox Adaptive Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18945)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 313)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 315)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Face-Off Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 314)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 325)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP MK X Fight Pad",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 326)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Rock Candy",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 347)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Fallout 4 Vault Boy Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 348)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One @Play Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 349)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Mirror's Edge Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 351)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Metallic Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 352)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP NFL Face-Off Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 353)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Camo",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 354)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 355)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Deliverer of Truth",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 356)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Battlefield 1 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 357)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Titanfall 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 358)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Mass Effect: Andromeda Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 359)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Halo Wars 2 Face-Off Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 517)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Victrix Pro Fight Stick",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 518)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Mortal Kombat Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 582)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Rock Candy",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 609)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Camo",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 610)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 672)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Midnight Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 673)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Verdant Green",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 674)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Crimson Red",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 675)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Arctic White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 676)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Phantom Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 677)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Ghost White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 678)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Revenant Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 679)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Raven Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 680)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Arctic White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 681)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Midnight Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 682)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Verdant Green",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 683)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Crimson Red",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 684)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Ember Orange",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 685)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Phantom Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 686)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Ghost White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 687)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Revenant Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 688)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Raven Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 689)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Arctic White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 691)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 693)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One GAMEware Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 694)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 701)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Royal Purple",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 702)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Raven Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 703)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Midnight Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 704)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Phantom Black",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 705)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Ghost White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 706)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Revenant Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 707)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Verdant Green",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 708)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Ember Orange",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 709)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Royal Purple",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 710)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Crimson Red",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 711)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Arctic White",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 712)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Kingdom Hearts Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 713)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Phantasm Red",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 714)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Specter Violet",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 715)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Specter Violet",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 717)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Blu-merang",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 718)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Cranblast",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 719)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Aqualime",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 725)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One Red Camo",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 838)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One RC Gamepad",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1094)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox One RC Gamepad",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 730)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox Series X Afterglow",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 726)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "Victrix Gambit Tournament Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 729)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PDP Xbox Series X Midnight Blue",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 99)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 103)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 120)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 197)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 336)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4341)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 28681)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4341)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 28691)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2560)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2563)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2580)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2581)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8193)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8194)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8195)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8196)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8197)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8198)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8201)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8202)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8203)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8204)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8205)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8206)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8207)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8209)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8210)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8213)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8214)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8215)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8216)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8217)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8218)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox Series X Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16385)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Fusion Pro 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 16386)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Spectra Infinity Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 35083)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21530)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21546)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21562)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = "PowerA Xbox One Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21786)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22042)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22554)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22810)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 22826)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 31002)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8194)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12550)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 12554)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1618)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5656)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11812)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5768)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1553)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 5140)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 345)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 64255)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 109)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 164)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6194)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6271)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6275)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1003)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 65281)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3832)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4096)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4607)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1297)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4933)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24582)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1390)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8210)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5227)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1538)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 174)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1025)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 769)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 51875)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 49761)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 657)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6355)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 177)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6286)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6268)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6300)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6260)))),
        .m_eControllerType = k_eControllerType_XBox360Controller,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 80)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 46)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 145)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1817)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 237)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 192)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 338)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4103)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 696)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6305)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 26246)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4779)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 772)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 657)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 681)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5168)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1803)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 654)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 672)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 7085)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21760)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8363)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21999)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9414)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 21769)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9494)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 105)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 9649)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 864)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11298)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8707)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 17)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 83)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 183)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4100)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4104)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1133)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62209)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 672)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 29283)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 46904)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 52009)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1848)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62465)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6338)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6344)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 121)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6351)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3607)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3612)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3618)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3090)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3632)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 53970)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 53970)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 39450)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3426)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 39451)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3584)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3584)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 298)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 690)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 151)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 186)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 216)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 4095)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 673)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2151)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 5840)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3903)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 12068)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 143)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 62721)))),
        .m_eControllerType = k_eControllerType_XBoxOneController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8198)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConLeft,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8295)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConLeft,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8199)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConRight,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8294)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConRight,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8200)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConPair,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8296)))),
        .m_eControllerType = k_eControllerType_SwitchJoyConPair,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8201)))),
        .m_eControllerType = k_eControllerType_SwitchProController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8297)))),
        .m_eControllerType = k_eControllerType_Switch2ProController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 193)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 146)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 246)))),
        .m_eControllerType = k_eControllerType_SwitchProController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 220)))),
        .m_eControllerType = k_eControllerType_XInputSwitchController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 384)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 385)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 388)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 389)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 390)))),
        .m_eControllerType = k_eControllerType_SwitchProController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 391)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 392)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 395)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 396)))),
        .m_eControllerType = k_eControllerType_SwitchProController,
        .m_pszName = "PDP REALMz Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 403)))),
        .m_eControllerType = k_eControllerType_Switch2ProController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 406)))),
        .m_eControllerType = k_eControllerType_Switch2InputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 407)))),
        .m_eControllerType = k_eControllerType_Switch2InputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3695)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 408)))),
        .m_eControllerType = k_eControllerType_Switch2InputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 170)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42769)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42770)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42771)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42772)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42773)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42774)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8406)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 42776)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13277)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13277)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 13277)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 240)))),
        .m_eControllerType = k_eControllerType_SwitchInputOnlyController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1356)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 3570)))),
        .m_eControllerType = k_eControllerType_PS5EdgeController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 739)))),
        .m_eControllerType = k_eControllerType_XBoxEliteController,
        .m_pszName = "Xbox One Elite Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2816)))),
        .m_eControllerType = k_eControllerType_XBoxEliteController,
        .m_pszName = "Xbox One Elite 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2821)))),
        .m_eControllerType = k_eControllerType_XBoxEliteController,
        .m_pszName = "Xbox One Elite 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 1118)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2850)))),
        .m_eControllerType = k_eControllerType_XBoxEliteController,
        .m_pszName = "Xbox One Elite 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24576)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo SF30 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24832)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo SF30 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24577)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo SN30 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24833)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo SN30 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24579)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo Pro 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24582)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo Pro 2 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24585)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo Pro 3 Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 11720)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24594)))),
        .m_eControllerType = k_eControllerType_8BitDoController,
        .m_pszName = "8Bitdo Ultimate 2 Wireless Controller",
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4603)))),
        .m_eControllerType = k_eControllerType_MobileTouch,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4353)))),
        .m_eControllerType = k_eControllerType_SteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4354)))),
        .m_eControllerType = k_eControllerType_SteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4357)))),
        .m_eControllerType = k_eControllerType_SteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4358)))),
        .m_eControllerType = k_eControllerType_SteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4607)))),
        .m_eControllerType = k_eControllerType_UnknownNonSteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4418)))),
        .m_eControllerType = k_eControllerType_SteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4609)))),
        .m_eControllerType = k_eControllerType_SteamControllerV2,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4610)))),
        .m_eControllerType = k_eControllerType_SteamControllerV2,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4613)))),
        .m_eControllerType = k_eControllerType_SteamControllerNeptune,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4866)))),
        .m_eControllerType = k_eControllerType_SteamControllerTriton,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4867)))),
        .m_eControllerType = k_eControllerType_SteamControllerTriton,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4868)))),
        .m_eControllerType = k_eControllerType_SteamControllerTriton,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 10462)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 4869)))),
        .m_eControllerType = k_eControllerType_SteamControllerTriton,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 427)))),
        .m_eControllerType = k_eControllerType_HoriSteamController,
        .m_pszName = null,
    },
    ControllerDescription_t{
        .m_unDeviceID = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3853)))) << @intCast(@as(c_uint, 16))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 406)))),
        .m_eControllerType = k_eControllerType_HoriSteamController,
        .m_pszName = null,
    },
};
pub fn GetControllerTypeOverride(nVID: c_int, nPID: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_GAMECONTROLLERTYPE");
    _ = &hint;
    if (hint != null) {
        var key: [32]u8 = undefined;
        _ = &key;
        var spot: [*c]const u8 = null;
        _ = &spot;
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&key)), @sizeOf(@TypeOf(key)), "0x%.4x/0x%.4x=", nVID, nPID);
        spot = SDL_strstr_REAL(hint, @ptrCast(@alignCast(&key)));
        if (!(spot != null)) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&key)), @sizeOf(@TypeOf(key)), "0x%.4X/0x%.4X=", nVID, nPID);
            spot = SDL_strstr_REAL(hint, @ptrCast(@alignCast(&key)));
        }
        if (spot != null) {
            spot += SDL_strlen_REAL(@ptrCast(@alignCast(&key)));
            if (SDL_strncmp_REAL(spot, "k_eControllerType_", 18) == @as(c_int, 0)) {
                spot += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 18)))));
            }
            return spot;
        }
    }
    return null;
}
