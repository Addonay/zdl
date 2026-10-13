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
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __mode_t = c_uint;
pub const __pid_t = c_int;
pub const __time_t = c_long;
pub const __key_t = c_int;
pub const __syscall_ulong_t = c_ulong;
pub const pid_t = __pid_t;
pub const key_t = __key_t;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strlcat_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_StepUTF8_REAL(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32;
pub extern fn SDL_UCS4ToUTF8_REAL(codepoint: Uint32, dst: [*c]u8) [*c]u8;
pub extern fn SDL_asprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_ceilf_REAL(x: f32) f32;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub extern fn SDL_lroundf_REAL(x: f32) c_long;
pub extern fn SDL_iconv_string_REAL(tocode: [*c]const u8, fromcode: [*c]const u8, inbuf: [*c]const u8, inbytesleft: usize) [*c]u8;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
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
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
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
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_BlitSurfaceScaled_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const SDL_SYSTEM_THEME_LIGHT: c_int = 1;
pub const SDL_SYSTEM_THEME_DARK: c_int = 2;
pub const enum_SDL_SystemTheme = c_uint;
pub const SDL_SystemTheme = enum_SDL_SystemTheme;
pub const XID = c_ulong;
pub const RRMode = XID;
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
pub const enum_SDL_DisplayOrientation = c_uint;
pub const SDL_DisplayOrientation = enum_SDL_DisplayOrientation;
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
const struct_unnamed_10 = extern struct {
    type: BYTE = 0,
    detail: BYTE = 0,
    sequenceNumber: CARD16 = 0,
};
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
const struct_unnamed_13 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    mode: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
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
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
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
pub const SDL_Keymod = Uint16;
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
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
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
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const struct_SDL_GLContextState = opaque {
};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;
pub const SDL_EGLAttrib = isize;
pub const SDL_EGLint = c_int;
pub const SDL_EGLAttribArrayCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (userdata: ?*anyopaque, display: SDL_EGLDisplay, config: SDL_EGLConfig) callconv(.c) [*c]SDL_EGLint;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_Locale = extern struct {
    language: [*c]const u8 = null,
    country: [*c]const u8 = null,
};
pub const SDL_Locale = struct_SDL_Locale;
pub extern fn SDL_GetPreferredLocales_REAL(count: [*c]c_int) [*c][*c]SDL_Locale;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = 0,
    buttonID: c_int = 0,
    text: [*c]const u8 = null,
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const SDL_MESSAGEBOX_COLOR_BACKGROUND: c_int = 0;
pub const SDL_MESSAGEBOX_COLOR_TEXT: c_int = 1;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BORDER: c_int = 2;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND: c_int = 3;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED: c_int = 4;
pub const SDL_MESSAGEBOX_COLOR_COUNT: c_int = 5;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = 0,
    window: [*c]SDL_Window = null,
    title: [*c]const u8 = null,
    message: [*c]const u8 = null,
    numbuttons: c_int = 0,
    buttons: [*c]const SDL_MessageBoxButtonData = null,
    colorScheme: [*c]const SDL_MessageBoxColorScheme = null,
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub const SDL_MetalView = ?*anyopaque;
pub extern fn SDL_startswith(string: [*c]const u8, prefix: [*c]const u8) bool;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_SDL_ListNode = extern struct {
    entry: ?*anyopaque = null,
    next: [*c]struct_SDL_ListNode = null,
};
pub const SDL_ListNode = struct_SDL_ListNode;
pub extern fn SDL_ListAdd(head: [*c][*c]SDL_ListNode, ent: ?*anyopaque) bool;
pub extern fn SDL_ListClear(head: [*c][*c]SDL_ListNode) void;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const struct_VkAllocationCallbacks = opaque {};
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
pub const SDL_VideoDisplay = struct_SDL_VideoDisplay;
const struct_unnamed_63 = extern struct {
    red_size: c_int = 0,
    green_size: c_int = 0,
    blue_size: c_int = 0,
    alpha_size: c_int = 0,
    depth_size: c_int = 0,
    buffer_size: c_int = 0,
    stencil_size: c_int = 0,
    double_buffer: c_int = 0,
    accum_red_size: c_int = 0,
    accum_green_size: c_int = 0,
    accum_blue_size: c_int = 0,
    accum_alpha_size: c_int = 0,
    stereo: c_int = 0,
    multisamplebuffers: c_int = 0,
    multisamplesamples: c_int = 0,
    floatbuffers: c_int = 0,
    accelerated: c_int = 0,
    major_version: c_int = 0,
    minor_version: c_int = 0,
    flags: c_int = 0,
    profile_mask: c_int = 0,
    share_with_current_context: c_int = 0,
    release_behavior: c_int = 0,
    reset_notification: c_int = 0,
    framebuffer_srgb_capable: c_int = 0,
    no_error: c_int = 0,
    retained_backing: c_int = 0,
    egl_platform: c_int = 0,
    driver_loaded: c_int = 0,
    HAS_GL_ARB_color_buffer_float: c_int = 0,
    driver_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    dll_handle: ?*SDL_SharedObject = null,
};
const struct_unnamed_64 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const SDL_VideoData = struct_SDL_VideoData;
const struct_unnamed_65 = extern struct {
    major: c_int = 0,
    minor: c_int = 0,
};
pub const enum_SDL_GLSwapIntervalTearBehavior = c_uint;
pub const SDL_GLSwapIntervalTearBehavior = enum_SDL_GLSwapIntervalTearBehavior;
pub const GLubyte = u8;
pub const __GLXextFuncPtr = ?*const fn () callconv(.c) void;
pub const struct___GLXcontextRec = opaque {};
pub const GLXContext = ?*struct___GLXcontextRec;
pub const struct___GLXFBConfigRec = opaque {};
pub const GLXFBConfig = ?*struct___GLXFBConfigRec;
pub const GLXDrawable = XID;
pub const struct_SDL_GLDriverData = extern struct {
    errorBase: c_int = 0,
    eventBase: c_int = 0,
    HAS_GLX_EXT_visual_rating: bool = false,
    HAS_GLX_EXT_visual_info: bool = false,
    HAS_GLX_EXT_swap_control_tear: bool = false,
    HAS_GLX_ARB_context_flush_control: bool = false,
    HAS_GLX_ARB_create_context_robustness: bool = false,
    HAS_GLX_ARB_create_context_no_error: bool = false,
    HAS_GLX_ARB_framebuffer_sRGB: bool = false,
    es_profile_max_supported_version: struct_unnamed_65 = @import("std").mem.zeroes(struct_unnamed_65),
    swap_interval_tear_behavior: SDL_GLSwapIntervalTearBehavior = @import("std").mem.zeroes(SDL_GLSwapIntervalTearBehavior),
    glXQueryExtension: ?*const fn ([*c]Display, [*c]c_int, [*c]c_int) callconv(.c) c_int = null,
    glXGetProcAddress: ?*const fn ([*c]const GLubyte) callconv(.c) __GLXextFuncPtr = null,
    glXChooseVisual: ?*const fn ([*c]Display, c_int, [*c]c_int) callconv(.c) [*c]XVisualInfo = null,
    glXCreateContext: ?*const fn ([*c]Display, [*c]XVisualInfo, GLXContext, c_int) callconv(.c) GLXContext = null,
    glXCreateContextAttribsARB: ?*const fn ([*c]Display, GLXFBConfig, GLXContext, c_int, [*c]const c_int) callconv(.c) GLXContext = null,
    glXChooseFBConfig: ?*const fn ([*c]Display, c_int, [*c]const c_int, [*c]c_int) callconv(.c) [*c]GLXFBConfig = null,
    glXGetVisualFromFBConfig: ?*const fn ([*c]Display, GLXFBConfig) callconv(.c) [*c]XVisualInfo = null,
    glXDestroyContext: ?*const fn ([*c]Display, GLXContext) callconv(.c) void = null,
    glXMakeCurrent: ?*const fn ([*c]Display, GLXDrawable, GLXContext) callconv(.c) c_int = null,
    glXSwapBuffers: ?*const fn ([*c]Display, GLXDrawable) callconv(.c) void = null,
    glXQueryDrawable: ?*const fn ([*c]Display, GLXDrawable, c_int, [*c]c_uint) callconv(.c) void = null,
    glXSwapIntervalEXT: ?*const fn ([*c]Display, GLXDrawable, c_int) callconv(.c) void = null,
    glXSwapIntervalSGI: ?*const fn (c_int) callconv(.c) c_int = null,
    glXSwapIntervalMESA: ?*const fn (c_int) callconv(.c) c_int = null,
    glXGetSwapIntervalMESA: ?*const fn () callconv(.c) c_int = null,
};
pub const struct_SDL_EGL_VideoData_66 = opaque {};
pub const struct_SDL_PrivateGLESData_67 = opaque {};
pub const struct_SDL_VideoDevice = extern struct {
    name: [*c]const u8 = null,
    VideoInit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    VideoQuit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    ResetTouch: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    RefreshDisplays: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GetDisplayBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayUsableBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayModes: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) callconv(.c) bool = null,
    SetDisplayMode: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) callconv(.c) bool = null,
    CreateSDLWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool = null,
    SetWindowTitle: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowIcon: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) callconv(.c) bool = null,
    SetWindowPosition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMinimumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMaximumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowAspectRatio: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    GetWindowBordersSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) callconv(.c) bool = null,
    GetWindowContentScale: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) f32 = null,
    GetWindowSizeInPixels: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) callconv(.c) void = null,
    SetWindowOpacity: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) callconv(.c) bool = null,
    SetWindowParent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowModal: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) callconv(.c) bool = null,
    ShowWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    HideWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RaiseWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MaximizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MinimizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RestoreWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowBordered: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) callconv(.c) void = null,
    SetWindowResizable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, resizable: bool) callconv(.c) void = null,
    SetWindowAlwaysOnTop: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, on_top: bool) callconv(.c) void = null,
    SetWindowFullscreen: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) callconv(.c) SDL_FullscreenResult = null,
    GetWindowICCProfile: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    GetDisplayForWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_DisplayID = null,
    SetWindowMouseRect: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowMouseGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    SetWindowKeyboardGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    DestroyWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    CreateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, format: [*c]SDL_PixelFormat, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool = null,
    SetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: c_int) callconv(.c) bool = null,
    GetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: [*c]c_int) callconv(.c) bool = null,
    UpdateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) callconv(.c) bool = null,
    DestroyWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    OnWindowEnter: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    UpdateWindowShape: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, shape: [*c]SDL_Surface) callconv(.c) bool = null,
    FlashWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) callconv(.c) bool = null,
    ApplyWindowProgress: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowFocusable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) callconv(.c) bool = null,
    SetWindowFillDocument: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, fill: bool) callconv(.c) bool = null,
    SyncWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ReconfigureWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) bool = null,
    GL_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    GL_GetProcAddress: ?*const fn (_this: [*c]SDL_VideoDevice, proc: [*c]const u8) callconv(.c) SDL_FunctionPointer = null,
    GL_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GL_CreateContext: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_GLContext = null,
    GL_MakeCurrent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) callconv(.c) bool = null,
    GL_GetEGLSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_EGLSurface = null,
    GL_SetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: c_int) callconv(.c) bool = null,
    GL_GetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: [*c]c_int) callconv(.c) bool = null,
    GL_SwapWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    GL_DestroyContext: ?*const fn (_this: [*c]SDL_VideoDevice, context: SDL_GLContext) callconv(.c) bool = null,
    GL_SetDefaultProfileConfig: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    Vulkan_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_GetInstanceExtensions: ?*const fn (_this: [*c]SDL_VideoDevice, count: [*c]Uint32) callconv(.c) [*c]const [*c]const u8 = null,
    Vulkan_CreateSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) callconv(.c) bool = null,
    Vulkan_DestroySurface: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) callconv(.c) void = null,
    Vulkan_GetPresentationSupport: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) callconv(.c) bool = null,
    Metal_CreateView: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_MetalView = null,
    Metal_DestroyView: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) void = null,
    Metal_GetLayer: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) ?*anyopaque = null,
    WaitEventTimeout: ?*const fn (_this: [*c]SDL_VideoDevice, timeoutNS: Sint64) callconv(.c) c_int = null,
    SendWakeupEvent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    PumpEvents: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    SuspendScreenSaver: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    StartTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) bool = null,
    StopTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    UpdateTextInputArea: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ClearComposition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    HasScreenKeyboardSupport: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    HideScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetTextInputProperties: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    GetTextMimeTypes: ?*const fn (_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) callconv(.c) [*c]const [*c]const u8 = null,
    SetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    GetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    HasClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8) callconv(.c) bool = null,
    SetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    SetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowMessageBox: ?*const fn (_this: [*c]SDL_VideoDevice, messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) callconv(.c) bool = null,
    SetWindowHitTest: ?*const fn (window: [*c]SDL_Window, enabled: bool) callconv(.c) bool = null,
    AcceptDragAndDrop: ?*const fn (window: [*c]SDL_Window, accept: bool) callconv(.c) void = null,
    ShowWindowSystemMenu: ?*const fn (window: [*c]SDL_Window, x: c_int, y: c_int) callconv(.c) void = null,
    thread: SDL_ThreadID = 0,
    checked_texture_framebuffer: bool = false,
    suspend_screensaver: bool = false,
    wakeup_window: ?*anyopaque = null,
    num_displays: c_int = 0,
    displays: [*c][*c]SDL_VideoDisplay = null,
    desktop_bounds: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    windows: [*c]SDL_Window = null,
    grabbed_window: [*c]SDL_Window = null,
    clipboard_sequence: Uint32 = 0,
    clipboard_callback: SDL_ClipboardDataCallback = null,
    clipboard_cleanup: SDL_ClipboardCleanupCallback = null,
    clipboard_userdata: ?*anyopaque = null,
    clipboard_mime_types: [*c][*c]u8 = null,
    num_clipboard_mime_types: usize = 0,
    primary_selection_text: [*c]u8 = null,
    setting_display_mode: bool = false,
    device_caps: Uint32 = 0,
    system_theme: SDL_SystemTheme = @import("std").mem.zeroes(SDL_SystemTheme),
    screen_keyboard_shown: bool = false,
    is_quitting: bool = false,
    gl_config: struct_unnamed_63 = @import("std").mem.zeroes(struct_unnamed_63),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_64 = @import("std").mem.zeroes(struct_unnamed_64),
    internal: [*c]SDL_VideoData = null,
    gl_data: [*c]struct_SDL_GLDriverData = null,
    egl_data: ?*struct_SDL_EGL_VideoData_66 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_67 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const RROutput = XID;
