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
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_AudioDeviceID = Uint32;
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
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
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
pub const SDL_CameraID = Uint32;
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
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_WindowData = opaque {};
pub const SDL_WindowData = struct_SDL_WindowData;
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
pub extern fn SDL_GetWindowFromID_REAL(id: SDL_WindowID) [*c]SDL_Window;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_QUIT: c_int = 256;
pub const SDL_EVENT_TERMINATING: c_int = 257;
pub const SDL_EVENT_LOW_MEMORY: c_int = 258;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND: c_int = 259;
pub const SDL_EVENT_DID_ENTER_BACKGROUND: c_int = 260;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND: c_int = 261;
pub const SDL_EVENT_DID_ENTER_FOREGROUND: c_int = 262;
pub const SDL_EVENT_LOCALE_CHANGED: c_int = 263;
pub const SDL_EVENT_SYSTEM_THEME_CHANGED: c_int = 264;
pub const SDL_EVENT_DISPLAY_FIRST: c_int = 337;
pub const SDL_EVENT_DISPLAY_LAST: c_int = 344;
pub const SDL_EVENT_WINDOW_FIRST: c_int = 514;
pub const SDL_EVENT_WINDOW_LAST: c_int = 539;
pub const SDL_EVENT_KEY_DOWN: c_int = 768;
pub const SDL_EVENT_KEY_UP: c_int = 769;
pub const SDL_EVENT_TEXT_EDITING: c_int = 770;
pub const SDL_EVENT_TEXT_INPUT: c_int = 771;
pub const SDL_EVENT_KEYMAP_CHANGED: c_int = 772;
pub const SDL_EVENT_KEYBOARD_ADDED: c_int = 773;
pub const SDL_EVENT_KEYBOARD_REMOVED: c_int = 774;
pub const SDL_EVENT_TEXT_EDITING_CANDIDATES: c_int = 775;
pub const SDL_EVENT_MOUSE_MOTION: c_int = 1024;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN: c_int = 1025;
pub const SDL_EVENT_MOUSE_BUTTON_UP: c_int = 1026;
pub const SDL_EVENT_MOUSE_WHEEL: c_int = 1027;
pub const SDL_EVENT_MOUSE_ADDED: c_int = 1028;
pub const SDL_EVENT_MOUSE_REMOVED: c_int = 1029;
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION: c_int = 1536;
pub const SDL_EVENT_JOYSTICK_BALL_MOTION: c_int = 1537;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION: c_int = 1538;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN: c_int = 1539;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP: c_int = 1540;
pub const SDL_EVENT_JOYSTICK_ADDED: c_int = 1541;
pub const SDL_EVENT_JOYSTICK_REMOVED: c_int = 1542;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED: c_int = 1543;
pub const SDL_EVENT_JOYSTICK_UPDATE_COMPLETE: c_int = 1544;
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION: c_int = 1616;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN: c_int = 1617;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP: c_int = 1618;
pub const SDL_EVENT_GAMEPAD_ADDED: c_int = 1619;
pub const SDL_EVENT_GAMEPAD_REMOVED: c_int = 1620;
pub const SDL_EVENT_GAMEPAD_REMAPPED: c_int = 1621;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN: c_int = 1622;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION: c_int = 1623;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP: c_int = 1624;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE: c_int = 1625;
pub const SDL_EVENT_GAMEPAD_UPDATE_COMPLETE: c_int = 1626;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED: c_int = 1627;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH: c_int = 1628;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE: c_int = 1629;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_FINGER_MOTION: c_int = 1794;
pub const SDL_EVENT_FINGER_CANCELED: c_int = 1795;
pub const SDL_EVENT_PINCH_BEGIN: c_int = 1808;
pub const SDL_EVENT_PINCH_UPDATE: c_int = 1809;
pub const SDL_EVENT_PINCH_END: c_int = 1810;
pub const SDL_EVENT_CLIPBOARD_UPDATE: c_int = 2304;
pub const SDL_EVENT_DROP_FILE: c_int = 4096;
pub const SDL_EVENT_DROP_TEXT: c_int = 4097;
pub const SDL_EVENT_DROP_BEGIN: c_int = 4098;
pub const SDL_EVENT_DROP_COMPLETE: c_int = 4099;
pub const SDL_EVENT_DROP_POSITION: c_int = 4100;
pub const SDL_EVENT_AUDIO_DEVICE_ADDED: c_int = 4352;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED: c_int = 4353;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED: c_int = 4354;
pub const SDL_EVENT_SENSOR_UPDATE: c_int = 4608;
pub const SDL_EVENT_PEN_PROXIMITY_IN: c_int = 4864;
pub const SDL_EVENT_PEN_PROXIMITY_OUT: c_int = 4865;
pub const SDL_EVENT_PEN_DOWN: c_int = 4866;
pub const SDL_EVENT_PEN_UP: c_int = 4867;
pub const SDL_EVENT_PEN_BUTTON_DOWN: c_int = 4868;
pub const SDL_EVENT_PEN_BUTTON_UP: c_int = 4869;
pub const SDL_EVENT_PEN_MOTION: c_int = 4870;
pub const SDL_EVENT_PEN_AXIS: c_int = 4871;
pub const SDL_EVENT_CAMERA_DEVICE_ADDED: c_int = 5120;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED: c_int = 5121;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED: c_int = 5122;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED: c_int = 5123;
pub const SDL_EVENT_NOTIFICATION_ACTION_INVOKED: c_int = 5376;
pub const SDL_EVENT_RENDER_TARGETS_RESET: c_int = 8192;
pub const SDL_EVENT_RENDER_DEVICE_RESET: c_int = 8193;
pub const SDL_EVENT_RENDER_DEVICE_LOST: c_int = 8194;
pub const SDL_EVENT_USER: c_int = 32768;
pub const SDL_EVENT_LAST: c_int = 65535;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub const SDL_EVENTCATEGORY_UNKNOWN: c_int = 0;
pub const SDL_EVENTCATEGORY_SYSTEM: c_int = 1;
pub const SDL_EVENTCATEGORY_DISPLAY: c_int = 2;
pub const SDL_EVENTCATEGORY_WINDOW: c_int = 3;
pub const SDL_EVENTCATEGORY_KDEVICE: c_int = 4;
pub const SDL_EVENTCATEGORY_KEY: c_int = 5;
pub const SDL_EVENTCATEGORY_EDIT: c_int = 6;
pub const SDL_EVENTCATEGORY_EDIT_CANDIDATES: c_int = 7;
pub const SDL_EVENTCATEGORY_TEXT: c_int = 8;
pub const SDL_EVENTCATEGORY_MDEVICE: c_int = 9;
pub const SDL_EVENTCATEGORY_MOTION: c_int = 10;
pub const SDL_EVENTCATEGORY_BUTTON: c_int = 11;
pub const SDL_EVENTCATEGORY_WHEEL: c_int = 12;
pub const SDL_EVENTCATEGORY_JDEVICE: c_int = 13;
pub const SDL_EVENTCATEGORY_JAXIS: c_int = 14;
pub const SDL_EVENTCATEGORY_JBALL: c_int = 15;
pub const SDL_EVENTCATEGORY_JHAT: c_int = 16;
pub const SDL_EVENTCATEGORY_JBUTTON: c_int = 17;
pub const SDL_EVENTCATEGORY_JBATTERY: c_int = 18;
pub const SDL_EVENTCATEGORY_GDEVICE: c_int = 19;
pub const SDL_EVENTCATEGORY_GAXIS: c_int = 20;
pub const SDL_EVENTCATEGORY_GBUTTON: c_int = 21;
pub const SDL_EVENTCATEGORY_GTOUCHPAD: c_int = 22;
pub const SDL_EVENTCATEGORY_GSENSOR: c_int = 23;
pub const SDL_EVENTCATEGORY_GCAPSENSE: c_int = 24;
pub const SDL_EVENTCATEGORY_ADEVICE: c_int = 25;
pub const SDL_EVENTCATEGORY_CDEVICE: c_int = 26;
pub const SDL_EVENTCATEGORY_SENSOR: c_int = 27;
pub const SDL_EVENTCATEGORY_QUIT: c_int = 28;
pub const SDL_EVENTCATEGORY_USER: c_int = 29;
pub const SDL_EVENTCATEGORY_TFINGER: c_int = 30;
pub const SDL_EVENTCATEGORY_PPROXIMITY: c_int = 31;
pub const SDL_EVENTCATEGORY_PTOUCH: c_int = 32;
pub const SDL_EVENTCATEGORY_PMOTION: c_int = 33;
pub const SDL_EVENTCATEGORY_PBUTTON: c_int = 34;
pub const SDL_EVENTCATEGORY_PAXIS: c_int = 35;
pub const SDL_EVENTCATEGORY_DROP: c_int = 36;
pub const SDL_EVENTCATEGORY_CLIPBOARD: c_int = 37;
pub const SDL_EVENTCATEGORY_RENDER: c_int = 38;
pub const SDL_EVENTCATEGORY_NOTIFICATION: c_int = 39;
pub const SDL_EVENTCATEGORY_PINCH: c_int = 40;
pub const enum_SDL_EventCategory = c_uint;
pub const SDL_EventCategory = enum_SDL_EventCategory;
pub export fn SDL_GetEventCategory(arg_type: Uint32) SDL_EventCategory {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@"type" >= @as(Uint32, SDL_EVENT_USER)) and (@"type" <= @as(Uint32, SDL_EVENT_LAST))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_EVENTCATEGORY_USER;
            },
            2 => {
                if ((@"type" >= @as(Uint32, SDL_EVENT_DISPLAY_FIRST)) and (@"type" <= @as(Uint32, SDL_EVENT_DISPLAY_LAST))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                switch (@"type") {
                    @as(Uint32, SDL_EVENT_KEYMAP_CHANGED) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TERMINATING) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_LOW_MEMORY) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WILL_ENTER_BACKGROUND) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DID_ENTER_BACKGROUND) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WILL_ENTER_FOREGROUND) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DID_ENTER_FOREGROUND) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_LOCALE_CHANGED) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SYSTEM_THEME_CHANGED) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_TARGETS_RESET) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_DEVICE_RESET) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_DEVICE_LOST) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_QUIT) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEY_DOWN) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEY_UP) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_EDITING) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_INPUT) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEYBOARD_ADDED) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEYBOARD_REMOVED) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_EDITING_CANDIDATES) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_MOTION) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_BUTTON_DOWN) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_BUTTON_UP) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_WHEEL) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_ADDED) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_REMOVED) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_AXIS_MOTION) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BALL_MOTION) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_HAT_MOTION) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_DOWN) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_UP) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_ADDED) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_REMOVED) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_UPDATE_COMPLETE) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BATTERY_UPDATED) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_AXIS_MOTION) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_DOWN) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_UP) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_ADDED) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_REMOVED) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_REMAPPED) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_UP) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_SENSOR_UPDATE) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_DOWN) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_UP) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_CANCELED) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_MOTION) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_BEGIN) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_UPDATE) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_END) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CLIPBOARD_UPDATE) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_FILE) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_TEXT) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_BEGIN) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_COMPLETE) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_POSITION) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_ADDED) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_REMOVED) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SENSOR_UPDATE) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_PROXIMITY_IN) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_PROXIMITY_OUT) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_DOWN) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_UP) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_BUTTON_DOWN) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_BUTTON_UP) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_MOTION) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_AXIS) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_ADDED) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_REMOVED) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_APPROVED) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_DENIED) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_NOTIFICATION_ACTION_INVOKED) => {
                        sdl_pc = 90;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            4 => {
                return SDL_EVENTCATEGORY_DISPLAY;
            },
            5 => {
                if ((@"type" >= @as(Uint32, SDL_EVENT_WINDOW_FIRST)) and (@"type" <= @as(Uint32, SDL_EVENT_WINDOW_LAST))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                return SDL_EVENTCATEGORY_WINDOW;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                return undefined;
            },
            11 => {
                _ = SDL_SetError_REAL("Unknown event type");
                return SDL_EVENTCATEGORY_UNKNOWN;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
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
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                return SDL_EVENTCATEGORY_SYSTEM;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                return SDL_EVENTCATEGORY_RENDER;
            },
            24 => {
                return SDL_EVENTCATEGORY_QUIT;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                return SDL_EVENTCATEGORY_KEY;
            },
            27 => {
                return SDL_EVENTCATEGORY_EDIT;
            },
            28 => {
                return SDL_EVENTCATEGORY_TEXT;
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                return SDL_EVENTCATEGORY_KDEVICE;
            },
            31 => {
                return SDL_EVENTCATEGORY_EDIT_CANDIDATES;
            },
            32 => {
                return SDL_EVENTCATEGORY_MOTION;
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                return SDL_EVENTCATEGORY_BUTTON;
            },
            35 => {
                return SDL_EVENTCATEGORY_WHEEL;
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                return SDL_EVENTCATEGORY_MDEVICE;
            },
            38 => {
                return SDL_EVENTCATEGORY_JAXIS;
            },
            39 => {
                return SDL_EVENTCATEGORY_JBALL;
            },
            40 => {
                return SDL_EVENTCATEGORY_JHAT;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                return SDL_EVENTCATEGORY_JBUTTON;
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                return SDL_EVENTCATEGORY_JDEVICE;
            },
            46 => {
                return SDL_EVENTCATEGORY_JBATTERY;
            },
            47 => {
                return SDL_EVENTCATEGORY_GAXIS;
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                return SDL_EVENTCATEGORY_GBUTTON;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
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
                return SDL_EVENTCATEGORY_GDEVICE;
            },
            55 => {
                {
                    sdl_pc = 56;
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
                return SDL_EVENTCATEGORY_GTOUCHPAD;
            },
            58 => {
                return SDL_EVENTCATEGORY_GSENSOR;
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                return SDL_EVENTCATEGORY_GCAPSENSE;
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
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
                return SDL_EVENTCATEGORY_TFINGER;
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                return SDL_EVENTCATEGORY_PINCH;
            },
            68 => {
                return SDL_EVENTCATEGORY_CLIPBOARD;
            },
            69 => {
                {
                    sdl_pc = 70;
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
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                return SDL_EVENTCATEGORY_DROP;
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                return SDL_EVENTCATEGORY_ADEVICE;
            },
            77 => {
                return SDL_EVENTCATEGORY_SENSOR;
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                return SDL_EVENTCATEGORY_PPROXIMITY;
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                return SDL_EVENTCATEGORY_PTOUCH;
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                return SDL_EVENTCATEGORY_PBUTTON;
            },
            84 => {
                return SDL_EVENTCATEGORY_PMOTION;
            },
            85 => {
                return SDL_EVENTCATEGORY_PAXIS;
            },
            86 => {
                {
                    sdl_pc = 87;
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
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                return SDL_EVENTCATEGORY_CDEVICE;
            },
            90 => {
                return SDL_EVENTCATEGORY_NOTIFICATION;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetWindowFromEvent_REAL(event: [*c]const SDL_Event) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var windowID: SDL_WindowID = undefined;
    _ = &windowID;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (SDL_GetEventCategory(event.*.type)) {
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_USER) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_WINDOW) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_KEY) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_EDIT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_TEXT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_EDIT_CANDIDATES) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_MOTION) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_BUTTON) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_WHEEL) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_TFINGER) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PPROXIMITY) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PTOUCH) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PBUTTON) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PMOTION) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PAXIS) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_DROP) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_RENDER) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_EventCategory, SDL_EVENTCATEGORY_PINCH) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            1 => {
                return SDL_GetWindowFromID_REAL(windowID);
            },
            2 => {
                windowID = event.*.user.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                windowID = event.*.window.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                windowID = event.*.key.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                windowID = event.*.edit.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                windowID = event.*.text.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                windowID = event.*.edit_candidates.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                windowID = event.*.motion.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                windowID = event.*.button.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                windowID = event.*.wheel.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                windowID = event.*.tfinger.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                windowID = event.*.pproximity.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                windowID = event.*.ptouch.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                windowID = event.*.pbutton.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                windowID = event.*.pmotion.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                windowID = event.*.paxis.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                windowID = event.*.drop.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                windowID = event.*.render.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                windowID = event.*.pinch.windowID;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            20 => {
                return null;
            },
            else => unreachable,
        }
    }
}

pub const SDL_GetWindowFromEvent = SDL_GetWindowFromEvent_REAL;
