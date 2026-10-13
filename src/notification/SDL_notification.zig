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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Surface = opaque {
};
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_NotificationID = Uint32;
pub const enum_SDL_NotificationActionType = c_uint;
pub const SDL_NotificationActionType = enum_SDL_NotificationActionType;
const struct_unnamed_13 = extern struct {
    type: SDL_NotificationActionType = @import("std").mem.zeroes(SDL_NotificationActionType),
    action_id: [*c]const u8 = null,
    action_label: [*c]const u8 = null,
};
pub const union_SDL_NotificationAction = extern union {
    type: SDL_NotificationActionType,
    button: struct_unnamed_13,
    padding: [128]Uint8,
};
pub const SDL_NotificationAction = union_SDL_NotificationAction;
pub extern fn SDL_SYS_ShowNotification(props: SDL_PropertiesID) SDL_NotificationID;
pub export fn SDL_ShowNotificationWithProperties_REAL(props: SDL_PropertiesID) SDL_NotificationID {
    @setEvalBranchQuota(100000);
    if (!(props != 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("props"))));
        return 0;
    }
    if (true) {
        var title: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.notification.title", null);
        _ = &title;
        if (!(title != null)) {
            _ = SDL_SetError_REAL("Notifications must have a title");
            return 0;
        }
    }
    return SDL_SYS_ShowNotification(props);
}
pub export fn SDL_ShowNotification_REAL(title: [*c]const u8, message: [*c]const u8, image: ?*SDL_Surface, actions: [*c]SDL_NotificationAction, num_actions: c_int) SDL_NotificationID {
    @setEvalBranchQuota(100000);
    var id: SDL_NotificationID = undefined;
    _ = &id;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                id = 0;
                props = SDL_CreateProperties_REAL();
                if (!(props != 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_DestroyProperties_REAL(props);
                return id;
            },
            2 => {
                return 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (title != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (!SDL_SetStringProperty_REAL(props, "SDL.notification.title", title)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            6 => {
                _ = SDL_SetError_REAL("Notifications must have a title");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                if (message != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                if (!SDL_SetStringProperty_REAL(props, "SDL.notification.message", message)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (image != null) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                if (!SDL_SetPointerProperty_REAL(props, "SDL.notification.image", @ptrCast(@alignCast(image)))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                if ((actions != null) and (num_actions != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                if (!SDL_SetPointerProperty_REAL(props, "SDL.notification.actions", @ptrCast(@alignCast(actions)))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                id = SDL_ShowNotificationWithProperties_REAL(props);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (!SDL_SetNumberProperty_REAL(props, "SDL.notification.action_count", num_actions)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_ShowNotificationWithProperties = SDL_ShowNotificationWithProperties_REAL;
pub const SDL_ShowNotification = SDL_ShowNotification_REAL;