pub const struct_SDL_DisplayData = extern struct {
    screen: c_int = 0,
    visual: [*c]Visual = null,
    depth: c_int = 0,
    scanline_pad: c_int = 0,
    x: c_int = 0,
    y: c_int = 0,
    mode_switch_deadline_ns: Uint64 = 0,
    use_xrandr: bool = false,
    xrandr_output: RROutput = 0,
    connector_name: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const SDL_DisplayData = struct_SDL_DisplayData;
pub const struct_SDL_VideoDisplay = extern struct {
    id: SDL_DisplayID = 0,
    name: [*c]u8 = null,
    max_fullscreen_modes: c_int = 0,
    num_fullscreen_modes: c_int = 0,
    fullscreen_modes: [*c]SDL_DisplayMode = null,
    desktop_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_mode: [*c]const SDL_DisplayMode = null,
    natural_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    current_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    content_scale: f32 = 0,
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    fullscreen_active: bool = false,
    fullscreen_window: [*c]SDL_Window = null,
    device: [*c]SDL_VideoDevice = null,
    props: SDL_PropertiesID = 0,
    internal: [*c]SDL_DisplayData = null,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub const VisualID = c_ulong;
pub const Time = c_ulong;
pub const Drawable = XID;
pub const Pixmap = XID;
pub const Cursor = XID;
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
pub const XSetWindowAttributes = extern struct {
    background_pixmap: Pixmap = 0,
    background_pixel: c_ulong = 0,
    border_pixmap: Pixmap = 0,
    border_pixel: c_ulong = 0,
    bit_gravity: c_int = 0,
    win_gravity: c_int = 0,
    backing_store: c_int = 0,
    backing_planes: c_ulong = 0,
    backing_pixel: c_ulong = 0,
    save_under: c_int = 0,
    event_mask: c_long = 0,
    do_not_propagate_mask: c_long = 0,
    override_redirect: c_int = 0,
    colormap: Colormap = 0,
    cursor: Cursor = 0,
};
pub const XWindowAttributes = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    depth: c_int = 0,
    visual: [*c]Visual = null,
    root: Window = 0,
    class: c_int = 0,
    bit_gravity: c_int = 0,
    win_gravity: c_int = 0,
    backing_store: c_int = 0,
    backing_planes: c_ulong = 0,
    backing_pixel: c_ulong = 0,
    save_under: c_int = 0,
    colormap: Colormap = 0,
    map_installed: c_int = 0,
    map_state: c_int = 0,
    all_event_masks: c_long = 0,
    your_event_mask: c_long = 0,
    do_not_propagate_mask: c_long = 0,
    override_redirect: c_int = 0,
    screen: [*c]Screen = null,
};
pub const XColor = extern struct {
    pixel: c_ulong = 0,
    red: c_ushort = 0,
    green: c_ushort = 0,
    blue: c_ushort = 0,
    flags: u8 = 0,
    pad: u8 = 0,
};
pub const XPoint = extern struct {
    x: c_short = 0,
    y: c_short = 0,
};
pub const XRectangle = extern struct {
    x: c_short = 0,
    y: c_short = 0,
    width: c_ushort = 0,
    height: c_ushort = 0,
};
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int = 0,
    modifiermap: [*c]KeyCode = null,
};
pub const struct__XPrivate = opaque {};
const struct_unnamed_68 = extern struct {
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
pub const _XPrivDisplay = [*c]struct_unnamed_68;
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
const union_unnamed_69 = extern union {
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
    data: union_unnamed_69 = @import("std").mem.zeroes(union_unnamed_69),
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
pub const XFontSetExtents = extern struct {
    max_ink_extent: XRectangle = @import("std").mem.zeroes(XRectangle),
    max_logical_extent: XRectangle = @import("std").mem.zeroes(XRectangle),
};
pub const struct__XOC = opaque {
};
pub const XFontSet = ?*struct__XOC;
pub const XErrorHandler = ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int;
const struct_unnamed_73 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const XSizeHints = extern struct {
    flags: c_long = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    min_width: c_int = 0,
    min_height: c_int = 0,
    max_width: c_int = 0,
    max_height: c_int = 0,
    width_inc: c_int = 0,
    height_inc: c_int = 0,
    min_aspect: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    max_aspect: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    base_width: c_int = 0,
    base_height: c_int = 0,
    win_gravity: c_int = 0,
};
pub const XVisualInfo = extern struct {
    visual: [*c]Visual = null,
    visualid: VisualID = 0,
    screen: c_int = 0,
    depth: c_int = 0,
    class: c_int = 0,
    red_mask: c_ulong = 0,
    green_mask: c_ulong = 0,
    blue_mask: c_ulong = 0,
    colormap_size: c_int = 0,
    bits_per_rgb: c_int = 0,
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
pub const struct_ipc_perm = extern struct {
    __key: __key_t = 0,
    uid: __uid_t = 0,
    gid: __gid_t = 0,
    cuid: __uid_t = 0,
    cgid: __gid_t = 0,
    mode: __mode_t = 0,
    __seq: c_ushort = 0,
    __pad2: c_ushort = 0,
    __glibc_reserved1: __syscall_ulong_t = 0,
    __glibc_reserved2: __syscall_ulong_t = 0,
};
pub const shmatt_t = __syscall_ulong_t;
pub const struct_shmid_ds = extern struct {
    shm_perm: struct_ipc_perm = @import("std").mem.zeroes(struct_ipc_perm),
    shm_segsz: usize = 0,
    shm_atime: __time_t = 0,
    shm_dtime: __time_t = 0,
    shm_ctime: __time_t = 0,
    shm_cpid: __pid_t = 0,
    shm_lpid: __pid_t = 0,
    shm_nattch: shmatt_t = 0,
    __glibc_reserved5: __syscall_ulong_t = 0,
    __glibc_reserved6: __syscall_ulong_t = 0,
};
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
pub const struct_shm_info = extern struct {
    used_ids: c_int = 0,
    shm_tot: __syscall_ulong_t = 0,
    shm_rss: __syscall_ulong_t = 0,
    shm_swp: __syscall_ulong_t = 0,
    swap_attempts: __syscall_ulong_t = 0,
    swap_successes: __syscall_ulong_t = 0,
};
pub extern fn shmctl(__shmid: c_int, __cmd: c_int, __buf: [*c]struct_shmid_ds) c_int;
pub extern fn shmget(__key: key_t, __size: usize, __shmflg: c_int) c_int;
pub extern fn shmat(__shmid: c_int, __shmaddr: ?*const anyopaque, __shmflg: c_int) ?*anyopaque;
pub extern fn shmdt(__shmaddr: ?*const anyopaque) c_int;
pub const ShmSeg = c_ulong;
pub const XShmSegmentInfo = extern struct {
    shmseg: ShmSeg = 0,
    shmid: c_int = 0,
    shmaddr: [*c]u8 = null,
    readOnly: c_int = 0,
};
pub const XdbeBackBuffer = Drawable;
pub const XdbeSwapAction = u8;
pub const XdbeSwapInfo = extern struct {
    swap_window: Window = 0,
    swap_action: XdbeSwapAction = 0,
};
pub const Rotation = c_ushort;
pub const SubpixelOrder = c_ushort;
pub const Connection = c_ushort;
pub const pointer = ?*anyopaque;
pub const RRCrtc = XID;
pub const XRRModeFlags = c_ulong;
pub const struct__XRRModeInfo = extern struct {
    id: RRMode = 0,
    width: c_uint = 0,
    height: c_uint = 0,
    dotClock: c_ulong = 0,
    hSyncStart: c_uint = 0,
    hSyncEnd: c_uint = 0,
    hTotal: c_uint = 0,
    hSkew: c_uint = 0,
    vSyncStart: c_uint = 0,
    vSyncEnd: c_uint = 0,
    vTotal: c_uint = 0,
    name: [*c]u8 = null,
    nameLength: c_uint = 0,
    modeFlags: XRRModeFlags = 0,
};
pub const XRRModeInfo = struct__XRRModeInfo;
pub const struct__XRRScreenResources = extern struct {
    timestamp: Time = 0,
    configTimestamp: Time = 0,
    ncrtc: c_int = 0,
    crtcs: [*c]RRCrtc = null,
    noutput: c_int = 0,
    outputs: [*c]RROutput = null,
    nmode: c_int = 0,
    modes: [*c]XRRModeInfo = null,
};
pub const XRRScreenResources = struct__XRRScreenResources;
pub const struct__XRROutputInfo = extern struct {
    timestamp: Time = 0,
    crtc: RRCrtc = 0,
    name: [*c]u8 = null,
    nameLen: c_int = 0,
    mm_width: c_ulong = 0,
    mm_height: c_ulong = 0,
    connection: Connection = 0,
    subpixel_order: SubpixelOrder = 0,
    ncrtc: c_int = 0,
    crtcs: [*c]RRCrtc = null,
    nclone: c_int = 0,
    clones: [*c]RROutput = null,
    nmode: c_int = 0,
    npreferred: c_int = 0,
    modes: [*c]RRMode = null,
};
pub const XRROutputInfo = struct__XRROutputInfo;
pub const struct__XRRCrtcInfo = extern struct {
    timestamp: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_uint = 0,
    height: c_uint = 0,
    mode: RRMode = 0,
    rotation: Rotation = 0,
    noutput: c_int = 0,
    outputs: [*c]RROutput = null,
    rotations: Rotation = 0,
    npossible: c_int = 0,
    possible: [*c]RROutput = null,
};
pub const XRRCrtcInfo = struct__XRRCrtcInfo;
pub extern fn SDL_X11_LoadSymbols() bool;
pub const SDL_DYNX11FN_XAllocSizeHints = ?*const fn () callconv(.c) [*c]XSizeHints;
pub extern var X11_XAllocSizeHints: SDL_DYNX11FN_XAllocSizeHints;
pub const SDL_DYNX11FN_XChangeProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: Atom, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) c_int;
pub extern var X11_XChangeProperty: SDL_DYNX11FN_XChangeProperty;
pub const SDL_DYNX11FN_XCloseDisplay = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XCloseDisplay: SDL_DYNX11FN_XCloseDisplay;
pub const SDL_DYNX11FN_XCreatePixmap = ?*const fn (a: [*c]Display, b: Drawable, d: c_uint, e: c_uint, f: c_uint) callconv(.c) Cursor;
pub extern var X11_XCreatePixmap: SDL_DYNX11FN_XCreatePixmap;
pub const SDL_DYNX11FN_XCreateFontSet = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c][*c][*c]u8, d: [*c]c_int, e: [*c][*c]u8) callconv(.c) XFontSet;
pub extern var X11_XCreateFontSet: SDL_DYNX11FN_XCreateFontSet;
pub const SDL_DYNX11FN_XCreateGC = ?*const fn (a: [*c]Display, b: Drawable, c: c_ulong, d: [*c]XGCValues) callconv(.c) GC;
pub extern var X11_XCreateGC: SDL_DYNX11FN_XCreateGC;
pub const SDL_DYNX11FN_XSetFont = ?*const fn (a: [*c]Display, b: GC, c: Font) callconv(.c) void;
pub extern var X11_XSetFont: SDL_DYNX11FN_XSetFont;
pub const SDL_DYNX11FN_XAllocColor = ?*const fn (a: [*c]Display, b: Colormap, c: [*c]XColor) callconv(.c) c_int;
pub extern var X11_XAllocColor: SDL_DYNX11FN_XAllocColor;
pub const SDL_DYNX11FN_XCreateWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_uint, h: c_int, i: c_uint, j: [*c]Visual, k: c_ulong, l: [*c]XSetWindowAttributes) callconv(.c) Window;
pub extern var X11_XCreateWindow: SDL_DYNX11FN_XCreateWindow;
pub const SDL_DYNX11FN_XCopyArea = ?*const fn (a: [*c]Display, b: Drawable, c: Drawable, d: GC, e: c_int, f: c_int, g: c_uint, h: c_uint, i: c_int, j: c_int) callconv(.c) void;
pub extern var X11_XCopyArea: SDL_DYNX11FN_XCopyArea;
pub const SDL_DYNX11FN_XDestroyWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XDestroyWindow: SDL_DYNX11FN_XDestroyWindow;
pub const SDL_DYNX11FN_XFontsOfFontSet = ?*const fn (a: XFontSet, b: [*c][*c][*c]XFontStruct, c: [*c][*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XFontsOfFontSet: SDL_DYNX11FN_XFontsOfFontSet;
pub const SDL_DYNX11FN_XFillArc = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: c_uint, g: c_uint, h: c_int, i: c_int) callconv(.c) c_int;
pub extern var X11_XFillArc: SDL_DYNX11FN_XFillArc;
pub const SDL_DYNX11FN_XDrawString = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: [*c]const u8, g: c_int) callconv(.c) c_int;
pub extern var X11_XDrawString: SDL_DYNX11FN_XDrawString;
pub const SDL_DYNX11FN_XFillRectangle = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: c_uint, g: c_uint) callconv(.c) c_int;
pub extern var X11_XFillRectangle: SDL_DYNX11FN_XFillRectangle;
pub const SDL_DYNX11FN_XFilterEvent = ?*const fn (event: [*c]XEvent, w: Window) callconv(.c) c_int;
pub extern var X11_XFilterEvent: SDL_DYNX11FN_XFilterEvent;
pub const SDL_DYNX11FN_XFlush = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XFlush: SDL_DYNX11FN_XFlush;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XFreeFontSet = ?*const fn (a: [*c]Display, b: XFontSet) callconv(.c) void;
pub extern var X11_XFreeFontSet: SDL_DYNX11FN_XFreeFontSet;
pub const SDL_DYNX11FN_XFreeGC = ?*const fn (a: [*c]Display, b: GC) callconv(.c) c_int;
pub extern var X11_XFreeGC: SDL_DYNX11FN_XFreeGC;
pub const SDL_DYNX11FN_XFreeFont = ?*const fn (a: [*c]Display, b: [*c]XFontStruct) callconv(.c) c_int;
pub extern var X11_XFreeFont: SDL_DYNX11FN_XFreeFont;
pub const SDL_DYNX11FN_XFreePixmap = ?*const fn (a: [*c]Display, b: Pixmap) callconv(.c) c_int;
pub extern var X11_XFreePixmap: SDL_DYNX11FN_XFreePixmap;
pub const SDL_DYNX11FN_XFreeStringList = ?*const fn (a: [*c][*c]u8) callconv(.c) void;
pub extern var X11_XFreeStringList: SDL_DYNX11FN_XFreeStringList;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub extern var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes;
pub const SDL_DYNX11FN_XIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub extern var X11_XIfEvent: SDL_DYNX11FN_XIfEvent;
pub const SDL_DYNX11FN_XGrabKeyboard = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: Time) callconv(.c) c_int;
pub extern var X11_XGrabKeyboard: SDL_DYNX11FN_XGrabKeyboard;
pub const SDL_DYNX11FN_XGrabPointer = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_uint, e: c_int, f: c_int, g: Window, h: Cursor, i: Time) callconv(.c) c_int;
pub extern var X11_XGrabPointer: SDL_DYNX11FN_XGrabPointer;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XLoadQueryFont = ?*const fn (a: [*c]Display, b: [*c]const u8) callconv(.c) [*c]XFontStruct;
pub extern var X11_XLoadQueryFont: SDL_DYNX11FN_XLoadQueryFont;
pub const SDL_DYNX11FN_XLookupKeysym = ?*const fn (a: [*c]XKeyEvent, b: c_int) callconv(.c) KeySym;
pub extern var X11_XLookupKeysym: SDL_DYNX11FN_XLookupKeysym;
pub const SDL_DYNX11FN_XMapRaised = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XMapRaised: SDL_DYNX11FN_XMapRaised;
pub const SDL_DYNX11FN_XMoveWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int) callconv(.c) c_int;
pub extern var X11_XMoveWindow: SDL_DYNX11FN_XMoveWindow;
pub const SDL_DYNX11FN_XOpenDisplay = ?*const fn (a: [*c]const u8) callconv(.c) [*c]Display;
pub extern var X11_XOpenDisplay: SDL_DYNX11FN_XOpenDisplay;
pub const SDL_DYNX11FN_XInitThreads = ?*const fn () callconv(.c) c_int;
pub extern var X11_XInitThreads: SDL_DYNX11FN_XInitThreads;
pub const SDL_DYNX11FN_XPeekEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent) callconv(.c) c_int;
pub extern var X11_XPeekEvent: SDL_DYNX11FN_XPeekEvent;
pub const SDL_DYNX11FN_XGetImage = ?*const fn (a: [*c]Display, b: Drawable, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_ulong, h: c_int) callconv(.c) [*c]XImage;
pub extern var X11_XGetImage: SDL_DYNX11FN_XGetImage;
pub const SDL_DYNX11FN_XPutImage = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: [*c]XImage, e: c_int, f: c_int, g: c_int, h: c_int, i: c_uint, j: c_uint) callconv(.c) c_int;
pub extern var X11_XPutImage: SDL_DYNX11FN_XPutImage;
pub const SDL_DYNX11FN_XResizeWindow = ?*const fn (a: [*c]Display, b: Window, c: c_uint, d: c_uint) callconv(.c) c_int;
pub extern var X11_XResizeWindow: SDL_DYNX11FN_XResizeWindow;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XSetForeground = ?*const fn (a: [*c]Display, b: GC, c: c_ulong) callconv(.c) c_int;
pub extern var X11_XSetForeground: SDL_DYNX11FN_XSetForeground;
pub const SDL_DYNX11FN_XSetTransientForHint = ?*const fn (a: [*c]Display, b: Window, c: Window) callconv(.c) c_int;
pub extern var X11_XSetTransientForHint: SDL_DYNX11FN_XSetTransientForHint;
pub const SDL_DYNX11FN_XSetWMNormalHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XSizeHints) callconv(.c) void;
pub extern var X11_XSetWMNormalHints: SDL_DYNX11FN_XSetWMNormalHints;
pub const SDL_DYNX11FN_XSetWMProtocols = ?*const fn (a: [*c]Display, b: Window, c: [*c]Atom, d: c_int) callconv(.c) c_int;
pub extern var X11_XSetWMProtocols: SDL_DYNX11FN_XSetWMProtocols;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub extern var X11_XSync: SDL_DYNX11FN_XSync;
pub const SDL_DYNX11FN_XTextExtents = ?*const fn (a: [*c]XFontStruct, b: [*c]const u8, c: c_int, d: [*c]c_int, e: [*c]c_int, f: [*c]c_int, g: [*c]XCharStruct) callconv(.c) c_int;
pub extern var X11_XTextExtents: SDL_DYNX11FN_XTextExtents;
pub const SDL_DYNX11FN_XTranslateCoordinates = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]Window) callconv(.c) c_int;
pub extern var X11_XTranslateCoordinates: SDL_DYNX11FN_XTranslateCoordinates;
pub const SDL_DYNX11FN_XUngrabKeyboard = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub extern var X11_XUngrabKeyboard: SDL_DYNX11FN_XUngrabKeyboard;
pub const SDL_DYNX11FN_XUngrabPointer = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub extern var X11_XUngrabPointer: SDL_DYNX11FN_XUngrabPointer;
pub const SDL_DYNX11FN_XWithdrawWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int) callconv(.c) c_int;
pub extern var X11_XWithdrawWindow: SDL_DYNX11FN_XWithdrawWindow;
pub const SDL_DYNX11FN_Xutf8DrawString = ?*const fn (a: [*c]Display, b: Drawable, c: XFontSet, d: GC, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) void;
pub extern var X11_Xutf8DrawString: SDL_DYNX11FN_Xutf8DrawString;
pub const SDL_DYNX11FN_Xutf8TextExtents = ?*const fn (a: XFontSet, b: [*c]const u8, c: c_int, d: [*c]XRectangle, e: [*c]XRectangle) callconv(.c) c_int;
pub extern var X11_Xutf8TextExtents: SDL_DYNX11FN_Xutf8TextExtents;
pub const SDL_DYNX11FN_XExtentsOfFontSet = ?*const fn (a: XFontSet) callconv(.c) [*c]XFontSetExtents;
pub extern var X11_XExtentsOfFontSet: SDL_DYNX11FN_XExtentsOfFontSet;
pub const SDL_DYNX11FN_XContextDependentDrawing = ?*const fn (a: XFontSet) callconv(.c) c_int;
pub extern var X11_XContextDependentDrawing: SDL_DYNX11FN_XContextDependentDrawing;
pub const SDL_DYNX11FN_XShmAttach = ?*const fn (a: [*c]Display, b: [*c]XShmSegmentInfo) callconv(.c) c_int;
pub extern var X11_XShmAttach: SDL_DYNX11FN_XShmAttach;
pub const SDL_DYNX11FN_XShmDetach = ?*const fn (a: [*c]Display, b: [*c]XShmSegmentInfo) callconv(.c) c_int;
pub extern var X11_XShmDetach: SDL_DYNX11FN_XShmDetach;
pub const SDL_DYNX11FN_XShmPutImage = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: [*c]XImage, e: c_int, f: c_int, g: c_int, h: c_int, i: c_uint, j: c_uint, k: c_int) callconv(.c) c_int;
pub extern var X11_XShmPutImage: SDL_DYNX11FN_XShmPutImage;
pub const SDL_DYNX11FN_XShmGetImage = ?*const fn (a: [*c]Display, b: Drawable, c: [*c]XImage, d: c_int, e: c_int, f: c_ulong) callconv(.c) c_int;
pub extern var X11_XShmGetImage: SDL_DYNX11FN_XShmGetImage;
pub const SDL_DYNX11FN_XShmCreateImage = ?*const fn (a: [*c]Display, b: [*c]Visual, c: c_uint, d: c_int, e: [*c]u8, f: [*c]XShmSegmentInfo, g: c_uint, h: c_uint) callconv(.c) [*c]XImage;
pub extern var X11_XShmCreateImage: SDL_DYNX11FN_XShmCreateImage;
pub const SDL_DYNX11FN_XShmCreatePixmap = ?*const fn (a: [*c]Display, b: Drawable, c: [*c]u8, d: [*c]XShmSegmentInfo, e: c_uint, f: c_uint, g: c_uint) callconv(.c) Pixmap;
pub extern var X11_XShmCreatePixmap: SDL_DYNX11FN_XShmCreatePixmap;
pub const SDL_DYNX11FN_XShmQueryExtension = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XShmQueryExtension: SDL_DYNX11FN_XShmQueryExtension;
pub const SDL_DYNX11FN_XShmQueryVersion = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int, d: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XShmQueryVersion: SDL_DYNX11FN_XShmQueryVersion;
pub const SDL_DYNX11FN_XShmPixmapFormat = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XShmPixmapFormat: SDL_DYNX11FN_XShmPixmapFormat;
pub const SDL_DYNX11FN_XdbeQueryExtension = ?*const fn (dpy: [*c]Display, major_version_return: [*c]c_int, minor_version_return: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XdbeQueryExtension: SDL_DYNX11FN_XdbeQueryExtension;
pub const SDL_DYNX11FN_XdbeAllocateBackBufferName = ?*const fn (dpy: [*c]Display, window: Window, swap_action: XdbeSwapAction) callconv(.c) XdbeBackBuffer;
pub extern var X11_XdbeAllocateBackBufferName: SDL_DYNX11FN_XdbeAllocateBackBufferName;
pub const SDL_DYNX11FN_XdbeDeallocateBackBufferName = ?*const fn (dpy: [*c]Display, buffer: XdbeBackBuffer) callconv(.c) c_int;
pub extern var X11_XdbeDeallocateBackBufferName: SDL_DYNX11FN_XdbeDeallocateBackBufferName;
pub const SDL_DYNX11FN_XdbeSwapBuffers = ?*const fn (dpy: [*c]Display, swap_info: [*c]XdbeSwapInfo, num_windows: c_int) callconv(.c) c_int;
pub extern var X11_XdbeSwapBuffers: SDL_DYNX11FN_XdbeSwapBuffers;
pub const SDL_DYNX11FN_XdbeBeginIdiom = ?*const fn (dpy: [*c]Display) callconv(.c) c_int;
pub extern var X11_XdbeBeginIdiom: SDL_DYNX11FN_XdbeBeginIdiom;
pub const SDL_DYNX11FN_XdbeEndIdiom = ?*const fn (dpy: [*c]Display) callconv(.c) c_int;
pub extern var X11_XdbeEndIdiom: SDL_DYNX11FN_XdbeEndIdiom;
pub const SDL_DYNX11FN_XRRQueryExtension = ?*const fn (dpy: [*c]Display, event_base_return: [*c]c_int, error_base_return: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XRRQueryExtension: SDL_DYNX11FN_XRRQueryExtension;
pub const SDL_DYNX11FN_XRRGetScreenResourcesCurrent = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) [*c]XRRScreenResources;
pub extern var X11_XRRGetScreenResourcesCurrent: SDL_DYNX11FN_XRRGetScreenResourcesCurrent;
pub const SDL_DYNX11FN_XRRFreeScreenResources = ?*const fn (resources: [*c]XRRScreenResources) callconv(.c) void;
pub extern var X11_XRRFreeScreenResources: SDL_DYNX11FN_XRRFreeScreenResources;
pub const SDL_DYNX11FN_XRRGetOutputInfo = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, output: RROutput) callconv(.c) [*c]XRROutputInfo;
pub extern var X11_XRRGetOutputInfo: SDL_DYNX11FN_XRRGetOutputInfo;
pub const SDL_DYNX11FN_XRRFreeOutputInfo = ?*const fn (outputInfo: [*c]XRROutputInfo) callconv(.c) void;
pub extern var X11_XRRFreeOutputInfo: SDL_DYNX11FN_XRRFreeOutputInfo;
pub const SDL_DYNX11FN_XRRGetCrtcInfo = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, crtc: RRCrtc) callconv(.c) [*c]XRRCrtcInfo;
pub extern var X11_XRRGetCrtcInfo: SDL_DYNX11FN_XRRGetCrtcInfo;
pub const SDL_DYNX11FN_XRRFreeCrtcInfo = ?*const fn (crtcInfo: [*c]XRRCrtcInfo) callconv(.c) void;
pub extern var X11_XRRFreeCrtcInfo: SDL_DYNX11FN_XRRFreeCrtcInfo;
pub const SDL_DYNX11FN_XRRGetOutputPrimary = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) RROutput;
pub extern var X11_XRRGetOutputPrimary: SDL_DYNX11FN_XRRGetOutputPrimary;
pub extern var SDL_X11_HAVE_UTF8: c_int;
pub extern var SDL_X11_HAVE_SHM: c_int;
pub extern var SDL_X11_HAVE_XDBE: c_int;
pub const struct__XSettingsColor = extern struct {
    red: c_ushort = 0,
    green: c_ushort = 0,
    blue: c_ushort = 0,
    alpha: c_ushort = 0,
};
pub const XSettingsColor = struct__XSettingsColor;
const union_unnamed_84 = extern union {
    v_int: c_int,
    v_string: [*c]u8,
    v_color: XSettingsColor,
};
pub const struct__XSettingsSetting = extern struct {
    name: [*c]u8 = null,
    type: XSettingsType = @import("std").mem.zeroes(XSettingsType),
    data: union_unnamed_84 = @import("std").mem.zeroes(union_unnamed_84),
    last_change_serial: c_ulong = 0,
};
pub const XSettingsSetting = struct__XSettingsSetting;
pub const XSettingsType = c_uint;
pub const XSettingsAction = c_uint;
pub const XSettingsNotifyFunc = ?*const fn (name: [*c]const u8, action: XSettingsAction, setting: [*c]XSettingsSetting, cb_data: ?*anyopaque) callconv(.c) void;
pub const XSettingsWatchFunc = ?*const fn (window: Window, is_start: c_int, mask: c_long, cb_data: ?*anyopaque) callconv(.c) c_int;
pub extern fn xsettings_client_new(display: [*c]Display, screen: c_int, notify: XSettingsNotifyFunc, watch: XSettingsWatchFunc, cb_data: ?*anyopaque) ?*XSettingsClient;
pub extern fn xsettings_client_destroy(client: ?*XSettingsClient) void;
pub extern fn xsettings_client_process_event(client: ?*XSettingsClient, xev: [*c]const XEvent) c_int;
pub extern fn X11_GetVisualInfoFromVisual(display: [*c]Display, visual: [*c]Visual, vinfo: [*c]XVisualInfo) bool;
pub extern fn X11_GetPixelFormatFromVisualInfo(display: [*c]Display, vinfo: [*c]XVisualInfo) SDL_PixelFormat;
pub extern fn X11_GetGlobalContentScale(display: [*c]Display, client: ?*XSettingsClient) f32;
pub extern fn glXChooseVisual(dpy: [*c]Display, screen: c_int, attribList: [*c]c_int) [*c]XVisualInfo;
pub extern fn glXCreateContext(dpy: [*c]Display, vis: [*c]XVisualInfo, shareList: GLXContext, direct: c_int) GLXContext;
pub extern fn glXDestroyContext(dpy: [*c]Display, ctx: GLXContext) void;
pub extern fn glXMakeCurrent(dpy: [*c]Display, drawable: GLXDrawable, ctx: GLXContext) c_int;
pub extern fn glXSwapBuffers(dpy: [*c]Display, drawable: GLXDrawable) void;
pub extern fn glXQueryExtension(dpy: [*c]Display, errorb: [*c]c_int, event: [*c]c_int) c_int;
pub extern fn glXChooseFBConfig(dpy: [*c]Display, screen: c_int, attribList: [*c]const c_int, nitems: [*c]c_int) [*c]GLXFBConfig;
pub extern fn glXGetVisualFromFBConfig(dpy: [*c]Display, config: GLXFBConfig) [*c]XVisualInfo;
pub extern fn glXQueryDrawable(dpy: [*c]Display, draw: GLXDrawable, attribute: c_int, value: [*c]c_uint) void;
pub extern fn glXGetProcAddress(procname: [*c]const GLubyte) ?*const fn () callconv(.c) void;
pub const PendingFocusEnum = c_uint;
pub extern fn SDL_X11_SetWindowTitle(display: [*c]Display, xwindow: Window, title: [*c]u8) bool;
pub const SDL_TOOLKIT_WINDOW_MODE_X11_DIALOG: c_int = 0;
pub const SDL_TOOLKIT_WINDOW_MODE_X11_CHILD: c_int = 1;
pub const SDL_TOOLKIT_WINDOW_MODE_X11_MENU: c_int = 2;
pub const SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP: c_int = 3;
pub const enum_SDL_ToolkitChildModeX11 = c_uint;
pub const SDL_ToolkitWindowModeX11 = enum_SDL_ToolkitChildModeX11;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_NONE: c_int = 0;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_TIS: c_int = 1;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_TIS_WIN: c_int = 2;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_TIS_MAC: c_int = 3;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_8859: c_int = 4;
pub const SDL_TOOLKIT_THAI_ENCODING_X11_UNICODE: c_int = 5;
pub const enum_SDL_ToolkitThaiEncodingX11 = c_uint;
pub const SDL_ToolkitThaiEncodingX11 = enum_SDL_ToolkitThaiEncodingX11;
pub const SDL_TOOLKIT_THAI_FONT_X11_OFFSET: c_int = 0;
pub const SDL_TOOLKIT_THAI_FONT_X11_CELL: c_int = 1;
pub const enum_SDL_ToolkitThaiFontX11 = c_uint;
pub const SDL_ToolkitThaiFontX11 = enum_SDL_ToolkitThaiFontX11;
pub const SDL_ToolkitWindowX11 = struct_SDL_ToolkitWindowX11;
pub const SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL: c_int = 0;
pub const SDL_TOOLKIT_CONTROL_STATE_X11_HOVER: c_int = 1;
pub const SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED: c_int = 2;
pub const SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED_HELD: c_int = 3;
pub const enum_SDL_ToolkitControlStateX11 = c_uint;
pub const SDL_ToolkitControlStateX11 = enum_SDL_ToolkitControlStateX11;
pub const struct_SDL_ToolkitControlX11 = extern struct {
    window: [*c]SDL_ToolkitWindowX11 = null,
    state: SDL_ToolkitControlStateX11 = @import("std").mem.zeroes(SDL_ToolkitControlStateX11),
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    selected: bool = false,
    dynamic: bool = false,
    is_default_enter: bool = false,
    is_default_esc: bool = false,
    do_size: bool = false,
    data: ?*anyopaque = null,
    func_draw: ?*const fn ([*c]struct_SDL_ToolkitControlX11) callconv(.c) void = null,
    func_calc_size: ?*const fn ([*c]struct_SDL_ToolkitControlX11) callconv(.c) void = null,
    func_on_scale_change: ?*const fn ([*c]struct_SDL_ToolkitControlX11) callconv(.c) void = null,
    func_on_state_change: ?*const fn ([*c]struct_SDL_ToolkitControlX11) callconv(.c) void = null,
    func_free: ?*const fn ([*c]struct_SDL_ToolkitControlX11) callconv(.c) void = null,
};
pub const struct_SDL_ToolkitWindowX11 = extern struct {
    origlocale: [*c]u8 = null,
    mode: SDL_ToolkitWindowModeX11 = @import("std").mem.zeroes(SDL_ToolkitWindowModeX11),
    display: [*c]Display = null,
    screen: c_int = 0,
    display_close: bool = false,
    parent_device: [*c]SDL_VideoDevice = null,
    parent: [*c]SDL_Window = null,
    tk_parent: [*c]struct_SDL_ToolkitWindowX11 = null,
    window: Window = 0,
    drawable: Drawable = 0,
    image: [*c]XImage = null,
    shm_info: XShmSegmentInfo = @import("std").mem.zeroes(XShmSegmentInfo),
    shm_bytes_per_line: c_int = 0,
    visual: [*c]Visual = null,
    vi: XVisualInfo = @import("std").mem.zeroes(XVisualInfo),
    cmap: Colormap = 0,
    ctx: GC = null,
    depth: c_int = 0,
    pixmap: bool = false,
    buf: XdbeBackBuffer = 0,
    xdbe: bool = false,
    xrandr: bool = false,
    shm: bool = false,
    shm_pixmap: c_int = 0,
    utf8: bool = false,
    wm_protocols: Atom = 0,
    wm_delete_message: Atom = 0,
    window_width: c_int = 0,
    window_height: c_int = 0,
    pixmap_width: c_int = 0,
    pixmap_height: c_int = 0,
    window_x: c_int = 0,
    window_y: c_int = 0,
    xsettings: ?*XSettingsClient = null,
    xsettings_first_time: bool = false,
    iscale: c_int = 0,
    scale: f32 = 0,
    font_set: XFontSet = null,
    font_struct: [*c]XFontStruct = null,
    thai_encoding: SDL_ToolkitThaiEncodingX11 = @import("std").mem.zeroes(SDL_ToolkitThaiEncodingX11),
    thai_font: SDL_ToolkitThaiFontX11 = @import("std").mem.zeroes(SDL_ToolkitThaiFontX11),
    color_hints: [*c]const SDL_MessageBoxColor = null,
    xcolor: [5]XColor = @import("std").mem.zeroes([5]XColor),
    xcolor_bevel_l1: XColor = @import("std").mem.zeroes(XColor),
    xcolor_bevel_l2: XColor = @import("std").mem.zeroes(XColor),
    xcolor_bevel_d: XColor = @import("std").mem.zeroes(XColor),
    xcolor_pressed: XColor = @import("std").mem.zeroes(XColor),
    xcolor_disabled_text: XColor = @import("std").mem.zeroes(XColor),
    has_focus: bool = false,
    focused_control: [*c]struct_SDL_ToolkitControlX11 = null,
    fiddled_control: [*c]struct_SDL_ToolkitControlX11 = null,
    controls: [*c][*c]struct_SDL_ToolkitControlX11 = null,
    controls_sz: usize = 0,
    dyn_controls: [*c][*c]struct_SDL_ToolkitControlX11 = null,
    dyn_controls_sz: usize = 0,
    cb_data: ?*anyopaque = null,
    cb_on_scale_change: ?*const fn ([*c]struct_SDL_ToolkitWindowX11, ?*anyopaque) callconv(.c) void = null,
    popup_windows: [*c]SDL_ListNode = null,
    e: [*c]XEvent = null,
    previous_control: [*c]struct_SDL_ToolkitControlX11 = null,
    key_control_esc: [*c]struct_SDL_ToolkitControlX11 = null,
    key_control_enter: [*c]struct_SDL_ToolkitControlX11 = null,
    last_key_pressed: KeySym = 0,
    ev_i: c_int = 0,
    ev_scale: f32 = 0,
    ev_iscale: f32 = 0,
    draw: bool = false,
    close: bool = false,
    event_mask: c_long = 0,
    fribidi: [*c]SDL_FriBidi = null,
    do_shaping: bool = false,
    th: [*c]SDL_LibThai = null,
    flip_interface: bool = false,
};
pub const SDL_ToolkitControlX11 = struct_SDL_ToolkitControlX11;
pub export fn X11Toolkit_CreateWindowStruct(parent: [*c]SDL_Window, tkparent: [*c]SDL_ToolkitWindowX11, mode: SDL_ToolkitWindowModeX11, arg_colorhints: [*c]const SDL_MessageBoxColor, create_new_display: bool) [*c]SDL_ToolkitWindowX11 {
    @setEvalBranchQuota(100000);
    var colorhints = arg_colorhints;
    _ = &colorhints;
    var window: [*c]SDL_ToolkitWindowX11 = undefined;
    _ = &window;
    var i: c_int = undefined;
    _ = &i;
    var theme: SDL_SystemTheme = undefined;
    _ = &theme;
    var xrandr_event_base: c_int = undefined;
    _ = &xrandr_event_base;
    var xrandr_error_base: c_int = undefined;
    _ = &xrandr_error_base;
    var major: c_int = undefined;
    _ = &major;
    var minor: c_int = undefined;
    _ = &minor;
    var displaydata: [*c]SDL_DisplayData = undefined;
    _ = &displaydata;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_X11_LoadSymbols()) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                _ = X11_XInitThreads.?();
                window = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitWindowX11))));
                if (!(window != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("Unable to allocate toolkit window structure");
                return null;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                window.*.mode = mode;
                window.*.tk_parent = tkparent;
                if (mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_DIALOG)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                window.*.origlocale = setlocale(__LC_ALL, null);
                if (window.*.origlocale != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                window.*.parent_device = null;
                if (create_new_display) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            10 => {
                window.*.origlocale = SDL_strdup_REAL(window.*.origlocale);
                if (!(window.*.origlocale != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                SDL_free_REAL(@ptrCast(@alignCast(window)));
                return null;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                _ = setlocale(__LC_ALL, "");
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                window.*.display = X11_XOpenDisplay.?(null);
                window.*.display_close = @"true" != 0;
                if (!(window.*.display != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            17 => {
                if (parent != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            18 => {
                window.*.xrandr = X11_XRRQueryExtension.?(window.*.display, &xrandr_event_base, &xrandr_error_base) != 0;
                window.*.shm_pixmap = False;
                window.*.shm = (if (X11_XShmQueryExtension.?(window.*.display) != 0) SDL_X11_HAVE_SHM else @"false") != 0;
                if (window.*.shm) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            19 => {
                _ = SDL_SetError_REAL("Couldn't open X11 display");
                SDL_free_REAL(@ptrCast(@alignCast(window)));
                return null;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                window.*.parent_device = SDL_GetVideoDevice();
                window.*.display = window.*.parent_device.*.internal.*.display;
                window.*.display_close = @"false" != 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (tkparent != null) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            25 => {
                window.*.display = tkparent.*.display;
                window.*.display_close = @"false" != 0;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                window.*.display = X11_XOpenDisplay.?(null);
                window.*.display_close = @"true" != 0;
                if (!(window.*.display != null)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                _ = SDL_SetError_REAL("Couldn't open X11 display");
                SDL_free_REAL(@ptrCast(@alignCast(window)));
                return null;
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                _ = X11_XShmQueryVersion.?(window.*.display, &major, &minor, &window.*.shm_pixmap);
                if (window.*.shm_pixmap != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                window.*.pixmap = @"false" != 0;
                window.*.xsettings_first_time = @"true" != 0;
                window.*.xsettings = xsettings_client_new(window.*.display, @as(_XPrivDisplay, @ptrCast(@alignCast(window.*.display))).*.default_screen, X11Toolkit_SettingsNotify, null, @ptrCast(@alignCast(window)));
                window.*.xsettings_first_time = @"false" != 0;
                window.*.scale = X11_GetGlobalContentScale(window.*.display, window.*.xsettings);
                if (window.*.scale < @as(f32, @floatFromInt(@as(c_int, 1)))) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            34 => {
                if (X11_XShmPixmapFormat.?(window.*.display) != ZPixmap) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                window.*.shm_pixmap = False;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                window.*.scale = @floatFromInt(@as(c_int, 1));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                window.*.iscale = @intFromFloat(SDL_ceilf_REAL(window.*.scale));
                if (SDL_roundf_REAL(window.*.scale) == window.*.scale) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                window.*.scale = @floatFromInt(@as(c_int, 0));
                {
                    sdl_pc = 45;
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
                X11Toolkit_InitWindowFonts(window);
                theme = SDL_SYSTEM_THEME_LIGHT;
                if (SDL_SystemTheme_Init()) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                theme = SDL_SystemTheme_Get();
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                if (!(colorhints != null)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                switch (theme) {
                    @as(SDL_SystemTheme, SDL_SYSTEM_THEME_DARK) => {
                        sdl_pc = 53;
                        continue;
                    },
                    else => {
                        sdl_pc = 54;
                        continue;
                    },
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                window.*.color_hints = colorhints;
                i = 0;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            53 => {
                colorhints = @ptrCast(@alignCast(&g_default_colors_dark));
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            54 => {
                colorhints = @ptrCast(@alignCast(&g_default_colors));
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                if (i < SDL_MESSAGEBOX_COLOR_COUNT) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                window.*.xcolor[@bitCast(@as(isize, @intCast(i)))].flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor[@bitCast(@as(isize, @intCast(i)))].red = @bitCast(@as(c_short, @truncate(@as(c_int, colorhints[@bitCast(@as(isize, @intCast(i)))].r) * @as(c_int, 257))));
                window.*.xcolor[@bitCast(@as(isize, @intCast(i)))].green = @bitCast(@as(c_short, @truncate(@as(c_int, colorhints[@bitCast(@as(isize, @intCast(i)))].g) * @as(c_int, 257))));
                window.*.xcolor[@bitCast(@as(isize, @intCast(i)))].blue = @bitCast(@as(c_short, @truncate(@as(c_int, colorhints[@bitCast(@as(isize, @intCast(i)))].b) * @as(c_int, 257))));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                i += 1;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            58 => {
                window.*.xcolor_bevel_l1.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor_bevel_l1.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 12500))));
                window.*.xcolor_bevel_l1.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 12500))));
                window.*.xcolor_bevel_l1.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 12500))));
                window.*.xcolor_bevel_l2.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor_bevel_l2.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 32500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 32500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) + @as(c_int, 32500))));
                window.*.xcolor_bevel_l2.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 32500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 32500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) + @as(c_int, 32500))));
                window.*.xcolor_bevel_l2.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 32500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 32500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) + @as(c_int, 32500))));
                window.*.xcolor_bevel_d.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor_bevel_d.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) - @as(c_int, 22500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) - @as(c_int, 22500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].red) - @as(c_int, 22500))));
                window.*.xcolor_bevel_d.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) - @as(c_int, 22500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) - @as(c_int, 22500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].green) - @as(c_int, 22500))));
                window.*.xcolor_bevel_d.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) - @as(c_int, 22500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) - @as(c_int, 22500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].blue) - @as(c_int, 22500))));
                window.*.xcolor_pressed.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor_pressed.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].red) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].red) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].red) - @as(c_int, 12500))));
                window.*.xcolor_pressed.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].green) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].green) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].green) - @as(c_int, 12500))));
                window.*.xcolor_pressed.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].blue) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].blue) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].blue) - @as(c_int, 12500))));
                window.*.xcolor_disabled_text.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                window.*.xcolor_disabled_text.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].red) + @as(c_int, 19500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].red) + @as(c_int, 19500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].red) + @as(c_int, 19500))));
                window.*.xcolor_disabled_text.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].green) + @as(c_int, 19500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].green) + @as(c_int, 19500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].green) + @as(c_int, 19500))));
                window.*.xcolor_disabled_text.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].blue) + @as(c_int, 19500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].blue) + @as(c_int, 19500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].blue) + @as(c_int, 19500))));
                window.*.parent = parent;
                if (parent != null) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                displaydata = SDL_GetDisplayDriverDataForWindow(parent);
                window.*.screen = displaydata.*.screen;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                window.*.screen = @as(_XPrivDisplay, @ptrCast(@alignCast(window.*.display))).*.default_screen;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if (mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_CHILD)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                window.*.visual = parent.*.internal.*.visual;
                window.*.cmap = parent.*.internal.*.colormap;
                _ = X11_GetVisualInfoFromVisual(window.*.display, window.*.visual, &window.*.vi);
                window.*.depth = window.*.vi.depth;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                window.*.visual = (&@as(_XPrivDisplay, @ptrCast(@alignCast(window.*.display))).*.screens[@bitCast(@as(isize, @intCast(window.*.screen)))]).*.root_visual;
                window.*.cmap = (&@as(_XPrivDisplay, @ptrCast(@alignCast(window.*.display))).*.screens[@bitCast(@as(isize, @intCast(window.*.screen)))]).*.cmap;
                window.*.depth = (&@as(_XPrivDisplay, @ptrCast(@alignCast(window.*.display))).*.screens[@bitCast(@as(isize, @intCast(window.*.screen)))]).*.root_depth;
                _ = X11_GetVisualInfoFromVisual(window.*.display, window.*.visual, &window.*.vi);
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                i = 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (i < SDL_MESSAGEBOX_COLOR_COUNT) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor[@bitCast(@as(isize, @intCast(i)))]);
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                i += 1;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor_bevel_l1);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor_bevel_l2);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor_bevel_d);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor_pressed);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &window.*.xcolor_disabled_text);
                window.*.has_focus = @"false" != 0;
                window.*.controls = null;
                window.*.controls_sz = 0;
                window.*.dyn_controls_sz = 0;
                window.*.fiddled_control = null;
                window.*.dyn_controls = null;
                window.*.popup_windows = null;
                window.*.fribidi = SDL_FriBidi_Create();
                window.*.th = SDL_LibThai_Create();
                window.*.flip_interface = X11Toolkit_ShouldFlipUI();
                return window;
            },
            else => unreachable,
        }
    }
}
pub export fn X11Toolkit_CreateWindowRes(data: [*c]SDL_ToolkitWindowX11, w: c_int, h: c_int, cx: c_int, cy: c_int, title: [*c]u8) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "X11Toolkit_CreateWindowRes".*;
    };
    _ = &static_local___func__;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var sizehints: [*c]XSizeHints = undefined;
    _ = &sizehints;
    var wnd_attr: XSetWindowAttributes = undefined;
    _ = &wnd_attr;
    var _NET_WM_WINDOW_TYPE: Atom = undefined;
    _ = &_NET_WM_WINDOW_TYPE;
    var _NET_WM_WINDOW_TYPE_DIALOG: Atom = undefined;
    _ = &_NET_WM_WINDOW_TYPE_DIALOG;
    var _NET_WM_WINDOW_TYPE_DROPDOWN_MENU: Atom = undefined;
    _ = &_NET_WM_WINDOW_TYPE_DROPDOWN_MENU;
    var _NET_WM_WINDOW_TYPE_TOOLTIP: Atom = undefined;
    _ = &_NET_WM_WINDOW_TYPE_TOOLTIP;
    var windowdata: [*c]SDL_WindowData = undefined;
    _ = &windowdata;
    var display: [*c]Display = undefined;
    _ = &display;
    var ctx_vals: XGCValues = undefined;
    _ = &ctx_vals;
    var root_win: Window = undefined;
    _ = &root_win;
    var parent_win: Window = undefined;
    _ = &parent_win;
    var gcflags: c_ulong = undefined;
    _ = &gcflags;
    var valuemask: c_ulong = undefined;
    _ = &valuemask;
    var use_xrandr_by_default: bool = undefined;
    _ = &use_xrandr_by_default;
    var _NET_WM_STATE: Atom = undefined;
    _ = &_NET_WM_STATE;
    var stateatoms: [16]Atom = undefined;
    _ = &stateatoms;
    var statecount: usize = undefined;
    _ = &statecount;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "statecount <= (sizeof(stateatoms)/sizeof(stateatoms[0]))",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var attrib: XWindowAttributes = undefined;
    _ = &attrib;
    var dummy: Window = undefined;
    _ = &dummy;
    var dev: [*c]const SDL_VideoDevice = undefined;
    _ = &dev;
    var dpy: [*c]const SDL_VideoDisplay = undefined;
    _ = &dpy;
    var dpydata: [*c]const SDL_DisplayData = undefined;
    _ = &dpydata;
    var screen_res: [*c]XRRScreenResources = undefined;
    _ = &screen_res;
    var crtc_info: [*c]XRRCrtcInfo = undefined;
    _ = &crtc_info;
    var default_out: RROutput = undefined;
    _ = &default_out;
    var out_info: [*c]XRROutputInfo = undefined;
    _ = &out_info;
    var out_info_1: [*c]XRROutputInfo = undefined;
    _ = &out_info_1;
    var xdbe_major: c_int = undefined;
    _ = &xdbe_major;
    var xdbe_minor: c_int = undefined;
    _ = &xdbe_minor;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                windowdata = null;
                display = data.*.display;
                gcflags = @bitCast(@as(c_long, (@as(c_long, 1) << @intCast(@as(c_long, 2))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))));
                use_xrandr_by_default = @"true" != 0;
                if (data.*.scale == @as(f32, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            1 => {
                if (screen_res.*.noutput > @as(c_int, 0)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            2 => {
                if (!(screen_res.*.ncrtc != 0)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            3 => {
                x = @divTrunc((&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.width - data.*.window_width, @as(c_int, 2));
                y = @divTrunc((&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.height - data.*.window_height, @as(c_int, 3));
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            4 => {
                _ = X11_XMoveWindow.?(display, data.*.window, x, y);
                data.*.window_x = x;
                data.*.window_y = y;
                sizehints = X11_XAllocSizeHints.?();
                if (sizehints != null) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            5 => {
                data.*.window_width = w;
                data.*.window_height = h;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                data.*.window_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(w, data.*.iscale))) * data.*.scale));
                data.*.window_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(h, data.*.iscale))) * data.*.scale));
                data.*.pixmap_width = w;
                data.*.pixmap_height = h;
                data.*.pixmap = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (data.*.parent != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                windowdata = data.*.parent.*.internal;
                {
                    sdl_pc = 10;
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
                valuemask = @bitCast(@as(c_long, (@as(c_long, 1) << @intCast(@as(c_long, 11))) | (@as(c_long, 1) << @intCast(@as(c_long, 13)))));
                data.*.event_mask = (((((((@as(c_long, 1) << @intCast(@as(c_long, 15))) | (@as(c_long, 1) << @intCast(@as(c_long, 2)))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 0)))) | (@as(c_long, 1) << @intCast(@as(c_long, 1)))) | (@as(c_long, 1) << @intCast(@as(c_long, 17)))) | (@as(c_long, 1) << @intCast(@as(c_long, 21)))) | (@as(c_long, 1) << @intCast(@as(c_long, 6)));
                wnd_attr.event_mask = data.*.event_mask;
                wnd_attr.colormap = data.*.cmap;
                if ((data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) or (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP))) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                valuemask |= @bitCast(@as(c_long, (@as(c_long, 1) << @intCast(@as(c_long, 9))) | (@as(c_long, 1) << @intCast(@as(c_long, 10)))));
                wnd_attr.save_under = True;
                wnd_attr.override_redirect = True;
                {
                    sdl_pc = 13;
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
                root_win = (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.root;
                if (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_CHILD)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                parent_win = windowdata.*.xwindow;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                parent_win = root_win;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                data.*.window = X11_XCreateWindow.?(display, parent_win, 0, 0, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)), 0, data.*.depth, InputOutput, data.*.visual, valuemask, &wnd_attr);
                if (data.*.window == @as(Window, None)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                return SDL_SetError_REAL("Couldn't create X window");
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if ((windowdata != null) and (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_DIALOG))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _NET_WM_STATE = X11_XInternAtom.?(display, "_NET_WM_STATE", False);
                statecount = 0;
                stateatoms[
                    blk: {
                        const ref = &statecount;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = X11_XInternAtom.?(display, "_NET_WM_STATE_SKIP_TASKBAR", False);
                stateatoms[
                    blk: {
                        const ref = &statecount;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = X11_XInternAtom.?(display, "_NET_WM_STATE_SKIP_PAGER", False);
                stateatoms[
                    blk: {
                        const ref = &statecount;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = X11_XInternAtom.?(display, "_NET_WM_STATE_FOCUSED", False);
                stateatoms[
                    blk: {
                        const ref = &statecount;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = X11_XInternAtom.?(display, "_NET_WM_STATE_MODAL", False);
                {
                    sdl_pc = 23;
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
                if ((windowdata != null) and (data.*.mode != @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_CHILD))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                _ = X11_XChangeProperty.?(display, data.*.window, _NET_WM_STATE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(@as([*c]Atom, @ptrCast(@alignCast(&stateatoms))))), @bitCast(@as(c_uint, @truncate(statecount))));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                if (!(statecount <= (@sizeOf(@TypeOf(stateatoms)) / @sizeOf(@TypeOf(stateatoms[@as(c_int, 0)]))))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11toolkit.c", 1273);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                _ = X11_XSetTransientForHint.?(display, data.*.window, windowdata.*.xwindow);
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
                if (data.*.tk_parent != null) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                _ = X11_XSetTransientForHint.?(display, data.*.window, data.*.tk_parent.*.window);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                _ = SDL_X11_SetWindowTitle(display, data.*.window, title);
                if (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_DIALOG)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                _NET_WM_WINDOW_TYPE = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE", False);
                _NET_WM_WINDOW_TYPE_DIALOG = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE_DIALOG", False);
                _ = X11_XChangeProperty.?(display, data.*.window, _NET_WM_WINDOW_TYPE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(&_NET_WM_WINDOW_TYPE_DIALOG)), 1);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                if (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                data.*.wm_delete_message = X11_XInternAtom.?(display, "WM_DELETE_WINDOW", False);
                _ = X11_XSetWMProtocols.?(display, data.*.window, &data.*.wm_delete_message, 1);
                data.*.wm_protocols = X11_XInternAtom.?(display, "WM_PROTOCOLS", False);
                if ((data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) or (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            44 => {
                _NET_WM_WINDOW_TYPE = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE", False);
                _NET_WM_WINDOW_TYPE_DROPDOWN_MENU = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE_DROPDOWN_MENU", False);
                _ = X11_XChangeProperty.?(display, data.*.window, _NET_WM_WINDOW_TYPE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(&_NET_WM_WINDOW_TYPE_DROPDOWN_MENU)), 1);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                _NET_WM_WINDOW_TYPE = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE", False);
                _NET_WM_WINDOW_TYPE_TOOLTIP = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE_TOOLTIP", False);
                _ = X11_XChangeProperty.?(display, data.*.window, _NET_WM_WINDOW_TYPE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(&_NET_WM_WINDOW_TYPE_TOOLTIP)), 1);
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                x = cx;
                y = cy;
                {
                    sdl_pc = 4;
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
                if (windowdata != null) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                _ = X11_XGetWindowAttributes.?(display, windowdata.*.xwindow, &attrib);
                x = attrib.x + @divTrunc(attrib.width - data.*.window_width, @as(c_int, 2));
                y = attrib.y + @divTrunc(attrib.height - data.*.window_height, @as(c_int, 3));
                _ = X11_XTranslateCoordinates.?(display, windowdata.*.xwindow, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.root, x, y, &x, &y, &dummy);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                dev = SDL_GetVideoDevice();
                if (((dev != null) and (dev.*.displays != null)) and (dev.*.num_displays > @as(c_int, 0))) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            56 => {
                dpy = dev.*.displays[@as(c_int, 0)];
                dpydata = dpy.*.internal;
                x = dpydata.*.x + @divTrunc(dpy.*.current_mode.*.w - data.*.window_width, @as(c_int, 2));
                y = dpydata.*.y + @divTrunc(dpy.*.current_mode.*.h - data.*.window_height, @as(c_int, 3));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                if (SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_XRANDR", use_xrandr_by_default) and data.*.xrandr) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                screen_res = X11_XRRGetScreenResourcesCurrent.?(display, root_win);
                if (!(screen_res != null)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 3;
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
                default_out = X11_XRRGetOutputPrimary.?(display, root_win);
                if (default_out != @as(RROutput, None)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                out_info = X11_XRRGetOutputInfo.?(display, screen_res, default_out);
                if (@as(c_int, out_info.*.connection) != RR_Connected) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            68 => {
                X11_XRRFreeOutputInfo.?(out_info);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if (out_info.*.crtc != @as(RRCrtc, None)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                crtc_info = X11_XRRGetCrtcInfo.?(display, screen_res, out_info.*.crtc);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                if (out_info.*.ncrtc > @as(c_int, 0)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (crtc_info != null) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            74 => {
                crtc_info = X11_XRRGetCrtcInfo.?(display, screen_res, out_info.*.crtcs[@as(c_int, 0)]);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                crtc_info = null;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                x = @bitCast(@as(c_uint, @truncate((crtc_info.*.width -% @as(c_uint, @bitCast(@as(c_int, data.*.window_width)))) / @as(c_uint, 2))));
                y = @bitCast(@as(c_uint, @truncate((crtc_info.*.height -% @as(c_uint, @bitCast(@as(c_int, data.*.window_height)))) / @as(c_uint, 3))));
                X11_XRRFreeOutputInfo.?(out_info);
                X11_XRRFreeCrtcInfo.?(crtc_info);
                X11_XRRFreeScreenResources.?(screen_res);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                X11_XRRFreeOutputInfo.?(out_info);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            80 => {
                out_info_1 = X11_XRRGetOutputInfo.?(display, screen_res, screen_res.*.outputs[@as(c_int, 0)]);
                if (!(out_info_1 != null)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (out_info_1.*.crtc != @as(RRCrtc, None)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                crtc_info = X11_XRRGetCrtcInfo.?(display, screen_res, out_info_1.*.crtc);
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                if (out_info_1.*.ncrtc > @as(c_int, 0)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                if (!(crtc_info != null)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            89 => {
                crtc_info = X11_XRRGetCrtcInfo.?(display, screen_res, out_info_1.*.crtcs[@as(c_int, 0)]);
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                crtc_info = null;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                X11_XRRFreeOutputInfo.?(out_info_1);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                x = @bitCast(@as(c_uint, @truncate((crtc_info.*.width -% @as(c_uint, @bitCast(@as(c_int, data.*.window_width)))) / @as(c_uint, 2))));
                y = @bitCast(@as(c_uint, @truncate((crtc_info.*.height -% @as(c_uint, @bitCast(@as(c_int, data.*.window_height)))) / @as(c_uint, 3))));
                X11_XRRFreeOutputInfo.?(out_info_1);
                X11_XRRFreeCrtcInfo.?(crtc_info);
                X11_XRRFreeScreenResources.?(screen_res);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            95 => {
                X11_XRRFreeScreenResources.?(screen_res);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                crtc_info = X11_XRRGetCrtcInfo.?(display, screen_res, screen_res.*.crtcs[@as(c_int, 0)]);
                if (crtc_info != null) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                x = @bitCast(@as(c_uint, @truncate((crtc_info.*.width -% @as(c_uint, @bitCast(@as(c_int, data.*.window_width)))) / @as(c_uint, 2))));
                y = @bitCast(@as(c_uint, @truncate((crtc_info.*.height -% @as(c_uint, @bitCast(@as(c_int, data.*.window_height)))) / @as(c_uint, 3))));
                X11_XRRFreeCrtcInfo.?(crtc_info);
                X11_XRRFreeScreenResources.?(screen_res);
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                X11_XRRFreeScreenResources.?(screen_res);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            101 => {
                sizehints.*.flags = (((@as(c_long, 1) << @intCast(@as(c_long, 0))) | (@as(c_long, 1) << @intCast(@as(c_long, 1)))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)))) | (@as(c_long, 1) << @intCast(@as(c_long, 4)));
                sizehints.*.x = x;
                sizehints.*.y = y;
                sizehints.*.width = data.*.window_width;
                sizehints.*.height = data.*.window_height;
                sizehints.*.min_width = blk: {
                    const tmp = data.*.window_width;
                    sizehints.*.max_width = tmp;
                    break :blk tmp;
                };
                sizehints.*.min_height = blk: {
                    const tmp = data.*.window_height;
                    sizehints.*.max_height = tmp;
                    break :blk tmp;
                };
                X11_XSetWMNormalHints.?(display, data.*.window, sizehints);
                _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                _ = X11_XMapRaised.?(display, data.*.window);
                data.*.drawable = data.*.window;
                if ((SDL_X11_HAVE_XDBE != 0) and !data.*.pixmap) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                if (X11_XdbeQueryExtension.?(display, &xdbe_major, &xdbe_minor) != @as(c_int, 0)) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
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
                X11Toolkit_InitWindowPixmap(data);
                _ = memset(@ptrCast(@alignCast(&ctx_vals)), 0, @sizeOf(@TypeOf(ctx_vals)));
                ctx_vals.foreground = data.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].pixel;
                ctx_vals.background = data.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].pixel;
                if (!data.*.utf8) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            107 => {
                data.*.xdbe = @"true" != 0;
                data.*.buf = X11_XdbeAllocateBackBufferName.?(display, data.*.window, XdbeUndefined);
                data.*.drawable = data.*.buf;
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                data.*.xdbe = @"false" != 0;
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            110 => {
                gcflags |= @bitCast(@as(c_long, @as(c_long, 1) << @intCast(@as(c_long, 14))));
                ctx_vals.font = data.*.font_struct.*.fid;
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                data.*.ctx = X11_XCreateGC.?(data.*.display, data.*.drawable, gcflags, &ctx_vals);
                if (data.*.ctx == @as(GC, @ptrFromInt(@as(usize, @intCast(None))))) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                return SDL_SetError_REAL("Couldn't create graphics context");
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                data.*.close = @"false" != 0;
                data.*.key_control_esc = blk: {
                    const tmp = @as([*c]struct_SDL_ToolkitControlX11, null);
                    data.*.key_control_enter = tmp;
                    break :blk tmp;
                };
                if (!data.*.pixmap) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                data.*.ev_scale = blk: {
                    const tmp = @as(f32, @floatFromInt(@as(c_int, 1)));
                    data.*.ev_iscale = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                data.*.ev_scale = data.*.scale;
                data.*.ev_iscale = @floatFromInt(data.*.iscale);
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if ((data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) or (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP))) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                _ = X11_XGrabPointer.?(display, data.*.window, False, @bitCast(@as(c_int, @truncate(((@as(c_long, 1) << @intCast(@as(c_long, 2))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 6)))))), GrabModeAsync, GrabModeAsync, None, None, CurrentTime);
                _ = X11_XGrabKeyboard.?(display, data.*.window, False, GrabModeAsync, GrabModeAsync, CurrentTime);
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn X11Toolkit_DoWindowEventLoop(data: [*c]SDL_ToolkitWindowX11) void {
    @setEvalBranchQuota(100000);
    while (!data.*.close) {
        var e: XEvent = undefined;
        _ = &e;
        _ = X11_XPeekEvent.?(data.*.display, &e);
        if (data.*.xsettings != null) {
            _ = xsettings_client_process_event(data.*.xsettings, &e);
        }
        _ = X11_XIfEvent.?(data.*.display, &e, X11Toolkit_EventTest, @ptrCast(@alignCast(data)));
        X11Toolkit_ProcessWindowEvents(data, &e);
    }
}
pub export fn X11Toolkit_ResizeWindow(data: [*c]SDL_ToolkitWindowX11, w: c_int, h: c_int) void {
    @setEvalBranchQuota(100000);
    if (!data.*.pixmap) {
        data.*.window_width = w;
        data.*.window_height = h;
    } else {
        data.*.window_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(w, data.*.iscale))) * data.*.scale));
        data.*.window_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(h, data.*.iscale))) * data.*.scale));
        data.*.pixmap_width = w;
        data.*.pixmap_height = h;
        _ = X11_XFreePixmap.?(data.*.display, data.*.drawable);
        X11Toolkit_InitWindowPixmap(data);
    }
    _ = X11_XResizeWindow.?(data.*.display, data.*.window, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)));
}
pub export fn X11Toolkit_DestroyWindow(data: [*c]SDL_ToolkitWindowX11) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (!(data != null)) {
        return;
    }
    if ((data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) or (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP))) {
        _ = X11_XUngrabPointer.?(data.*.display, CurrentTime);
        _ = X11_XUngrabKeyboard.?(data.*.display, CurrentTime);
    }
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < data.*.controls_sz) : (i += 1) {
            if (data.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_free != null) {
                data.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_free.?(data.*.controls[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(data.*.controls)));
    SDL_free_REAL(@ptrCast(@alignCast(data.*.dyn_controls)));
    if (data.*.popup_windows != null) {
        SDL_ListClear(&data.*.popup_windows);
    }
    if (data.*.pixmap) {
        _ = X11_XFreePixmap.?(data.*.display, data.*.drawable);
    }
    if (data.*.pixmap and data.*.shm) {
        _ = X11_XShmDetach.?(data.*.display, &data.*.shm_info);
        if (!(data.*.shm_pixmap != 0)) {
            _ = data.*.image.*.f.destroy_image.?(data.*.image);
        }
        _ = shmdt(@ptrCast(@alignCast(data.*.shm_info.shmaddr)));
    }
    if (data.*.font_set != null) {
        X11_XFreeFontSet.?(data.*.display, data.*.font_set);
        data.*.font_set = null;
    }
    if (data.*.font_struct != null) {
        _ = X11_XFreeFont.?(data.*.display, data.*.font_struct);
        data.*.font_struct = null;
    }
    if (((SDL_X11_HAVE_XDBE != 0) and data.*.xdbe) and !data.*.pixmap) {
        _ = X11_XdbeDeallocateBackBufferName.?(data.*.display, data.*.buf);
    }
    if (data.*.xsettings != null) {
        xsettings_client_destroy(data.*.xsettings);
    }
    _ = X11_XFreeGC.?(data.*.display, data.*.ctx);
    if (data.*.display != null) {
        if (data.*.window != @as(Window, None)) {
            _ = X11_XWithdrawWindow.?(data.*.display, data.*.window, data.*.screen);
            _ = X11_XDestroyWindow.?(data.*.display, data.*.window);
            data.*.window = None;
        }
        if (data.*.display_close) {
            _ = X11_XCloseDisplay.?(data.*.display);
        }
        data.*.display = null;
    }
    if ((data.*.origlocale != null) and (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_DIALOG))) {
        _ = setlocale(__LC_ALL, data.*.origlocale);
        SDL_free_REAL(@ptrCast(@alignCast(data.*.origlocale)));
    }
    SDL_FriBidi_Destroy(data.*.fribidi);
    SDL_LibThai_Destroy(data.*.th);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
}
pub export fn X11Toolkit_SignalWindowClose(data: [*c]SDL_ToolkitWindowX11) void {
    @setEvalBranchQuota(100000);
    data.*.close = @"true" != 0;
}

pub export fn X11Toolkit_NotifyControlOfSizeChange(control: [*c]SDL_ToolkitControlX11) bool {
    @setEvalBranchQuota(100000);
    if (control.*.func_calc_size != null) {
        control.*.func_calc_size.?(control);
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub export fn X11Toolkit_CreateIconControl(window: [*c]SDL_ToolkitWindowX11, flags: SDL_MessageBoxFlags) [*c]SDL_ToolkitControlX11 {
    @setEvalBranchQuota(100000);
    var control: [*c]SDL_ToolkitIconControlX11 = undefined;
    _ = &control;
    var base_control: [*c]SDL_ToolkitControlX11 = undefined;
    _ = &base_control;
    var font: [*c]u8 = undefined;
    _ = &font;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                control = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitIconControlX11))));
                base_control = @ptrCast(@alignCast(control));
                if (!(control != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Unable to allocate icon control structure");
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                base_control.*.window = window;
                base_control.*.func_draw = X11Toolkit_DrawIconControl;
                base_control.*.func_free = X11Toolkit_DestroyIconControl;
                base_control.*.func_on_state_change = null;
                base_control.*.func_calc_size = X11Toolkit_CalculateIconControl;
                base_control.*.func_on_scale_change = X11Toolkit_OnIconControlScaleChange;
                base_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
                base_control.*.selected = @"false" != 0;
                base_control.*.dynamic = @"false" != 0;
                base_control.*.is_default_enter = @"false" != 0;
                base_control.*.is_default_esc = @"false" != 0;
                control.*.flags = flags;
                _ = SDL_asprintf_REAL(&font, g_IconFont, G_ICONFONT_SIZE * window.*.iscale);
                control.*.icon_char_font = X11_XLoadQueryFont.?(window.*.display, font);
                SDL_free_REAL(@ptrCast(@alignCast(font)));
                if (!(control.*.icon_char_font != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_asprintf_REAL(&font, @ptrCast(@alignCast(&g_ToolkitFontLatin1)), G_TOOLKITFONT_SIZE * window.*.iscale);
                control.*.icon_char_font = X11_XLoadQueryFont.?(window.*.display, font);
                SDL_free_REAL(@ptrCast(@alignCast(font)));
                if (!(control.*.icon_char_font != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (flags & ((SDL_MESSAGEBOX_ERROR | SDL_MESSAGEBOX_WARNING) | SDL_MESSAGEBOX_INFORMATION)) {
                    SDL_MESSAGEBOX_ERROR => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_MESSAGEBOX_WARNING => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_MESSAGEBOX_INFORMATION => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            7 => {
                SDL_free_REAL(@ptrCast(@alignCast(control)));
                return null;
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
                control.*.xcolor_bg_shadow.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) > @as(c_int, 32896)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            11 => {
                control.*.icon_char = 'X';
                control.*.xcolor_white.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_white.red = 65535;
                control.*.xcolor_white.green = 65535;
                control.*.xcolor_white.blue = 65535;
                control.*.xcolor_red.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_red.red = 65535;
                control.*.xcolor_red.green = 0;
                control.*.xcolor_red.blue = 0;
                control.*.xcolor_red_darker.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_red_darker.red = 40535;
                control.*.xcolor_red_darker.green = 0;
                control.*.xcolor_red_darker.blue = 0;
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_white);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_red);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_red_darker);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                control.*.icon_char = '!';
                control.*.xcolor_black.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_black.red = 0;
                control.*.xcolor_black.green = 0;
                control.*.xcolor_black.blue = 0;
                control.*.xcolor_yellow.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_yellow.red = 65535;
                control.*.xcolor_yellow.green = 65535;
                control.*.xcolor_yellow.blue = 0;
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_black);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_yellow);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                control.*.icon_char = 'i';
                control.*.xcolor_white.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_white.red = 65535;
                control.*.xcolor_white.green = 65535;
                control.*.xcolor_white.blue = 65535;
                control.*.xcolor_blue.flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
                control.*.xcolor_blue.red = 0;
                control.*.xcolor_blue.green = 0;
                control.*.xcolor_blue.blue = 65535;
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_white);
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_blue);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                _ = X11_XFreeFont.?(window.*.display, control.*.icon_char_font);
                SDL_free_REAL(@ptrCast(@alignCast(control)));
                return null;
            },
            15 => {
                control.*.xcolor_bg_shadow.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 12500))));
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) == @as(c_int, 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) > @as(c_int, 32896)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            18 => {
                control.*.xcolor_bg_shadow.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) + @as(c_int, 9000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) + @as(c_int, 9000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) + @as(c_int, 9000))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                control.*.xcolor_bg_shadow.red = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 3000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 3000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].red) - @as(c_int, 3000))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                control.*.xcolor_bg_shadow.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 12500))));
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) == @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) > @as(c_int, 32896)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            24 => {
                control.*.xcolor_bg_shadow.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) + @as(c_int, 9000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) + @as(c_int, 9000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) + @as(c_int, 9000))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                control.*.xcolor_bg_shadow.green = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 3000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 3000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].green) - @as(c_int, 3000))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                control.*.xcolor_bg_shadow.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 12500)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 12500)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 12500))));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                if (@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) == @as(c_int, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                _ = X11_XAllocColor.?(window.*.display, window.*.cmap, &control.*.xcolor_bg_shadow);
                X11Toolkit_CalculateIconControl(base_control);
                X11Toolkit_AddControlToWindow(window, base_control);
                return base_control;
            },
            30 => {
                control.*.xcolor_bg_shadow.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) + @as(c_int, 9000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) + @as(c_int, 9000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) + @as(c_int, 9000))));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                control.*.xcolor_bg_shadow.blue = @bitCast(@as(c_short, @truncate(if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 3000)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 3000)) > @as(c_int, 65535)) @as(c_int, 65535) else @as(c_int, window.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].blue) - @as(c_int, 3000))));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11Toolkit_CreateLabelControl(window: [*c]SDL_ToolkitWindowX11, arg_utf8: [*c]u8) [*c]SDL_ToolkitControlX11 {
    @setEvalBranchQuota(100000);
    var utf8 = arg_utf8;
    _ = &utf8;
    var control: [*c]SDL_ToolkitLabelControlX11 = undefined;
    _ = &control;
    var base_control: [*c]SDL_ToolkitControlX11 = undefined;
    _ = &base_control;
    var i: c_int = undefined;
    _ = &i;
    if (!(utf8 != null)) {
        return null;
    }
    if (!(SDL_strcmp_REAL(utf8, "") != 0)) {
        return null;
    }
    control = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitLabelControlX11))));
    base_control = @ptrCast(@alignCast(control));
    if (!(control != null)) {
        _ = SDL_SetError_REAL("Unable to allocate label control structure");
        return null;
    }
    base_control.*.window = window;
    base_control.*.func_draw = X11Toolkit_DrawLabelControl;
    base_control.*.func_on_state_change = null;
    base_control.*.func_calc_size = X11Toolkit_CalculateLabelControl;
    base_control.*.func_free = X11Toolkit_DestroyLabelControl;
    base_control.*.func_on_scale_change = null;
    base_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
    base_control.*.selected = @"false" != 0;
    base_control.*.dynamic = @"false" != 0;
    base_control.*.rect.w = 0;
    base_control.*.rect.h = 0;
    base_control.*.is_default_enter = @"false" != 0;
    base_control.*.is_default_esc = @"false" != 0;
    control.*.sz = @bitCast(@as(c_long, X11Toolkit_CountLinesOfText(utf8)));
    control.*.lines = @ptrCast(@alignCast(SDL_calloc_REAL(control.*.sz, @sizeOf(SDL_ToolkitLabelControlLineX11))));
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < control.*.sz) : (i += 1) {
            var lf: [*c]const u8 = SDL_strchr_REAL(utf8, '\n');
            _ = &lf;
            const length: c_int = @bitCast(@as(c_uint, @truncate(if (lf != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(lf) -% @intFromPtr(utf8))), @sizeOf(u8))))) else SDL_strlen_REAL(utf8))));
            _ = &length;
            var sz: c_int = undefined;
            _ = &sz;
            sz = length;
            if (((lf != null) and (lf > utf8)) and (@as(c_int, lf[@bitCast(@as(isize, @intCast(-@as(c_int, 1))))]) == @as(c_int, '\r'))) {
                sz -= 1;
            }
            control.*.lines[@bitCast(@as(isize, @intCast(i)))].text = X11Toolkit_MakeTextElements(base_control.*.window, utf8, @bitCast(@as(c_long, sz)), &control.*.lines[@bitCast(@as(isize, @intCast(i)))].par);
            X11Toolkit_ShapeTextElements(base_control.*.window, control.*.lines[@bitCast(@as(isize, @intCast(i)))].text);
            utf8 += @as(usize, @bitCast(@as(isize, @intCast(length + @as(c_int, 1)))));
            if (!(lf != null)) {
                break;
            }
        }
    }
    base_control.*.do_size = @"true" != 0;
    X11Toolkit_CalculateLabelControl(base_control);
    base_control.*.do_size = @"false" != 0;
    X11Toolkit_AddControlToWindow(window, base_control);
    return base_control;
}
pub export fn X11Toolkit_GetLabelControlFirstLineHeight(control: [*c]SDL_ToolkitControlX11) c_int {
    @setEvalBranchQuota(100000);
    var label_control: [*c]SDL_ToolkitLabelControlX11 = undefined;
    _ = &label_control;
    label_control = @ptrCast(@alignCast(control));
    return label_control.*.lines[@as(c_int, 0)].rect.h;
}
pub export fn X11Toolkit_CreateButtonControl(window: [*c]SDL_ToolkitWindowX11, data: [*c]const SDL_MessageBoxButtonData) [*c]SDL_ToolkitControlX11 {
    @setEvalBranchQuota(100000);
    var control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &control;
    var base_control: [*c]SDL_ToolkitControlX11 = undefined;
    _ = &base_control;
    control = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitButtonControlX11))));
    base_control = @ptrCast(@alignCast(control));
    if (!(control != null)) {
        _ = SDL_SetError_REAL("Unable to allocate button control structure");
        return null;
    }
    base_control.*.window = window;
    base_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
    base_control.*.func_calc_size = X11Toolkit_CalculateButtonControl;
    base_control.*.func_draw = X11Toolkit_DrawButtonControl;
    base_control.*.func_on_state_change = X11Toolkit_OnButtonControlStateChange;
    base_control.*.func_free = X11Toolkit_DestroyButtonControl;
    base_control.*.func_on_scale_change = null;
    base_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
    base_control.*.selected = @"false" != 0;
    base_control.*.dynamic = @"true" != 0;
    base_control.*.is_default_enter = @"false" != 0;
    base_control.*.is_default_esc = @"false" != 0;
    if ((data.*.flags & SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT) != 0) {
        base_control.*.is_default_esc = @"true" != 0;
    }
    if ((data.*.flags & SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT) != 0) {
        base_control.*.is_default_enter = @"true" != 0;
        base_control.*.selected = @"true" != 0;
    }
    control.*.cb = null;
    control.*.data = data;
    control.*.text = X11Toolkit_MakeTextElements(base_control.*.window, @ptrCast(@alignCast(@constCast(control.*.data.*.text))), SDL_strlen_REAL(control.*.data.*.text), null);
    X11Toolkit_ShapeTextElements(base_control.*.window, control.*.text);
    base_control.*.do_size = @"true" != 0;
    X11Toolkit_CalculateButtonControl(base_control);
    base_control.*.do_size = @"false" != 0;
    X11Toolkit_AddControlToWindow(window, base_control);
    return base_control;
}
pub export fn X11Toolkit_RegisterCallbackForButtonControl(control: [*c]SDL_ToolkitControlX11, data: ?*anyopaque, cb: ?*const fn ([*c]struct_SDL_ToolkitControlX11, ?*anyopaque) callconv(.c) void) void {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    button_control.*.cb_data = data;
    button_control.*.cb = cb;
}
pub export fn X11Toolkit_GetButtonControlData(control: [*c]SDL_ToolkitControlX11) [*c]const SDL_MessageBoxButtonData {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    return button_control.*.data;
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MESSAGEBOX_ERROR = @as(c_uint, 0x00000010);
pub const SDL_MESSAGEBOX_WARNING = @as(c_uint, 0x00000020);
pub const SDL_MESSAGEBOX_INFORMATION = @as(c_uint, 0x00000040);
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = @as(c_uint, 0x00000001);
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = @as(c_uint, 0x00000002);
pub const None = @as(c_long, 0);
pub const CurrentTime = @as(c_long, 0);
pub const KeyPress = @as(c_int, 2);
pub const KeyRelease = @as(c_int, 3);
pub const ButtonPress = @as(c_int, 4);
pub const ButtonRelease = @as(c_int, 5);
pub const MotionNotify = @as(c_int, 6);
pub const FocusIn = @as(c_int, 9);
pub const FocusOut = @as(c_int, 10);
pub const Expose = @as(c_int, 12);
pub const ClientMessage = @as(c_int, 33);
pub const Button1 = @as(c_int, 1);
pub const GrabModeAsync = @as(c_int, 1);
pub const BadRequest = @as(c_int, 1);
pub const BadAccess = @as(c_int, 10);
pub const InputOutput = @as(c_int, 1);
pub const PropModeReplace = @as(c_int, 0);
pub const ZPixmap = @as(c_int, 2);
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub const XK_Tab = __helpers.promoteIntLiteral(c_int, 0xff09, .hex);
pub const XK_Return = __helpers.promoteIntLiteral(c_int, 0xff0d, .hex);
pub const XK_Escape = __helpers.promoteIntLiteral(c_int, 0xff1b, .hex);
pub const XK_Left = __helpers.promoteIntLiteral(c_int, 0xff51, .hex);
pub const XK_Right = __helpers.promoteIntLiteral(c_int, 0xff53, .hex);
pub const XK_KP_Enter = __helpers.promoteIntLiteral(c_int, 0xff8d, .hex);
pub const IPC_CREAT = @as(c_int, 0o1000);
pub const IPC_RMID = @as(c_int, 0);
pub const XdbeUndefined = @as(c_int, 0);
pub const RR_Connected = @as(c_int, 0);
pub const SDL_TOOLKIT_X11_ELEMENT_PADDING = @as(c_int, 4);
pub const SDL_TOOLKIT_X11_ELEMENT_PADDING_3 = @as(c_int, 8);
pub const shminfo = struct_shminfo;
pub const shm_info = struct_shm_info;
pub extern fn SDL_SystemTheme_Init() bool;
pub extern fn SDL_SystemTheme_Get() SDL_SystemTheme;
pub const FriBidiChar = u32;
pub const FriBidiStrIndex = c_int;
pub const FriBidiFlags = u32;
pub const FriBidiLevel = i8;
pub const FriBidiCharType = c_uint;
pub const FRIBIDI_PAR_LTR: c_int = 272;
pub const FRIBIDI_PAR_RTL: c_int = 273;
pub const FRIBIDI_PAR_ON: c_int = 64;
pub const FriBidiParType = c_uint;
pub const FriBidiJoiningType = u8;
pub const FriBidiArabicProp = u8;
pub const FriBidiCharSet = c_uint;
pub const SDL_FriBidiUnicodeToCharset = ?*const fn (FriBidiCharSet, [*c]const FriBidiChar, FriBidiStrIndex, [*c]u8) callconv(.c) FriBidiStrIndex;
pub const SDL_FriBidiCharsetToUnicode = ?*const fn (FriBidiCharSet, [*c]const u8, FriBidiStrIndex, [*c]FriBidiChar) callconv(.c) FriBidiStrIndex;
pub const SDL_FriBidiGetBidiTypes = ?*const fn ([*c]const FriBidiChar, FriBidiStrIndex, [*c]FriBidiCharType) callconv(.c) void;
pub const SDL_FriBidiGetParDirection = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex) callconv(.c) FriBidiParType;
pub const SDL_FriBidiGetParEmbeddingLevels = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex, [*c]FriBidiParType, [*c]FriBidiLevel) callconv(.c) FriBidiLevel;
pub const SDL_FriBidiGetJoiningTypes = ?*const fn ([*c]const FriBidiChar, FriBidiStrIndex, [*c]FriBidiJoiningType) callconv(.c) void;
pub const SDL_FriBidiJoinArabic = ?*const fn ([*c]const FriBidiCharType, FriBidiStrIndex, [*c]const FriBidiLevel, [*c]FriBidiArabicProp) callconv(.c) void;
pub const SDL_FriBidiShape = ?*const fn (flags: FriBidiFlags, [*c]const FriBidiLevel, FriBidiStrIndex, [*c]FriBidiArabicProp, str: [*c]FriBidiChar) callconv(.c) void;
pub const SDL_FriBidiReorderLine = ?*const fn (flags: FriBidiFlags, [*c]const FriBidiCharType, FriBidiStrIndex, FriBidiStrIndex, FriBidiParType, [*c]FriBidiLevel, [*c]FriBidiChar, [*c]FriBidiStrIndex) callconv(.c) FriBidiLevel;
pub const struct_SDL_FriBidi = extern struct {
    lib: ?*SDL_SharedObject = null,
    unicode_to_charset: SDL_FriBidiUnicodeToCharset = null,
    charset_to_unicode: SDL_FriBidiCharsetToUnicode = null,
    get_bidi_types: SDL_FriBidiGetBidiTypes = null,
    get_par_direction: SDL_FriBidiGetParDirection = null,
    get_par_embedding_levels: SDL_FriBidiGetParEmbeddingLevels = null,
    get_joining_types: SDL_FriBidiGetJoiningTypes = null,
    join_arabic: SDL_FriBidiJoinArabic = null,
    shape: SDL_FriBidiShape = null,
    reorder_line: SDL_FriBidiReorderLine = null,
};
pub const SDL_FriBidi = struct_SDL_FriBidi;
pub extern fn SDL_FriBidi_Create() [*c]SDL_FriBidi;
pub extern fn SDL_FriBidi_Process(fribidi: [*c]SDL_FriBidi, utf8: [*c]u8, utf8_len: isize, shaping: bool, out_par_type: [*c]FriBidiParType) [*c]u8;
pub extern fn SDL_FriBidi_Destroy(fribidi: [*c]SDL_FriBidi) void;
pub const thchar_t = u8;
pub const struct_thcell_t = extern struct {
    base: thchar_t = 0,
    hilo: thchar_t = 0,
    top: thchar_t = 0,
};
pub const SDL_LibThaiMakeCells = ?*const fn (s: [*c]const thchar_t, usize, cells: [*c]struct_thcell_t, [*c]usize, c_int) callconv(.c) usize;
pub const struct_SDL_LibThai = extern struct {
    lib: ?*SDL_SharedObject = null,
    make_cells: SDL_LibThaiMakeCells = null,
};
pub const SDL_LibThai = struct_SDL_LibThai;
pub extern fn SDL_LibThai_Create() [*c]SDL_LibThai;
pub extern fn SDL_LibThai_Destroy(th: [*c]SDL_LibThai) void;
pub extern fn setlocale(__category: c_int, __locale: [*c]const u8) [*c]u8;
pub const SDL_TOOLKIT_TEXT_TYPE_X11_GENERIC: c_int = 0;
pub const SDL_TOOLKIT_TEXT_TYPE_X11_THAI: c_int = 1;
pub const enum_SDL_ToolkitTextTypeX11 = c_uint;
pub const SDL_ToolkitTextTypeX11 = enum_SDL_ToolkitTextTypeX11;
pub const struct_SDL_ToolkitThaiOverlayX11 = extern struct {
    top: bool = false,
    str: [*c]u8 = null,
    sz: usize = 0,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const SDL_ToolkitThaiOverlayX11 = struct_SDL_ToolkitThaiOverlayX11;
pub const struct_SDL_ToolkitTextElementX11 = extern struct {
    type: SDL_ToolkitTextTypeX11 = @import("std").mem.zeroes(SDL_ToolkitTextTypeX11),
    str: [*c]u8 = null,
    sz: usize = 0,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    font_h: c_int = 0,
    str_free: ?*const fn (?*anyopaque) callconv(.c) void = null,
    thai_overlays: [*c]SDL_ListNode = null,
};
pub const SDL_ToolkitTextElementX11 = struct_SDL_ToolkitTextElementX11;
pub const struct_SDL_ToolkitIconControlX11 = extern struct {
    parent: SDL_ToolkitControlX11 = @import("std").mem.zeroes(SDL_ToolkitControlX11),
    flags: SDL_MessageBoxFlags = 0,
    icon_char: u8 = 0,
    icon_char_font: [*c]XFontStruct = null,
    icon_char_x: c_int = 0,
    icon_char_y: c_int = 0,
    icon_char_a: c_int = 0,
    icon_char_h: c_int = 0,
    xcolor_black: XColor = @import("std").mem.zeroes(XColor),
    xcolor_red: XColor = @import("std").mem.zeroes(XColor),
    xcolor_red_darker: XColor = @import("std").mem.zeroes(XColor),
    xcolor_white: XColor = @import("std").mem.zeroes(XColor),
    xcolor_yellow: XColor = @import("std").mem.zeroes(XColor),
    xcolor_blue: XColor = @import("std").mem.zeroes(XColor),
    xcolor_bg_shadow: XColor = @import("std").mem.zeroes(XColor),
};
pub const SDL_ToolkitIconControlX11 = struct_SDL_ToolkitIconControlX11;
pub const struct_SDL_ToolkitButtonControlX11 = extern struct {
    parent: SDL_ToolkitControlX11 = @import("std").mem.zeroes(SDL_ToolkitControlX11),
    data: [*c]const SDL_MessageBoxButtonData = null,
    text: [*c]SDL_ListNode = null,
    text_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    cb_data: ?*anyopaque = null,
    cb: ?*const fn ([*c]struct_SDL_ToolkitControlX11, ?*anyopaque) callconv(.c) void = null,
};
pub const SDL_ToolkitButtonControlX11 = struct_SDL_ToolkitButtonControlX11;
pub const struct_SDL_ToolkitLabelControlLineX11 = extern struct {
    text: [*c]SDL_ListNode = null,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    par: FriBidiParType = @import("std").mem.zeroes(FriBidiParType),
};
pub const SDL_ToolkitLabelControlLineX11 = struct_SDL_ToolkitLabelControlLineX11;
pub const struct_SDL_ToolkitLabelControlX11 = extern struct {
    parent: SDL_ToolkitControlX11 = @import("std").mem.zeroes(SDL_ToolkitControlX11),
    lines: [*c]SDL_ToolkitLabelControlLineX11 = null,
    sz: usize = 0,
};
pub const SDL_ToolkitLabelControlX11 = struct_SDL_ToolkitLabelControlX11;
pub var g_IconFont: [*c]const u8 = "-*-*-bold-r-normal-*-%d-*-*-*-*-*-iso8859-1[33 88 105]";
pub const g_ToolkitFontLatin1: [44:0]u8 = "-*-*-medium-r-normal--0-%d-*-*-p-0-iso8859-1".*;
pub const g_ToolkitFontLatin1Fallback: [33:0]u8 = "-*-*-*-*-*--*-*-*-*-*-*-iso8859-1".*;
pub var g_ToolkitFont: [9][*c]const u8 = [9][*c]const u8{
    "-*-*-medium-r-normal--*-%d-*-*-*-*-iso10646-1,*",
    "-*-*-medium-r-*--*-%d-*-*-*-*-iso10646-1,*",
    "-misc-*-*-*-*--*-*-*-*-*-*-iso10646-1,*",
    "-*-*-*-*-*--*-*-*-*-*-*-iso10646-1,*",
    "-*-*-medium-r-normal--*-%d-*-*-*-*-iso8859-1,*",
    "-*-*-medium-r-*--*-%d-*-*-*-*-iso8859-1,*",
    "-misc-*-*-*-*--*-*-*-*-*-*-iso8859-1,*",
    "-*-*-*-*-*--*-*-*-*-*-*-iso8859-1,*",
    null,
};
pub const g_default_colors: [5]SDL_MessageBoxColor = [5]SDL_MessageBoxColor{
    SDL_MessageBoxColor{
        .r = 191,
        .g = 184,
        .b = 191,
    },
    SDL_MessageBoxColor{
        .r = 0,
        .g = 0,
        .b = 0,
    },
    SDL_MessageBoxColor{
        .r = 127,
        .g = 120,
        .b = 127,
    },
    SDL_MessageBoxColor{
        .r = 191,
        .g = 184,
        .b = 191,
    },
    SDL_MessageBoxColor{
        .r = 235,
        .g = 235,
        .b = 235,
    },
};
pub const g_default_colors_dark: [5]SDL_MessageBoxColor = [5]SDL_MessageBoxColor{
    SDL_MessageBoxColor{
        .r = 20,
        .g = 20,
        .b = 20,
    },
    SDL_MessageBoxColor{
        .r = 192,
        .g = 192,
        .b = 192,
    },
    SDL_MessageBoxColor{
        .r = 12,
        .g = 12,
        .b = 12,
    },
    SDL_MessageBoxColor{
        .r = 20,
        .g = 20,
        .b = 20,
    },
    SDL_MessageBoxColor{
        .r = 36,
        .g = 36,
        .b = 36,
    },
};
pub var g_shm_error: c_int = 0;
pub var g_old_error_handler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = null;
pub fn X11Toolkit_SharedMemoryErrorHandler(d: [*c]Display, e: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, e.*.error_code) == BadAccess) or (@as(c_int, e.*.error_code) == BadRequest)) {
        g_shm_error = True;
        return 0;
    }
    return g_old_error_handler.?(d, e);
}
pub fn X11Toolkit_InitWindowPixmap(data: [*c]SDL_ToolkitWindowX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.pixmap) {
        if (!(data.*.shm_pixmap != 0)) {
            data.*.drawable = X11_XCreatePixmap.?(data.*.display, data.*.window, @bitCast(@as(c_int, data.*.pixmap_width)), @bitCast(@as(c_int, data.*.pixmap_height)), @bitCast(@as(c_int, data.*.depth)));
        }
        if (data.*.shm) {
            data.*.image = X11_XShmCreateImage.?(data.*.display, data.*.visual, @bitCast(@as(c_int, data.*.depth)), ZPixmap, null, &data.*.shm_info, @bitCast(@as(c_int, data.*.pixmap_width)), @bitCast(@as(c_int, data.*.pixmap_height)));
            if (data.*.image != null) {
                data.*.shm_bytes_per_line = data.*.image.*.bytes_per_line;
                data.*.shm_info.shmid = shmget(@as(c_int, 0), @bitCast(@as(c_long, data.*.image.*.bytes_per_line * data.*.image.*.height)), IPC_CREAT | @as(c_int, 511));
                if (data.*.shm_info.shmid < @as(c_int, 0)) {
                    _ = data.*.image.*.f.destroy_image.?(data.*.image);
                    data.*.image = null;
                    data.*.shm = @"false" != 0;
                    return;
                }
                data.*.shm_info.readOnly = False;
                data.*.shm_info.shmaddr = blk: {
                    const tmp = @as([*c]u8, @ptrCast(@alignCast(shmat(data.*.shm_info.shmid, null, 0))));
                    data.*.image.*.data = tmp;
                    break :blk tmp;
                };
                if (@as([*c]i8, @ptrCast(@alignCast(data.*.shm_info.shmaddr))) == @as([*c]i8, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
                    _ = data.*.image.*.f.destroy_image.?(data.*.image);
                    data.*.shm = @"false" != 0;
                    data.*.image = null;
                    return;
                }
                g_shm_error = False;
                g_old_error_handler = X11_XSetErrorHandler.?(X11Toolkit_SharedMemoryErrorHandler);
                _ = X11_XShmAttach.?(data.*.display, &data.*.shm_info);
                _ = X11_XSync.?(data.*.display, False);
                _ = X11_XSetErrorHandler.?(g_old_error_handler);
                if (g_shm_error != 0) {
                    _ = data.*.image.*.f.destroy_image.?(data.*.image);
                    _ = shmdt(@ptrCast(@alignCast(data.*.shm_info.shmaddr)));
                    _ = shmctl(data.*.shm_info.shmid, IPC_RMID, null);
                    data.*.image = null;
                    data.*.shm = @"false" != 0;
                    return;
                }
                if (data.*.shm_pixmap != 0) {
                    data.*.drawable = X11_XShmCreatePixmap.?(data.*.display, data.*.window, data.*.shm_info.shmaddr, &data.*.shm_info, @bitCast(@as(c_int, data.*.pixmap_width)), @bitCast(@as(c_int, data.*.pixmap_height)), @bitCast(@as(c_int, data.*.depth)));
                    if (data.*.drawable == @as(Drawable, None)) {
                        data.*.shm_pixmap = False;
                    } else {
                        _ = data.*.image.*.f.destroy_image.?(data.*.image);
                        data.*.image = null;
                    }
                }
                _ = shmctl(data.*.shm_info.shmid, IPC_RMID, null);
            } else {
                data.*.shm = @"false" != 0;
            }
        }
    }
}
pub fn X11Toolkit_InitWindowFonts(window: [*c]SDL_ToolkitWindowX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var missing: [*c][*c]u8 = undefined;
    _ = &missing;
    var num_missing: c_int = undefined;
    _ = &num_missing;
    var i_font: c_int = undefined;
    _ = &i_font;
    var font: [*c]u8 = undefined;
    _ = &font;
    var font_structs: [*c][*c]XFontStruct = undefined;
    _ = &font_structs;
    var font_names: [*c][*c]u8 = undefined;
    _ = &font_names;
    var font_sz: c_int = undefined;
    _ = &font_sz;
    var i: c_int = undefined;
    _ = &i;
    var thai_encoding: SDL_ToolkitThaiEncodingX11 = undefined;
    _ = &thai_encoding;
    var font_struct: [*c]XFontStruct = undefined;
    _ = &font_struct;
    var glyphs_sz: c_int = undefined;
    _ = &glyphs_sz;
    var j: c_int = undefined;
    _ = &j;
    var font_1: [*c]u8 = undefined;
    _ = &font_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window.*.thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_NONE;
                window.*.thai_font = SDL_TOOLKIT_THAI_FONT_X11_CELL;
                window.*.utf8 = @"true" != 0;
                window.*.font_set = null;
                if (SDL_X11_HAVE_UTF8 != 0) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                _ = SDL_asprintf_REAL(&font, g_ToolkitFont[@bitCast(@as(isize, @intCast(i_font)))], G_TOOLKITFONT_SIZE * window.*.iscale);
                window.*.font_set = X11_XCreateFontSet.?(window.*.display, font, &missing, &num_missing, null);
                SDL_free_REAL(@ptrCast(@alignCast(font)));
                if (!(window.*.font_set != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            2 => {
                window.*.utf8 = @"false" != 0;
                _ = SDL_asprintf_REAL(&font_1, @ptrCast(@alignCast(&g_ToolkitFontLatin1)), G_TOOLKITFONT_SIZE * window.*.iscale);
                window.*.font_struct = X11_XLoadQueryFont.?(window.*.display, font_1);
                SDL_free_REAL(@ptrCast(@alignCast(font_1)));
                if (!(window.*.font_struct != null)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            3 => {
                missing = null;
                num_missing = 0;
                window.*.font_struct = null;
                i_font = 0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            5 => {
                {}
            },
            6 => {
                if (g_ToolkitFont[@bitCast(@as(isize, @intCast(i_font)))] != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if (SDL_strstr_REAL(g_ToolkitFont[@bitCast(@as(isize, @intCast(i_font)))], "%d") != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                i_font += 1;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                if (!(window.*.font_set != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                window.*.font_set = X11_XCreateFontSet.?(window.*.display, g_ToolkitFont[@bitCast(@as(isize, @intCast(i_font)))], &missing, &num_missing, null);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (missing != null) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            13 => {
                if ((window.*.scale != @as(f32, @floatFromInt(@as(c_int, 0)))) and (window.*.iscale > @as(c_int, 0))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                window.*.iscale = @intFromFloat(SDL_ceilf_REAL(window.*.scale));
                window.*.scale = @floatFromInt(@as(c_int, 0));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                window.*.iscale -= 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                X11_XFreeStringList.?(missing);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if (window.*.font_set != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            26 => {
                window.*.do_shaping = !(X11_XContextDependentDrawing.?(window.*.font_set) != 0);
                font_sz = X11_XFontsOfFontSet.?(window.*.font_set, &font_structs, &font_names);
                i = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            28 => {
                if (i < font_sz) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_NONE;
                if (SDL_strstr_REAL(font_names[@bitCast(@as(isize, @intCast(i)))], "tis620-0") != null) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                i += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            32 => {
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_TIS;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if (SDL_strstr_REAL(font_names[@bitCast(@as(isize, @intCast(i)))], "tis620-1") != null) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                if (thai_encoding != @as(SDL_ToolkitThaiEncodingX11, SDL_TOOLKIT_THAI_ENCODING_X11_NONE)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            35 => {
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_TIS_MAC;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (SDL_strstr_REAL(font_names[@bitCast(@as(isize, @intCast(i)))], "tis620-2") != null) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_TIS_WIN;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                if (SDL_strstr_REAL(font_names[@bitCast(@as(isize, @intCast(i)))], "iso8859-11") != null) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_8859;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                if (SDL_strstr_REAL(font_names[@bitCast(@as(isize, @intCast(i)))], "iso10646-1") != null) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                thai_encoding = SDL_TOOLKIT_THAI_ENCODING_X11_UNICODE;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                font_struct = X11_XLoadQueryFont.?(window.*.display, font_names[@bitCast(@as(isize, @intCast(i)))]);
                if (font_struct != null) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                window.*.thai_encoding = thai_encoding;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            50 => {
                if (font_struct.*.per_char != null) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                    sdl_pc = 49;
                    continue;
                }
            },
            53 => {
                glyphs_sz = @bitCast(@as(c_uint, @truncate(((font_struct.*.max_char_or_byte2 -% font_struct.*.min_char_or_byte2) +% @as(c_uint, 1)) *% ((font_struct.*.max_byte1 -% font_struct.*.min_byte1) +% @as(c_uint, 1)))));
                j = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                _ = X11_XFreeFont.?(window.*.display, font_struct);
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                if (j < glyphs_sz) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                if (@as(c_int, font_struct.*.per_char[@bitCast(@as(isize, @intCast(j)))].lbearing) < @as(c_int, 0)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                j += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            60 => {
                window.*.thai_font = SDL_TOOLKIT_THAI_FONT_X11_OFFSET;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            63 => {
                if (window.*.iscale > @as(c_int, 0)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            66 => {
                if (window.*.scale != @as(f32, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                window.*.font_struct = X11_XLoadQueryFont.?(window.*.display, @ptrCast(@alignCast(&g_ToolkitFontLatin1Fallback)));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            69 => {
                window.*.iscale = @intFromFloat(SDL_ceilf_REAL(window.*.scale));
                window.*.scale = @floatFromInt(@as(c_int, 0));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                window.*.iscale -= 1;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn X11Toolkit_SettingsNotify(name: [*c]const u8, _: XSettingsAction, _: [*c]XSettingsSetting, data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_ToolkitWindowX11 = undefined;
    _ = &window;
    var i: c_int = undefined;
    _ = &i;
    window = @ptrCast(@alignCast(data));
    if (window.*.xsettings_first_time) {
        return;
    }
    if (((SDL_strcmp_REAL(name, "Gdk/WindowScalingFactor") == @as(c_int, 0)) or (SDL_strcmp_REAL(name, "Gdk/UnscaledDPI") == @as(c_int, 0))) or (SDL_strcmp_REAL(name, "Xft/DPI") == @as(c_int, 0))) {
        var dbe_already_setup: bool = @"false" != 0;
        _ = &dbe_already_setup;
        var pixmap_already_setup: bool = @"false" != 0;
        _ = &pixmap_already_setup;
        if (window.*.pixmap) {
            pixmap_already_setup = @"true" != 0;
        } else {
            dbe_already_setup = @"true" != 0;
        }
        window.*.scale = X11_GetGlobalContentScale(window.*.display, window.*.xsettings);
        window.*.iscale = @intFromFloat(SDL_ceilf_REAL(window.*.scale));
        if (window.*.scale < @as(f32, @floatFromInt(@as(c_int, 1)))) {
            window.*.scale = @floatFromInt(@as(c_int, 1));
        }
        if (SDL_roundf_REAL(window.*.scale) == window.*.scale) {
            window.*.scale = @floatFromInt(@as(c_int, 0));
        }
        if (window.*.font_set != null) {
            X11_XFreeFontSet.?(window.*.display, window.*.font_set);
        }
        if (window.*.font_struct != null) {
            _ = X11_XFreeFont.?(window.*.display, window.*.font_struct);
        }
        X11Toolkit_InitWindowFonts(window);
        if (window.*.scale != @as(f32, @floatFromInt(@as(c_int, 0)))) {
            window.*.window_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(window.*.window_width, window.*.iscale))) * window.*.scale));
            window.*.window_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(@divTrunc(window.*.window_height, window.*.iscale))) * window.*.scale));
            window.*.pixmap_width = window.*.window_width;
            window.*.pixmap_height = window.*.window_height;
            window.*.pixmap = @"true" != 0;
        } else {
            window.*.pixmap = @"false" != 0;
        }
        if (window.*.pixmap) {
            if (!pixmap_already_setup) {
                if ((SDL_X11_HAVE_XDBE != 0) and window.*.xdbe) {
                    _ = X11_XdbeDeallocateBackBufferName.?(window.*.display, window.*.buf);
                }
            }
            _ = X11_XFreePixmap.?(window.*.display, window.*.drawable);
            X11Toolkit_InitWindowPixmap(window);
        } else {
            if (!dbe_already_setup) {
                _ = X11_XFreePixmap.?(window.*.display, window.*.drawable);
                if (window.*.image != null) {
                    _ = window.*.image.*.f.destroy_image.?(window.*.image);
                    window.*.image = null;
                }
                if ((SDL_X11_HAVE_XDBE != 0) and window.*.xdbe) {
                    window.*.buf = X11_XdbeAllocateBackBufferName.?(window.*.display, window.*.window, XdbeUndefined);
                    window.*.drawable = window.*.buf;
                }
            }
        }
        {
            i = 0;
            while (@as(usize, @bitCast(@as(c_long, i))) < window.*.controls_sz) : (i += 1) {
                window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.do_size = @"true" != 0;
                if (window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_on_scale_change != null) {
                    window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_on_scale_change.?(window.*.controls[@bitCast(@as(isize, @intCast(i)))]);
                }
                if (window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_calc_size != null) {
                    window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.func_calc_size.?(window.*.controls[@bitCast(@as(isize, @intCast(i)))]);
                }
                window.*.controls[@bitCast(@as(isize, @intCast(i)))].*.do_size = @"false" != 0;
            }
        }
        if (window.*.cb_on_scale_change != null) {
            window.*.cb_on_scale_change.?(window, window.*.cb_data);
        }
        if (!window.*.pixmap) {
            window.*.ev_scale = blk: {
                const tmp = @as(f32, @floatFromInt(@as(c_int, 1)));
                window.*.ev_iscale = tmp;
                break :blk tmp;
            };
        } else {
            window.*.ev_scale = window.*.scale;
            window.*.ev_iscale = @floatFromInt(window.*.iscale);
        }
    }
}
pub fn X11Toolkit_GetTextWidthHeightForFont(font: [*c]XFontStruct, str: [*c]const u8, nbytes: c_int, pwidth: [*c]c_int, pheight: [*c]c_int, ascent: [*c]c_int, font_height: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var text_structure: XCharStruct = undefined;
    _ = &text_structure;
    var font_direction: c_int = undefined;
    _ = &font_direction;
    var font_ascent: c_int = undefined;
    _ = &font_ascent;
    var font_descent: c_int = undefined;
    _ = &font_descent;
    _ = X11_XTextExtents.?(font, str, nbytes, &font_direction, &font_ascent, &font_descent, &text_structure);
    pwidth.* = text_structure.width;
    pheight.* = @as(c_int, text_structure.ascent) + @as(c_int, text_structure.descent);
    ascent.* = text_structure.ascent;
    if (font_height != null) {
        font_height.* = font_ascent + font_descent;
    }
}
pub fn X11Toolkit_GetTextWidthHeight(data: [*c]SDL_ToolkitWindowX11, str: [*c]const u8, nbytes: c_int, pwidth: [*c]c_int, pheight: [*c]c_int, ascent: [*c]c_int, descent: [*c]c_int, font_height: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.utf8) {
        var overall_ink: XRectangle = undefined;
        _ = &overall_ink;
        var overall_logical: XRectangle = undefined;
        _ = &overall_logical;
        _ = X11_Xutf8TextExtents.?(data.*.font_set, str, nbytes, &overall_ink, &overall_logical);
        pwidth.* = overall_logical.width;
        pheight.* = overall_logical.height;
        ascent.* = -@as(c_int, overall_logical.y);
        descent.* = @as(c_int, overall_logical.height) - ascent.*;
        if (font_height != null) {
            var extents: [*c]XFontSetExtents = undefined;
            _ = &extents;
            extents = X11_XExtentsOfFontSet.?(data.*.font_set);
            font_height.* = extents.*.max_logical_extent.height;
        }
    } else {
        var text_structure: XCharStruct = undefined;
        _ = &text_structure;
        var font_direction: c_int = undefined;
        _ = &font_direction;
        var font_ascent: c_int = undefined;
        _ = &font_ascent;
        var font_descent: c_int = undefined;
        _ = &font_descent;
        _ = X11_XTextExtents.?(data.*.font_struct, str, nbytes, &font_direction, &font_ascent, &font_descent, &text_structure);
        pwidth.* = text_structure.width;
        pheight.* = @as(c_int, text_structure.ascent) + @as(c_int, text_structure.descent);
        ascent.* = text_structure.ascent;
        descent.* = text_structure.descent;
        if (font_height != null) {
            font_height.* = font_ascent + font_descent;
        }
    }
}
pub export fn X11Toolkit_MakeTextElements(data: [*c]SDL_ToolkitWindowX11, arg_txt: [*c]u8, arg_sz: usize, par: [*c]FriBidiParType) [*c]SDL_ListNode {
    @setEvalBranchQuota(100000);
    var txt = arg_txt;
    _ = &txt;
    var sz = arg_sz;
    _ = &sz;
    var list: [*c]SDL_ListNode = undefined;
    _ = &list;
    var str: [*c]u8 = undefined;
    _ = &str;
    var buffer: [*c]u8 = undefined;
    _ = &buffer;
    var cp: Uint32 = undefined;
    _ = &cp;
    var thai: bool = undefined;
    _ = &thai;
    var free_txt: bool = undefined;
    _ = &free_txt;
    free_txt = @"false" != 0;
    list = null;
    thai = @as(c_int, 0) != 0;
    str = txt;
    buffer = @ptrCast(@alignCast(SDL_malloc_REAL(1)));
    buffer[@as(c_int, 0)] = 0;
    if (par != null) {
        par.* = FRIBIDI_PAR_LTR;
    }
    if (data.*.fribidi != null) {
        var fstr: [*c]u8 = undefined;
        _ = &fstr;
        fstr = SDL_FriBidi_Process(data.*.fribidi, str, @bitCast(@as(c_ulong, @truncate(sz))), data.*.do_shaping, par);
        if (fstr != null) {
            txt = fstr;
            str = fstr;
            sz = SDL_strlen_REAL(str);
            free_txt = @"true" != 0;
        }
    }
    while (true) {
        var new: [*c]u8 = undefined;
        _ = &new;
        var utf8: [5]u8 = undefined;
        _ = &utf8;
        var csz: usize = undefined;
        _ = &csz;
        var cond: bool = undefined;
        _ = &cond;
        _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&utf8))))), 0, @sizeOf(@TypeOf(utf8)));
        cp = SDL_StepUTF8_REAL(@ptrCast(@alignCast(&str)), &sz);
        cond = (if ((@as(Uint32, 3584) <= cp) and (cp <= @as(Uint32, 3711))) @"true" else @"false") != 0;
        if ((cp == @as(Uint32, 0)) or (@as(c_int, @intFromBool(cond)) == (if (thai) @"false" else @"true"))) {
            var element: [*c]SDL_ToolkitTextElementX11 = undefined;
            _ = &element;
            element = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitTextElementX11))));
            if (thai) {
                element.*.type = SDL_TOOLKIT_TEXT_TYPE_X11_THAI;
            } else {
                element.*.type = SDL_TOOLKIT_TEXT_TYPE_X11_GENERIC;
            }
            element.*.str = SDL_strdup_REAL(buffer);
            element.*.sz = SDL_strlen_REAL(buffer);
            element.*.str_free = SDL_free_REAL;
            _ = SDL_ListAdd(&list, @ptrCast(@alignCast(element)));
            SDL_free_REAL(@ptrCast(@alignCast(buffer)));
            buffer = @ptrCast(@alignCast(SDL_malloc_REAL(1)));
            buffer[@as(c_int, 0)] = 0;
            thai = (if (thai) @"false" else @"true") != 0;
        }
        if (!(cp != 0)) {
            break;
        }
        _ = SDL_UCS4ToUTF8_REAL(cp, @ptrCast(@alignCast(&utf8)));
        csz = (SDL_strlen_REAL(buffer) +% SDL_strlen_REAL(@ptrCast(@alignCast(&utf8)))) +% @as(usize, 1);
        new = @ptrCast(@alignCast(SDL_malloc_REAL(csz)));
        _ = SDL_strlcpy_REAL(new, buffer, csz);
        _ = SDL_strlcat_REAL(new, @ptrCast(@alignCast(&utf8)), csz);
        SDL_free_REAL(@ptrCast(@alignCast(buffer)));
        buffer = new;
    }
    SDL_free_REAL(@ptrCast(@alignCast(buffer)));
    if (free_txt) {
        SDL_free_REAL(@ptrCast(@alignCast(txt)));
    }
    return list;
}
pub export fn X11Toolkit_ShapeTextElements(data: [*c]SDL_ToolkitWindowX11, list: [*c]SDL_ListNode) void {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    var prev: [*c]SDL_ToolkitTextElementX11 = undefined;
    _ = &prev;
    var temp: c_int = undefined;
    _ = &temp;
    cursor = list;
    while (cursor != null) {
        var element: [*c]SDL_ToolkitTextElementX11 = undefined;
        _ = &element;
        element = @ptrCast(@alignCast(cursor.*.entry));
        element.*.thai_overlays = null;
        if (element.*.type == @as(SDL_ToolkitTextTypeX11, SDL_TOOLKIT_TEXT_TYPE_X11_THAI)) {
            if (data.*.thai_font == @as(SDL_ToolkitThaiFontX11, SDL_TOOLKIT_THAI_FONT_X11_OFFSET)) {
                X11Toolkit_GetTextWidthHeight(data, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))), &element.*.rect.w, &element.*.rect.h, &element.*.rect.y, &temp, null);
            } else {
                if (data.*.th != null) {
                    var cells: [*c]struct_thcell_t = undefined;
                    _ = &cells;
                    var tis_str: [*c]u8 = undefined;
                    _ = &tis_str;
                    var base_tis_str: [*c]u8 = undefined;
                    _ = &base_tis_str;
                    var cells_sz: usize = undefined;
                    _ = &cells_sz;
                    var base_tis_str_sz: usize = undefined;
                    _ = &base_tis_str_sz;
                    var tis_str_sz: usize = undefined;
                    _ = &tis_str_sz;
                    tis_str = SDL_iconv_string_REAL("TIS-620", "UTF-8", element.*.str, element.*.sz);
                    cells_sz = blk: {
                        const tmp = SDL_strlen_REAL(tis_str);
                        tis_str_sz = tmp;
                        break :blk tmp;
                    };
                    cells = @ptrCast(@alignCast(SDL_calloc_REAL(cells_sz, @sizeOf(struct_thcell_t))));
                    _ = data.*.th.*.make_cells.?(@ptrCast(@alignCast(tis_str)), tis_str_sz, cells, &cells_sz, 0);
                    base_tis_str_sz = cells_sz;
                    base_tis_str = @ptrCast(@alignCast(SDL_malloc_REAL(base_tis_str_sz +% @as(usize, 1))));
                    {
                        temp = 0;
                        while (@as(usize, @bitCast(@as(c_long, temp))) < cells_sz) : (temp += 1) {
                            base_tis_str[@bitCast(@as(isize, @intCast(temp)))] = @truncate(cells[@bitCast(@as(isize, @intCast(temp)))].base);
                            if (@as(c_int, cells[@bitCast(@as(isize, @intCast(temp)))].hilo) != 0) {
                                var overlay: [*c]SDL_ToolkitThaiOverlayX11 = undefined;
                                _ = &overlay;
                                var pre: [*c]u8 = undefined;
                                _ = &pre;
                                var temp2: c_int = undefined;
                                _ = &temp2;
                                overlay = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitThaiOverlayX11))));
                                pre = SDL_iconv_string_REAL("UTF-8", "TIS-620", base_tis_str, @bitCast(@as(c_long, temp)));
                                overlay.*.str = SDL_iconv_string_REAL("UTF-8", "TIS-620", @ptrCast(@alignCast(&cells[@bitCast(@as(isize, @intCast(temp)))].hilo)), 1);
                                overlay.*.sz = SDL_strlen_REAL(overlay.*.str);
                                overlay.*.top = @"false" != 0;
                                X11Toolkit_GetTextWidthHeight(data, pre, @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(pre)))), &overlay.*.rect.x, &temp2, &temp2, &temp2, null);
                                X11Toolkit_GetTextWidthHeight(data, overlay.*.str, @bitCast(@as(c_uint, @truncate(overlay.*.sz))), &overlay.*.rect.w, &overlay.*.rect.h, &overlay.*.rect.y, &temp2, null);
                                _ = SDL_ListAdd(&element.*.thai_overlays, @ptrCast(@alignCast(overlay)));
                                SDL_free_REAL(@ptrCast(@alignCast(pre)));
                            }
                            if (@as(c_int, cells[@bitCast(@as(isize, @intCast(temp)))].top) != 0) {
                                var overlay: [*c]SDL_ToolkitThaiOverlayX11 = undefined;
                                _ = &overlay;
                                var pre: [*c]u8 = undefined;
                                _ = &pre;
                                var temp2: c_int = undefined;
                                _ = &temp2;
                                overlay = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_ToolkitThaiOverlayX11))));
                                pre = SDL_iconv_string_REAL("UTF-8", "TIS-620", base_tis_str, @bitCast(@as(c_long, temp)));
                                overlay.*.str = SDL_iconv_string_REAL("UTF-8", "TIS-620", @ptrCast(@alignCast(&cells[@bitCast(@as(isize, @intCast(temp)))].top)), 1);
                                overlay.*.sz = SDL_strlen_REAL(overlay.*.str);
                                overlay.*.top = @"true" != 0;
                                X11Toolkit_GetTextWidthHeight(data, pre, @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(pre)))), &overlay.*.rect.x, &temp2, &temp2, &temp2, null);
                                X11Toolkit_GetTextWidthHeight(data, overlay.*.str, @bitCast(@as(c_uint, @truncate(overlay.*.sz))), &overlay.*.rect.w, &overlay.*.rect.h, &overlay.*.rect.y, &temp2, null);
                                _ = SDL_ListAdd(&element.*.thai_overlays, @ptrCast(@alignCast(overlay)));
                                SDL_free_REAL(@ptrCast(@alignCast(pre)));
                            }
                        }
                    }
                    base_tis_str[base_tis_str_sz] = '\x00';
                    element.*.str_free.?(@ptrCast(@alignCast(element.*.str)));
                    element.*.str = SDL_iconv_string_REAL("UTF-8", "TIS-620", base_tis_str, base_tis_str_sz);
                    element.*.sz = SDL_strlen_REAL(element.*.str);
                    X11Toolkit_GetTextWidthHeight(data, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))), &element.*.rect.w, &element.*.rect.h, &element.*.rect.y, &temp, &element.*.font_h);
                    SDL_free_REAL(@ptrCast(@alignCast(tis_str)));
                    SDL_free_REAL(@ptrCast(@alignCast(cells)));
                    SDL_free_REAL(@ptrCast(@alignCast(base_tis_str)));
                }
            }
        } else {
            X11Toolkit_GetTextWidthHeight(data, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))), &element.*.rect.w, &element.*.rect.h, &element.*.rect.y, &temp, &element.*.font_h);
        }
        cursor = cursor.*.next;
    }
    prev = null;
    cursor = list;
    while (cursor != null) {
        var element: [*c]SDL_ToolkitTextElementX11 = undefined;
        _ = &element;
        element = @ptrCast(@alignCast(cursor.*.entry));
        if (prev != null) {
            element.*.rect.x = prev.*.rect.x + prev.*.rect.w;
        } else {
            element.*.rect.x = 0;
        }
        prev = element;
        cursor = cursor.*.next;
    }
}
pub export fn X11Toolkit_DrawTextElements(data: [*c]SDL_ToolkitWindowX11, list: [*c]SDL_ListNode, x: c_int, y: c_int) void {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    cursor = list;
    while (cursor != null) {
        var element: [*c]SDL_ToolkitTextElementX11 = undefined;
        _ = &element;
        element = @ptrCast(@alignCast(cursor.*.entry));
        if (element.*.type == @as(SDL_ToolkitTextTypeX11, SDL_TOOLKIT_TEXT_TYPE_X11_THAI)) {
            if (data.*.thai_font == @as(SDL_ToolkitThaiFontX11, SDL_TOOLKIT_THAI_FONT_X11_OFFSET)) {
                if (data.*.utf8) {
                    X11_Xutf8DrawString.?(data.*.display, data.*.drawable, data.*.font_set, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
                } else {
                    _ = X11_XDrawString.?(data.*.display, data.*.drawable, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
                }
            } else {
                var overlay_cursor: [*c]SDL_ListNode = undefined;
                _ = &overlay_cursor;
                if (data.*.utf8) {
                    X11_Xutf8DrawString.?(data.*.display, data.*.drawable, data.*.font_set, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
                } else {
                    _ = X11_XDrawString.?(data.*.display, data.*.drawable, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
                }
                overlay_cursor = element.*.thai_overlays;
                while (overlay_cursor != null) {
                    var overlay: [*c]SDL_ToolkitThaiOverlayX11 = undefined;
                    _ = &overlay;
                    overlay = @ptrCast(@alignCast(overlay_cursor.*.entry));
                    if (data.*.utf8) {
                        X11_Xutf8DrawString.?(data.*.display, data.*.drawable, data.*.font_set, data.*.ctx, (x + element.*.rect.x) + overlay.*.rect.x, y + overlay.*.rect.y, overlay.*.str, @bitCast(@as(c_uint, @truncate(overlay.*.sz))));
                    } else {
                        _ = X11_XDrawString.?(data.*.display, data.*.drawable, data.*.ctx, (x + element.*.rect.x) + overlay.*.rect.x, (y + element.*.rect.y) + overlay.*.rect.y, overlay.*.str, @bitCast(@as(c_uint, @truncate(overlay.*.sz))));
                    }
                    overlay_cursor = overlay_cursor.*.next;
                }
            }
        } else {
            if (data.*.utf8) {
                X11_Xutf8DrawString.?(data.*.display, data.*.drawable, data.*.font_set, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
            } else {
                _ = X11_XDrawString.?(data.*.display, data.*.drawable, data.*.ctx, x + element.*.rect.x, y + element.*.rect.y, element.*.str, @bitCast(@as(c_uint, @truncate(element.*.sz))));
            }
        }
        cursor = cursor.*.next;
    }
}
pub export fn X11Toolkit_GetTextElementsRect(list: [*c]SDL_ListNode, out: [*c]SDL_Rect) c_int {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    var ret: c_int = undefined;
    _ = &ret;
    ret = 0;
    out.*.x = blk: {
        const tmp = @as(c_int, 0);
        out.*.y = tmp;
        break :blk tmp;
    };
    out.*.w = blk: {
        const tmp = @as(c_int, 0);
        out.*.h = tmp;
        break :blk tmp;
    };
    cursor = list;
    while (cursor != null) {
        var element: [*c]SDL_ToolkitTextElementX11 = undefined;
        _ = &element;
        element = @ptrCast(@alignCast(cursor.*.entry));
        out.*.w += element.*.rect.w;
        out.*.h = if (out.*.h > element.*.rect.h) out.*.h else element.*.rect.h;
        ret = if (ret > element.*.font_h) ret else element.*.font_h;
        cursor = cursor.*.next;
    }
    return ret;
}
pub export fn X11Toolkit_FreeTextElementsListContents(list: [*c]SDL_ListNode) void {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_ListNode = undefined;
    _ = &cursor;
    cursor = list;
    while (cursor != null) {
        var element: [*c]SDL_ToolkitTextElementX11 = undefined;
        _ = &element;
        var overlay_cursor: [*c]SDL_ListNode = undefined;
        _ = &overlay_cursor;
        element = @ptrCast(@alignCast(cursor.*.entry));
        if (element.*.str_free != null) {
            element.*.str_free.?(@ptrCast(@alignCast(element.*.str)));
        }
        overlay_cursor = element.*.thai_overlays;
        while (overlay_cursor != null) {
            var overlay: [*c]SDL_ToolkitThaiOverlayX11 = undefined;
            _ = &overlay;
            overlay = @ptrCast(@alignCast(overlay_cursor.*.entry));
            SDL_free_REAL(@ptrCast(@alignCast(overlay.*.str)));
            SDL_free_REAL(@ptrCast(@alignCast(overlay)));
            overlay_cursor = overlay_cursor.*.next;
        }
        SDL_ListClear(&element.*.thai_overlays);
        SDL_free_REAL(@ptrCast(@alignCast(element)));
        cursor = cursor.*.next;
    }
}
pub fn X11Toolkit_ShouldFlipUI() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var current_locales: [*c][*c]SDL_Locale = undefined;
    _ = &current_locales;
    const static_local_rtl_locales = struct {
        const rtl_locales: [11]SDL_Locale = [11]SDL_Locale{
            SDL_Locale{
                .language = "ar",
                .country = null,
            },
            SDL_Locale{
                .language = "fa",
                .country = "AF",
            },
            SDL_Locale{
                .language = "fa",
                .country = "IR",
            },
            SDL_Locale{
                .language = "he",
                .country = null,
            },
            SDL_Locale{
                .language = "iw",
                .country = null,
            },
            SDL_Locale{
                .language = "yi",
                .country = null,
            },
            SDL_Locale{
                .language = "ur",
                .country = null,
            },
            SDL_Locale{
                .language = "ug",
                .country = null,
            },
            SDL_Locale{
                .language = "kd",
                .country = null,
            },
            SDL_Locale{
                .language = "pk",
                .country = "PK",
            },
            SDL_Locale{
                .language = "ps",
                .country = null,
            },
        };
    };
    _ = &static_local_rtl_locales;
    var current_locales_sz: c_int = undefined;
    _ = &current_locales_sz;
    var i: c_int = undefined;
    _ = &i;
    current_locales = SDL_GetPreferredLocales_REAL(&current_locales_sz);
    if (current_locales_sz <= @as(c_int, 0)) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_rtl_locales.rtl_locales)) / @sizeOf(@TypeOf(static_local_rtl_locales.rtl_locales[@as(c_int, 0)])))) : (i += 1) {
            if (SDL_startswith(current_locales[@as(c_int, 0)].*.language, static_local_rtl_locales.rtl_locales[@bitCast(@as(isize, @intCast(i)))].language)) {
                if (!(static_local_rtl_locales.rtl_locales[@bitCast(@as(isize, @intCast(i)))].country != null)) {
                    return @"true" != 0;
                } else {
                    return SDL_startswith(current_locales[@as(c_int, 0)].*.country, static_local_rtl_locales.rtl_locales[@bitCast(@as(isize, @intCast(i)))].country);
                }
            }
        }
    }
    return @"false" != 0;
}
pub fn X11Toolkit_AddControlToWindow(window: [*c]SDL_ToolkitWindowX11, control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    window.*.controls_sz +%= 1;
    if (window.*.controls_sz == @as(usize, 1)) {
        window.*.controls = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]struct_SDL_ToolkitControlX11))));
    } else {
        window.*.controls = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(window.*.controls)), @sizeOf([*c]struct_SDL_ToolkitControlX11) *% window.*.controls_sz)));
    }
    window.*.controls[window.*.controls_sz -% @as(usize, 1)] = control;
    if (control.*.dynamic) {
        window.*.dyn_controls_sz +%= 1;
        if (window.*.dyn_controls_sz == @as(usize, 1)) {
            window.*.dyn_controls = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]struct_SDL_ToolkitControlX11))));
        } else {
            window.*.dyn_controls = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(window.*.dyn_controls)), @sizeOf([*c]struct_SDL_ToolkitControlX11) *% window.*.dyn_controls_sz)));
        }
        window.*.dyn_controls[window.*.dyn_controls_sz -% @as(usize, 1)] = control;
    }
    if (control.*.selected) {
        window.*.focused_control = control;
    }
}
pub fn X11Toolkit_DrawWindow(data: [*c]SDL_ToolkitWindowX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var i: c_int = undefined;
    _ = &i;
    if (((SDL_X11_HAVE_XDBE != 0) and data.*.xdbe) and !data.*.pixmap) {
        _ = X11_XdbeBeginIdiom.?(data.*.display);
    }
    _ = X11_XSetForeground.?(data.*.display, data.*.ctx, data.*.xcolor[SDL_MESSAGEBOX_COLOR_BACKGROUND].pixel);
    if (data.*.pixmap) {
        _ = X11_XFillRectangle.?(data.*.display, data.*.drawable, data.*.ctx, 0, 0, @bitCast(@as(c_int, data.*.pixmap_width)), @bitCast(@as(c_int, data.*.pixmap_height)));
    } else {
        _ = X11_XFillRectangle.?(data.*.display, data.*.drawable, data.*.ctx, 0, 0, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)));
    }
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < data.*.controls_sz) : (i += 1) {
            var control: [*c]SDL_ToolkitControlX11 = undefined;
            _ = &control;
            control = data.*.controls[@bitCast(@as(isize, @intCast(i)))];
            if (control != null) {
                if (control.*.func_draw != null) {
                    control.*.func_draw.?(control);
                }
            }
        }
    }
    if (((SDL_X11_HAVE_XDBE != 0) and data.*.xdbe) and !data.*.pixmap) {
        var swap_info: XdbeSwapInfo = undefined;
        _ = &swap_info;
        swap_info.swap_window = data.*.window;
        swap_info.swap_action = XdbeUndefined;
        _ = X11_XdbeSwapBuffers.?(data.*.display, &swap_info, 1);
        _ = X11_XdbeEndIdiom.?(data.*.display);
    }
    if (data.*.pixmap) {
        var scale_surface: [*c]SDL_Surface = undefined;
        _ = &scale_surface;
        rect.x = blk: {
            const tmp = @as(c_int, 0);
            rect.y = tmp;
            break :blk tmp;
        };
        rect.w = data.*.window_width;
        rect.h = data.*.window_height;
        if (data.*.shm) {
            if (data.*.shm_pixmap != 0) {
                _ = X11_XFlush.?(data.*.display);
                _ = X11_XSync.?(data.*.display, @"false");
                scale_surface = SDL_CreateSurfaceFrom_REAL(data.*.pixmap_width, data.*.pixmap_height, X11_GetPixelFormatFromVisualInfo(data.*.display, &data.*.vi), @ptrCast(@alignCast(data.*.shm_info.shmaddr)), data.*.shm_bytes_per_line);
                _ = SDL_BlitSurfaceScaled_REAL(scale_surface, null, scale_surface, &rect, SDL_SCALEMODE_LINEAR);
                SDL_DestroySurface_REAL(scale_surface);
                X11_XCopyArea.?(data.*.display, data.*.drawable, data.*.window, data.*.ctx, 0, 0, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)), 0, 0);
            } else {
                _ = X11_XShmGetImage.?(data.*.display, data.*.drawable, data.*.image, 0, 0, @as(c_ulong, @bitCast(@as(c_long, ~@as(c_long, 0)))));
                scale_surface = SDL_CreateSurfaceFrom_REAL(data.*.pixmap_width, data.*.pixmap_height, X11_GetPixelFormatFromVisualInfo(data.*.display, &data.*.vi), @ptrCast(@alignCast(data.*.image.*.data)), data.*.image.*.bytes_per_line);
                _ = SDL_BlitSurfaceScaled_REAL(scale_surface, null, scale_surface, &rect, SDL_SCALEMODE_LINEAR);
                _ = X11_XShmPutImage.?(data.*.display, data.*.window, data.*.ctx, data.*.image, 0, 0, 0, 0, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)), False);
            }
        } else {
            var image: [*c]XImage = undefined;
            _ = &image;
            image = X11_XGetImage.?(data.*.display, data.*.drawable, 0, 0, @bitCast(@as(c_int, data.*.pixmap_width)), @bitCast(@as(c_int, data.*.pixmap_height)), @as(c_ulong, @bitCast(@as(c_long, ~@as(c_long, 0)))), ZPixmap);
            scale_surface = SDL_CreateSurfaceFrom_REAL(data.*.pixmap_width, data.*.pixmap_height, X11_GetPixelFormatFromVisualInfo(data.*.display, &data.*.vi), @ptrCast(@alignCast(image.*.data)), image.*.bytes_per_line);
            _ = SDL_BlitSurfaceScaled_REAL(scale_surface, null, scale_surface, &rect, SDL_SCALEMODE_LINEAR);
            _ = X11_XPutImage.?(data.*.display, data.*.window, data.*.ctx, image, 0, 0, 0, 0, @bitCast(@as(c_int, data.*.window_width)), @bitCast(@as(c_int, data.*.window_height)));
            _ = image.*.f.destroy_image.?(image);
            SDL_DestroySurface_REAL(scale_surface);
        }
    }
    _ = X11_XFlush.?(data.*.display);
}
pub fn X11Toolkit_GetControlMouseIsOn(data: [*c]SDL_ToolkitWindowX11, arg_x: c_int, arg_y: c_int) callconv(.c) [*c]SDL_ToolkitControlX11 {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < data.*.controls_sz) : (i += 1) {
            var rect: [*c]SDL_Rect = &data.*.controls[@bitCast(@as(isize, @intCast(i)))].*.rect;
            _ = &rect;
            if ((((x >= rect.*.x) and (x <= (rect.*.x + rect.*.w))) and (y >= rect.*.y)) and (y <= (rect.*.y + rect.*.h))) {
                return data.*.controls[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    return null;
}
pub fn X11Toolkit_EventTest(_: [*c]Display, event: [*c]XEvent, arg: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_ToolkitWindowX11 = @ptrCast(@alignCast(arg));
    _ = &data;
    if (event.*.xany.display != data.*.display) {
        return False;
    }
    if (event.*.xany.window == data.*.window) {
        return True;
    }
    return False;
}
pub export fn X11Toolkit_ProcessWindowEvents(data: [*c]SDL_ToolkitWindowX11, e: [*c]XEvent) void {
    @setEvalBranchQuota(100000);
    var cx: c_int = undefined;
    _ = &cx;
    var cy: c_int = undefined;
    _ = &cy;
    var control: [*c]SDL_ToolkitControlX11 = undefined;
    _ = &control;
    var key: KeySym = undefined;
    _ = &key;
    var next_index: c_int = undefined;
    _ = &next_index;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((e.*.type != Expose) and (X11_XFilterEvent.?(e, None) != 0)) {
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
                data.*.draw = @"false" != 0;
                data.*.e = e;
                switch (e.*.type) {
                    Expose => {
                        sdl_pc = 5;
                        continue;
                    },
                    ClientMessage => {
                        sdl_pc = 6;
                        continue;
                    },
                    FocusIn => {
                        sdl_pc = 10;
                        continue;
                    },
                    FocusOut => {
                        sdl_pc = 11;
                        continue;
                    },
                    MotionNotify => {
                        sdl_pc = 19;
                        continue;
                    },
                    ButtonPress => {
                        sdl_pc = 38;
                        continue;
                    },
                    ButtonRelease => {
                        sdl_pc = 54;
                        continue;
                    },
                    KeyPress => {
                        sdl_pc = 73;
                        continue;
                    },
                    KeyRelease => {
                        sdl_pc = 94;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            4 => {
                if (data.*.draw) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            5 => {
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                if (((e.*.xclient.message_type == data.*.wm_protocols) and (e.*.xclient.format == @as(c_int, 32))) and (@as(Atom, @bitCast(@as(c_long, e.*.xclient.data.l[@as(c_int, 0)]))) == data.*.wm_delete_message)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                data.*.close = @"true" != 0;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                data.*.has_focus = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                data.*.has_focus = @"false" != 0;
                if (data.*.fiddled_control != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                data.*.fiddled_control.*.selected = @"false" != 0;
                {
                    sdl_pc = 14;
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
                data.*.fiddled_control = null;
                data.*.ev_i = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (@as(usize, @bitCast(@as(c_long, data.*.ev_i))) < data.*.controls_sz) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))].*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                data.*.ev_i += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            19 => {
                if (data.*.has_focus) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                data.*.previous_control = data.*.fiddled_control;
                data.*.fiddled_control = X11Toolkit_GetControlMouseIsOn(data, @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.x)) / data.*.ev_scale) * data.*.ev_iscale)), @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.y)) / data.*.ev_scale) * data.*.ev_iscale)));
                if (data.*.previous_control != null) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                    sdl_pc = 4;
                    continue;
                }
            },
            23 => {
                data.*.previous_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
                if (data.*.previous_control.*.func_on_state_change != null) {
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
                if (data.*.fiddled_control != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            26 => {
                data.*.previous_control.*.func_on_state_change.?(data.*.previous_control);
                {
                    sdl_pc = 28;
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
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                if (data.*.fiddled_control.*.dynamic) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            32 => {
                data.*.fiddled_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_HOVER;
                if (data.*.fiddled_control.*.func_on_state_change != null) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                data.*.fiddled_control = null;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                data.*.fiddled_control.*.func_on_state_change.?(data.*.fiddled_control);
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
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                data.*.previous_control = data.*.fiddled_control;
                if (data.*.previous_control != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                data.*.previous_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
                if (data.*.previous_control.*.func_on_state_change != null) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                if (e.*.xbutton.button == @as(c_uint, Button1)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            42 => {
                data.*.previous_control.*.func_on_state_change.?(data.*.previous_control);
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                data.*.fiddled_control = X11Toolkit_GetControlMouseIsOn(data, @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.x)) / data.*.ev_scale) * data.*.ev_iscale)), @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.y)) / data.*.ev_scale) * data.*.ev_iscale)));
                if (data.*.fiddled_control != null) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            48 => {
                data.*.fiddled_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED_HELD;
                if (data.*.fiddled_control.*.func_on_state_change != null) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            51 => {
                data.*.fiddled_control.*.func_on_state_change.?(data.*.fiddled_control);
                {
                    sdl_pc = 53;
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
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                if ((data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_MENU)) or (data.*.mode == @as(SDL_ToolkitWindowModeX11, SDL_TOOLKIT_WINDOW_MODE_X11_TOOLTIP))) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                cx = e.*.xbutton.x;
                cy = e.*.xbutton.y;
                if ((cy < @as(c_int, 0)) or (cx < @as(c_int, 0))) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
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
                if ((e.*.xbutton.button == @as(c_uint, Button1)) and (data.*.fiddled_control != null)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            58 => {
                data.*.close = @"true" != 0;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if ((cy > data.*.window_height) or (cx > data.*.window_width)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                data.*.close = @"true" != 0;
                {
                    sdl_pc = 63;
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
                    sdl_pc = 57;
                    continue;
                }
            },
            64 => {
                control = X11Toolkit_GetControlMouseIsOn(data, @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.x)) / data.*.ev_scale) * data.*.ev_iscale)), @truncate(SDL_lroundf_REAL((@as(f32, @floatFromInt(e.*.xbutton.y)) / data.*.ev_scale) * data.*.ev_iscale)));
                if (data.*.fiddled_control == control) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            67 => {
                data.*.fiddled_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED;
                if (data.*.fiddled_control.*.func_on_state_change != null) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            70 => {
                data.*.fiddled_control.*.func_on_state_change.?(data.*.fiddled_control);
                {
                    sdl_pc = 72;
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
                data.*.fiddled_control.*.state = SDL_TOOLKIT_CONTROL_STATE_X11_NORMAL;
                data.*.draw = @"true" != 0;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            73 => {
                data.*.last_key_pressed = X11_XLookupKeysym.?(&e.*.xkey, 0);
                if (data.*.last_key_pressed == @as(KeySym, XK_Escape)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                data.*.ev_i = 0;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                if ((data.*.last_key_pressed == @as(KeySym, XK_Return)) or (data.*.last_key_pressed == @as(KeySym, XK_KP_Enter))) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            77 => {
                if (@as(usize, @bitCast(@as(c_long, data.*.ev_i))) < data.*.controls_sz) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if (data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))].*.is_default_esc) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            79 => {
                data.*.ev_i += 1;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            81 => {
                data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))].*.state = SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED;
                data.*.draw = @"true" != 0;
                data.*.key_control_esc = data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))];
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            84 => {
                data.*.ev_i = 0;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            87 => {
                if (@as(usize, @bitCast(@as(c_long, data.*.ev_i))) < data.*.controls_sz) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                if (data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))].*.selected) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            89 => {
                data.*.ev_i += 1;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            91 => {
                data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))].*.state = SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED;
                data.*.draw = @"true" != 0;
                data.*.key_control_enter = data.*.controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))];
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            94 => {
                key = X11_XLookupKeysym.?(&e.*.xkey, 0);
                if (key != data.*.last_key_pressed) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                if (key == @as(KeySym, XK_Escape)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                if (data.*.key_control_esc != null) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                if ((key == @as(KeySym, XK_Return)) or (key == @as(KeySym, XK_KP_Enter))) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            101 => {
                if (data.*.key_control_esc.*.func_on_state_change != null) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            104 => {
                data.*.key_control_esc.*.func_on_state_change.?(data.*.key_control_esc);
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
                    sdl_pc = 103;
                    continue;
                }
            },
            107 => {
                if (data.*.key_control_enter != null) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            108 => {
                if (((key == @as(KeySym, XK_Tab)) or (key == @as(KeySym, XK_Left))) or (key == @as(KeySym, XK_Right))) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            110 => {
                if (data.*.key_control_enter.*.func_on_state_change != null) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            113 => {
                data.*.key_control_enter.*.func_on_state_change.?(data.*.key_control_enter);
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                if (data.*.focused_control != null) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            119 => {
                data.*.focused_control.*.selected = @"false" != 0;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                data.*.draw = @"true" != 0;
                data.*.ev_i = 0;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                if (@as(usize, @bitCast(@as(c_long, data.*.ev_i))) < data.*.dyn_controls_sz) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            123 => {
                if (data.*.dyn_controls[@bitCast(@as(isize, @intCast(data.*.ev_i)))] == data.*.focused_control) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            124 => {
                data.*.ev_i += 1;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            126 => {
                if (key == @as(KeySym, XK_Left)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            129 => {
                next_index = data.*.ev_i - @as(c_int, 1);
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                next_index = data.*.ev_i + @as(c_int, 1);
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                if ((@as(usize, @bitCast(@as(c_long, next_index))) >= data.*.dyn_controls_sz) or (next_index < @as(c_int, 0))) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                if ((key == @as(KeySym, XK_Right)) or (key == @as(KeySym, XK_Left))) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                data.*.focused_control = data.*.dyn_controls[@bitCast(@as(isize, @intCast(next_index)))];
                data.*.focused_control.*.selected = @"true" != 0;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            135 => {
                next_index = data.*.ev_i;
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                next_index = 0;
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            138 => {
                X11Toolkit_DrawWindow(data);
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub fn X11Toolkit_DestroyIconControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var icon_control: [*c]SDL_ToolkitIconControlX11 = undefined;
    _ = &icon_control;
    icon_control = @ptrCast(@alignCast(control));
    _ = X11_XFreeFont.?(control.*.window.*.display, icon_control.*.icon_char_font);
    SDL_free_REAL(@ptrCast(@alignCast(control)));
}
pub fn X11Toolkit_DrawIconControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var icon_control: [*c]SDL_ToolkitIconControlX11 = undefined;
    _ = &icon_control;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                icon_control = @ptrCast(@alignCast(control));
                control.*.rect.w -= @as(c_int, 2) * control.*.window.*.iscale;
                control.*.rect.h -= @as(c_int, 2) * control.*.window.*.iscale;
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_bg_shadow.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 2) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 2) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)), 0, @as(c_int, 360) * @as(c_int, 64));
                switch (icon_control.*.flags & ((SDL_MESSAGEBOX_ERROR | SDL_MESSAGEBOX_WARNING) | SDL_MESSAGEBOX_INFORMATION)) {
                    SDL_MESSAGEBOX_ERROR => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_MESSAGEBOX_WARNING => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_MESSAGEBOX_INFORMATION => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                X11_XSetFont.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.icon_char_font.*.fid);
                _ = X11_XDrawString.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + icon_control.*.icon_char_x, control.*.rect.y + icon_control.*.icon_char_y, &icon_control.*.icon_char, 1);
                if (!control.*.window.*.utf8) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            2 => {
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_red_darker.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_red.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 2) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 2) * control.*.window.*.iscale))), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_white.pixel);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_black.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_yellow.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 2) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 2) * control.*.window.*.iscale))), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_black.pixel);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_white.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_blue.pixel);
                _ = X11_XFillArc.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 2) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 2) * control.*.window.*.iscale))), 0, @as(c_int, 360) * @as(c_int, 64));
                _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, icon_control.*.xcolor_white.pixel);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                X11_XSetFont.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.font_struct.*.fid);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                control.*.rect.w += @as(c_int, 2) * control.*.window.*.iscale;
                control.*.rect.h += @as(c_int, 2) * control.*.window.*.iscale;
                {}
            },
            else => unreachable,
        }
    }
}
pub fn X11Toolkit_CalculateIconControl(base_control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var control: [*c]SDL_ToolkitIconControlX11 = undefined;
    _ = &control;
    var icon_char_w: c_int = undefined;
    _ = &icon_char_w;
    var icon_wh: c_int = undefined;
    _ = &icon_wh;
    control = @ptrCast(@alignCast(base_control));
    X11Toolkit_GetTextWidthHeightForFont(control.*.icon_char_font, &control.*.icon_char, 1, &icon_char_w, &control.*.icon_char_h, &control.*.icon_char_a, null);
    base_control.*.rect.w = icon_char_w;
    base_control.*.rect.h = control.*.icon_char_h;
    icon_wh = (if (icon_char_w > control.*.icon_char_h) icon_char_w else control.*.icon_char_h) + ((SDL_TOOLKIT_X11_ELEMENT_PADDING * @as(c_int, 2)) * base_control.*.window.*.iscale);
    base_control.*.rect.w = icon_wh;
    base_control.*.rect.h = icon_wh;
    base_control.*.rect.y = 0;
    base_control.*.rect.x = 0;
    control.*.icon_char_y = control.*.icon_char_a + @divTrunc(base_control.*.rect.h - control.*.icon_char_h, @as(c_int, 2));
    control.*.icon_char_x = @divTrunc(base_control.*.rect.w - icon_char_w, @as(c_int, 2));
    base_control.*.rect.w += @as(c_int, 2) * base_control.*.window.*.iscale;
    base_control.*.rect.h += @as(c_int, 2) * base_control.*.window.*.iscale;
}
pub fn X11Toolkit_OnIconControlScaleChange(base_control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var control: [*c]SDL_ToolkitIconControlX11 = undefined;
    _ = &control;
    var font: [*c]u8 = undefined;
    _ = &font;
    control = @ptrCast(@alignCast(base_control));
    _ = X11_XFreeFont.?(base_control.*.window.*.display, control.*.icon_char_font);
    _ = SDL_asprintf_REAL(&font, g_IconFont, G_ICONFONT_SIZE * base_control.*.window.*.iscale);
    control.*.icon_char_font = X11_XLoadQueryFont.?(base_control.*.window.*.display, font);
    SDL_free_REAL(@ptrCast(@alignCast(font)));
    if (!(control.*.icon_char_font != null)) {
        _ = SDL_asprintf_REAL(&font, @ptrCast(@alignCast(&g_ToolkitFontLatin1)), G_TOOLKITFONT_SIZE * base_control.*.window.*.iscale);
        control.*.icon_char_font = X11_XLoadQueryFont.?(base_control.*.window.*.display, font);
        SDL_free_REAL(@ptrCast(@alignCast(font)));
    }
}
pub fn X11Toolkit_CalculateButtonControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    _ = X11Toolkit_GetTextElementsRect(button_control.*.text, &button_control.*.text_rect);
    if (control.*.do_size) {
        control.*.rect.w = ((SDL_TOOLKIT_X11_ELEMENT_PADDING_3 * @as(c_int, 2)) * control.*.window.*.iscale) + button_control.*.text_rect.w;
        control.*.rect.h = ((SDL_TOOLKIT_X11_ELEMENT_PADDING_3 * @as(c_int, 2)) * control.*.window.*.iscale) + button_control.*.text_rect.h;
    }
    button_control.*.text_rect.x = @divTrunc(control.*.rect.w - button_control.*.text_rect.w, @as(c_int, 2));
    button_control.*.text_rect.y = @divTrunc(control.*.rect.h - button_control.*.text_rect.h, @as(c_int, 2));
}
pub fn X11Toolkit_DrawButtonControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].pixel);
    if ((control.*.state == @as(SDL_ToolkitControlStateX11, SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED)) or (control.*.state == @as(SDL_ToolkitControlStateX11, SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED_HELD))) {
        _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_d.pixel);
        _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)));
        _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l2.pixel);
        _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 1) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 1) * control.*.window.*.iscale))));
        _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l1.pixel);
        _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 3) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 2) * control.*.window.*.iscale))));
        _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].pixel);
        _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 3) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 3) * control.*.window.*.iscale))));
        _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_pressed.pixel);
        _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 2) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 2) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 4) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 4) * control.*.window.*.iscale))));
    } else {
        if (control.*.selected) {
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_d.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l2.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 3) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 3) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 2) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 2) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 4) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 4) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l1.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 2) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 2) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 5) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 5) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, if (control.*.state == @as(SDL_ToolkitControlStateX11, SDL_TOOLKIT_CONTROL_STATE_X11_HOVER)) control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED].pixel else control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 3) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 3) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 6) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 6) * control.*.window.*.iscale))));
        } else {
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_d.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w)), @bitCast(@as(c_int, control.*.rect.h)));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l2.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x, control.*.rect.y, @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 1) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 1) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BORDER].pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 2) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 2) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor_bevel_l1.pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 1) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 1) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 3) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 3) * control.*.window.*.iscale))));
            _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, if (control.*.state == @as(SDL_ToolkitControlStateX11, SDL_TOOLKIT_CONTROL_STATE_X11_HOVER)) control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED].pixel else control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND].pixel);
            _ = X11_XFillRectangle.?(control.*.window.*.display, control.*.window.*.drawable, control.*.window.*.ctx, control.*.rect.x + (@as(c_int, 2) * control.*.window.*.iscale), control.*.rect.y + (@as(c_int, 2) * control.*.window.*.iscale), @bitCast(@as(c_int, control.*.rect.w - (@as(c_int, 4) * control.*.window.*.iscale))), @bitCast(@as(c_int, control.*.rect.h - (@as(c_int, 4) * control.*.window.*.iscale))));
        }
    }
    _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].pixel);
    X11Toolkit_DrawTextElements(control.*.window, button_control.*.text, control.*.rect.x + button_control.*.text_rect.x, control.*.rect.y + button_control.*.text_rect.y);
}
pub fn X11Toolkit_OnButtonControlStateChange(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    if ((button_control.*.cb != null) and (control.*.state == @as(SDL_ToolkitControlStateX11, SDL_TOOLKIT_CONTROL_STATE_X11_PRESSED))) {
        button_control.*.cb.?(control, button_control.*.cb_data);
    }
}
pub fn X11Toolkit_DestroyButtonControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var button_control: [*c]SDL_ToolkitButtonControlX11 = undefined;
    _ = &button_control;
    button_control = @ptrCast(@alignCast(control));
    X11Toolkit_FreeTextElementsListContents(button_control.*.text);
    SDL_ListClear(&button_control.*.text);
    SDL_free_REAL(@ptrCast(@alignCast(control)));
}
pub fn X11Toolkit_CountLinesOfText(arg_text: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var text = arg_text;
    _ = &text;
    var result: c_int = 0;
    _ = &result;
    while ((text != null) and (@as(c_int, text.*) != 0)) {
        var lf: [*c]const u8 = SDL_strchr_REAL(text, '\n');
        _ = &lf;
        result += 1;
        text = @ptrCast(@alignCast(if (lf != null) @as(?*const anyopaque, @ptrCast(@alignCast(lf + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
    }
    return result;
}
pub fn X11Toolkit_DrawLabelControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var label_control: [*c]SDL_ToolkitLabelControlX11 = undefined;
    _ = &label_control;
    var i: c_int = undefined;
    _ = &i;
    label_control = @ptrCast(@alignCast(control));
    _ = X11_XSetForeground.?(control.*.window.*.display, control.*.window.*.ctx, control.*.window.*.xcolor[SDL_MESSAGEBOX_COLOR_TEXT].pixel);
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < label_control.*.sz) : (i += 1) {
            X11Toolkit_DrawTextElements(control.*.window, label_control.*.lines[@bitCast(@as(isize, @intCast(i)))].text, control.*.rect.x + label_control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x, control.*.rect.y + label_control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.y);
        }
    }
}
pub fn X11Toolkit_DestroyLabelControl(control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var label_control: [*c]SDL_ToolkitLabelControlX11 = undefined;
    _ = &label_control;
    var i: c_int = undefined;
    _ = &i;
    label_control = @ptrCast(@alignCast(control));
    {
        i = 0;
        while (@as(usize, @bitCast(@as(c_long, i))) < label_control.*.sz) : (i += 1) {
            X11Toolkit_FreeTextElementsListContents(label_control.*.lines[@bitCast(@as(isize, @intCast(i)))].text);
            SDL_ListClear(&label_control.*.lines[@bitCast(@as(isize, @intCast(i)))].text);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(label_control.*.lines)));
    SDL_free_REAL(@ptrCast(@alignCast(label_control)));
}
pub fn X11Toolkit_CalculateLabelControl(base_control: [*c]SDL_ToolkitControlX11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var control: [*c]SDL_ToolkitLabelControlX11 = undefined;
    _ = &control;
    var i: c_int = undefined;
    _ = &i;
    var font_h: c_int = undefined;
    _ = &font_h;
    var first_ndn_dir: FriBidiParType = undefined;
    _ = &first_ndn_dir;
    var last_ndn: c_int = undefined;
    _ = &last_ndn;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                control = @ptrCast(@alignCast(base_control));
                if (base_control.*.do_size) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                base_control.*.rect.w = 0;
                base_control.*.rect.h = 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < control.*.sz) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                font_h = X11Toolkit_GetTextElementsRect(control.*.lines[@bitCast(@as(isize, @intCast(i)))].text, &control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect);
                if (base_control.*.do_size) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            6 => {
                i += 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                if (base_control.*.window.*.fribidi != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            8 => {
                base_control.*.rect.w = if (base_control.*.rect.w > control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.w) base_control.*.rect.w else control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.w;
                {
                    sdl_pc = 10;
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
                if (i > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.y = font_h + control.*.lines[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))].rect.y;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.y = 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            14 => {
                first_ndn_dir = FRIBIDI_PAR_LTR;
                i = 0;
                {
                    sdl_pc = 17;
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
                if ((@as(usize, @bitCast(@as(c_long, @as(c_int, @intFromBool(base_control.*.do_size))))) != 0) and (control.*.sz != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            17 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < control.*.sz) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                if (control.*.lines[@bitCast(@as(isize, @intCast(i)))].par != @as(FriBidiParType, FRIBIDI_PAR_ON)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                i += 1;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                last_ndn = -@as(c_int, 1);
                i = 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            21 => {
                first_ndn_dir = control.*.lines[@bitCast(@as(isize, @intCast(i)))].par;
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < control.*.sz) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                switch (control.*.lines[@bitCast(@as(isize, @intCast(i)))].par) {
                    @as(FriBidiParType, FRIBIDI_PAR_LTR) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(FriBidiParType, FRIBIDI_PAR_RTL) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
                        continue;
                    },
                }
            },
            26 => {
                i += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = 0;
                last_ndn = i;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            30 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = base_control.*.rect.w - control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.w;
                last_ndn = i;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                if (last_ndn != -@as(c_int, 1)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                if (control.*.lines[@bitCast(@as(isize, @intCast(last_ndn)))].par == @as(FriBidiParType, FRIBIDI_PAR_RTL)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (first_ndn_dir == @as(FriBidiParType, FRIBIDI_PAR_RTL)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            35 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = base_control.*.rect.w - control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.w;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = 0;
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
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = base_control.*.rect.w - control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.w;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                control.*.lines[@bitCast(@as(isize, @intCast(i)))].rect.x = 0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            41 => {
                base_control.*.rect.h = control.*.lines[control.*.sz -% @as(usize, 1)].rect.y + control.*.lines[control.*.sz -% @as(usize, 1)].rect.h;
                {
                    sdl_pc = 43;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub const __LC_ALL = @as(c_int, 6);
pub const G_ICONFONT_SIZE = @as(c_int, 22);
pub const G_TOOLKITFONT_SIZE = @as(c_int, 140);
