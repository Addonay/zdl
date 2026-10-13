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
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const __time_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const pid_t = __pid_t;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_utf8strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_utf8strnlen_REAL(str: [*c]const u8, bytes: usize) usize;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
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
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_DisplayModeData = extern struct {
    xrandr_mode: RRMode = 0,
};
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
    internal: [*c]SDL_DisplayModeData = null,
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
    internal: [*c]SDL_WindowData = null,
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
pub extern fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID;
pub extern fn SDL_GetWindowPosition_REAL(window: [*c]SDL_Window, x: [*c]c_int, y: [*c]c_int) bool;
pub extern fn SDL_GetWindowSize_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
const struct_unnamed_10 = extern struct {
    type: BYTE = 0,
    detail: BYTE = 0,
    sequenceNumber: CARD16 = 0,
};
const struct_unnamed_12 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    root: CARD32 = 0,
    event: CARD32 = 0,
    child: CARD32 = 0,
    rootX: INT16 = 0,
    rootY: INT16 = 0,
    eventX: INT16 = 0,
    eventY: INT16 = 0,
    state: KeyButMask = 0,
    mode: BYTE = 0,
    flags: BYTE = 0,
};
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keymod = Uint16;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
pub extern fn SDL_GetModState_REAL() SDL_Keymod;
const struct_unnamed_13 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    mode: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const union__XEvent = extern union {
    type: c_int,
    xany: XAnyEvent,
    xkey: XKeyEvent,
    xbutton: XButtonEvent,
    xmotion: XMotionEvent,
    xcrossing: XCrossingEvent,
    xfocus: XFocusChangeEvent,
    xexpose: XExposeEvent,
    xgraphicsexpose: XGraphicsExposeEvent,
    xnoexpose: XNoExposeEvent,
    xvisibility: XVisibilityEvent,
    xcreatewindow: XCreateWindowEvent,
    xdestroywindow: XDestroyWindowEvent,
    xunmap: XUnmapEvent,
    xmap: XMapEvent,
    xmaprequest: XMapRequestEvent,
    xreparent: XReparentEvent,
    xconfigure: XConfigureEvent,
    xgravity: XGravityEvent,
    xresizerequest: XResizeRequestEvent,
    xconfigurerequest: XConfigureRequestEvent,
    xcirculate: XCirculateEvent,
    xcirculaterequest: XCirculateRequestEvent,
    xproperty: XPropertyEvent,
    xselectionclear: XSelectionClearEvent,
    xselectionrequest: XSelectionRequestEvent,
    xselection: XSelectionEvent,
    xcolormap: XColormapEvent,
    xclient: XClientMessageEvent,
    xmapping: XMappingEvent,
    xerror: XErrorEvent,
    xkeymap: XKeymapEvent,
    xgeneric: XGenericEvent,
    xcookie: XGenericEventCookie,
    pad: [24]c_long,
};
pub const XEvent = union__XEvent;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn SDL_GetExeName() [*c]const u8;
pub export fn SDL_Fcitx_Init() bool {
    @setEvalBranchQuota(100000);
    fcitx_client.dbus = SDL_DBus_GetContext();
    fcitx_client.cursor_rect.x = -@as(c_int, 1);
    fcitx_client.cursor_rect.y = -@as(c_int, 1);
    fcitx_client.cursor_rect.w = 0;
    fcitx_client.cursor_rect.h = 0;
    return FcitxClientCreateIC(&fcitx_client);
}
pub export fn SDL_Fcitx_Quit() void {
    @setEvalBranchQuota(100000);
    FcitxClientICCallMethod(&fcitx_client, "DestroyIC");
    if (fcitx_client.ic_path != null) {
        SDL_free_REAL(@ptrCast(@alignCast(fcitx_client.ic_path)));
        fcitx_client.ic_path = null;
    }
}
pub export fn SDL_Fcitx_SetFocus(focused: bool) void {
    @setEvalBranchQuota(100000);
    if (focused) {
        FcitxClientICCallMethod(&fcitx_client, "FocusIn");
    } else {
        FcitxClientICCallMethod(&fcitx_client, "FocusOut");
    }
}
pub export fn SDL_Fcitx_Reset() void {
    @setEvalBranchQuota(100000);
    FcitxClientICCallMethod(&fcitx_client, "Reset");
}
pub export fn SDL_Fcitx_ProcessKeyEvent(arg_keysym: Uint32, arg_keycode: Uint32, down: bool) bool {
    @setEvalBranchQuota(100000);
    var keysym = arg_keysym;
    _ = &keysym;
    var keycode = arg_keycode;
    _ = &keycode;
    var mod_state: Uint32 = Fcitx_ModState();
    _ = &mod_state;
    var handled: Uint32 = @"false";
    _ = &handled;
    var is_release: Uint32 = @bitCast(@as(c_int, @intFromBool(!down)));
    _ = &is_release;
    var event_time: Uint32 = 0;
    _ = &event_time;
    if (!(fcitx_client.ic_path != null)) {
        return @"false" != 0;
    }
    if (SDL_DBus_CallMethod(null, "org.freedesktop.portal.Fcitx", fcitx_client.ic_path, "org.fcitx.Fcitx.InputContext1", "ProcessKeyEvent", @as(c_int, 'u'), &keysym, @as(c_int, 'u'), &keycode, @as(c_int, 'u'), &mod_state, @as(c_int, 'b'), &is_release, @as(c_int, 'u'), &event_time, @as(c_int, '\x00'), @as(c_int, 'b'), &handled, @as(c_int, '\x00'))) {
        if (handled != 0) {
            SDL_Fcitx_UpdateTextInputArea(SDL_GetKeyboardFocus_REAL());
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_Fcitx_UpdateTextInputArea(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var x: c_int = 0;
    _ = &x;
    var y: c_int = 0;
    _ = &y;
    var cursor: [*c]SDL_Rect = &fcitx_client.cursor_rect;
    _ = &cursor;
    if (!(window != null)) {
        return;
    }
    cursor.*.x = window.*.text_input_rect.x + window.*.text_input_cursor;
    cursor.*.y = window.*.text_input_rect.y;
    cursor.*.w = window.*.text_input_rect.h;
    cursor.*.h = window.*.text_input_rect.h;
    _ = SDL_GetWindowPosition_REAL(window, &x, &y);
    {
        var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
        _ = &props;
        var x_disp: [*c]Display = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.window.x11.display", null)));
        _ = &x_disp;
        var x_screen: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.window.x11.screen", 0));
        _ = &x_screen;
        var x_win: Window = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(props, "SDL.window.x11.window", 0)));
        _ = &x_win;
        var unused: Window = undefined;
        _ = &unused;
        if ((x_disp != null) and (x_win != 0)) {
            _ = X11_XTranslateCoordinates.?(x_disp, x_win, (&@as(_XPrivDisplay, @ptrCast(@alignCast(x_disp))).*.screens[@bitCast(@as(isize, @intCast(x_screen)))]).*.root, 0, 0, &x, &y, &unused);
        }
    }
    if ((((cursor.*.x == -@as(c_int, 1)) and (cursor.*.y == -@as(c_int, 1))) and (cursor.*.w == @as(c_int, 0))) and (cursor.*.h == @as(c_int, 0))) {
        var w: c_int = 0;
        _ = &w;
        var h: c_int = 0;
        _ = &h;
        _ = SDL_GetWindowSize_REAL(window, &w, &h);
        cursor.*.x = 0;
        cursor.*.y = h;
    }
    x += cursor.*.x;
    y += cursor.*.y;
    _ = SDL_DBus_CallVoidMethod("org.freedesktop.portal.Fcitx", fcitx_client.ic_path, "org.fcitx.Fcitx.InputContext1", "SetCursorRect", @as(c_int, 'i'), &x, @as(c_int, 'i'), &y, @as(c_int, 'i'), &cursor.*.w, @as(c_int, 'i'), &cursor.*.h, @as(c_int, '\x00'));
}
pub export fn SDL_Fcitx_PumpEvents() void {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = fcitx_client.dbus;
    _ = &dbus;
    var conn: ?*DBusConnection = dbus.*.session_conn;
    _ = &conn;
    _ = dbus.*.connection_read_write.?(conn, 0);
    while (dbus.*.connection_dispatch.?(conn) == @as(DBusDispatchStatus, DBUS_DISPATCH_DATA_REMAINS)) {}
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LCTRL = @as(c_uint, 0x0040);
pub const SDL_KMOD_RCTRL = @as(c_uint, 0x0080);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_LGUI = @as(c_uint, 0x0400);
pub const SDL_KMOD_RGUI = @as(c_uint, 0x0800);
pub const SDL_KMOD_NUM = @as(c_uint, 0x1000);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
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
pub const XID = c_ulong;
pub const RRMode = XID;
pub const Window = XID;
pub const Colormap = XID;
pub const XPointer = [*c]u8;
pub const struct__XExtData = extern struct {
    number: c_int = 0,
    next: [*c]struct__XExtData = null,
    free_private: ?*const fn (extension: [*c]struct__XExtData) callconv(.c) c_int = null,
    private_data: XPointer = null,
};
pub const XExtData = struct__XExtData;
pub const Display = struct__XDisplay;
pub const FreeFuncType = ?*const fn ([*c]Display) callconv(.c) void;
pub const FreeModmapType = ?*const fn ([*c]XModifierKeymap) callconv(.c) c_int;
pub const struct__XFreeFuncs = extern struct {
    atoms: FreeFuncType = null,
    modifiermap: FreeModmapType = null,
    key_bindings: FreeFuncType = null,
    context_db: FreeFuncType = null,
    defaultCCCs: FreeFuncType = null,
    clientCmaps: FreeFuncType = null,
    intensityMaps: FreeFuncType = null,
    im_filters: FreeFuncType = null,
    xkb: FreeFuncType = null,
};
pub const struct__XSQEvent = extern struct {
    next: [*c]struct__XSQEvent = null,
    event: XEvent = @import("std").mem.zeroes(XEvent),
    qserial_num: c_ulong = 0,
};
pub const struct__XrmHashBucketRec = opaque {
};
pub const KeySym = XID;
pub const GContext = XID;
pub const struct__XGC = extern struct {
    ext_data: [*c]XExtData = null,
    gid: GContext = 0,
    rects: c_int = 0,
    dashes: c_int = 0,
    dirty: c_ulong = 0,
    values: XGCValues = @import("std").mem.zeroes(XGCValues),
};
pub const GC = [*c]struct__XGC;
pub const CreateGCType = ?*const fn ([*c]Display, GC, [*c]XExtCodes) callconv(.c) c_int;
pub const CopyGCType = ?*const fn ([*c]Display, GC, [*c]XExtCodes) callconv(.c) c_int;
pub const FlushGCType = ?*const fn ([*c]Display, GC, [*c]XExtCodes) callconv(.c) c_int;
pub const FreeGCType = ?*const fn ([*c]Display, GC, [*c]XExtCodes) callconv(.c) c_int;
pub const CreateFontType = ?*const fn ([*c]Display, [*c]XFontStruct, [*c]XExtCodes) callconv(.c) c_int;
pub const FreeFontType = ?*const fn ([*c]Display, [*c]XFontStruct, [*c]XExtCodes) callconv(.c) c_int;
pub const CloseDisplayType = ?*const fn ([*c]Display, [*c]XExtCodes) callconv(.c) c_int;
pub const ErrorType = ?*const fn ([*c]Display, [*c]xError, [*c]XExtCodes, [*c]c_int) callconv(.c) c_int;
pub const ErrorStringType = ?*const fn ([*c]Display, c_int, [*c]XExtCodes, [*c]u8, c_int) callconv(.c) [*c]u8;
pub const PrintErrorType = ?*const fn ([*c]Display, [*c]XErrorEvent, ?*anyopaque) callconv(.c) void;
pub const BeforeFlushType = ?*const fn ([*c]Display, [*c]XExtCodes, [*c]const u8, c_long) callconv(.c) void;
pub const struct__XExten = extern struct {
    next: [*c]struct__XExten = null,
    codes: XExtCodes = @import("std").mem.zeroes(XExtCodes),
    create_GC: CreateGCType = null,
    copy_GC: CopyGCType = null,
    flush_GC: FlushGCType = null,
    free_GC: FreeGCType = null,
    create_Font: CreateFontType = null,
    free_Font: FreeFontType = null,
    close_display: CloseDisplayType = null,
    @"error": ErrorType = null,
    error_string: ErrorStringType = null,
    name: [*c]u8 = null,
    error_values: PrintErrorType = null,
    before_flush: BeforeFlushType = null,
    next_flush: [*c]struct__XExten = null,
};
pub const CARD8 = u8;
pub const BYTE = CARD8;
pub const CARD16 = c_ushort;
pub const CARD32 = c_uint;
pub const INT16 = c_short;
pub const KeyButMask = CARD16;
pub const BOOL = CARD8;
const struct_unnamed_11 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    root: CARD32 = 0,
    event: CARD32 = 0,
    child: CARD32 = 0,
    rootX: INT16 = 0,
    rootY: INT16 = 0,
    eventX: INT16 = 0,
    eventY: INT16 = 0,
    state: KeyButMask = 0,
    sameScreen: BOOL = 0,
    pad1: BYTE = 0,
};
const struct_unnamed_14 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    x: CARD16 = 0,
    y: CARD16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    count: CARD16 = 0,
    pad2: CARD16 = 0,
};
const struct_unnamed_15 = extern struct {
    pad00: CARD32 = 0,
    drawable: CARD32 = 0,
    x: CARD16 = 0,
    y: CARD16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    minorEvent: CARD16 = 0,
    count: CARD16 = 0,
    majorEvent: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_16 = extern struct {
    pad00: CARD32 = 0,
    drawable: CARD32 = 0,
    minorEvent: CARD16 = 0,
    majorEvent: BYTE = 0,
    bpad: BYTE = 0,
};
const struct_unnamed_17 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    state: CARD8 = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_18 = extern struct {
    pad00: CARD32 = 0,
    parent: CARD32 = 0,
    window: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    borderWidth: CARD16 = 0,
    override: BOOL = 0,
    bpad: BYTE = 0,
};
const struct_unnamed_19 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
};
const struct_unnamed_20 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    fromConfigure: BOOL = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_21 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    override: BOOL = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_22 = extern struct {
    pad00: CARD32 = 0,
    parent: CARD32 = 0,
    window: CARD32 = 0,
};
const struct_unnamed_23 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    parent: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    override: BOOL = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_24 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    aboveSibling: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    borderWidth: CARD16 = 0,
    override: BOOL = 0,
    bpad: BYTE = 0,
};
const struct_unnamed_25 = extern struct {
    pad00: CARD32 = 0,
    parent: CARD32 = 0,
    window: CARD32 = 0,
    sibling: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    borderWidth: CARD16 = 0,
    valueMask: CARD16 = 0,
    pad1: CARD32 = 0,
};
const struct_unnamed_26 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    pad1: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
};
const struct_unnamed_27 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
};
const struct_unnamed_28 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    parent: CARD32 = 0,
    place: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_29 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    atom: CARD32 = 0,
    time: CARD32 = 0,
    state: BYTE = 0,
    pad1: BYTE = 0,
    pad2: CARD16 = 0,
};
const struct_unnamed_30 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    window: CARD32 = 0,
    atom: CARD32 = 0,
};
const struct_unnamed_31 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    owner: CARD32 = 0,
    requestor: CARD32 = 0,
    selection: CARD32 = 0,
    target: CARD32 = 0,
    property: CARD32 = 0,
};
const struct_unnamed_32 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    requestor: CARD32 = 0,
    selection: CARD32 = 0,
    target: CARD32 = 0,
    property: CARD32 = 0,
};
const struct_unnamed_33 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    colormap: CARD32 = 0,
    new: BOOL = 0,
    state: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
};
const struct_unnamed_34 = extern struct {
    pad00: CARD32 = 0,
    request: CARD8 = 0,
    firstKeyCode: CARD8 = 0,
    count: CARD8 = 0,
    pad1: BYTE = 0,
};
pub const INT32 = c_int;
const struct_unnamed_37 = extern struct {
    type: CARD32 = 0,
    longs0: INT32 = 0,
    longs1: INT32 = 0,
    longs2: INT32 = 0,
    longs3: INT32 = 0,
    longs4: INT32 = 0,
};
const struct_unnamed_38 = extern struct {
    type: CARD32 = 0,
    shorts0: INT16 = 0,
    shorts1: INT16 = 0,
    shorts2: INT16 = 0,
    shorts3: INT16 = 0,
    shorts4: INT16 = 0,
    shorts5: INT16 = 0,
    shorts6: INT16 = 0,
    shorts7: INT16 = 0,
    shorts8: INT16 = 0,
    shorts9: INT16 = 0,
};
pub const INT8 = i8;
const struct_unnamed_39 = extern struct {
    type: CARD32 = 0,
    bytes: [20]INT8 = @import("std").mem.zeroes([20]INT8),
};
const union_unnamed_36 = extern union {
    l: struct_unnamed_37,
    s: struct_unnamed_38,
    b: struct_unnamed_39,
};
const struct_unnamed_35 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    u: union_unnamed_36 = @import("std").mem.zeroes(union_unnamed_36),
};
const union_unnamed_9 = extern union {
    u: struct_unnamed_10,
    keyButtonPointer: struct_unnamed_11,
    enterLeave: struct_unnamed_12,
    focus: struct_unnamed_13,
    expose: struct_unnamed_14,
    graphicsExposure: struct_unnamed_15,
    noExposure: struct_unnamed_16,
    visibility: struct_unnamed_17,
    createNotify: struct_unnamed_18,
    destroyNotify: struct_unnamed_19,
    unmapNotify: struct_unnamed_20,
    mapNotify: struct_unnamed_21,
    mapRequest: struct_unnamed_22,
    reparent: struct_unnamed_23,
    configureNotify: struct_unnamed_24,
    configureRequest: struct_unnamed_25,
    gravity: struct_unnamed_26,
    resizeRequest: struct_unnamed_27,
    circulate: struct_unnamed_28,
    property: struct_unnamed_29,
    selectionClear: struct_unnamed_30,
    selectionRequest: struct_unnamed_31,
    selectionNotify: struct_unnamed_32,
    colormap: struct_unnamed_33,
    mappingNotify: struct_unnamed_34,
    clientMessage: struct_unnamed_35,
};
pub const struct__xEvent = extern struct {
    u: union_unnamed_9 = @import("std").mem.zeroes(union_unnamed_9),
};
pub const xEvent = struct__xEvent;
pub const struct__XLockInfo_40 = opaque {};
pub const struct__XInternalAsync = extern struct {
    next: [*c]struct__XInternalAsync = null,
    handler: ?*const fn ([*c]Display, [*c]xReply, [*c]u8, c_int, XPointer) callconv(.c) c_int = null,
    data: XPointer = null,
};
pub const struct__XLockPtrs = extern struct {
    lock_display: ?*const fn (dpy: [*c]Display) callconv(.c) void = null,
    unlock_display: ?*const fn (dpy: [*c]Display) callconv(.c) void = null,
};
pub const struct__XKeytrans_41 = opaque {};
pub const Font = XID;
pub const struct__XDisplayAtoms_42 = opaque {};
pub const struct__XContextDB_43 = opaque {};
const struct_unnamed_44 = extern struct {
    defaultCCCs: XPointer = null,
    clientCmaps: XPointer = null,
    perVisualIntensityMaps: XPointer = null,
};
pub const struct__XIMFilter_45 = opaque {};
pub const _XInternalConnectionProc = ?*const fn ([*c]Display, c_int, XPointer) callconv(.c) void;
pub const struct__XConnectionInfo = extern struct {
    fd: c_int = 0,
    read_callback: _XInternalConnectionProc = null,
    call_data: XPointer = null,
    watch_data: [*c]XPointer = null,
    next: [*c]struct__XConnectionInfo = null,
};
pub const XConnectionWatchProc = ?*const fn ([*c]Display, XPointer, c_int, c_int, [*c]XPointer) callconv(.c) void;
pub const struct__XConnWatchInfo = extern struct {
    @"fn": XConnectionWatchProc = null,
    client_data: XPointer = null,
    next: [*c]struct__XConnWatchInfo = null,
};
pub const struct__XkbInfoRec_46 = opaque {};
pub const struct__XtransConnInfo_47 = opaque {};
pub const struct__X11XCBPrivate_48 = opaque {};
pub const struct__XErrorThreadInfo_49 = opaque {};
pub const XIOErrorExitHandler = ?*const fn ([*c]Display, ?*anyopaque) callconv(.c) void;
pub const xthread_t = pthread_t;
pub const struct__XDisplay = extern struct {
    ext_data: [*c]XExtData = null,
    free_funcs: [*c]struct__XFreeFuncs = null,
    fd: c_int = 0,
    conn_checker: c_int = 0,
    proto_major_version: c_int = 0,
    proto_minor_version: c_int = 0,
    vendor: [*c]u8 = null,
    resource_base: XID = 0,
    resource_mask: XID = 0,
    resource_id: XID = 0,
    resource_shift: c_int = 0,
    resource_alloc: ?*const fn ([*c]struct__XDisplay) callconv(.c) XID = null,
    byte_order: c_int = 0,
    bitmap_unit: c_int = 0,
    bitmap_pad: c_int = 0,
    bitmap_bit_order: c_int = 0,
    nformats: c_int = 0,
    pixmap_format: [*c]ScreenFormat = null,
    vnumber: c_int = 0,
    release: c_int = 0,
    head: [*c]struct__XSQEvent = null,
    tail: [*c]struct__XSQEvent = null,
    qlen: c_int = 0,
    last_request_read: c_ulong = 0,
    request: c_ulong = 0,
    last_req: [*c]u8 = null,
    buffer: [*c]u8 = null,
    bufptr: [*c]u8 = null,
    bufmax: [*c]u8 = null,
    max_request_size: c_uint = 0,
    db: ?*struct__XrmHashBucketRec = null,
    synchandler: ?*const fn ([*c]struct__XDisplay) callconv(.c) c_int = null,
    display_name: [*c]u8 = null,
    default_screen: c_int = 0,
    nscreens: c_int = 0,
    screens: [*c]Screen = null,
    motion_buffer: c_ulong = 0,
    flags: c_ulong = 0,
    min_keycode: c_int = 0,
    max_keycode: c_int = 0,
    keysyms: [*c]KeySym = null,
    modifiermap: [*c]XModifierKeymap = null,
    keysyms_per_keycode: c_int = 0,
    xdefaults: [*c]u8 = null,
    scratch_buffer: [*c]u8 = null,
    scratch_length: c_ulong = 0,
    ext_number: c_int = 0,
    ext_procs: [*c]struct__XExten = null,
    event_vec: [128]?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int),
    wire_vec: [128]?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int),
    lock_meaning: KeySym = 0,
    lock: ?*struct__XLockInfo_40 = null,
    async_handlers: [*c]struct__XInternalAsync = null,
    bigreq_size: c_ulong = 0,
    lock_fns: [*c]struct__XLockPtrs = null,
    idlist_alloc: ?*const fn ([*c]Display, [*c]XID, c_int) callconv(.c) void = null,
    key_bindings: ?*struct__XKeytrans_41 = null,
    cursor_font: Font = 0,
    atoms: ?*struct__XDisplayAtoms_42 = null,
    mode_switch: c_uint = 0,
    num_lock: c_uint = 0,
    context_db: ?*struct__XContextDB_43 = null,
    error_vec: [*c]?*const fn ([*c]Display, [*c]XErrorEvent, [*c]xError) callconv(.c) c_int = null,
    cms: struct_unnamed_44 = @import("std").mem.zeroes(struct_unnamed_44),
    im_filters: ?*struct__XIMFilter_45 = null,
    qfree: [*c]struct__XSQEvent = null,
    next_event_serial_num: c_ulong = 0,
    flushes: [*c]struct__XExten = null,
    im_fd_info: [*c]struct__XConnectionInfo = null,
    im_fd_length: c_int = 0,
    conn_watchers: [*c]struct__XConnWatchInfo = null,
    watcher_count: c_int = 0,
    filedes: XPointer = null,
    savedsynchandler: ?*const fn ([*c]Display) callconv(.c) c_int = null,
    resource_max: XID = 0,
    xcmisc_opcode: c_int = 0,
    xkb_info: ?*struct__XkbInfoRec_46 = null,
    trans_conn: ?*struct__XtransConnInfo_47 = null,
    xcb: ?*struct__X11XCBPrivate_48 = null,
    next_cookie: c_uint = 0,
    generic_event_vec: [128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]xEvent) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]xEvent) callconv(.c) c_int),
    generic_event_copy_vec: [128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]XGenericEventCookie) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]XGenericEventCookie) callconv(.c) c_int),
    cookiejar: ?*anyopaque = null,
    error_threads: ?*struct__XErrorThreadInfo_49 = null,
    exit_handler: XIOErrorExitHandler = null,
    exit_handler_data: ?*anyopaque = null,
    in_ifevent: CARD32 = 0,
    ifevent_thread: xthread_t = 0,
};
pub const struct_funcs_8 = extern struct {
    create_image: ?*const fn ([*c]struct__XDisplay, [*c]Visual, c_uint, c_int, c_int, [*c]u8, c_uint, c_uint, c_int, c_int) callconv(.c) [*c]struct__XImage = null,
    destroy_image: ?*const fn ([*c]struct__XImage) callconv(.c) c_int = null,
    get_pixel: ?*const fn ([*c]struct__XImage, c_int, c_int) callconv(.c) c_ulong = null,
    put_pixel: ?*const fn ([*c]struct__XImage, c_int, c_int, c_ulong) callconv(.c) c_int = null,
    sub_image: ?*const fn ([*c]struct__XImage, c_int, c_int, c_uint, c_uint) callconv(.c) [*c]struct__XImage = null,
    add_pixel: ?*const fn ([*c]struct__XImage, c_long) callconv(.c) c_int = null,
};
pub const struct__XImage = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    xoffset: c_int = 0,
    format: c_int = 0,
    data: [*c]u8 = null,
    byte_order: c_int = 0,
    bitmap_unit: c_int = 0,
    bitmap_bit_order: c_int = 0,
    bitmap_pad: c_int = 0,
    depth: c_int = 0,
    bytes_per_line: c_int = 0,
    bits_per_pixel: c_int = 0,
    red_mask: c_ulong = 0,
    green_mask: c_ulong = 0,
    blue_mask: c_ulong = 0,
    obdata: XPointer = null,
    f: struct_funcs_8 = @import("std").mem.zeroes(struct_funcs_8),
};
pub const XImage = struct__XImage;
pub const struct__XIC = opaque {
};
pub const XIC = ?*struct__XIC;
pub const struct__XIM = opaque {
};
pub const XIM = ?*struct__XIM;
pub const struct_X11_ClipboardData = extern struct {
    callback: SDL_ClipboardDataCallback = null,
    userdata: ?*anyopaque = null,
    mime_types: [*c]const [*c]const u8 = null,
    mime_count: usize = 0,
    sequence: Uint32 = 0,
};
pub const SDLX11_ClipboardData = struct_X11_ClipboardData;
pub const struct__XSettingsClient = opaque {
};
pub const XSettingsClient = struct__XSettingsClient;
pub const struct_X11_SettingsData = extern struct {
    xsettings: ?*XSettingsClient = null,
};
pub const SDLX11_SettingsData = struct_X11_SettingsData;
pub const Atom = c_ulong;
const struct_unnamed_50 = extern struct {
    WM_PROTOCOLS: Atom = 0,
    WM_DELETE_WINDOW: Atom = 0,
    WM_NAME: Atom = 0,
    WM_TRANSIENT_FOR: Atom = 0,
    WM_STATE: Atom = 0,
    _NET_WM_STATE: Atom = 0,
    _NET_WM_STATE_HIDDEN: Atom = 0,
    _NET_WM_STATE_FOCUSED: Atom = 0,
    _NET_WM_STATE_MAXIMIZED_VERT: Atom = 0,
    _NET_WM_STATE_MAXIMIZED_HORZ: Atom = 0,
    _NET_WM_STATE_FULLSCREEN: Atom = 0,
    _NET_WM_STATE_ABOVE: Atom = 0,
    _NET_WM_STATE_SKIP_TASKBAR: Atom = 0,
    _NET_WM_STATE_SKIP_PAGER: Atom = 0,
    _NET_WM_STATE_MODAL: Atom = 0,
    _NET_WM_MOVERESIZE: Atom = 0,
    _NET_WM_ALLOWED_ACTIONS: Atom = 0,
    _NET_WM_ACTION_FULLSCREEN: Atom = 0,
    _NET_WM_NAME: Atom = 0,
    _NET_WM_ICON_NAME: Atom = 0,
    _NET_WM_ICON: Atom = 0,
    _NET_WM_PING: Atom = 0,
    _NET_WM_SYNC_REQUEST: Atom = 0,
    _NET_WM_SYNC_REQUEST_COUNTER: Atom = 0,
    _NET_WM_WINDOW_OPACITY: Atom = 0,
    _NET_WM_USER_TIME: Atom = 0,
    _NET_ACTIVE_WINDOW: Atom = 0,
    _NET_FRAME_EXTENTS: Atom = 0,
    _SDL_WAKEUP: Atom = 0,
    UTF8_STRING: Atom = 0,
    PRIMARY: Atom = 0,
    CLIPBOARD: Atom = 0,
    INCR: Atom = 0,
    SDL_SELECTION: Atom = 0,
    TARGETS: Atom = 0,
    SDL_FORMATS: Atom = 0,
    RESOURCE_MANAGER: Atom = 0,
    XdndAware: Atom = 0,
    XdndEnter: Atom = 0,
    XdndLeave: Atom = 0,
    XdndPosition: Atom = 0,
    XdndStatus: Atom = 0,
    XdndTypeList: Atom = 0,
    XdndActionCopy: Atom = 0,
    XdndDrop: Atom = 0,
    XdndFinished: Atom = 0,
    XdndSelection: Atom = 0,
    XKLAVIER_STATE: Atom = 0,
    pen_atom_device_product_id: Atom = 0,
    pen_atom_abs_pressure: Atom = 0,
    pen_atom_abs_tilt_x: Atom = 0,
    pen_atom_abs_tilt_y: Atom = 0,
    pen_atom_wacom_serial_ids: Atom = 0,
    pen_atom_wacom_tool_type: Atom = 0,
};
pub const KeyCode = u8;
pub const struct__XkbMods = extern struct {
    mask: u8 = 0,
    real_mods: u8 = 0,
    vmods: c_ushort = 0,
};
pub const XkbModsRec = struct__XkbMods;
pub const struct__XkbControls = extern struct {
    mk_dflt_btn: u8 = 0,
    num_groups: u8 = 0,
    groups_wrap: u8 = 0,
    internal: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
    ignore_lock: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
    enabled_ctrls: c_uint = 0,
    repeat_delay: c_ushort = 0,
    repeat_interval: c_ushort = 0,
    slow_keys_delay: c_ushort = 0,
    debounce_delay: c_ushort = 0,
    mk_delay: c_ushort = 0,
    mk_interval: c_ushort = 0,
    mk_time_to_max: c_ushort = 0,
    mk_max_speed: c_ushort = 0,
    mk_curve: c_short = 0,
    ax_options: c_ushort = 0,
    ax_timeout: c_ushort = 0,
    axt_opts_mask: c_ushort = 0,
    axt_opts_values: c_ushort = 0,
    axt_ctrls_mask: c_uint = 0,
    axt_ctrls_values: c_uint = 0,
    per_key_repeat: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const XkbControlsPtr = [*c]struct__XkbControls;
pub const struct__XkbAnyAction = extern struct {
    type: u8 = 0,
    data: [7]u8 = @import("std").mem.zeroes([7]u8),
};
pub const XkbAnyAction = struct__XkbAnyAction;
pub const struct__XkbModAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    mask: u8 = 0,
    real_mods: u8 = 0,
    vmods1: u8 = 0,
    vmods2: u8 = 0,
};
pub const XkbModAction = struct__XkbModAction;
pub const struct__XkbGroupAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    group_XXX: u8 = 0,
};
pub const XkbGroupAction = struct__XkbGroupAction;
pub const struct__XkbISOAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    mask: u8 = 0,
    real_mods: u8 = 0,
    group_XXX: u8 = 0,
    affect: u8 = 0,
    vmods1: u8 = 0,
    vmods2: u8 = 0,
};
pub const XkbISOAction = struct__XkbISOAction;
pub const struct__XkbPtrAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    high_XXX: u8 = 0,
    low_XXX: u8 = 0,
    high_YYY: u8 = 0,
    low_YYY: u8 = 0,
};
pub const XkbPtrAction = struct__XkbPtrAction;
pub const struct__XkbPtrBtnAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    count: u8 = 0,
    button: u8 = 0,
};
pub const XkbPtrBtnAction = struct__XkbPtrBtnAction;
pub const struct__XkbPtrDfltAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    affect: u8 = 0,
    valueXXX: u8 = 0,
};
pub const XkbPtrDfltAction = struct__XkbPtrDfltAction;
pub const struct__XkbSwitchScreenAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    screenXXX: u8 = 0,
};
pub const XkbSwitchScreenAction = struct__XkbSwitchScreenAction;
pub const struct__XkbCtrlsAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    ctrls3: u8 = 0,
    ctrls2: u8 = 0,
    ctrls1: u8 = 0,
    ctrls0: u8 = 0,
};
pub const XkbCtrlsAction = struct__XkbCtrlsAction;
pub const struct__XkbMessageAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    message: [6]u8 = @import("std").mem.zeroes([6]u8),
};
pub const XkbMessageAction = struct__XkbMessageAction;
pub const struct__XkbRedirectKeyAction = extern struct {
    type: u8 = 0,
    new_key: u8 = 0,
    mods_mask: u8 = 0,
    mods: u8 = 0,
    vmods_mask0: u8 = 0,
    vmods_mask1: u8 = 0,
    vmods0: u8 = 0,
    vmods1: u8 = 0,
};
pub const XkbRedirectKeyAction = struct__XkbRedirectKeyAction;
pub const struct__XkbDeviceBtnAction = extern struct {
    type: u8 = 0,
    flags: u8 = 0,
    count: u8 = 0,
    button: u8 = 0,
    device: u8 = 0,
};
pub const XkbDeviceBtnAction = struct__XkbDeviceBtnAction;
pub const struct__XkbDeviceValuatorAction = extern struct {
    type: u8 = 0,
    device: u8 = 0,
    v1_what: u8 = 0,
    v1_ndx: u8 = 0,
    v1_value: u8 = 0,
    v2_what: u8 = 0,
    v2_ndx: u8 = 0,
    v2_value: u8 = 0,
};
pub const XkbDeviceValuatorAction = struct__XkbDeviceValuatorAction;
pub const union__XkbAction = extern union {
    any: XkbAnyAction,
    mods: XkbModAction,
    group: XkbGroupAction,
    iso: XkbISOAction,
    ptr: XkbPtrAction,
    btn: XkbPtrBtnAction,
    dflt: XkbPtrDfltAction,
    screen: XkbSwitchScreenAction,
    ctrls: XkbCtrlsAction,
    msg: XkbMessageAction,
    redirect: XkbRedirectKeyAction,
    devbtn: XkbDeviceBtnAction,
    devval: XkbDeviceValuatorAction,
    type: u8,
};
pub const XkbAction = union__XkbAction;
pub const struct__XkbBehavior = extern struct {
    type: u8 = 0,
    data: u8 = 0,
};
pub const XkbBehavior = struct__XkbBehavior;
pub const struct__XkbServerMapRec = extern struct {
    num_acts: c_ushort = 0,
    size_acts: c_ushort = 0,
    acts: [*c]XkbAction = null,
    behaviors: [*c]XkbBehavior = null,
    key_acts: [*c]c_ushort = null,
    explicit: [*c]u8 = null,
    vmods: [16]u8 = @import("std").mem.zeroes([16]u8),
    vmodmap: [*c]c_ushort = null,
};
pub const XkbServerMapPtr = [*c]struct__XkbServerMapRec;
pub const struct__XkbKTMapEntry = extern struct {
    active: c_int = 0,
    level: u8 = 0,
    mods: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
};
pub const XkbKTMapEntryPtr = [*c]struct__XkbKTMapEntry;
pub const XkbModsPtr = [*c]struct__XkbMods;
pub const struct__XkbKeyType = extern struct {
    mods: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
    num_levels: u8 = 0,
    map_count: u8 = 0,
    map: XkbKTMapEntryPtr = null,
    preserve: XkbModsPtr = null,
    name: Atom = 0,
    level_names: [*c]Atom = null,
};
pub const XkbKeyTypePtr = [*c]struct__XkbKeyType;
pub const struct__XkbSymMapRec = extern struct {
    kt_index: [4]u8 = @import("std").mem.zeroes([4]u8),
    group_info: u8 = 0,
    width: u8 = 0,
    offset: c_ushort = 0,
};
pub const XkbSymMapPtr = [*c]struct__XkbSymMapRec;
pub const struct__XkbClientMapRec = extern struct {
    size_types: u8 = 0,
    num_types: u8 = 0,
    types: XkbKeyTypePtr = null,
    size_syms: c_ushort = 0,
    num_syms: c_ushort = 0,
    syms: [*c]KeySym = null,
    key_sym_map: XkbSymMapPtr = null,
    modmap: [*c]u8 = null,
};
pub const XkbClientMapPtr = [*c]struct__XkbClientMapRec;
pub const struct__XkbIndicatorMapRec = extern struct {
    flags: u8 = 0,
    which_groups: u8 = 0,
    groups: u8 = 0,
    which_mods: u8 = 0,
    mods: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
    ctrls: c_uint = 0,
};
pub const XkbIndicatorMapRec = struct__XkbIndicatorMapRec;
pub const struct__XkbIndicatorRec = extern struct {
    phys_indicators: c_ulong = 0,
    maps: [32]XkbIndicatorMapRec = @import("std").mem.zeroes([32]XkbIndicatorMapRec),
};
pub const XkbIndicatorPtr = [*c]struct__XkbIndicatorRec;
pub const struct__XkbKeyNameRec = extern struct {
    name: [4]u8 = @import("std").mem.zeroes([4]u8),
};
pub const XkbKeyNamePtr = [*c]struct__XkbKeyNameRec;
pub const struct__XkbKeyAliasRec = extern struct {
    real: [4]u8 = @import("std").mem.zeroes([4]u8),
    alias: [4]u8 = @import("std").mem.zeroes([4]u8),
};
pub const XkbKeyAliasPtr = [*c]struct__XkbKeyAliasRec;
pub const struct__XkbNamesRec = extern struct {
    keycodes: Atom = 0,
    geometry: Atom = 0,
    symbols: Atom = 0,
    types: Atom = 0,
    compat: Atom = 0,
    vmods: [16]Atom = @import("std").mem.zeroes([16]Atom),
    indicators: [32]Atom = @import("std").mem.zeroes([32]Atom),
    groups: [4]Atom = @import("std").mem.zeroes([4]Atom),
    keys: XkbKeyNamePtr = null,
    key_aliases: XkbKeyAliasPtr = null,
    radio_groups: [*c]Atom = null,
    phys_symbols: Atom = 0,
    num_keys: u8 = 0,
    num_key_aliases: u8 = 0,
    num_rg: c_ushort = 0,
};
pub const XkbNamesPtr = [*c]struct__XkbNamesRec;
pub const struct__XkbSymInterpretRec = extern struct {
    sym: KeySym = 0,
    flags: u8 = 0,
    match: u8 = 0,
    mods: u8 = 0,
    virtual_mod: u8 = 0,
    act: XkbAnyAction = @import("std").mem.zeroes(XkbAnyAction),
};
pub const XkbSymInterpretPtr = [*c]struct__XkbSymInterpretRec;
pub const struct__XkbCompatMapRec = extern struct {
    sym_interpret: XkbSymInterpretPtr = null,
    groups: [4]XkbModsRec = @import("std").mem.zeroes([4]XkbModsRec),
    num_si: c_ushort = 0,
    size_si: c_ushort = 0,
};
pub const XkbCompatMapPtr = [*c]struct__XkbCompatMapRec;
pub const struct__XkbGeometry = opaque {};
pub const XkbGeometryPtr = ?*struct__XkbGeometry;
pub const struct__XkbDesc = extern struct {
    dpy: [*c]struct__XDisplay = null,
    flags: c_ushort = 0,
    device_spec: c_ushort = 0,
    min_key_code: KeyCode = 0,
    max_key_code: KeyCode = 0,
    ctrls: XkbControlsPtr = null,
    server: XkbServerMapPtr = null,
    map: XkbClientMapPtr = null,
    indicators: XkbIndicatorPtr = null,
    names: XkbNamesPtr = null,
    compat: XkbCompatMapPtr = null,
    geom: XkbGeometryPtr = null,
};
pub const XkbDescPtr = [*c]struct__XkbDesc;
pub const struct_SDL_Keymap = opaque {
};
pub const SDL_Keymap = struct_SDL_Keymap;
const struct_unnamed_53 = extern struct {
    desc_ptr: XkbDescPtr = null,
    keymaps: [4]?*SDL_Keymap = @import("std").mem.zeroes([4]?*SDL_Keymap),
    last_map_serial: c_ulong = 0,
    event: c_int = 0,
    current_group: Uint32 = 0,
};
const struct_unnamed_54 = extern struct {
    keysym_map: [*c]KeySym = null,
    keysyms_per_key: c_int = 0,
    min_keycode: c_int = 0,
    max_keycode: c_int = 0,
};
const union_unnamed_52 = extern union {
    xkb: struct_unnamed_53,
    core: struct_unnamed_54,
};
const struct_unnamed_51 = extern struct {
    xkb_enabled: bool = false,
    key_layout: [256]SDL_Scancode = @import("std").mem.zeroes([256]SDL_Scancode),
    unnamed_0: union_unnamed_52 = @import("std").mem.zeroes(union_unnamed_52),
    pressed_modifiers: Uint32 = 0,
    locked_modifiers: Uint32 = 0,
    sdl_pressed_modifiers: SDL_Keymod = 0,
    sdl_physically_pressed_modifiers: SDL_Keymod = 0,
    sdl_locked_modifiers: SDL_Keymod = 0,
    alt_mask: Uint32 = 0,
    gui_mask: Uint32 = 0,
    level3_mask: Uint32 = 0,
    level5_mask: Uint32 = 0,
    numlock_mask: Uint32 = 0,
    scrolllock_mask: Uint32 = 0,
};
pub const struct_xcb_connection_t = opaque {};
pub const xcb_connection_t = struct_xcb_connection_t;
pub const PFN_XGetXCBConnection = ?*const fn (dpy: [*c]Display) callconv(.c) ?*xcb_connection_t;
pub const struct_SDL_VideoData = extern struct {
    display: [*c]Display = null,
    request_display: [*c]Display = null,
    pid: pid_t = 0,
    im: XIM = null,
    screensaver_activity: Uint64 = 0,
    numwindows: c_int = 0,
    windowlist: [*c][*c]SDL_WindowData = null,
    windowlistlength: c_int = 0,
    window_group: XID = 0,
    clipboard_window: Window = 0,
    clipboard: SDLX11_ClipboardData = @import("std").mem.zeroes(SDLX11_ClipboardData),
    primary_selection: SDLX11_ClipboardData = @import("std").mem.zeroes(SDLX11_ClipboardData),
    active_cursor_confined_window: [*c]SDL_Window = null,
    xsettings_window: Window = 0,
    xsettings_data: SDLX11_SettingsData = @import("std").mem.zeroes(SDLX11_SettingsData),
    net_wm: bool = false,
    atoms: struct_unnamed_50 = @import("std").mem.zeroes(struct_unnamed_50),
    selection_waiting: bool = false,
    selection_incr_waiting: bool = false,
    broken_pointer_grab: bool = false,
    last_mode_change_deadline: Uint64 = 0,
    global_mouse_changed: bool = false,
    global_mouse_position: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    global_mouse_buttons: Uint32 = 0,
    xinput_last_button_serial: c_ulong = 0,
    xinput_last_key_serial: c_ulong = 0,
    xinput_last_keyboard_device: c_int = 0,
    xinput_master_pointer_device: c_int = 0,
    xinput_hierarchy_changed: bool = false,
    xrandr_event_base: c_int = 0,
    keyboard: struct_unnamed_51 = @import("std").mem.zeroes(struct_unnamed_51),
    vulkan_xlib_xcb_library: ?*SDL_SharedObject = null,
    vulkan_XGetXCBConnection: PFN_XGetXCBConnection = null,
    use_steam_screen_keyboard: bool = false,
    is_xwayland: bool = false,
};
pub const EGLSurface = ?*anyopaque;
pub const PointerBarrier = XID;
pub const XSyncCounter = XID;
pub const struct__XSyncValue = extern struct {
    hi: c_int = 0,
    lo: c_uint = 0,
};
pub const XSyncValue = struct__XSyncValue;
const enum_unnamed_55 = c_uint;
const enum_unnamed_56 = c_uint;
pub const XIMFeedback = c_ulong;
pub const struct_SDL_WindowData = extern struct {
    window: [*c]SDL_Window = null,
    xwindow: Window = 0,
    visual: [*c]Visual = null,
    colormap: Colormap = 0,
    use_mitshm: bool = false,
    shminfo: XShmSegmentInfo = @import("std").mem.zeroes(XShmSegmentInfo),
    ximage: [*c]XImage = null,
    gc: GC = null,
    ic: XIC = null,
    created: bool = false,
    border_left: c_int = 0,
    border_right: c_int = 0,
    border_top: c_int = 0,
    border_bottom: c_int = 0,
    xinput2_mouse_enabled: bool = false,
    xinput2_keyboard_enabled: bool = false,
    mouse_grabbed: bool = false,
    last_focus_event_time: Uint64 = 0,
    ignore_button_press_serial: c_ulong = 0,
    pending_focus: PendingFocusEnum = @import("std").mem.zeroes(PendingFocusEnum),
    pending_focus_time: Uint64 = 0,
    pending_move: bool = false,
    pending_move_point: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    last_xconfigure: XConfigureEvent = @import("std").mem.zeroes(XConfigureEvent),
    pending_xconfigure: XConfigureEvent = @import("std").mem.zeroes(XConfigureEvent),
    videodata: [*c]struct_SDL_VideoData = null,
    user_time: c_ulong = 0,
    xdnd_req: Atom = 0,
    xdnd_source: Window = 0,
    flashing_window: bool = false,
    flash_cancel_time: Uint64 = 0,
    egl_surface: EGLSurface = null,
    pointer_barrier_active: bool = false,
    barrier: [4]PointerBarrier = @import("std").mem.zeroes([4]PointerBarrier),
    barrier_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    resize_counter: XSyncCounter = 0,
    resize_id: XSyncValue = @import("std").mem.zeroes(XSyncValue),
    resize_in_progress: bool = false,
    expected: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    requested_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    pending_operation: enum_unnamed_55 = @import("std").mem.zeroes(enum_unnamed_55),
    size_move_event_flags: enum_unnamed_56 = @import("std").mem.zeroes(enum_unnamed_56),
    pending_size: bool = false,
    pending_position: bool = false,
    fs_repositioned: bool = false,
    window_was_maximized: bool = false,
    previous_borders_nonzero: bool = false,
    toggle_borders: bool = false,
    fullscreen_borders_forced_on: bool = false,
    was_shown: bool = false,
    emit_size_move_after_property_notify: bool = false,
    hit_test_result: SDL_HitTestResult = @import("std").mem.zeroes(SDL_HitTestResult),
    pending_grab: bool = false,
    xim_spot: XPoint = @import("std").mem.zeroes(XPoint),
    preedit_text: [*c]u8 = null,
    preedit_feedback: [*c]XIMFeedback = null,
    preedit_length: c_int = 0,
    preedit_cursor: c_int = 0,
    ime_needs_clear_composition: bool = false,
};
pub const SDL_WindowData = struct_SDL_WindowData;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
pub extern fn SDL_SendKeyboardText(text: [*c]const u8) void;
pub extern fn SDL_SendEditingText(text: [*c]const u8, start: c_int, length: c_int) void;
pub extern fn SDL_GetAppID() [*c]const u8;
pub const dbus_uint32_t = c_uint;
pub const dbus_bool_t = dbus_uint32_t;
pub const struct_DBusError = extern struct {
    name: [*c]const u8 = null,
    message: [*c]const u8 = null,
    reserved_bits: c_uint = 0,
    padding1: ?*anyopaque = null,
};
pub const DBusError = struct_DBusError;
pub const DBusFreeFunction = ?*const fn (memory: ?*anyopaque) callconv(.c) void;
pub const struct_DBusMessage = opaque {
};
pub const DBusMessage = struct_DBusMessage;
pub const struct_DBusMessageIter = extern struct {
    dummy1: ?*anyopaque = null,
    dummy2: ?*anyopaque = null,
    dummy3: dbus_uint32_t = 0,
    dummy4: c_int = 0,
    dummy5: c_int = 0,
    dummy6: c_int = 0,
    dummy7: c_int = 0,
    dummy8: c_int = 0,
    dummy9: c_int = 0,
    dummy10: c_int = 0,
    dummy11: c_int = 0,
    pad1: c_int = 0,
    pad2: ?*anyopaque = null,
    pad3: ?*anyopaque = null,
};
pub const DBusMessageIter = struct_DBusMessageIter;
pub const DBusBusType = c_uint;
pub const DBUS_HANDLER_RESULT_HANDLED: c_int = 0;
pub const DBUS_HANDLER_RESULT_NOT_YET_HANDLED: c_int = 1;
pub const DBusHandlerResult = c_uint;
pub const struct_DBusConnection = opaque {
};
pub const DBusConnection = struct_DBusConnection;
pub const DBusObjectPathUnregisterFunction = ?*const fn (connection: ?*DBusConnection, user_data: ?*anyopaque) callconv(.c) void;
pub const DBusObjectPathMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_DBusObjectPathVTable = extern struct {
    unregister_function: DBusObjectPathUnregisterFunction = null,
    message_function: DBusObjectPathMessageFunction = null,
    dbus_internal_pad1: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad2: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad3: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad4: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const DBusObjectPathVTable = struct_DBusObjectPathVTable;
pub const DBUS_DISPATCH_DATA_REMAINS: c_int = 0;
pub const DBusDispatchStatus = c_uint;
pub const DBusHandleMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_SDL_DBusContext = extern struct {
    session_conn: ?*DBusConnection = null,
    system_conn: ?*DBusConnection = null,
    bus_get_private: ?*const fn (DBusBusType, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    bus_register: ?*const fn (?*DBusConnection, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    bus_add_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_remove_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_get_unique_name: ?*const fn (?*DBusConnection) callconv(.c) [*c]const u8 = null,
    connection_open_private: ?*const fn ([*c]const u8, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    connection_set_exit_on_disconnect: ?*const fn (?*DBusConnection, dbus_bool_t) callconv(.c) void = null,
    connection_get_is_connected: ?*const fn (?*DBusConnection) callconv(.c) dbus_bool_t = null,
    connection_add_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque, DBusFreeFunction) callconv(.c) dbus_bool_t = null,
    connection_remove_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque) callconv(.c) dbus_bool_t = null,
    connection_try_register_object_path: ?*const fn (?*DBusConnection, [*c]const u8, [*c]const DBusObjectPathVTable, ?*anyopaque, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    connection_send: ?*const fn (?*DBusConnection, ?*DBusMessage, [*c]dbus_uint32_t) callconv(.c) dbus_bool_t = null,
    connection_send_with_reply_and_block: ?*const fn (?*DBusConnection, ?*DBusMessage, c_int, [*c]DBusError) callconv(.c) ?*DBusMessage = null,
    connection_close: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_ref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_unref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_flush: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_read_write: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_read_write_dispatch: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_dispatch: ?*const fn (?*DBusConnection) callconv(.c) DBusDispatchStatus = null,
    type_is_fixed: ?*const fn (c_int) callconv(.c) dbus_bool_t = null,
    message_is_signal: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_has_path: ?*const fn (?*DBusMessage, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_method_call: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_signal: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_set_no_reply: ?*const fn (?*DBusMessage, dbus_bool_t) callconv(.c) void = null,
    message_append_args: ?*const fn (?*DBusMessage, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_append_args_valist: ?*const fn (?*DBusMessage, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init_append: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) void = null,
    message_iter_open_container: ?*const fn ([*c]DBusMessageIter, c_int, [*c]const u8, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_append_basic: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque) callconv(.c) dbus_bool_t = null,
    message_iter_close_container: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_get_args: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_get_args_valist: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_next: ?*const fn ([*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_get_basic: ?*const fn ([*c]DBusMessageIter, ?*anyopaque) callconv(.c) void = null,
    message_iter_get_arg_type: ?*const fn ([*c]DBusMessageIter) callconv(.c) c_int = null,
    message_iter_recurse: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) void = null,
    message_unref: ?*const fn (?*DBusMessage) callconv(.c) void = null,
    threads_init_default: ?*const fn () callconv(.c) dbus_bool_t = null,
    error_init: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    error_is_set: ?*const fn ([*c]const DBusError) callconv(.c) dbus_bool_t = null,
    error_has_name: ?*const fn ([*c]const DBusError, [*c]const u8) callconv(.c) dbus_bool_t = null,
    error_free: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    get_local_machine_id: ?*const fn () callconv(.c) [*c]u8 = null,
    try_get_local_machine_id: ?*const fn ([*c]DBusError) callconv(.c) [*c]u8 = null,
    free: ?*const fn (?*anyopaque) callconv(.c) void = null,
    free_string_array: ?*const fn ([*c][*c]u8) callconv(.c) void = null,
    shutdown: ?*const fn () callconv(.c) void = null,
    bus_request_name: ?*const fn (?*DBusConnection, [*c]const u8, c_uint, [*c]DBusError) callconv(.c) c_int = null,
    message_is_method_call: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_error: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_method_return: ?*const fn (?*DBusMessage) callconv(.c) ?*DBusMessage = null,
    message_iter_append_fixed_array: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque, c_int) callconv(.c) dbus_bool_t = null,
    message_iter_get_fixed_array: ?*const fn ([*c]DBusMessageIter, ?*anyopaque, [*c]c_int) callconv(.c) void = null,
    connection_unregister_object_path: ?*const fn (?*DBusConnection, [*c]const u8) callconv(.c) dbus_bool_t = null,
    connection_get_object_path_data: ?*const fn (?*DBusConnection, [*c]const u8, [*c]?*anyopaque) callconv(.c) dbus_bool_t = null,
};
pub const SDL_DBusContext = struct_SDL_DBusContext;
pub extern fn SDL_DBus_GetContext() [*c]SDL_DBusContext;
pub extern fn SDL_DBus_CallMethod(save_reply: [*c]?*DBusMessage, node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool;
pub extern fn SDL_DBus_CallVoidMethod(node: [*c]const u8, path: [*c]const u8, interface: [*c]const u8, method: [*c]const u8, ...) bool;
pub const VisualID = c_ulong;
pub const Time = c_ulong;
pub const Drawable = XID;
pub const Pixmap = XID;
pub const XExtCodes = extern struct {
    extension: c_int = 0,
    major_opcode: c_int = 0,
    first_event: c_int = 0,
    first_error: c_int = 0,
};
pub const XGCValues = extern struct {
    function: c_int = 0,
    plane_mask: c_ulong = 0,
    foreground: c_ulong = 0,
    background: c_ulong = 0,
    line_width: c_int = 0,
    line_style: c_int = 0,
    cap_style: c_int = 0,
    join_style: c_int = 0,
    fill_style: c_int = 0,
    fill_rule: c_int = 0,
    arc_mode: c_int = 0,
    tile: Pixmap = 0,
    stipple: Pixmap = 0,
    ts_x_origin: c_int = 0,
    ts_y_origin: c_int = 0,
    font: Font = 0,
    subwindow_mode: c_int = 0,
    graphics_exposures: c_int = 0,
    clip_x_origin: c_int = 0,
    clip_y_origin: c_int = 0,
    clip_mask: Pixmap = 0,
    dash_offset: c_int = 0,
    dashes: u8 = 0,
};
pub const Visual = extern struct {
    ext_data: [*c]XExtData = null,
    visualid: VisualID = 0,
    class: c_int = 0,
    red_mask: c_ulong = 0,
    green_mask: c_ulong = 0,
    blue_mask: c_ulong = 0,
    bits_per_rgb: c_int = 0,
    map_entries: c_int = 0,
};
pub const Depth = extern struct {
    depth: c_int = 0,
    nvisuals: c_int = 0,
    visuals: [*c]Visual = null,
};
pub const Screen = extern struct {
    ext_data: [*c]XExtData = null,
    display: [*c]struct__XDisplay = null,
    root: Window = 0,
    width: c_int = 0,
    height: c_int = 0,
    mwidth: c_int = 0,
    mheight: c_int = 0,
    ndepths: c_int = 0,
    depths: [*c]Depth = null,
    root_depth: c_int = 0,
    root_visual: [*c]Visual = null,
    default_gc: GC = null,
    cmap: Colormap = 0,
    white_pixel: c_ulong = 0,
    black_pixel: c_ulong = 0,
    max_maps: c_int = 0,
    min_maps: c_int = 0,
    backing_store: c_int = 0,
    save_unders: c_int = 0,
    root_input_mask: c_long = 0,
};
pub const ScreenFormat = extern struct {
    ext_data: [*c]XExtData = null,
    depth: c_int = 0,
    bits_per_pixel: c_int = 0,
    scanline_pad: c_int = 0,
};
pub const XPoint = extern struct {
    x: c_short = 0,
    y: c_short = 0,
};
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int = 0,
    modifiermap: [*c]KeyCode = null,
};
pub const struct__XPrivate = opaque {};
const struct_unnamed_71 = extern struct {
    ext_data: [*c]XExtData = null,
    private1: ?*struct__XPrivate = null,
    fd: c_int = 0,
    private2: c_int = 0,
    proto_major_version: c_int = 0,
    proto_minor_version: c_int = 0,
    vendor: [*c]u8 = null,
    private3: XID = 0,
    private4: XID = 0,
    private5: XID = 0,
    private6: c_int = 0,
    resource_alloc: ?*const fn ([*c]struct__XDisplay) callconv(.c) XID = null,
    byte_order: c_int = 0,
    bitmap_unit: c_int = 0,
    bitmap_pad: c_int = 0,
    bitmap_bit_order: c_int = 0,
    nformats: c_int = 0,
    pixmap_format: [*c]ScreenFormat = null,
    private8: c_int = 0,
    release: c_int = 0,
    private9: ?*struct__XPrivate = null,
    private10: ?*struct__XPrivate = null,
    qlen: c_int = 0,
    last_request_read: c_ulong = 0,
    request: c_ulong = 0,
    private11: XPointer = null,
    private12: XPointer = null,
    private13: XPointer = null,
    private14: XPointer = null,
    max_request_size: c_uint = 0,
    db: ?*struct__XrmHashBucketRec = null,
    private15: ?*const fn ([*c]struct__XDisplay) callconv(.c) c_int = null,
    display_name: [*c]u8 = null,
    default_screen: c_int = 0,
    nscreens: c_int = 0,
    screens: [*c]Screen = null,
    motion_buffer: c_ulong = 0,
    private16: c_ulong = 0,
    min_keycode: c_int = 0,
    max_keycode: c_int = 0,
    private17: XPointer = null,
    private18: XPointer = null,
    private19: c_int = 0,
    xdefaults: [*c]u8 = null,
};
pub const _XPrivDisplay = [*c]struct_unnamed_71;
pub const XKeyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    keycode: c_uint = 0,
    same_screen: c_int = 0,
};
pub const XButtonEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    button: c_uint = 0,
    same_screen: c_int = 0,
};
pub const XMotionEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    is_hint: u8 = 0,
    same_screen: c_int = 0,
};
pub const XCrossingEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    mode: c_int = 0,
    detail: c_int = 0,
    same_screen: c_int = 0,
    focus: c_int = 0,
    state: c_uint = 0,
};
pub const XFocusChangeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    mode: c_int = 0,
    detail: c_int = 0,
};
pub const XKeymapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    key_vector: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const XExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    count: c_int = 0,
};
pub const XGraphicsExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    drawable: Drawable = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    count: c_int = 0,
    major_code: c_int = 0,
    minor_code: c_int = 0,
};
pub const XNoExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    drawable: Drawable = 0,
    major_code: c_int = 0,
    minor_code: c_int = 0,
};
pub const XVisibilityEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    state: c_int = 0,
};
pub const XCreateWindowEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    parent: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    override_redirect: c_int = 0,
};
pub const XDestroyWindowEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
};
pub const XUnmapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    from_configure: c_int = 0,
};
pub const XMapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    override_redirect: c_int = 0,
};
pub const XMapRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    parent: Window = 0,
    window: Window = 0,
};
pub const XReparentEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    parent: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    override_redirect: c_int = 0,
};
pub const XConfigureEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    above: Window = 0,
    override_redirect: c_int = 0,
};
pub const XGravityEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
};
pub const XResizeRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    width: c_int = 0,
    height: c_int = 0,
};
pub const XConfigureRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    parent: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    above: Window = 0,
    detail: c_int = 0,
    value_mask: c_ulong = 0,
};
pub const XCirculateEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    event: Window = 0,
    window: Window = 0,
    place: c_int = 0,
};
pub const XCirculateRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    parent: Window = 0,
    window: Window = 0,
    place: c_int = 0,
};
pub const XPropertyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    atom: Atom = 0,
    time: Time = 0,
    state: c_int = 0,
};
pub const XSelectionClearEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    selection: Atom = 0,
    time: Time = 0,
};
pub const XSelectionRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    owner: Window = 0,
    requestor: Window = 0,
    selection: Atom = 0,
    target: Atom = 0,
    property: Atom = 0,
    time: Time = 0,
};
pub const XSelectionEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    requestor: Window = 0,
    selection: Atom = 0,
    target: Atom = 0,
    property: Atom = 0,
    time: Time = 0,
};
pub const XColormapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    colormap: Colormap = 0,
    new: c_int = 0,
    state: c_int = 0,
};
const union_unnamed_72 = extern union {
    b: [20]u8,
    s: [10]c_short,
    l: [5]c_long,
};
pub const XClientMessageEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    message_type: Atom = 0,
    format: c_int = 0,
    data: union_unnamed_72 = @import("std").mem.zeroes(union_unnamed_72),
};
pub const XMappingEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    request: c_int = 0,
    first_keycode: c_int = 0,
    count: c_int = 0,
};
pub const XErrorEvent = extern struct {
    type: c_int = 0,
    display: [*c]Display = null,
    resourceid: XID = 0,
    serial: c_ulong = 0,
    error_code: u8 = 0,
    request_code: u8 = 0,
    minor_code: u8 = 0,
};
pub const XAnyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
};
pub const XGenericEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
};
pub const XGenericEventCookie = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    cookie: c_uint = 0,
    data: ?*anyopaque = null,
};
pub const XCharStruct = extern struct {
    lbearing: c_short = 0,
    rbearing: c_short = 0,
    width: c_short = 0,
    ascent: c_short = 0,
    descent: c_short = 0,
    attributes: c_ushort = 0,
};
pub const XFontProp = extern struct {
    name: Atom = 0,
    card32: c_ulong = 0,
};
pub const XFontStruct = extern struct {
    ext_data: [*c]XExtData = null,
    fid: Font = 0,
    direction: c_uint = 0,
    min_char_or_byte2: c_uint = 0,
    max_char_or_byte2: c_uint = 0,
    min_byte1: c_uint = 0,
    max_byte1: c_uint = 0,
    all_chars_exist: c_int = 0,
    default_char: c_uint = 0,
    n_properties: c_int = 0,
    properties: [*c]XFontProp = null,
    min_bounds: XCharStruct = @import("std").mem.zeroes(XCharStruct),
    max_bounds: XCharStruct = @import("std").mem.zeroes(XCharStruct),
    per_char: [*c]XCharStruct = null,
    ascent: c_int = 0,
    descent: c_int = 0,
};
pub const xGenericReply = extern struct {
    type: BYTE = 0,
    data1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    data00: CARD32 = 0,
    data01: CARD32 = 0,
    data02: CARD32 = 0,
    data03: CARD32 = 0,
    data04: CARD32 = 0,
    data05: CARD32 = 0,
};
pub const xGetGeometryReply = extern struct {
    type: BYTE = 0,
    depth: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    root: CARD32 = 0,
    x: INT16 = 0,
    y: INT16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    borderWidth: CARD16 = 0,
    pad1: CARD16 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
};
pub const xQueryTreeReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    root: CARD32 = 0,
    parent: CARD32 = 0,
    nChildren: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
};
pub const xInternAtomReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    atom: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xGetAtomNameReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nameLength: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetPropertyReply = extern struct {
    type: BYTE = 0,
    format: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    propertyType: CARD32 = 0,
    bytesAfter: CARD32 = 0,
    nItems: CARD32 = 0,
    pad1: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
};
pub const xListPropertiesReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nProperties: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetSelectionOwnerReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    owner: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xGrabPointerReply = extern struct {
    type: BYTE = 0,
    status: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad1: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xGrabKeyboardReply = xGrabPointerReply;
pub const xQueryPointerReply = extern struct {
    type: BYTE = 0,
    sameScreen: BOOL = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    root: CARD32 = 0,
    child: CARD32 = 0,
    rootX: INT16 = 0,
    rootY: INT16 = 0,
    winX: INT16 = 0,
    winY: INT16 = 0,
    mask: CARD16 = 0,
    pad1: CARD16 = 0,
    pad: CARD32 = 0,
};
pub const xGetMotionEventsReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nEvents: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xTranslateCoordsReply = extern struct {
    type: BYTE = 0,
    sameScreen: BOOL = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    child: CARD32 = 0,
    dstX: INT16 = 0,
    dstY: INT16 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
};
pub const xGetInputFocusReply = extern struct {
    type: BYTE = 0,
    revertTo: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    focus: CARD32 = 0,
    pad1: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
};
pub const xQueryTextExtentsReply = extern struct {
    type: BYTE = 0,
    drawDirection: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    fontAscent: INT16 = 0,
    fontDescent: INT16 = 0,
    overallAscent: INT16 = 0,
    overallDescent: INT16 = 0,
    overallWidth: INT32 = 0,
    overallLeft: INT32 = 0,
    overallRight: INT32 = 0,
    pad: CARD32 = 0,
};
pub const xListFontsReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nFonts: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetFontPathReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nPaths: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetImageReply = extern struct {
    type: BYTE = 0,
    depth: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    visual: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xListInstalledColormapsReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nColormaps: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xAllocColorReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    red: CARD16 = 0,
    green: CARD16 = 0,
    blue: CARD16 = 0,
    pad2: CARD16 = 0,
    pixel: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
};
pub const xAllocNamedColorReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pixel: CARD32 = 0,
    exactRed: CARD16 = 0,
    exactGreen: CARD16 = 0,
    exactBlue: CARD16 = 0,
    screenRed: CARD16 = 0,
    screenGreen: CARD16 = 0,
    screenBlue: CARD16 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
};
pub const xAllocColorCellsReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nPixels: CARD16 = 0,
    nMasks: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xAllocColorPlanesReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nPixels: CARD16 = 0,
    pad2: CARD16 = 0,
    redMask: CARD32 = 0,
    greenMask: CARD32 = 0,
    blueMask: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
};
pub const xQueryColorsReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nColors: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xLookupColorReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    exactRed: CARD16 = 0,
    exactGreen: CARD16 = 0,
    exactBlue: CARD16 = 0,
    screenRed: CARD16 = 0,
    screenGreen: CARD16 = 0,
    screenBlue: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
};
pub const xQueryBestSizeReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xQueryExtensionReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    present: BOOL = 0,
    major_opcode: CARD8 = 0,
    first_event: CARD8 = 0,
    first_error: CARD8 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xListExtensionsReply = extern struct {
    type: BYTE = 0,
    nExtensions: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xSetMappingReply = extern struct {
    type: BYTE = 0,
    success: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xSetPointerMappingReply = xSetMappingReply;
pub const xSetModifierMappingReply = xSetMappingReply;
pub const xGetPointerMappingReply = extern struct {
    type: BYTE = 0,
    nElts: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetKeyboardMappingReply = extern struct {
    type: BYTE = 0,
    keySymsPerKeyCode: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xGetModifierMappingReply = extern struct {
    type: BYTE = 0,
    numKeyPerModifier: CARD8 = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    pad1: CARD32 = 0,
    pad2: CARD32 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xGetPointerControlReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    accelNumerator: CARD16 = 0,
    accelDenominator: CARD16 = 0,
    threshold: CARD16 = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xGetScreenSaverReply = extern struct {
    type: BYTE = 0,
    pad1: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    timeout: CARD16 = 0,
    interval: CARD16 = 0,
    preferBlanking: BOOL = 0,
    allowExposures: BOOL = 0,
    pad2: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
};
pub const xListHostsReply = extern struct {
    type: BYTE = 0,
    enabled: BOOL = 0,
    sequenceNumber: CARD16 = 0,
    length: CARD32 = 0,
    nHosts: CARD16 = 0,
    pad1: CARD16 = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xError = extern struct {
    type: BYTE = 0,
    errorCode: BYTE = 0,
    sequenceNumber: CARD16 = 0,
    resourceID: CARD32 = 0,
    minorCode: CARD16 = 0,
    majorCode: CARD8 = 0,
    pad1: BYTE = 0,
    pad3: CARD32 = 0,
    pad4: CARD32 = 0,
    pad5: CARD32 = 0,
    pad6: CARD32 = 0,
    pad7: CARD32 = 0,
};
pub const xReply = extern union {
    generic: xGenericReply,
    geom: xGetGeometryReply,
    tree: xQueryTreeReply,
    atom: xInternAtomReply,
    atomName: xGetAtomNameReply,
    property: xGetPropertyReply,
    listProperties: xListPropertiesReply,
    selection: xGetSelectionOwnerReply,
    grabPointer: xGrabPointerReply,
    grabKeyboard: xGrabKeyboardReply,
    pointer: xQueryPointerReply,
    motionEvents: xGetMotionEventsReply,
    coords: xTranslateCoordsReply,
    inputFocus: xGetInputFocusReply,
    textExtents: xQueryTextExtentsReply,
    fonts: xListFontsReply,
    fontPath: xGetFontPathReply,
    image: xGetImageReply,
    colormaps: xListInstalledColormapsReply,
    allocColor: xAllocColorReply,
    allocNamedColor: xAllocNamedColorReply,
    colorCells: xAllocColorCellsReply,
    colorPlanes: xAllocColorPlanesReply,
    colors: xQueryColorsReply,
    lookupColor: xLookupColorReply,
    bestSize: xQueryBestSizeReply,
    extension: xQueryExtensionReply,
    extensions: xListExtensionsReply,
    setModifierMapping: xSetModifierMappingReply,
    getModifierMapping: xGetModifierMappingReply,
    setPointerMapping: xSetPointerMappingReply,
    getKeyboardMapping: xGetKeyboardMappingReply,
    getPointerMapping: xGetPointerMappingReply,
    pointerControl: xGetPointerControlReply,
    screenSaver: xGetScreenSaverReply,
    hosts: xListHostsReply,
    @"error": xError,
    event: xEvent,
};
pub extern fn time(__timer: [*c]time_t) time_t;
pub const struct_shminfo = extern struct {
    shmmax: __syscall_ulong_t = 0,
    shmmin: __syscall_ulong_t = 0,
    shmmni: __syscall_ulong_t = 0,
    shmseg: __syscall_ulong_t = 0,
    shmall: __syscall_ulong_t = 0,
    __glibc_reserved1: __syscall_ulong_t = 0,
    __glibc_reserved2: __syscall_ulong_t = 0,
    __glibc_reserved3: __syscall_ulong_t = 0,
    __glibc_reserved4: __syscall_ulong_t = 0,
};
pub const ShmSeg = c_ulong;
pub const XShmSegmentInfo = extern struct {
    shmseg: ShmSeg = 0,
    shmid: c_int = 0,
    shmaddr: [*c]u8 = null,
    readOnly: c_int = 0,
};
pub const pointer = ?*anyopaque;
pub const SDL_DYNX11FN_XTranslateCoordinates = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]Window) callconv(.c) c_int;
pub extern var X11_XTranslateCoordinates: SDL_DYNX11FN_XTranslateCoordinates;
pub const PendingFocusEnum = c_uint;
pub const struct_FcitxClient = extern struct {
    dbus: [*c]SDL_DBusContext = null,
    ic_path: [*c]u8 = null,
    id: c_int = 0,
    cursor_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const FcitxClient = struct_FcitxClient;
pub var fcitx_client: FcitxClient = @import("std").mem.zeroes(FcitxClient);
pub fn GetAppName() callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var exe_name: [*c]const u8 = SDL_GetExeName();
    _ = &exe_name;
    if (exe_name != null) {
        return exe_name;
    }
    return "SDL_App";
}
pub fn Fcitx_GetPreeditString(dbus: [*c]SDL_DBusContext, msg: ?*DBusMessage, ret: [*c][*c]u8, start_pos: [*c]Sint32, end_pos: [*c]Sint32) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var text: [*c]u8 = null;
    _ = &text;
    var subtext: [*c]u8 = undefined;
    _ = &subtext;
    var text_bytes: usize = 0;
    _ = &text_bytes;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    var array: DBusMessageIter = undefined;
    _ = &array;
    var sub: DBusMessageIter = undefined;
    _ = &sub;
    var p_start_pos: Sint32 = -@as(c_int, 1);
    _ = &p_start_pos;
    var p_end_pos: Sint32 = -@as(c_int, 1);
    _ = &p_end_pos;
    _ = dbus.*.message_iter_init.?(msg, &iter);
    if (dbus.*.message_iter_get_arg_type.?(&iter) == @as(c_int, 'a')) {
        var pos: usize = 0;
        _ = &pos;
        dbus.*.message_iter_recurse.?(&iter, &array);
        while (dbus.*.message_iter_get_arg_type.?(&array) == @as(c_int, 'r')) {
            dbus.*.message_iter_recurse.?(&array, &sub);
            subtext = null;
            if (dbus.*.message_iter_get_arg_type.?(&sub) == @as(c_int, 's')) {
                dbus.*.message_iter_get_basic.?(&sub, @ptrCast(@alignCast(&subtext)));
                if ((subtext != null) and (@as(c_int, subtext.*) != 0)) {
                    text_bytes +%= SDL_strlen_REAL(subtext);
                }
            }
            _ = dbus.*.message_iter_next.?(&sub);
            if ((dbus.*.message_iter_get_arg_type.?(&sub) == @as(c_int, 'i')) and (p_end_pos == -@as(c_int, 1))) {
                var @"type": Sint32 = undefined;
                _ = &@"type";
                dbus.*.message_iter_get_basic.?(&sub, @ptrCast(@alignCast(&@"type")));
                if ((@"type" & (@as(c_int, 1) << @intCast(@as(c_int, 4)))) != 0) {
                    if (p_start_pos == -@as(c_int, 1)) {
                        p_start_pos = @bitCast(@as(c_uint, @truncate(pos)));
                    }
                } else if ((p_start_pos != -@as(c_int, 1)) and (p_end_pos == -@as(c_int, 1))) {
                    p_end_pos = @bitCast(@as(c_uint, @truncate(pos)));
                }
            }
            _ = dbus.*.message_iter_next.?(&array);
            if ((subtext != null) and (@as(c_int, subtext.*) != 0)) {
                pos +%= SDL_utf8strlen_REAL(subtext);
            }
        }
        if ((p_start_pos != -@as(c_int, 1)) and (p_end_pos == -@as(c_int, 1))) {
            p_end_pos = @bitCast(@as(c_uint, @truncate(pos)));
        }
        if (text_bytes != 0) {
            text = @ptrCast(@alignCast(SDL_malloc_REAL(text_bytes +% @as(usize, 1))));
        }
        if (text != null) {
            var pivot: [*c]u8 = text;
            _ = &pivot;
            dbus.*.message_iter_recurse.?(&iter, &array);
            while (dbus.*.message_iter_get_arg_type.?(&array) == @as(c_int, 'r')) {
                dbus.*.message_iter_recurse.?(&array, &sub);
                if (dbus.*.message_iter_get_arg_type.?(&sub) == @as(c_int, 's')) {
                    dbus.*.message_iter_get_basic.?(&sub, @ptrCast(@alignCast(&subtext)));
                    if ((subtext != null) and (@as(c_int, subtext.*) != 0)) {
                        var length: usize = SDL_strlen_REAL(subtext);
                        _ = &length;
                        _ = SDL_strlcpy_REAL(pivot, subtext, length +% @as(usize, 1));
                        pivot += length;
                    }
                }
                _ = dbus.*.message_iter_next.?(&array);
            }
        } else {
            text_bytes = 0;
        }
    }
    ret.* = text;
    start_pos.* = p_start_pos;
    end_pos.* = p_end_pos;
    return text_bytes;
}
pub fn Fcitx_GetPreeditCursorByte(dbus: [*c]SDL_DBusContext, msg: ?*DBusMessage) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    var byte: Sint32 = -@as(c_int, 1);
    _ = &byte;
    var iter: DBusMessageIter = undefined;
    _ = &iter;
    _ = dbus.*.message_iter_init.?(msg, &iter);
    _ = dbus.*.message_iter_next.?(&iter);
    if (dbus.*.message_iter_get_arg_type.?(&iter) != @as(c_int, 'i')) {
        return -@as(c_int, 1);
    }
    dbus.*.message_iter_get_basic.?(&iter, @ptrCast(@alignCast(&byte)));
    return byte;
}
pub fn DBus_MessageFilter(_: ?*DBusConnection, msg: ?*DBusMessage, data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = @ptrCast(@alignCast(data));
    _ = &dbus;
    if (dbus.*.message_is_signal.?(msg, "org.fcitx.Fcitx.InputContext1", "CommitString") != 0) {
        var iter: DBusMessageIter = undefined;
        _ = &iter;
        var text: [*c]const u8 = null;
        _ = &text;
        _ = dbus.*.message_iter_init.?(msg, &iter);
        dbus.*.message_iter_get_basic.?(&iter, @ptrCast(@alignCast(&text)));
        SDL_SendKeyboardText(text);
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    if (dbus.*.message_is_signal.?(msg, "org.fcitx.Fcitx.InputContext1", "UpdateFormattedPreedit") != 0) {
        var text: [*c]u8 = null;
        _ = &text;
        var start_pos: Sint32 = undefined;
        _ = &start_pos;
        var end_pos: Sint32 = undefined;
        _ = &end_pos;
        var text_bytes: usize = Fcitx_GetPreeditString(dbus, msg, &text, &start_pos, &end_pos);
        _ = &text_bytes;
        if (text_bytes != 0) {
            if (start_pos == -@as(c_int, 1)) {
                var byte_pos: Sint32 = Fcitx_GetPreeditCursorByte(dbus, msg);
                _ = &byte_pos;
                start_pos = @bitCast(@as(c_uint, @truncate(if (byte_pos >= @as(c_int, 0)) SDL_utf8strnlen_REAL(text, @bitCast(@as(c_long, byte_pos))) else @as(usize, @bitCast(@as(c_long, -@as(c_int, 1)))))));
            }
            SDL_SendEditingText(text, start_pos, if (end_pos >= @as(c_int, 0)) end_pos - start_pos else -@as(c_int, 1));
            SDL_free_REAL(@ptrCast(@alignCast(text)));
        } else {
            SDL_SendEditingText("", 0, 0);
        }
        SDL_Fcitx_UpdateTextInputArea(SDL_GetKeyboardFocus_REAL());
        return DBUS_HANDLER_RESULT_HANDLED;
    }
    return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
}
pub fn FcitxClientICCallMethod(client: [*c]FcitxClient, method: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(client.*.ic_path != null)) {
        return;
    }
    _ = SDL_DBus_CallVoidMethod("org.freedesktop.portal.Fcitx", client.*.ic_path, "org.fcitx.Fcitx.InputContext1", method, @as(c_int, '\x00'));
}
pub fn Fcitx_SetCapabilities(data: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var client: [*c]FcitxClient = @ptrCast(@alignCast(data));
    _ = &client;
    var caps: Uint64 = 0;
    _ = &caps;
    if (!(client.*.ic_path != null)) {
        return;
    }
    if ((hint != null) and (SDL_strstr_REAL(hint, "composition") != null)) {
        caps |= @bitCast(@as(c_long, @as(c_int, 1) << @intCast(@as(c_int, 1))));
        caps |= @bitCast(@as(c_long, @as(c_int, 1) << @intCast(@as(c_int, 4))));
    }
    if ((hint != null) and (SDL_strstr_REAL(hint, "candidates") != null)) {}
    _ = SDL_DBus_CallVoidMethod("org.freedesktop.portal.Fcitx", client.*.ic_path, "org.fcitx.Fcitx.InputContext1", "SetCapability", @as(c_int, 't'), &caps, @as(c_int, '\x00'));
}
pub fn FcitxCreateInputContext(dbus: [*c]SDL_DBusContext, arg_appname: [*c]const u8, ic_path: [*c][*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var appname = arg_appname;
    _ = &appname;
    var program: [*c]const u8 = "program";
    _ = &program;
    var result: bool = @"false" != 0;
    _ = &result;
    if ((dbus != null) and (dbus.*.session_conn != null)) {
        var msg: ?*DBusMessage = dbus.*.message_new_method_call.?("org.freedesktop.portal.Fcitx", "/org/freedesktop/portal/inputmethod", "org.fcitx.Fcitx.InputMethod1", "CreateInputContext");
        _ = &msg;
        if (msg != null) {
            var reply: ?*DBusMessage = null;
            _ = &reply;
            var args: DBusMessageIter = undefined;
            _ = &args;
            var array: DBusMessageIter = undefined;
            _ = &array;
            var sub: DBusMessageIter = undefined;
            _ = &sub;
            dbus.*.message_iter_init_append.?(msg, &args);
            _ = dbus.*.message_iter_open_container.?(&args, @as(c_int, 'a'), "(ss)", &array);
            _ = dbus.*.message_iter_open_container.?(&array, @as(c_int, 'r'), null, &sub);
            _ = dbus.*.message_iter_append_basic.?(&sub, @as(c_int, 's'), @ptrCast(@alignCast(&program)));
            _ = dbus.*.message_iter_append_basic.?(&sub, @as(c_int, 's'), @ptrCast(@alignCast(&appname)));
            _ = dbus.*.message_iter_close_container.?(&array, &sub);
            _ = dbus.*.message_iter_close_container.?(&args, &array);
            reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, 300, null);
            if (reply != null) {
                if (dbus.*.message_get_args.?(reply, null, @as(c_int, 'o'), ic_path, @as(c_int, '\x00')) != 0) {
                    result = @"true" != 0;
                }
                dbus.*.message_unref.?(reply);
            }
            dbus.*.message_unref.?(msg);
        }
    }
    return result;
}
pub fn FcitxClientCreateIC(client: [*c]FcitxClient) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var appname: [*c]const u8 = GetAppName();
    _ = &appname;
    var ic_path: [*c]u8 = null;
    _ = &ic_path;
    var dbus: [*c]SDL_DBusContext = client.*.dbus;
    _ = &dbus;
    if (!FcitxCreateInputContext(dbus, appname, &ic_path)) {
        ic_path = null;
    }
    if (ic_path != null) {
        SDL_free_REAL(@ptrCast(@alignCast(client.*.ic_path)));
        client.*.ic_path = SDL_strdup_REAL(ic_path);
        dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.fcitx.Fcitx.InputContext1'", null);
        _ = dbus.*.connection_add_filter.?(dbus.*.session_conn, &DBus_MessageFilter, @ptrCast(@alignCast(dbus)), null);
        dbus.*.connection_flush.?(dbus.*.session_conn);
        _ = SDL_AddHintCallback_REAL("SDL_IME_IMPLEMENTED_UI", Fcitx_SetCapabilities, @ptrCast(@alignCast(client)));
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn Fcitx_ModState() callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var fcitx_mods: Uint32 = 0;
    _ = &fcitx_mods;
    var sdl_mods: SDL_Keymod = SDL_GetModState_REAL();
    _ = &sdl_mods;
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & SDL_KMOD_CAPS) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & SDL_KMOD_NUM) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 4))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & SDL_KMOD_MODE) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 7))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & SDL_KMOD_LGUI) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 6))));
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_mods)))) & SDL_KMOD_RGUI) != 0) {
        fcitx_mods |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 28))));
    }
    return fcitx_mods;
}
pub const shminfo = struct_shminfo;
