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
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const __suseconds_t = c_long;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const SDL_PropertiesID = Uint32;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_DisplayModeData = opaque {};
pub const SDL_DisplayModeData = struct_SDL_DisplayModeData;
pub const struct_SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixel_density: f32 = 0,
    refresh_rate: f32 = 0,
    refresh_rate_numerator: c_int = 0,
    refresh_rate_denominator: c_int = 0,
    internal: ?*SDL_DisplayModeData = null,
};
pub const SDL_DisplayMode = struct_SDL_DisplayMode;
pub const struct_SDL_Window = extern struct {
    id: SDL_WindowID = 0,
    title: [*c]u8 = null,
    icon: [*c]SDL_Surface = null,
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
    min_w: c_int = 0,
    min_h: c_int = 0,
    max_w: c_int = 0,
    max_h: c_int = 0,
    min_aspect: f32 = 0,
    max_aspect: f32 = 0,
    last_pixel_w: c_int = 0,
    last_pixel_h: c_int = 0,
    flags: SDL_WindowFlags = 0,
    pending_flags: SDL_WindowFlags = 0,
    display_scale: f32 = 0,
    external_graphics_context: bool = false,
    fullscreen_exclusive: bool = false,
    last_fullscreen_exclusive_display: SDL_DisplayID = 0,
    displayID: SDL_DisplayID = 0,
    pending_displayID: SDL_DisplayID = 0,
    windowed: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    floating: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    pending: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    tiled: bool = false,
    undefined_x: bool = false,
    undefined_y: bool = false,
    requested_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    opacity: f32 = 0,
    surface: [*c]SDL_Surface = null,
    surface_valid: bool = false,
    is_hiding: bool = false,
    restore_on_show: bool = false,
    last_position_pending: bool = false,
    last_size_pending: bool = false,
    update_fullscreen_on_display_changed: bool = false,
    constrain_popup: bool = false,
    is_destroying: bool = false,
    is_dropping: bool = false,
    safe_inset_left: c_int = 0,
    safe_inset_right: c_int = 0,
    safe_inset_top: c_int = 0,
    safe_inset_bottom: c_int = 0,
    safe_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_props: SDL_PropertiesID = 0,
    text_input_active: bool = false,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    mouse_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    hit_test: SDL_HitTest = null,
    hit_test_data: ?*anyopaque = null,
    progress_state: SDL_ProgressState = @import("std").mem.zeroes(SDL_ProgressState),
    progress_value: f32 = 0,
    props: SDL_PropertiesID = 0,
    num_renderers: c_int = 0,
    renderers: [*c]?*SDL_Renderer = null,
    internal: ?*SDL_WindowData = null,
    keyboard_focus: [*c]SDL_Window = null,
    prev: [*c]SDL_Window = null,
    next: [*c]SDL_Window = null,
    parent: [*c]SDL_Window = null,
    first_child: [*c]SDL_Window = null,
    prev_sibling: [*c]SDL_Window = null,
    next_sibling: [*c]SDL_Window = null,
};
pub const SDL_Window = struct_SDL_Window;
pub const SDL_WindowFlags = Uint64;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub extern fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID;
pub extern fn SDL_GetCurrentDisplayMode_REAL(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode;
pub extern fn SDL_GetDisplayForWindow_REAL(window: [*c]SDL_Window) SDL_DisplayID;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: ?*SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const SDL_MOUSEWHEEL_NORMAL: c_int = 0;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const struct_SDL_CursorFrameInfo = extern struct {
    surface: [*c]SDL_Surface = null,
    duration: Uint32 = 0,
};
pub const SDL_CursorFrameInfo = struct_SDL_CursorFrameInfo;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE: c_int = 1;
pub const enum_SDL_TouchDeviceType = c_int;
pub const SDL_TouchDeviceType = enum_SDL_TouchDeviceType;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_input_event = extern struct {
    time: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    type: __u16 = 0,
    code: __u16 = 0,
    value: __s32 = 0,
};
pub export fn SDL_EVDEV_Init() bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _this = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(_this.*)))));
        if (!(_this != null)) {
            return @"false" != 0;
        }
        if (!SDL_UDEV_Init()) {
            SDL_free_REAL(@ptrCast(@alignCast(_this)));
            _this = null;
            return @"false" != 0;
        }
        if (!SDL_UDEV_AddCallback(SDL_EVDEV_udev_callback)) {
            SDL_UDEV_Quit();
            SDL_free_REAL(@ptrCast(@alignCast(_this)));
            _this = null;
            return @"false" != 0;
        }
        _ = SDL_UDEV_Scan();
        _this.*.kbd = SDL_EVDEV_kbd_init();
        SDL_EVDEV_UpdateKeyboardMute();
    }
    SDL_GetMouse().*.SetRelativeMouseMode = SDL_EVDEV_SetRelativeMouseMode;
    _this.*.ref_count += 1;
    return @"true" != 0;
}
pub export fn SDL_EVDEV_Quit() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "SDL_EVDEV_Quit".*;
    };
    _ = &static_local___func__;
    if (!(_this != null)) {
        return;
    }
    _this.*.ref_count -= 1;
    if (_this.*.ref_count < @as(c_int, 1)) {
        SDL_UDEV_DelCallback(SDL_EVDEV_udev_callback);
        SDL_UDEV_Quit();
        while (_this.*.first != null) {
            _ = SDL_EVDEV_device_removed(_this.*.first.*.path);
        }
        SDL_EVDEV_kbd_quit(_this.*.kbd);
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(_this.*.first))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "_this->first == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 253);
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
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(_this.*.last))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "_this->last == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 254);
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
            while (!(_this.*.num_devices == @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "_this->num_devices == 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 255);
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
        SDL_free_REAL(@ptrCast(@alignCast(_this)));
        _this = null;
    }
}
pub export fn SDL_EVDEV_SetVTSwitchCallbacks(release_callback: ?*const fn (?*anyopaque) callconv(.c) void, release_callback_data: ?*anyopaque, acquire_callback: ?*const fn (?*anyopaque) callconv(.c) void, acquire_callback_data: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    SDL_EVDEV_kbd_set_vt_switch_callbacks(_this.*.kbd, release_callback, release_callback_data, acquire_callback, acquire_callback_data);
}
pub export fn SDL_EVDEV_GetDeviceCount(arg_device_class: c_int) c_int {
    @setEvalBranchQuota(100000);
    var device_class = arg_device_class;
    _ = &device_class;
    var item: [*c]SDL_evdevlist_item = undefined;
    _ = &item;
    var count: c_int = 0;
    _ = &count;
    {
        item = _this.*.first;
        while (item != null) : (item = item.*.next) {
            if ((item.*.udev_class & device_class) == device_class) {
                count += 1;
            }
        }
    }
    return count;
}
pub export fn SDL_EVDEV_Poll() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "SDL_EVDEV_Poll".*;
    };
    _ = &static_local___func__;
    var events: [32]struct_input_event = undefined;
    _ = &events;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var len: c_int = undefined;
    _ = &len;
    var item: [*c]SDL_evdevlist_item = undefined;
    _ = &item;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var mouse_button: c_int = undefined;
    _ = &mouse_button;
    var mouse: [*c]SDL_Mouse = undefined;
    _ = &mouse;
    var norm_x: f32 = undefined;
    _ = &norm_x;
    var norm_y: f32 = undefined;
    _ = &norm_y;
    var norm_pressure: f32 = undefined;
    _ = &norm_pressure;
    var event: [*c]struct_input_event = undefined;
    _ = &event;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var timestamp_1: Uint64 = undefined;
    _ = &timestamp_1;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "item->high_res_wheel",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_2 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "item->high_res_hwheel",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_2;
    var sdl_assert_state_3: SDL_AssertState = undefined;
    _ = &sdl_assert_state_3;
    var timestamp_4: Uint64 = undefined;
    _ = &timestamp_4;
    var screen_w: c_int = undefined;
    _ = &screen_w;
    var screen_h: c_int = undefined;
    _ = &screen_h;
    var mode: [*c]const SDL_DisplayMode = undefined;
    _ = &mode;
    var timestamp_5: Uint64 = undefined;
    _ = &timestamp_5;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(_this != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                SDL_EVDEV_kbd_update(_this.*.kbd);
                mouse = SDL_GetMouse();
                item = _this.*.first;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (item != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                item = item.*.next;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {}
            },
            8 => {
                if ((blk: {
                    const tmp = @as(c_int, @truncate(read(item.*.fd, @ptrCast(@alignCast(@as([*c]struct_input_event, @ptrCast(@alignCast(&events))))), @sizeOf(@TypeOf(events)))));
                    len = tmp;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                {
                    const ref = &len;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) / @sizeOf(@TypeOf(events[@as(c_int, 0)])))));
                }
                i = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                if (i < len) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                event = &events[@bitCast(@as(isize, @intCast(i)))];
                if (((item.*.out_of_sync and item.*.is_touchscreen) and (@as(c_int, event.*.type) == EV_SYN)) and (@as(c_int, event.*.code) != SYN_REPORT)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                switch (@as(c_int, event.*.type)) {
                    EV_KEY => {
                        sdl_pc = 19;
                        continue;
                    },
                    EV_ABS => {
                        sdl_pc = 38;
                        continue;
                    },
                    EV_REL => {
                        sdl_pc = 93;
                        continue;
                    },
                    EV_SYN => {
                        sdl_pc = 138;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            18 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                if ((@as(c_int, event.*.code) >= BTN_MOUSE) and (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, event.*.code)))) < (@as(c_ulong, BTN_MOUSE) +% (@sizeOf(@TypeOf(EVDEV_MouseButtons)) / @sizeOf(@TypeOf(EVDEV_MouseButtons[@as(c_int, 0)])))))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                timestamp = SDL_EVDEV_GetEventTimestamp(event);
                mouse_button = @as(c_int, event.*.code) - BTN_MOUSE;
                SDL_SendMouseButton(timestamp, mouse.*.focus, @bitCast(@as(c_int, item.*.fd)), EVDEV_MouseButtons[@bitCast(@as(isize, @intCast(mouse_button)))], event.*.value != @as(c_int, 0));
                {
                    sdl_pc = 18;
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
                if (item.*.is_touchscreen and (@as(c_int, event.*.code) == BTN_TOUCH)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (item.*.touchscreen_data.*.max_slots == @as(c_int, 1)) {
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
                timestamp_1 = SDL_EVDEV_GetEventTimestamp(event);
                scancode = SDL_EVDEV_translate_keycode(event.*.code);
                if (event.*.value == @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            26 => {
                if (event.*.value != 0) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            29 => {
                item.*.touchscreen_data.*.slots[@as(c_int, 0)].delta = EVDEV_TOUCH_SLOTDELTA_DOWN;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                item.*.touchscreen_data.*.slots[@as(c_int, 0)].delta = EVDEV_TOUCH_SLOTDELTA_UP;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                _ = SDL_SendKeyboardKey(timestamp_1, @bitCast(@as(c_int, item.*.fd)), event.*.code, scancode, @"false" != 0);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if ((event.*.value == @as(c_int, 1)) or (event.*.value == @as(c_int, 2))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                SDL_EVDEV_kbd_keycode(_this.*.kbd, event.*.code, event.*.value);
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            35 => {
                _ = SDL_SendKeyboardKey(timestamp_1, @bitCast(@as(c_int, item.*.fd)), event.*.code, scancode, @"true" != 0);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                switch (@as(c_int, event.*.code)) {
                    ABS_MT_SLOT => {
                        sdl_pc = 40;
                        continue;
                    },
                    ABS_MT_TRACKING_ID => {
                        sdl_pc = 44;
                        continue;
                    },
                    ABS_MT_POSITION_X => {
                        sdl_pc = 51;
                        continue;
                    },
                    ABS_MT_POSITION_Y => {
                        sdl_pc = 58;
                        continue;
                    },
                    ABS_MT_PRESSURE => {
                        sdl_pc = 65;
                        continue;
                    },
                    ABS_X => {
                        sdl_pc = 72;
                        continue;
                    },
                    ABS_Y => {
                        sdl_pc = 82;
                        continue;
                    },
                    else => {
                        sdl_pc = 92;
                        continue;
                    },
                }
            },
            39 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            40 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                item.*.touchscreen_data.*.current_slot = event.*.value;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if (event.*.value >= @as(c_int, 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].tracking_id = event.*.value + @as(c_int, 1);
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta = EVDEV_TOUCH_SLOTDELTA_DOWN;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta = EVDEV_TOUCH_SLOTDELTA_UP;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            51 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].x = event.*.value;
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            58 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].y = event.*.value;
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            65 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].pressure = event.*.value;
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(item.*.touchscreen_data.*.current_slot)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            72 => {
                if (item.*.is_touchscreen) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                if (item.*.touchscreen_data.*.max_slots != @as(c_int, 1)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                if (!item.*.relative_mouse) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                item.*.touchscreen_data.*.slots[@as(c_int, 0)].x = event.*.value;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                item.*.mouse_x = event.*.value;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            82 => {
                if (item.*.is_touchscreen) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                if (item.*.touchscreen_data.*.max_slots != @as(c_int, 1)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            84 => {
                if (!item.*.relative_mouse) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                item.*.touchscreen_data.*.slots[@as(c_int, 0)].y = event.*.value;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                item.*.mouse_y = event.*.value;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            93 => {
                switch (@as(c_int, event.*.code)) {
                    REL_X => {
                        sdl_pc = 95;
                        continue;
                    },
                    REL_Y => {
                        sdl_pc = 99;
                        continue;
                    },
                    REL_WHEEL => {
                        sdl_pc = 103;
                        continue;
                    },
                    REL_WHEEL_HI_RES => {
                        sdl_pc = 107;
                        continue;
                    },
                    REL_HWHEEL => {
                        sdl_pc = 120;
                        continue;
                    },
                    REL_HWHEEL_HI_RES => {
                        sdl_pc = 124;
                        continue;
                    },
                    else => {
                        sdl_pc = 137;
                        continue;
                    },
                }
            },
            94 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            95 => {
                if (item.*.relative_mouse) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                item.*.mouse_x += event.*.value;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            99 => {
                if (item.*.relative_mouse) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                item.*.mouse_y += event.*.value;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            103 => {
                if (!item.*.high_res_wheel) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                item.*.mouse_wheel += event.*.value;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            109 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                item.*.mouse_wheel += event.*.value;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            111 => {
                if (!item.*.high_res_wheel) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 472);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            115 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            117 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            120 => {
                if (!item.*.high_res_hwheel) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                item.*.mouse_hwheel += event.*.value;
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            126 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                item.*.mouse_hwheel += event.*.value;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            128 => {
                if (!item.*.high_res_hwheel) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                sdl_assert_state_3 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_2.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 481);
                if (sdl_assert_state_3 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 131;
                    continue;
                } else {
                    sdl_pc = 132;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            132 => {
                if (sdl_assert_state_3 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            134 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            138 => {
                switch (@as(c_int, event.*.code)) {
                    SYN_REPORT => {
                        sdl_pc = 140;
                        continue;
                    },
                    SYN_DROPPED => {
                        sdl_pc = 180;
                        continue;
                    },
                    else => {
                        sdl_pc = 184;
                        continue;
                    },
                }
            },
            139 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            140 => {
                if (item.*.relative_mouse) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                if ((item.*.mouse_x != @as(c_int, 0)) or (item.*.mouse_y != @as(c_int, 0))) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            142 => {
                if ((item.*.range_x > @as(c_int, 0)) and (item.*.range_y > @as(c_int, 0))) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            143 => {
                if ((item.*.mouse_wheel != @as(c_int, 0)) or (item.*.mouse_hwheel != @as(c_int, 0))) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            144 => {
                timestamp_4 = SDL_EVDEV_GetEventTimestamp(event);
                SDL_SendMouseMotion(timestamp_4, mouse.*.focus, @bitCast(@as(c_int, item.*.fd)), item.*.relative_mouse, @floatFromInt(item.*.mouse_x), @floatFromInt(item.*.mouse_y));
                item.*.mouse_x = blk: {
                    const tmp = @as(c_int, 0);
                    item.*.mouse_y = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            147 => {
                screen_w = 0;
                screen_h = 0;
                mode = null;
                if (mouse.*.focus != null) {
                    sdl_pc = 150;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            150 => {
                mode = SDL_GetCurrentDisplayMode_REAL(SDL_GetDisplayForWindow_REAL(mouse.*.focus));
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                if (!(mode != null)) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            153 => {
                mode = SDL_GetCurrentDisplayMode_REAL(SDL_GetPrimaryDisplay_REAL());
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            155 => {
                if (mode != null) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                screen_w = mode.*.w;
                screen_h = mode.*.h;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                SDL_SendMouseMotion(SDL_EVDEV_GetEventTimestamp(event), mouse.*.focus, @bitCast(@as(c_int, item.*.fd)), item.*.relative_mouse, (@as(f32, @floatFromInt(item.*.mouse_x - item.*.min_x)) * @as(f32, @floatFromInt(screen_w))) / @as(f32, @floatFromInt(item.*.range_x)), (@as(f32, @floatFromInt(item.*.mouse_y - item.*.min_y)) * @as(f32, @floatFromInt(screen_h))) / @as(f32, @floatFromInt(item.*.range_y)));
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            159 => {
                timestamp_5 = SDL_EVDEV_GetEventTimestamp(event);
                SDL_SendMouseWheel(timestamp_5, mouse.*.focus, @bitCast(@as(c_int, item.*.fd)), @as(f32, @floatFromInt(item.*.mouse_hwheel)) / (if (item.*.high_res_hwheel) @as(f32, 120.0) else @as(f32, 1.0)), @as(f32, @floatFromInt(item.*.mouse_wheel)) / (if (item.*.high_res_wheel) @as(f32, 120.0) else @as(f32, 1.0)), SDL_MOUSEWHEEL_NORMAL);
                item.*.mouse_wheel = blk: {
                    const tmp = @as(c_int, 0);
                    item.*.mouse_hwheel = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                if (!item.*.is_touchscreen) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                j = 0;
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                if (j < item.*.touchscreen_data.*.max_slots) {
                    sdl_pc = 166;
                    continue;
                } else {
                    sdl_pc = 168;
                    continue;
                }
            },
            166 => {
                norm_x = @as(f32, @floatFromInt(item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].x - item.*.touchscreen_data.*.min_x)) / @as(f32, @floatFromInt(item.*.touchscreen_data.*.range_x));
                norm_y = @as(f32, @floatFromInt(item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].y - item.*.touchscreen_data.*.min_y)) / @as(f32, @floatFromInt(item.*.touchscreen_data.*.range_y));
                if (item.*.touchscreen_data.*.range_pressure > @as(c_int, 0)) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            167 => {
                j += 1;
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            168 => {
                if (item.*.out_of_sync) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 178;
                    continue;
                }
            },
            169 => {
                norm_pressure = @as(f32, @floatFromInt(item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].pressure - item.*.touchscreen_data.*.min_pressure)) / @as(f32, @floatFromInt(item.*.touchscreen_data.*.range_pressure));
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            170 => {
                norm_pressure = 1.0;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                switch (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].delta) {
                    @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_DOWN) => {
                        sdl_pc = 173;
                        continue;
                    },
                    @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_UP) => {
                        sdl_pc = 174;
                        continue;
                    },
                    @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_MOVE) => {
                        sdl_pc = 175;
                        continue;
                    },
                    else => {
                        sdl_pc = 176;
                        continue;
                    },
                }
            },
            172 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            173 => {
                SDL_SendTouch(SDL_EVDEV_GetEventTimestamp(event), @bitCast(@as(c_long, item.*.fd)), @bitCast(@as(c_long, item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].tracking_id)), mouse.*.focus, SDL_EVENT_FINGER_DOWN, norm_x, norm_y, norm_pressure);
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].delta = EVDEV_TOUCH_SLOTDELTA_NONE;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            174 => {
                SDL_SendTouch(SDL_EVDEV_GetEventTimestamp(event), @bitCast(@as(c_long, item.*.fd)), @bitCast(@as(c_long, item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].tracking_id)), mouse.*.focus, SDL_EVENT_FINGER_UP, norm_x, norm_y, norm_pressure);
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].tracking_id = 0;
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].delta = EVDEV_TOUCH_SLOTDELTA_NONE;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            175 => {
                SDL_SendTouchMotion(SDL_EVDEV_GetEventTimestamp(event), @bitCast(@as(c_long, item.*.fd)), @bitCast(@as(c_long, item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].tracking_id)), mouse.*.focus, norm_x, norm_y, norm_pressure);
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(j)))].delta = EVDEV_TOUCH_SLOTDELTA_NONE;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            177 => {
                item.*.out_of_sync = @"false" != 0;
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            180 => {
                if (item.*.is_touchscreen) {
                    sdl_pc = 181;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            181 => {
                item.*.out_of_sync = @"true" != 0;
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            182 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                SDL_EVDEV_sync_device(item);
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            184 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_EVDEV_GetEventTimestamp(event: [*c]struct_input_event) Uint64 {
    @setEvalBranchQuota(100000);
    const static_local_timestamp_offset = struct {
        var timestamp_offset: Uint64 = 0;
    };
    _ = &static_local_timestamp_offset;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var now: Uint64 = SDL_GetTicksNS_REAL();
    _ = &now;
    timestamp = @bitCast(@as(c_long, event.*.time.tv_sec));
    {
        const ref = &timestamp;
        ref.* = @truncate(@as(c_ulonglong, ref.*) *% @as(c_ulonglong, SDL_NS_PER_SECOND));
    }
    timestamp +%= @as(Uint64, @bitCast(@as(c_long, event.*.time.tv_usec))) *% @as(Uint64, SDL_NS_PER_US);
    if (!(static_local_timestamp_offset.timestamp_offset != 0)) {
        static_local_timestamp_offset.timestamp_offset = now -% timestamp;
    }
    timestamp +%= static_local_timestamp_offset.timestamp_offset;
    if (timestamp > now) {
        static_local_timestamp_offset.timestamp_offset -%= timestamp -% now;
        timestamp = now;
    }
    return timestamp;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BUTTON_LEFT = @as(c_int, 1);
pub const SDL_BUTTON_MIDDLE = @as(c_int, 2);
pub const SDL_BUTTON_RIGHT = @as(c_int, 3);
pub const SDL_BUTTON_X1 = @as(c_int, 4);
pub const SDL_BUTTON_X2 = @as(c_int, 5);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_WindowData = opaque {};
pub const SDL_WindowData = struct_SDL_WindowData;
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const __u16 = c_ushort;
pub const __s32 = c_int;
pub const struct_SDL_EVDEV_keyboard_state = opaque {
};
pub const SDL_EVDEV_keyboard_state = struct_SDL_EVDEV_keyboard_state;
pub extern fn SDL_EVDEV_kbd_init() ?*SDL_EVDEV_keyboard_state;
pub extern fn SDL_EVDEV_kbd_set_muted(state: ?*SDL_EVDEV_keyboard_state, muted: bool) void;
pub extern fn SDL_EVDEV_kbd_set_vt_switch_callbacks(state: ?*SDL_EVDEV_keyboard_state, release_callback: ?*const fn (?*anyopaque) callconv(.c) void, release_callback_data: ?*anyopaque, acquire_callback: ?*const fn (?*anyopaque) callconv(.c) void, acquire_callback_data: ?*anyopaque) void;
pub extern fn SDL_EVDEV_kbd_update(state: ?*SDL_EVDEV_keyboard_state) void;
pub extern fn SDL_EVDEV_kbd_keycode(state: ?*SDL_EVDEV_keyboard_state, keycode: c_uint, down: c_int) void;
pub extern fn SDL_EVDEV_kbd_quit(state: ?*SDL_EVDEV_keyboard_state) void;
pub extern fn __errno_location() [*c]c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub const struct_input_absinfo = extern struct {
    value: __s32 = 0,
    minimum: __s32 = 0,
    maximum: __s32 = 0,
    fuzz: __s32 = 0,
    flat: __s32 = 0,
    resolution: __s32 = 0,
};
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_AddKeyboard(keyboardID: SDL_KeyboardID, name: [*c]const u8) void;
pub extern fn SDL_RemoveKeyboard(keyboardID: SDL_KeyboardID) void;
pub extern fn SDL_SendKeyboardKey(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool;
pub const SDL_CursorAnimation = extern struct {
    last_update: Uint64 = 0,
    num_frames: c_int = 0,
    current_frame: c_int = 0,
    frames: [*c][*c]struct_SDL_Cursor = null,
    durations: [*c]Uint32 = null,
};
pub const SDL_MouseClickState = extern struct {
    last_timestamp: Uint64 = 0,
    click_motion_x: f64 = 0,
    click_motion_y: f64 = 0,
    click_count: Uint8 = 0,
};
pub const SDL_MouseInputSource = extern struct {
    mouseID: SDL_MouseID = 0,
    buttonstate: Uint32 = 0,
    num_clickstates: c_int = 0,
    clickstate: [*c]SDL_MouseClickState = null,
};
pub const SDL_Mouse = extern struct {
    CreateCursor: ?*const fn (surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor = null,
    CreateAnimatedCursor: ?*const fn (frames: [*c]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor = null,
    CreateSystemCursor: ?*const fn (id: SDL_SystemCursor) callconv(.c) [*c]SDL_Cursor = null,
    ShowCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) bool = null,
    MoveCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) bool = null,
    FreeCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) void = null,
    WarpMouse: ?*const fn (window: [*c]SDL_Window, x: f32, y: f32) callconv(.c) bool = null,
    WarpMouseGlobal: ?*const fn (x: f32, y: f32) callconv(.c) bool = null,
    SetRelativeMouseMode: ?*const fn (enabled: bool) callconv(.c) bool = null,
    CaptureMouse: ?*const fn (window: [*c]SDL_Window) callconv(.c) bool = null,
    GetGlobalMouseState: ?*const fn (x: [*c]f32, y: [*c]f32) callconv(.c) SDL_MouseButtonFlags = null,
    ApplySystemScale: SDL_MouseMotionTransformCallback = null,
    system_scale_data: ?*anyopaque = null,
    InputTransform: SDL_MouseMotionTransformCallback = null,
    input_transform_data: ?*anyopaque = null,
    integer_mode_flags: Uint8 = 0,
    integer_mode_residual_motion_x: f32 = 0,
    integer_mode_residual_motion_y: f32 = 0,
    focus: [*c]SDL_Window = null,
    x: f32 = 0,
    y: f32 = 0,
    x_accu: f32 = 0,
    y_accu: f32 = 0,
    last_x: f32 = 0,
    last_y: f32 = 0,
    residual_scroll_x: f32 = 0,
    residual_scroll_y: f32 = 0,
    click_motion_x: f64 = 0,
    click_motion_y: f64 = 0,
    has_position: bool = false,
    relative_mode: bool = false,
    relative_mode_warp_motion: bool = false,
    relative_mode_hide_cursor: bool = false,
    relative_mode_center: bool = false,
    warp_emulation_hint: bool = false,
    warp_emulation_active: bool = false,
    warp_emulation_prohibited: bool = false,
    have_explicit_warp_event: bool = false,
    last_center_warp_time_ns: Uint64 = 0,
    enable_normal_speed_scale: bool = false,
    normal_speed_scale: f32 = 0,
    enable_relative_speed_scale: bool = false,
    relative_speed_scale: f32 = 0,
    enable_relative_system_scale: bool = false,
    double_click_time: Uint32 = 0,
    double_click_radius: c_int = 0,
    touch_mouse_events: bool = false,
    mouse_touch_events: bool = false,
    pen_mouse_events: bool = false,
    pen_touch_events: bool = false,
    was_touch_mouse_events: bool = false,
    added_mouse_touch_device: bool = false,
    added_pen_touch_device: bool = false,
    auto_capture: bool = false,
    capture_desired: bool = false,
    capture_window: [*c]SDL_Window = null,
    num_sources: c_int = 0,
    sources: [*c]SDL_MouseInputSource = null,
    cursors: [*c]SDL_Cursor = null,
    def_cursor: [*c]SDL_Cursor = null,
    cur_cursor: [*c]SDL_Cursor = null,
    cursor_visible: bool = false,
    internal: ?*anyopaque = null,
};
pub extern fn SDL_AddMouse(mouseID: SDL_MouseID, name: [*c]const u8) void;
pub extern fn SDL_RemoveMouse(mouseID: SDL_MouseID) void;
pub extern fn SDL_GetMouse() [*c]SDL_Mouse;
pub extern fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void;
pub extern fn SDL_SendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool) void;
pub extern fn SDL_SendMouseWheel(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32, direction: SDL_MouseWheelDirection) void;
pub extern fn SDL_AddTouch(id: SDL_TouchID, @"type": SDL_TouchDeviceType, name: [*c]const u8) c_int;
pub extern fn SDL_SendTouch(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, @"type": SDL_EventType, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendTouchMotion(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_DelTouch(id: SDL_TouchID) void;
pub const SDL_SCANCODE_TABLE_LINUX: c_int = 1;
pub const SDL_ScancodeTable = c_uint;
pub extern fn SDL_GetScancodeFromTable(table: SDL_ScancodeTable, keycode: c_int) SDL_Scancode;
pub const SDL_UDEV_DEVICE_MOUSE: c_int = 1;
pub const SDL_UDEV_DEVICE_KEYBOARD: c_int = 2;
pub const SDL_UDEV_DEVICE_JOYSTICK: c_int = 4;
pub const SDL_UDEV_DEVICE_TOUCHSCREEN: c_int = 16;
pub const SDL_UDEV_DEVICE_TOUCHPAD: c_int = 64;
pub const SDL_UDEV_DEVICE_HAS_KEYS: c_int = 128;
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub extern fn SDL_UDEV_Init() bool;
pub extern fn SDL_UDEV_Quit() void;
pub extern fn SDL_UDEV_Scan() bool;
pub extern fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool;
pub extern fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void;
pub const EVDEV_TOUCH_SLOTDELTA_NONE: c_int = 0;
pub const EVDEV_TOUCH_SLOTDELTA_DOWN: c_int = 1;
pub const EVDEV_TOUCH_SLOTDELTA_UP: c_int = 2;
pub const EVDEV_TOUCH_SLOTDELTA_MOVE: c_int = 3;
const enum_unnamed_25 = c_uint;
const struct_unnamed_24 = extern struct {
    delta: enum_unnamed_25 = @import("std").mem.zeroes(enum_unnamed_25),
    tracking_id: c_int = 0,
    x: c_int = 0,
    y: c_int = 0,
    pressure: c_int = 0,
};
const struct_unnamed_23 = extern struct {
    name: [*c]u8 = null,
    min_x: c_int = 0,
    max_x: c_int = 0,
    range_x: c_int = 0,
    min_y: c_int = 0,
    max_y: c_int = 0,
    range_y: c_int = 0,
    min_pressure: c_int = 0,
    max_pressure: c_int = 0,
    range_pressure: c_int = 0,
    max_slots: c_int = 0,
    current_slot: c_int = 0,
    slots: [*c]struct_unnamed_24 = null,
};
pub const struct_SDL_evdevlist_item = extern struct {
    path: [*c]u8 = null,
    fd: c_int = 0,
    udev_class: c_int = 0,
    out_of_sync: bool = false,
    is_touchscreen: bool = false,
    touchscreen_data: [*c]struct_unnamed_23 = null,
    high_res_wheel: bool = false,
    high_res_hwheel: bool = false,
    relative_mouse: bool = false,
    mouse_x: c_int = 0,
    mouse_y: c_int = 0,
    mouse_wheel: c_int = 0,
    mouse_hwheel: c_int = 0,
    min_x: c_int = 0,
    max_x: c_int = 0,
    range_x: c_int = 0,
    min_y: c_int = 0,
    max_y: c_int = 0,
    range_y: c_int = 0,
    next: [*c]struct_SDL_evdevlist_item = null,
};
pub const SDL_evdevlist_item = struct_SDL_evdevlist_item;
pub const struct_SDL_EVDEV_PrivateData = extern struct {
    ref_count: c_int = 0,
    num_devices: c_int = 0,
    first: [*c]SDL_evdevlist_item = null,
    last: [*c]SDL_evdevlist_item = null,
    kbd: ?*SDL_EVDEV_keyboard_state = null,
};
pub const SDL_EVDEV_PrivateData = struct_SDL_EVDEV_PrivateData;
pub var _this: [*c]SDL_EVDEV_PrivateData = null;
pub var EVDEV_MouseButtons: [8]Uint8 = [8]Uint8{
    SDL_BUTTON_LEFT,
    SDL_BUTTON_RIGHT,
    SDL_BUTTON_MIDDLE,
    SDL_BUTTON_X1,
    SDL_BUTTON_X2,
    @bitCast(@as(i8, @truncate(SDL_BUTTON_X2 + @as(c_int, 1)))),
    @bitCast(@as(i8, @truncate(SDL_BUTTON_X2 + @as(c_int, 2)))),
    @bitCast(@as(i8, @truncate(SDL_BUTTON_X2 + @as(c_int, 3)))),
};
pub fn SDL_EVDEV_SetRelativeMouseMode(_: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_EVDEV_UpdateKeyboardMute() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_EVDEV_GetDeviceCount(SDL_UDEV_DEVICE_KEYBOARD) > @as(c_int, 0)) {
        SDL_EVDEV_kbd_set_muted(_this.*.kbd, @"true" != 0);
    } else {
        SDL_EVDEV_kbd_set_muted(_this.*.kbd, @"false" != 0);
    }
}
pub fn SDL_EVDEV_udev_callback(udev_event: SDL_UDEV_deviceevent, udev_class: c_int, dev_path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(dev_path != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (udev_event) {
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEADDED) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEREMOVED) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            4 => {
                {}
            },
            5 => {
                if (!((udev_class & (((SDL_UDEV_DEVICE_MOUSE | SDL_UDEV_DEVICE_HAS_KEYS) | SDL_UDEV_DEVICE_TOUCHSCREEN) | SDL_UDEV_DEVICE_TOUCHPAD)) != 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if ((udev_class & SDL_UDEV_DEVICE_JOYSTICK) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                return;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                _ = SDL_EVDEV_device_added(dev_path, udev_class);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                _ = SDL_EVDEV_device_removed(dev_path);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_EVDEV_translate_keycode(keycode: c_int) callconv(.c) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var scancode: SDL_Scancode = SDL_GetScancodeFromTable(SDL_SCANCODE_TABLE_LINUX, keycode);
    _ = &scancode;
    return scancode;
}
pub fn SDL_EVDEV_init_keyboard(item: [*c]SDL_evdevlist_item, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var name: [128]u8 = undefined;
    _ = &name;
    name[@as(c_int, 0)] = '\x00';
    _ = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(name)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&name))));
    SDL_AddKeyboard(@bitCast(@as(c_int, item.*.fd)), @ptrCast(@alignCast(&name)));
    return @"true" != 0;
}
pub fn SDL_EVDEV_destroy_keyboard(item: [*c]SDL_evdevlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveKeyboard(@bitCast(@as(c_int, item.*.fd)));
}
pub fn SDL_EVDEV_init_mouse(item: [*c]SDL_evdevlist_item, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var name: [128]u8 = undefined;
    _ = &name;
    var ret: c_int = undefined;
    _ = &ret;
    var abs_info: struct_input_absinfo = undefined;
    _ = &abs_info;
    name[@as(c_int, 0)] = '\x00';
    _ = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(name)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&name))));
    SDL_AddMouse(@bitCast(@as(c_int, item.*.fd)), @ptrCast(@alignCast(&name)));
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_X) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_info);
    if (ret < @as(c_int, 0)) {
        return @"true" != 0;
    }
    item.*.min_x = abs_info.minimum;
    item.*.max_x = abs_info.maximum;
    item.*.range_x = abs_info.maximum - abs_info.minimum;
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_Y) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_info);
    if (ret < @as(c_int, 0)) {
        return @"true" != 0;
    }
    item.*.min_y = abs_info.minimum;
    item.*.max_y = abs_info.maximum;
    item.*.range_y = abs_info.maximum - abs_info.minimum;
    return @"true" != 0;
}
pub fn SDL_EVDEV_destroy_mouse(item: [*c]SDL_evdevlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveMouse(@bitCast(@as(c_int, item.*.fd)));
}
pub fn SDL_EVDEV_init_touchscreen(item: [*c]SDL_evdevlist_item, udev_class: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ret: c_int = undefined;
    _ = &ret;
    var xreq: c_ulong = undefined;
    _ = &xreq;
    var yreq: c_ulong = undefined;
    _ = &yreq;
    var name: [64]u8 = undefined;
    _ = &name;
    var abs_info: struct_input_absinfo = undefined;
    _ = &abs_info;
    if (!item.*.is_touchscreen) {
        return @"true" != 0;
    }
    item.*.touchscreen_data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(item.*.touchscreen_data.*)))));
    if (!(item.*.touchscreen_data != null)) {
        return @"false" != 0;
    }
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(name)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&name))));
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Failed to get evdev touchscreen name");
        return @"false" != 0;
    }
    item.*.touchscreen_data.*.name = SDL_strdup_REAL(@ptrCast(@alignCast(&name)));
    if (!(item.*.touchscreen_data.*.name != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        return @"false" != 0;
    }
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_MT_SLOT) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_info);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Failed to get evdev touchscreen limits");
        return @"false" != 0;
    }
    if (abs_info.maximum == @as(c_int, 0)) {
        item.*.touchscreen_data.*.max_slots = 1;
        xreq = @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_X) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))));
        yreq = @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_Y) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))));
    } else {
        item.*.touchscreen_data.*.max_slots = abs_info.maximum + @as(c_int, 1);
        xreq = @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_MT_POSITION_X) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))));
        yreq = @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_MT_POSITION_Y) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS)))));
    }
    ret = ioctl(item.*.fd, xreq, &abs_info);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Failed to get evdev touchscreen limits");
        return @"false" != 0;
    }
    item.*.touchscreen_data.*.min_x = abs_info.minimum;
    item.*.touchscreen_data.*.max_x = abs_info.maximum;
    item.*.touchscreen_data.*.range_x = abs_info.maximum - abs_info.minimum;
    ret = ioctl(item.*.fd, yreq, &abs_info);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Failed to get evdev touchscreen limits");
        return @"false" != 0;
    }
    item.*.touchscreen_data.*.min_y = abs_info.minimum;
    item.*.touchscreen_data.*.max_y = abs_info.maximum;
    item.*.touchscreen_data.*.range_y = abs_info.maximum - abs_info.minimum;
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_MT_PRESSURE) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_info);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Failed to get evdev touchscreen limits");
        return @"false" != 0;
    }
    item.*.touchscreen_data.*.min_pressure = abs_info.minimum;
    item.*.touchscreen_data.*.max_pressure = abs_info.maximum;
    item.*.touchscreen_data.*.range_pressure = abs_info.maximum - abs_info.minimum;
    item.*.touchscreen_data.*.slots = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, item.*.touchscreen_data.*.max_slots)), @sizeOf(@TypeOf(item.*.touchscreen_data.*.slots.*)))));
    if (!(item.*.touchscreen_data.*.slots != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        return @"false" != 0;
    }
    ret = SDL_AddTouch(@bitCast(@as(c_long, item.*.fd)), if ((udev_class & SDL_UDEV_DEVICE_TOUCHPAD) != 0) SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE else SDL_TOUCH_DEVICE_DIRECT, item.*.touchscreen_data.*.name);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.slots)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
        SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_EVDEV_destroy_touchscreen(item: [*c]SDL_evdevlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!item.*.is_touchscreen) {
        return;
    }
    SDL_DelTouch(@bitCast(@as(c_long, item.*.fd)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.slots)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.touchscreen_data)));
}
pub fn SDL_EVDEV_sync_device(item: [*c]SDL_evdevlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var ret: c_int = undefined;
    _ = &ret;
    var abs_info: struct_input_absinfo = undefined;
    _ = &abs_info;
    var mt_req_code: [*c]Uint32 = undefined;
    _ = &mt_req_code;
    var mt_req_values: [*c]Sint32 = undefined;
    _ = &mt_req_values;
    var mt_req_size: usize = undefined;
    _ = &mt_req_size;
    if (!item.*.is_touchscreen) {
        return;
    }
    mt_req_size = @sizeOf(@TypeOf(mt_req_code.*)) +% (@sizeOf(@TypeOf(mt_req_values.*)) *% @as(c_ulong, @bitCast(@as(c_long, item.*.touchscreen_data.*.max_slots))));
    mt_req_code = @ptrCast(@alignCast(SDL_calloc_REAL(1, mt_req_size)));
    if (!(mt_req_code != null)) {
        return;
    }
    mt_req_values = @as([*c]Sint32, @ptrCast(@alignCast(mt_req_code))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    mt_req_code.* = ABS_MT_TRACKING_ID;
    ret = ioctl(item.*.fd, @as(usize, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10) << @intCast(_IOC_NRSHIFT))))) | (mt_req_size << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), mt_req_code);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
        return;
    }
    {
        i = 0;
        while (i < item.*.touchscreen_data.*.max_slots) : (i += 1) {
            if ((item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id == @as(c_int, 0)) and (mt_req_values[@bitCast(@as(isize, @intCast(i)))] >= @as(c_int, 0))) {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id = mt_req_values[@bitCast(@as(isize, @intCast(i)))] + @as(c_int, 1);
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta = EVDEV_TOUCH_SLOTDELTA_DOWN;
            } else if ((item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id != @as(c_int, 0)) and (mt_req_values[@bitCast(@as(isize, @intCast(i)))] < @as(c_int, 0))) {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id = 0;
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta = EVDEV_TOUCH_SLOTDELTA_UP;
            }
        }
    }
    mt_req_code.* = ABS_MT_POSITION_X;
    ret = ioctl(item.*.fd, @as(usize, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10) << @intCast(_IOC_NRSHIFT))))) | (mt_req_size << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), mt_req_code);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
        return;
    }
    {
        i = 0;
        while (i < item.*.touchscreen_data.*.max_slots) : (i += 1) {
            if ((item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id != @as(c_int, 0)) and (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].x != mt_req_values[@bitCast(@as(isize, @intCast(i)))])) {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].x = mt_req_values[@bitCast(@as(isize, @intCast(i)))];
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                }
            }
        }
    }
    mt_req_code.* = ABS_MT_POSITION_Y;
    ret = ioctl(item.*.fd, @as(usize, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10) << @intCast(_IOC_NRSHIFT))))) | (mt_req_size << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), mt_req_code);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
        return;
    }
    {
        i = 0;
        while (i < item.*.touchscreen_data.*.max_slots) : (i += 1) {
            if ((item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id != @as(c_int, 0)) and (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].y != mt_req_values[@bitCast(@as(isize, @intCast(i)))])) {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].y = mt_req_values[@bitCast(@as(isize, @intCast(i)))];
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                }
            }
        }
    }
    mt_req_code.* = ABS_MT_PRESSURE;
    ret = ioctl(item.*.fd, @as(usize, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 10) << @intCast(_IOC_NRSHIFT))))) | (mt_req_size << @intCast(@as(usize, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), mt_req_code);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
        return;
    }
    {
        i = 0;
        while (i < item.*.touchscreen_data.*.max_slots) : (i += 1) {
            if ((item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].tracking_id != @as(c_int, 0)) and (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].pressure != mt_req_values[@bitCast(@as(isize, @intCast(i)))])) {
                item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].pressure = mt_req_values[@bitCast(@as(isize, @intCast(i)))];
                if (item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta == @as(enum_unnamed_25, EVDEV_TOUCH_SLOTDELTA_NONE)) {
                    item.*.touchscreen_data.*.slots[@bitCast(@as(isize, @intCast(i)))].delta = EVDEV_TOUCH_SLOTDELTA_MOVE;
                }
            }
        }
    }
    ret = ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + ABS_MT_SLOT) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_info);
    if (ret < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
        return;
    }
    item.*.touchscreen_data.*.current_slot = abs_info.value;
    SDL_free_REAL(@ptrCast(@alignCast(mt_req_code)));
}
pub fn SDL_EVDEV_device_added(dev_path: [*c]const u8, udev_class: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_evdevlist_item = undefined;
    _ = &item;
    var relbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &relbit;
    {
        item = _this.*.first;
        while (item != null) : (item = item.*.next) {
            if (SDL_strcmp_REAL(dev_path, item.*.path) == @as(c_int, 0)) {
                return @"false" != 0;
            }
        }
    }
    item = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_evdevlist_item))));
    if (!(item != null)) {
        return @"false" != 0;
    }
    item.*.fd = open(dev_path, (O_RDONLY | O_NONBLOCK) | __O_CLOEXEC);
    if (item.*.fd < @as(c_int, 0)) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "Couldn't open %s: %s", dev_path, strerror(__errno_location().*));
        SDL_free_REAL(@ptrCast(@alignCast(item)));
        return @"false" != 0;
    }
    item.*.path = SDL_strdup_REAL(dev_path);
    if (!(item.*.path != null)) {
        _ = close(item.*.fd);
        SDL_free_REAL(@ptrCast(@alignCast(item)));
        return @"false" != 0;
    }
    item.*.udev_class = udev_class;
    if (ioctl(item.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_REL) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(relbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&relbit)))) >= @as(c_int, 0)) {
        item.*.relative_mouse = (((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0);
        item.*.high_res_wheel = ((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_WHEEL_HI_RES))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_WHEEL_HI_RES))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0;
        item.*.high_res_hwheel = ((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_HWHEEL_HI_RES))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_HWHEEL_HI_RES))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0;
    }
    if ((udev_class & (SDL_UDEV_DEVICE_TOUCHSCREEN | SDL_UDEV_DEVICE_TOUCHPAD)) != 0) {
        item.*.is_touchscreen = @"true" != 0;
        if (!SDL_EVDEV_init_touchscreen(item, udev_class)) {
            _ = close(item.*.fd);
            SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
            SDL_free_REAL(@ptrCast(@alignCast(item)));
            return @"false" != 0;
        }
    }
    if ((udev_class & SDL_UDEV_DEVICE_MOUSE) != 0) {
        if (!SDL_EVDEV_init_mouse(item, udev_class)) {
            _ = close(item.*.fd);
            SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
            SDL_free_REAL(@ptrCast(@alignCast(item)));
            return @"false" != 0;
        }
    }
    if ((udev_class & SDL_UDEV_DEVICE_KEYBOARD) != 0) {
        if (!SDL_EVDEV_init_keyboard(item, udev_class)) {
            _ = close(item.*.fd);
            SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
            SDL_free_REAL(@ptrCast(@alignCast(item)));
            return @"false" != 0;
        }
    }
    if (!(_this.*.last != null)) {
        _this.*.first = blk: {
            const tmp = item;
            _this.*.last = tmp;
            break :blk tmp;
        };
    } else {
        _this.*.last.*.next = item;
        _this.*.last = item;
    }
    SDL_EVDEV_sync_device(item);
    SDL_EVDEV_UpdateKeyboardMute();
    _this.*.num_devices += 1;
    return @"true" != 0;
}
pub fn SDL_EVDEV_device_removed(dev_path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_EVDEV_device_removed".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_evdevlist_item = undefined;
    _ = &item;
    var prev: [*c]SDL_evdevlist_item = null;
    _ = &prev;
    {
        item = _this.*.first;
        while (item != null) : (item = item.*.next) {
            if (SDL_strcmp_REAL(dev_path, item.*.path) == @as(c_int, 0)) {
                if (prev != null) {
                    prev.*.next = item.*.next;
                } else {
                    while (true) {
                        while (!(_this.*.first == item)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "_this->first == item",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_evdev.c", 996);
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
                    _this.*.first = item.*.next;
                }
                if (item == _this.*.last) {
                    _this.*.last = prev;
                }
                if (item.*.is_touchscreen) {
                    SDL_EVDEV_destroy_touchscreen(item);
                }
                if ((item.*.udev_class & SDL_UDEV_DEVICE_MOUSE) != 0) {
                    SDL_EVDEV_destroy_mouse(item);
                }
                if ((item.*.udev_class & SDL_UDEV_DEVICE_KEYBOARD) != 0) {
                    SDL_EVDEV_destroy_keyboard(item);
                }
                _ = close(item.*.fd);
                SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
                SDL_free_REAL(@ptrCast(@alignCast(item)));
                SDL_EVDEV_UpdateKeyboardMute();
                _this.*.num_devices -= 1;
                return @"true" != 0;
            }
            prev = item;
        }
    }
    return @"false" != 0;
}
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_READ = @as(c_uint, 2);
pub const EV_SYN = @as(c_int, 0x00);
pub const EV_KEY = @as(c_int, 0x01);
pub const EV_REL = @as(c_int, 0x02);
pub const EV_ABS = @as(c_int, 0x03);
pub const SYN_REPORT = @as(c_int, 0);
pub const SYN_DROPPED = @as(c_int, 3);
pub const BTN_MOUSE = @as(c_int, 0x110);
pub const BTN_TOUCH = @as(c_int, 0x14a);
pub const REL_X = @as(c_int, 0x00);
pub const REL_Y = @as(c_int, 0x01);
pub const REL_HWHEEL = @as(c_int, 0x06);
pub const REL_WHEEL = @as(c_int, 0x08);
pub const REL_WHEEL_HI_RES = @as(c_int, 0x0b);
pub const REL_HWHEEL_HI_RES = @as(c_int, 0x0c);
pub const ABS_X = @as(c_int, 0x00);
pub const ABS_Y = @as(c_int, 0x01);
pub const ABS_MT_SLOT = @as(c_int, 0x2f);
pub const ABS_MT_POSITION_X = @as(c_int, 0x35);
pub const ABS_MT_POSITION_Y = @as(c_int, 0x36);
pub const ABS_MT_TRACKING_ID = @as(c_int, 0x39);
pub const ABS_MT_PRESSURE = @as(c_int, 0x3a);
