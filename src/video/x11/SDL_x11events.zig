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
pub const __pid_t = c_int;
pub const __time_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const pid_t = __pid_t;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
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
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
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
pub const SDL_HITTEST_DRAGGABLE: c_int = 1;
pub const SDL_HITTEST_RESIZE_TOPLEFT: c_int = 2;
pub const SDL_HITTEST_RESIZE_TOP: c_int = 3;
pub const SDL_HITTEST_RESIZE_TOPRIGHT: c_int = 4;
pub const SDL_HITTEST_RESIZE_RIGHT: c_int = 5;
pub const SDL_HITTEST_RESIZE_BOTTOMRIGHT: c_int = 6;
pub const SDL_HITTEST_RESIZE_BOTTOM: c_int = 7;
pub const SDL_HITTEST_RESIZE_BOTTOMLEFT: c_int = 8;
pub const SDL_HITTEST_RESIZE_LEFT: c_int = 9;
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
pub const X11_PENDING_OP_RESTORE: c_int = 1;
pub const X11_PENDING_OP_MINIMIZE: c_int = 2;
pub const X11_PENDING_OP_MAXIMIZE: c_int = 4;
pub const X11_PENDING_OP_FULLSCREEN: c_int = 8;
pub const X11_PENDING_OP_MOVE: c_int = 16;
pub const X11_PENDING_OP_RESIZE: c_int = 32;
const enum_unnamed_55 = c_uint;
pub const X11_SIZE_MOVE_EVENTS_WAIT_FOR_BORDERS: c_int = 2;
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
pub const SDL_FLASH_CANCEL: c_int = 0;
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
pub const SDL_Keycode = Uint32;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
pub extern fn SDL_GetKeyboardState_REAL(numkeys: [*c]c_int) [*c]const bool;
pub extern fn SDL_GetModState_REAL() SDL_Keymod;
pub extern fn SDL_SetModState_REAL(modstate: SDL_Keymod) void;
pub extern fn SDL_GetKeyFromScancode_REAL(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
pub extern fn SDL_TextInputActive_REAL(window: [*c]SDL_Window) bool;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
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
pub const SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED: c_int = 344;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_HIDDEN: c_int = 515;
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_MAXIMIZED: c_int = 522;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED: c_int = 528;
pub const SDL_EVENT_WINDOW_HIT_TEST: c_int = 529;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED: c_int = 530;
pub const SDL_EVENT_WINDOW_OCCLUDED: c_int = 534;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub const SDL_X11EventHook = ?*const fn (userdata: ?*anyopaque, xevent: [*c]XEvent) callconv(.c) bool;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_startswith(string: [*c]const u8, prefix: [*c]const u8) bool;
pub extern fn SDL_URIToLocal(src: [*c]const u8, dst: [*c]u8) c_int;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
const struct_unnamed_92 = extern struct {
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
const struct_unnamed_93 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const SDL_VideoData = struct_SDL_VideoData;
const struct_unnamed_94 = extern struct {
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
    es_profile_max_supported_version: struct_unnamed_94 = @import("std").mem.zeroes(struct_unnamed_94),
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
pub const struct_SDL_EGL_VideoData_95 = opaque {};
pub const struct_SDL_PrivateGLESData_96 = opaque {};
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
    gl_config: struct_unnamed_92 = @import("std").mem.zeroes(struct_unnamed_92),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_93 = @import("std").mem.zeroes(struct_unnamed_93),
    internal: [*c]SDL_VideoData = null,
    gl_data: [*c]struct_SDL_GLDriverData = null,
    egl_data: ?*struct_SDL_EGL_VideoData_95 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_96 = null,
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
pub const SDL_FULLSCREEN_OP_ENTER: c_int = 1;
pub const SDL_FULLSCREEN_OP_UPDATE: c_int = 2;
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_SetDisplayModeForDisplay(display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) bool;
pub extern fn SDL_GlobalToRelativeForWindow(window: [*c]SDL_Window, abs_x: c_int, abs_y: c_int, rel_x: [*c]c_int, rel_y: [*c]c_int) void;
pub extern fn SDL_UpdateWindowGrab(window: [*c]SDL_Window) void;
pub extern fn SDL_UpdateFullscreenMode(window: [*c]SDL_Window, fullscreen: SDL_FullscreenOp, commit: bool) bool;
pub extern fn SDL_DBus_ScreensaverTickle() void;
pub extern fn SDL_DBus_ScreensaverInhibit(inhibit: bool) bool;
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
pub const XPoint = extern struct {
    x: c_short = 0,
    y: c_short = 0,
};
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int = 0,
    modifiermap: [*c]KeyCode = null,
};
pub const struct__XPrivate = opaque {};
const struct_unnamed_97 = extern struct {
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
pub const _XPrivDisplay = [*c]struct_unnamed_97;
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
pub const XKeyPressedEvent = XKeyEvent;
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
const union_unnamed_98 = extern union {
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
    data: union_unnamed_98 = @import("std").mem.zeroes(union_unnamed_98),
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
pub const XErrorHandler = ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int;
pub const struct__XComposeStatus = extern struct {
    compose_ptr: XPointer = null,
    chars_matched: c_int = 0,
};
pub const XComposeStatus = struct__XComposeStatus;
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
pub const struct__XkbStateRec = extern struct {
    group: u8 = 0,
    locked_group: u8 = 0,
    base_group: c_ushort = 0,
    latched_group: c_ushort = 0,
    mods: u8 = 0,
    base_mods: u8 = 0,
    latched_mods: u8 = 0,
    locked_mods: u8 = 0,
    compat_state: u8 = 0,
    grab_mods: u8 = 0,
    compat_grab_mods: u8 = 0,
    lookup_mods: u8 = 0,
    compat_lookup_mods: u8 = 0,
    ptr_buttons: c_ushort = 0,
};
pub const XkbStateRec = struct__XkbStateRec;
pub const XkbStatePtr = [*c]struct__XkbStateRec;
pub const struct__XkbAnyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_uint = 0,
};
pub const XkbAnyEvent = struct__XkbAnyEvent;
pub const struct__XkbNewKeyboardNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    old_device: c_int = 0,
    min_key_code: c_int = 0,
    max_key_code: c_int = 0,
    old_min_key_code: c_int = 0,
    old_max_key_code: c_int = 0,
    changed: c_uint = 0,
    req_major: u8 = 0,
    req_minor: u8 = 0,
};
pub const XkbNewKeyboardNotifyEvent = struct__XkbNewKeyboardNotify;
pub const struct__XkbMapNotifyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed: c_uint = 0,
    flags: c_uint = 0,
    first_type: c_int = 0,
    num_types: c_int = 0,
    min_key_code: KeyCode = 0,
    max_key_code: KeyCode = 0,
    first_key_sym: KeyCode = 0,
    first_key_act: KeyCode = 0,
    first_key_behavior: KeyCode = 0,
    first_key_explicit: KeyCode = 0,
    first_modmap_key: KeyCode = 0,
    first_vmodmap_key: KeyCode = 0,
    num_key_syms: c_int = 0,
    num_key_acts: c_int = 0,
    num_key_behaviors: c_int = 0,
    num_key_explicit: c_int = 0,
    num_modmap_keys: c_int = 0,
    num_vmodmap_keys: c_int = 0,
    vmods: c_uint = 0,
};
pub const XkbMapNotifyEvent = struct__XkbMapNotifyEvent;
pub const struct__XkbStateNotifyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed: c_uint = 0,
    group: c_int = 0,
    base_group: c_int = 0,
    latched_group: c_int = 0,
    locked_group: c_int = 0,
    mods: c_uint = 0,
    base_mods: c_uint = 0,
    latched_mods: c_uint = 0,
    locked_mods: c_uint = 0,
    compat_state: c_int = 0,
    grab_mods: u8 = 0,
    compat_grab_mods: u8 = 0,
    lookup_mods: u8 = 0,
    compat_lookup_mods: u8 = 0,
    ptr_buttons: c_int = 0,
    keycode: KeyCode = 0,
    event_type: u8 = 0,
    req_major: u8 = 0,
    req_minor: u8 = 0,
};
pub const XkbStateNotifyEvent = struct__XkbStateNotifyEvent;
pub const struct__XkbControlsNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed_ctrls: c_uint = 0,
    enabled_ctrls: c_uint = 0,
    enabled_ctrl_changes: c_uint = 0,
    num_groups: c_int = 0,
    keycode: KeyCode = 0,
    event_type: u8 = 0,
    req_major: u8 = 0,
    req_minor: u8 = 0,
};
pub const XkbControlsNotifyEvent = struct__XkbControlsNotify;
pub const struct__XkbIndicatorNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed: c_uint = 0,
    state: c_uint = 0,
};
pub const XkbIndicatorNotifyEvent = struct__XkbIndicatorNotify;
pub const struct__XkbNamesNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed: c_uint = 0,
    first_type: c_int = 0,
    num_types: c_int = 0,
    first_lvl: c_int = 0,
    num_lvls: c_int = 0,
    num_aliases: c_int = 0,
    num_radio_groups: c_int = 0,
    changed_vmods: c_uint = 0,
    changed_groups: c_uint = 0,
    changed_indicators: c_uint = 0,
    first_key: c_int = 0,
    num_keys: c_int = 0,
};
pub const XkbNamesNotifyEvent = struct__XkbNamesNotify;
pub const struct__XkbCompatMapNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    changed_groups: c_uint = 0,
    first_si: c_int = 0,
    num_si: c_int = 0,
    num_total_si: c_int = 0,
};
pub const XkbCompatMapNotifyEvent = struct__XkbCompatMapNotify;
pub const struct__XkbBellNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    percent: c_int = 0,
    pitch: c_int = 0,
    duration: c_int = 0,
    bell_class: c_int = 0,
    bell_id: c_int = 0,
    name: Atom = 0,
    window: Window = 0,
    event_only: c_int = 0,
};
pub const XkbBellNotifyEvent = struct__XkbBellNotify;
pub const struct__XkbActionMessage = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    keycode: KeyCode = 0,
    press: c_int = 0,
    key_event_follows: c_int = 0,
    group: c_int = 0,
    mods: c_uint = 0,
    message: [7]u8 = @import("std").mem.zeroes([7]u8),
};
pub const XkbActionMessageEvent = struct__XkbActionMessage;
pub const struct__XkbAccessXNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    detail: c_int = 0,
    keycode: c_int = 0,
    sk_delay: c_int = 0,
    debounce_delay: c_int = 0,
};
pub const XkbAccessXNotifyEvent = struct__XkbAccessXNotify;
pub const struct__XkbExtensionDeviceNotify = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    time: Time = 0,
    xkb_type: c_int = 0,
    device: c_int = 0,
    reason: c_uint = 0,
    supported: c_uint = 0,
    unsupported: c_uint = 0,
    first_btn: c_int = 0,
    num_btns: c_int = 0,
    leds_defined: c_uint = 0,
    led_state: c_uint = 0,
    led_class: c_int = 0,
    led_id: c_int = 0,
};
pub const XkbExtensionDeviceNotifyEvent = struct__XkbExtensionDeviceNotify;
pub const union__XkbEvent = extern union {
    type: c_int,
    any: XkbAnyEvent,
    new_kbd: XkbNewKeyboardNotifyEvent,
    map: XkbMapNotifyEvent,
    state: XkbStateNotifyEvent,
    ctrls: XkbControlsNotifyEvent,
    indicators: XkbIndicatorNotifyEvent,
    names: XkbNamesNotifyEvent,
    compat: XkbCompatMapNotifyEvent,
    bell: XkbBellNotifyEvent,
    message: XkbActionMessageEvent,
    accessx: XkbAccessXNotifyEvent,
    device: XkbExtensionDeviceNotifyEvent,
    core: XEvent,
};
pub const XkbEvent = union__XkbEvent;
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
pub extern fn __errno_location() [*c]c_int;
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
pub const XFixesSelectionNotifyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    subtype: c_int = 0,
    owner: Window = 0,
    selection: Atom = 0,
    timestamp: Time = 0,
    selection_timestamp: Time = 0,
};
pub const pointer = ?*anyopaque;
pub const SDL_DYNX11FN_XChangeProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: Atom, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) c_int;
pub extern var X11_XChangeProperty: SDL_DYNX11FN_XChangeProperty;
pub const SDL_DYNX11FN_XCheckIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub extern var X11_XCheckIfEvent: SDL_DYNX11FN_XCheckIfEvent;
pub const SDL_DYNX11FN_XConvertSelection = ?*const fn (a: [*c]Display, b: Atom, c: Atom, d: Atom, e: Window, f: Time) callconv(.c) c_int;
pub extern var X11_XConvertSelection: SDL_DYNX11FN_XConvertSelection;
pub const SDL_DYNX11FN_XFilterEvent = ?*const fn (event: [*c]XEvent, w: Window) callconv(.c) c_int;
pub extern var X11_XFilterEvent: SDL_DYNX11FN_XFilterEvent;
pub const SDL_DYNX11FN_XFlush = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XFlush: SDL_DYNX11FN_XFlush;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XGetAtomName = ?*const fn (a: [*c]Display, b: Atom) callconv(.c) [*c]u8;
pub extern var X11_XGetAtomName: SDL_DYNX11FN_XGetAtomName;
pub const SDL_DYNX11FN_XGetSelectionOwner = ?*const fn (a: [*c]Display, b: Atom) callconv(.c) Window;
pub extern var X11_XGetSelectionOwner: SDL_DYNX11FN_XGetSelectionOwner;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub extern var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes;
pub const SDL_DYNX11FN_XGetWindowProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XGetWindowProperty: SDL_DYNX11FN_XGetWindowProperty;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XLookupString = ?*const fn (a: [*c]XKeyEvent, b: [*c]u8, c: c_int, d: [*c]KeySym, e: [*c]XComposeStatus) callconv(.c) c_int;
pub extern var X11_XLookupString: SDL_DYNX11FN_XLookupString;
pub const SDL_DYNX11FN_XMoveWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int) callconv(.c) c_int;
pub extern var X11_XMoveWindow: SDL_DYNX11FN_XMoveWindow;
pub const SDL_DYNX11FN_XPending = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XPending: SDL_DYNX11FN_XPending;
pub const SDL_DYNX11FN_XQueryKeymap = ?*const fn (a: [*c]Display, b: [*c]u8) callconv(.c) c_int;
pub extern var X11_XQueryKeymap: SDL_DYNX11FN_XQueryKeymap;
pub const SDL_DYNX11FN_XQueryPointer = ?*const fn (a: [*c]Display, b: Window, c: [*c]Window, d: [*c]Window, e: [*c]c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]c_int, i: [*c]c_uint) callconv(.c) c_int;
pub extern var X11_XQueryPointer: SDL_DYNX11FN_XQueryPointer;
pub const SDL_DYNX11FN_XResetScreenSaver = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XResetScreenSaver: SDL_DYNX11FN_XResetScreenSaver;
pub const SDL_DYNX11FN_XResizeWindow = ?*const fn (a: [*c]Display, b: Window, c: c_uint, d: c_uint) callconv(.c) c_int;
pub extern var X11_XResizeWindow: SDL_DYNX11FN_XResizeWindow;
pub const SDL_DYNX11FN_XScreenNumberOfScreen = ?*const fn (a: [*c]Screen) callconv(.c) c_int;
pub extern var X11_XScreenNumberOfScreen: SDL_DYNX11FN_XScreenNumberOfScreen;
pub const SDL_DYNX11FN_XSendEvent = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_long, e: [*c]XEvent) callconv(.c) c_int;
pub extern var X11_XSendEvent: SDL_DYNX11FN_XSendEvent;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub extern var X11_XSync: SDL_DYNX11FN_XSync;
pub const SDL_DYNX11FN_XTranslateCoordinates = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]Window) callconv(.c) c_int;
pub extern var X11_XTranslateCoordinates: SDL_DYNX11FN_XTranslateCoordinates;
pub const SDL_DYNX11FN_XUngrabPointer = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub extern var X11_XUngrabPointer: SDL_DYNX11FN_XUngrabPointer;
pub const SDL_DYNX11FN_XGetErrorText = ?*const fn (a: [*c]Display, b: c_int, c: [*c]u8, d: c_int) callconv(.c) c_int;
pub extern var X11_XGetErrorText: SDL_DYNX11FN_XGetErrorText;
pub const SDL_DYNX11FN_XRefreshKeyboardMapping = ?*const fn (a: [*c]XMappingEvent) callconv(.c) void;
pub extern var X11_XRefreshKeyboardMapping: SDL_DYNX11FN_XRefreshKeyboardMapping;
pub const SDL_DYNX11FN_XQueryTree = ?*const fn (a: [*c]Display, b: Window, c: [*c]Window, d: [*c]Window, e: [*c][*c]Window, f: [*c]c_uint) callconv(.c) c_int;
pub extern var X11_XQueryTree: SDL_DYNX11FN_XQueryTree;
pub const SDL_DYNX11FN_XGetEventData = ?*const fn (a: [*c]Display, b: [*c]XGenericEventCookie) callconv(.c) c_int;
pub extern var X11_XGetEventData: SDL_DYNX11FN_XGetEventData;
pub const SDL_DYNX11FN_XFreeEventData = ?*const fn (a: [*c]Display, b: [*c]XGenericEventCookie) callconv(.c) void;
pub extern var X11_XFreeEventData: SDL_DYNX11FN_XFreeEventData;
pub const SDL_DYNX11FN_XkbGetState = ?*const fn (a: [*c]Display, b: c_uint, c: XkbStatePtr) callconv(.c) c_int;
pub extern var X11_XkbGetState: SDL_DYNX11FN_XkbGetState;
pub const SDL_DYNX11FN_XkbRefreshKeyboardMapping = ?*const fn (a: [*c]XkbMapNotifyEvent) callconv(.c) c_int;
pub extern var X11_XkbRefreshKeyboardMapping: SDL_DYNX11FN_XkbRefreshKeyboardMapping;
pub const SDL_DYNX11FN_Xutf8LookupString = ?*const fn (a: XIC, b: [*c]XKeyPressedEvent, c: [*c]u8, d: c_int, e: [*c]KeySym, f: [*c]c_int) callconv(.c) c_int;
pub extern var X11_Xutf8LookupString: SDL_DYNX11FN_Xutf8LookupString;
pub const SDL_DYNX11FN_XSetICFocus = ?*const fn (a: XIC) callconv(.c) void;
pub extern var X11_XSetICFocus: SDL_DYNX11FN_XSetICFocus;
pub const SDL_DYNX11FN_XUnsetICFocus = ?*const fn (a: XIC) callconv(.c) void;
pub extern var X11_XUnsetICFocus: SDL_DYNX11FN_XUnsetICFocus;
pub const SDL_DYNX11FN_XScreenSaverQueryExtension = ?*const fn (dpy: [*c]Display, event_base: [*c]c_int, error_base: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XScreenSaverQueryExtension: SDL_DYNX11FN_XScreenSaverQueryExtension;
pub const SDL_DYNX11FN_XScreenSaverQueryVersion = ?*const fn (dpy: [*c]Display, major_versionp: [*c]c_int, minor_versionp: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XScreenSaverQueryVersion: SDL_DYNX11FN_XScreenSaverQueryVersion;
pub const SDL_DYNX11FN_XScreenSaverSuspend = ?*const fn (dpy: [*c]Display, @"suspend": c_int) callconv(.c) void;
pub extern var X11_XScreenSaverSuspend: SDL_DYNX11FN_XScreenSaverSuspend;
pub extern var SDL_X11_HAVE_XFIXES: c_int;
pub extern var SDL_X11_HAVE_XSS: c_int;
pub extern fn GetWindow(_this: [*c]SDL_VideoDevice) Window;
pub extern fn X11_UpdateKeymap(_this: [*c]SDL_VideoDevice, send_event: bool) void;
pub extern fn X11_ClearComposition(data: [*c]SDL_WindowData) void;
pub extern fn X11_HandleXsettingsEvent(_this: [*c]SDL_VideoDevice, xevent: [*c]const XEvent) void;
pub extern fn X11_CheckDisplaysMoved(_this: [*c]SDL_VideoDevice, dpy: [*c]Display) void;
pub extern fn X11_HandleXRandREvent(_this: [*c]SDL_VideoDevice, xevent: [*c]const XEvent) void;
pub extern fn X11_SetHitTestCursor(rc: SDL_HitTestResult) void;
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
pub const PENDING_FOCUS_NONE: c_int = 0;
pub const PENDING_FOCUS_IN: c_int = 1;
pub const PENDING_FOCUS_OUT: c_int = 2;
pub const PendingFocusEnum = c_uint;
pub extern fn X11_GetNetWMState(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, xwindow: Window) SDL_WindowFlags;
pub extern fn X11_SetWindowBordered(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) void;
pub extern fn X11_SetWindowMouseGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool;
pub extern fn X11_SetWindowKeyboardGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool;
pub extern fn X11_FlashWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) bool;
pub extern fn X11_UpdateWindowPosition(window: [*c]SDL_Window, use_current_position: bool) void;
pub extern fn X11_SetWindowMinMax(window: [*c]SDL_Window, use_current: bool) void;
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
pub extern fn SDL_GetMouse() [*c]SDL_Mouse;
pub extern fn SDL_SetMouseFocus(window: [*c]SDL_Window) void;
pub extern fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void;
pub extern fn SDL_SendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool) void;
pub extern fn SDL_SendMouseWheel(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32, direction: SDL_MouseWheelDirection) void;
pub extern fn X11_HandleXinput2Event(_this: [*c]SDL_VideoDevice, cookie: [*c]XGenericEventCookie) void;
pub extern fn X11_Xinput2UpdateDevices(_this: [*c]SDL_VideoDevice) void;
pub extern fn X11_Xinput2UpdatePointerMapping(_this: [*c]SDL_VideoDevice) void;
pub extern fn X11_Xinput2HandlesMotionForWindow(window_data: [*c]SDL_WindowData) bool;
pub extern fn X11_ConfineCursorWithFlags(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, rect: [*c]const SDL_Rect, flags: c_int) bool;
pub extern fn X11_GetXFixesSelectionNotifyEvent() c_int;
pub extern fn SDL_CancelClipboardData(sequence: Uint32) void;
pub extern fn X11_HandleSyncRequest(window: [*c]SDL_Window, event: [*c]XClientMessageEvent) void;
pub extern fn X11_HandleConfigure(window: [*c]SDL_Window, event: [*c]XConfigureEvent) void;
pub extern fn SDL_IOReady(fd: c_int, flags: c_int, timeoutNS: Sint64) c_int;
pub extern fn SDL_SendClipboardUpdate(owner: bool, mime_types: [*c][*c]u8, num_mime_types: usize) void;
pub extern fn SDL_SendDisplayEvent(display: [*c]SDL_VideoDisplay, displayevent: SDL_EventType, data1: c_int, data2: c_int) void;
pub extern fn SDL_SendDropFile(window: [*c]SDL_Window, source: [*c]const u8, file: [*c]const u8) bool;
pub extern fn SDL_SendDropPosition(window: [*c]SDL_Window, x: f32, y: f32) bool;
pub extern fn SDL_SendDropText(window: [*c]SDL_Window, text: [*c]const u8) bool;
pub extern fn SDL_SendDropComplete(window: [*c]SDL_Window) bool;
pub extern fn SDL_SetKeymap(keymap: ?*SDL_Keymap, send_event: bool) void;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_SendKeyboardKeyIgnoreModifiers(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool;
pub extern fn SDL_SendKeyboardText(text: [*c]const u8) void;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_AllocateTemporaryMemory(size: usize) ?*anyopaque;
pub const SDL_x11Prop = extern struct {
    data: [*c]u8 = null,
    format: c_int = 0,
    count: c_int = 0,
    type: Atom = 0,
};
pub fn X11_ReadProperty(p: [*c]SDL_x11Prop, disp: [*c]Display, w: Window, prop: Atom) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ret: [*c]u8 = null;
    _ = &ret;
    var @"type": Atom = undefined;
    _ = &@"type";
    var fmt: c_int = undefined;
    _ = &fmt;
    var count: c_ulong = undefined;
    _ = &count;
    var bytes_left: c_ulong = undefined;
    _ = &bytes_left;
    var bytes_fetch: c_int = 0;
    _ = &bytes_fetch;
    while (true) {
        if (ret != null) {
            _ = X11_XFree.?(@ptrCast(@alignCast(ret)));
        }
        _ = X11_XGetWindowProperty.?(disp, w, prop, 0, bytes_fetch, False, AnyPropertyType, &@"type", &fmt, &count, &bytes_left, &ret);
        {
            const ref = &bytes_fetch;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) +% bytes_left)));
        }
        if (!(bytes_left != @as(c_ulong, 0))) break;
    }
    p.*.data = ret;
    p.*.format = fmt;
    p.*.count = @bitCast(@as(c_uint, @truncate(count)));
    p.*.type = @"type";
}
pub fn X11_PickTarget(disp: [*c]Display, list: [*c]Atom, list_count: c_int) callconv(.c) Atom {
    @setEvalBranchQuota(100000);
    const text_uri_request: Atom = X11_XInternAtom.?(disp, "text/uri-list", False);
    _ = &text_uri_request;
    var request: Atom = None;
    _ = &request;
    var preferred: Atom = None;
    _ = &preferred;
    {
        var i: c_int = 0;
        _ = &i;
        while ((i < list_count) and (request != text_uri_request)) : (i += 1) {
            var name: [*c]u8 = X11_XGetAtomName.?(disp, list[@bitCast(@as(isize, @intCast(i)))]);
            _ = &name;
            if (((SDL_strcmp_REAL("text/uri-list", name) == @as(c_int, 0)) or (SDL_strcmp_REAL("text/plain;charset=utf-8", name) == @as(c_int, 0))) or (SDL_strcmp_REAL("UTF8_STRING", name) == @as(c_int, 0))) {
                if (preferred == @as(Atom, None)) {
                    preferred = list[@bitCast(@as(isize, @intCast(i)))];
                }
                request = list[@bitCast(@as(isize, @intCast(i)))];
            }
            if ((SDL_strcmp_REAL("text/plain", name) == @as(c_int, 0)) or (SDL_strcmp_REAL("TEXT", name) == @as(c_int, 0))) {
                if (request == @as(Atom, None)) {
                    request = list[@bitCast(@as(isize, @intCast(i)))];
                }
            }
            _ = X11_XFree.?(@ptrCast(@alignCast(name)));
        }
    }
    if ((preferred != @as(Atom, None)) and (request != text_uri_request)) {
        request = preferred;
    }
    return request;
}
pub fn X11_PickTargetFromAtoms(disp: [*c]Display, a0: Atom, a1: Atom, a2: Atom) callconv(.c) Atom {
    @setEvalBranchQuota(100000);
    var count: c_int = 0;
    _ = &count;
    var atom: [3]Atom = undefined;
    _ = &atom;
    if (a0 != @as(Atom, None)) {
        atom[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = a0;
    }
    if (a1 != @as(Atom, None)) {
        atom[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = a1;
    }
    if (a2 != @as(Atom, None)) {
        atom[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = a2;
    }
    return X11_PickTarget(disp, @ptrCast(@alignCast(&atom)), count);
}
pub const struct_KeyRepeatCheckData = extern struct {
    event: [*c]XEvent = null,
    found: bool = false,
};
pub fn X11_KeyRepeatCheckIfEvent(_: [*c]Display, chkev: [*c]XEvent, arg: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var d: [*c]struct_KeyRepeatCheckData = @ptrCast(@alignCast(arg));
    _ = &d;
    if (((chkev.*.type == KeyPress) and (chkev.*.xkey.keycode == d.*.event.*.xkey.keycode)) and ((chkev.*.xkey.time -% d.*.event.*.xkey.time) < @as(Time, 2))) {
        d.*.found = @"true" != 0;
    }
    return False;
}
pub fn X11_KeyRepeat(display: [*c]Display, event: [*c]XEvent) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dummyev: XEvent = undefined;
    _ = &dummyev;
    var d: struct_KeyRepeatCheckData = undefined;
    _ = &d;
    d.event = event;
    d.found = @"false" != 0;
    if (X11_XPending.?(display) != 0) {
        _ = X11_XCheckIfEvent.?(display, &dummyev, X11_KeyRepeatCheckIfEvent, @ptrCast(@alignCast(&d)));
    }
    return d.found;
}
pub export fn X11_IsWheelEvent(button: c_int, xticks: [*c]c_int, yticks: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (button) {
                    @as(c_int, 4) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                yticks.* = 1;
                return @"true" != 0;
            },
            3 => {
                yticks.* = -@as(c_int, 1);
                return @"true" != 0;
            },
            4 => {
                xticks.* = 1;
                return @"true" != 0;
            },
            5 => {
                xticks.* = -@as(c_int, 1);
                return @"true" != 0;
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub var g_X11EventHook: SDL_X11EventHook = null;
pub var g_X11EventHookData: ?*anyopaque = null;
pub export fn SDL_SetX11EventHook_REAL(callback: SDL_X11EventHook, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    g_X11EventHook = callback;
    g_X11EventHookData = userdata;
}
pub fn X11_HandleGenericEvent(_this: [*c]SDL_VideoDevice, xev: [*c]XEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var cookie: [*c]XGenericEventCookie = &xev.*.xcookie;
    _ = &cookie;
    if (X11_XGetEventData.?(videodata.*.display, cookie) != 0) {
        if (!(g_X11EventHook != null) or g_X11EventHook.?(g_X11EventHookData, xev)) {
            X11_HandleXinput2Event(_this, cookie);
        }
        X11_XFreeEventData.?(videodata.*.display, cookie);
    }
}
pub fn X11_UpdateSystemKeyModifiers(viddata: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (viddata.*.keyboard.xkb_enabled) {
        var xkb_state: XkbStateRec = undefined;
        _ = &xkb_state;
        if (X11_XkbGetState.?(viddata.*.display, XkbUseCoreKbd, &xkb_state) == Success) {
            viddata.*.keyboard.pressed_modifiers = xkb_state.base_mods;
            viddata.*.keyboard.locked_modifiers = @bitCast(@as(c_int, @as(c_int, xkb_state.latched_mods) | @as(c_int, xkb_state.locked_mods)));
        }
    } else {
        var junk_window: Window = undefined;
        _ = &junk_window;
        var x: c_int = undefined;
        _ = &x;
        var y: c_int = undefined;
        _ = &y;
        var mod_mask: c_uint = undefined;
        _ = &mod_mask;
        _ = X11_XQueryPointer.?(viddata.*.display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(viddata.*.display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(viddata.*.display))).*.default_screen)))]).*.root, &junk_window, &junk_window, &x, &y, &x, &y, &mod_mask);
        viddata.*.keyboard.pressed_modifiers = mod_mask & @as(c_uint, @bitCast(@as(c_int, (((((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | (@as(c_int, 1) << @intCast(@as(c_int, 3)))) | (@as(c_int, 1) << @intCast(@as(c_int, 5)))) | (@as(c_int, 1) << @intCast(@as(c_int, 6)))) | (@as(c_int, 1) << @intCast(@as(c_int, 7))))));
        viddata.*.keyboard.locked_modifiers = mod_mask & ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))))) | viddata.*.keyboard.numlock_mask) | viddata.*.keyboard.scrolllock_mask);
    }
}
pub fn X11_ReconcileModifiers(viddata: [*c]SDL_VideoData, key_pressed: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (key_pressed) {
        if ((viddata.*.keyboard.pressed_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != 0) {
            if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)));
                }
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2)))))) != 0) {
            if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)));
                }
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.alt_mask) != 0) {
            if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)));
                }
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.gui_mask) != 0) {
            if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_physically_pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)));
                }
            }
        }
    } else {
        if ((viddata.*.keyboard.pressed_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2)))))) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.alt_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LALT | SDL_KMOD_RALT));
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.gui_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LGUI | SDL_KMOD_RGUI));
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.level3_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & SDL_KMOD_MODE) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_MODE);
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_MODE);
            }
        }
        if ((viddata.*.keyboard.pressed_modifiers & viddata.*.keyboard.level5_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & SDL_KMOD_LEVEL5) != 0)) {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_LEVEL5);
                }
            }
        } else {
            {
                const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_LEVEL5);
            }
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_locked_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0)) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2)))))) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_locked_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0)) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.alt_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_locked_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0)) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.gui_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, viddata.*.keyboard.sdl_locked_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0)) {
            {
                const ref = &viddata.*.keyboard.sdl_locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.level3_mask) != 0) {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_MODE);
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_MODE);
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.level5_mask) != 0) {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_LEVEL5);
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_LEVEL5);
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0) {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_CAPS);
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_CAPS);
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.numlock_mask) != 0) {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_NUM);
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_NUM);
        }
    }
    if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.scrolllock_mask) != 0) {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_SCROLL);
        }
    } else {
        {
            const ref = &viddata.*.keyboard.sdl_locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_SCROLL);
        }
    }
    SDL_SetModState_REAL(@bitCast(@as(c_short, @truncate(@as(c_int, viddata.*.keyboard.sdl_pressed_modifiers) | @as(c_int, viddata.*.keyboard.sdl_locked_modifiers)))));
}
pub fn X11_HandleModifierKeys(viddata: [*c]SDL_VideoData, scancode: SDL_Scancode, pressed: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var mod: SDL_Keymod = undefined;
    _ = &mod;
    var cur_mask: c_uint = undefined;
    _ = &cur_mask;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                keycode = SDL_GetKeyFromScancode_REAL(scancode, SDL_KMOD_NONE, @"false" != 0);
                mod = SDL_KMOD_NONE;
                switch (keycode) {
                    SDLK_LSHIFT => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDLK_RSHIFT => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDLK_LCTRL => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDLK_RCTRL => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDLK_LALT => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDLK_RALT => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDLK_LGUI => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDLK_RGUI => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDLK_MODE => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDLK_LEVEL5_SHIFT => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDLK_CAPSLOCK => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDLK_NUMLOCKCLEAR => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDLK_SCROLLLOCK => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            1 => {
                if (pressed) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            2 => {
                mod = SDL_KMOD_LSHIFT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                mod = SDL_KMOD_RSHIFT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                mod = SDL_KMOD_LCTRL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                mod = SDL_KMOD_RCTRL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                mod = SDL_KMOD_LALT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                mod = SDL_KMOD_RALT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                mod = SDL_KMOD_LGUI;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                mod = SDL_KMOD_RGUI;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                mod = SDL_KMOD_MODE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                mod = SDL_KMOD_LEVEL5;
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (viddata.*.keyboard.xkb_enabled) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                cur_mask = viddata.*.keyboard.locked_modifiers;
                X11_UpdateSystemKeyModifiers(viddata);
                if ((viddata.*.keyboard.locked_modifiers & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                cur_mask |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                cur_mask &= @bitCast(@as(c_int, ~(@as(c_int, 1) << @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.numlock_mask) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                cur_mask |= viddata.*.keyboard.numlock_mask;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                cur_mask &= ~viddata.*.keyboard.numlock_mask;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if ((viddata.*.keyboard.locked_modifiers & viddata.*.keyboard.scrolllock_mask) != 0) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                cur_mask |= viddata.*.keyboard.scrolllock_mask;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                cur_mask &= ~viddata.*.keyboard.scrolllock_mask;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                viddata.*.keyboard.locked_modifiers = cur_mask;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            27 => {
                return;
            },
            28 => {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, mod))));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_physically_pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, mod))));
                }
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    const ref = &viddata.*.keyboard.sdl_pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & ~@as(c_int, mod))));
                }
                {
                    const ref = &viddata.*.keyboard.sdl_physically_pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & ~@as(c_int, mod))));
                }
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                X11_ReconcileModifiers(viddata, @"true" != 0);
                {}
            },
            else => unreachable,
        }
    }
}
pub export fn X11_ReconcileKeyboardState(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var display: [*c]Display = undefined;
    _ = &display;
    var keys: [32]u8 = undefined;
    _ = &keys;
    var keystate: [*c]const bool = undefined;
    _ = &keystate;
    var keycode: Uint32 = undefined;
    _ = &keycode;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var x11KeyPressed: bool = undefined;
    _ = &x11KeyPressed;
    var sdlKeyPressed: bool = undefined;
    _ = &sdlKeyPressed;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                display = videodata.*.display;
                X11_UpdateSystemKeyModifiers(videodata);
                X11_ReconcileModifiers(videodata, @"false" != 0);
                videodata.*.keyboard.sdl_pressed_modifiers = 0;
                videodata.*.keyboard.sdl_physically_pressed_modifiers = 0;
                {
                    const ref = &videodata.*.keyboard.sdl_locked_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ((SDL_KMOD_CAPS | SDL_KMOD_NUM) | SDL_KMOD_SCROLL));
                }
                videodata.*.keyboard.pressed_modifiers = 0;
                videodata.*.keyboard.locked_modifiers &= (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))))) | videodata.*.keyboard.numlock_mask) | videodata.*.keyboard.scrolllock_mask;
                _ = X11_XQueryKeymap.?(display, @ptrCast(@alignCast(&keys)));
                keystate = SDL_GetKeyboardState_REAL(null);
                keycode = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (@as(c_ulong, keycode) < (@sizeOf(@TypeOf(videodata.*.keyboard.key_layout)) / @sizeOf(@TypeOf(videodata.*.keyboard.key_layout[@as(c_int, 0)])))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                scancode = videodata.*.keyboard.key_layout[keycode];
                x11KeyPressed = (@as(Uint32, @bitCast(@as(c_int, @as(c_int, keys[keycode / @as(Uint32, 8)])))) & (@as(Uint32, 1) << @intCast(keycode % @as(Uint32, 8)))) != @as(Uint32, 0);
                sdlKeyPressed = keystate[scancode];
                if (x11KeyPressed and !sdlKeyPressed) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                keycode +%= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                X11_UpdateSystemKeyModifiers(videodata);
                X11_ReconcileModifiers(videodata, @"true" != 0);
                {}
            },
            5 => {
                switch (SDL_GetKeyFromScancode_REAL(scancode, SDL_KMOD_NONE, @"false" != 0)) {
                    SDLK_LCTRL => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDLK_RCTRL => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDLK_LSHIFT => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDLK_RSHIFT => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDLK_LALT => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDLK_RALT => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDLK_LGUI => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDLK_RGUI => {
                        sdl_pc = 16;
                        continue;
                    },
                    SDLK_MODE => {
                        sdl_pc = 17;
                        continue;
                    },
                    SDLK_LEVEL5_SHIFT => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            6 => {
                if (!x11KeyPressed and sdlKeyPressed) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 7;
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
                    sdl_pc = 11;
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
                X11_HandleModifierKeys(videodata, scancode, @"true" != 0);
                _ = SDL_SendKeyboardKeyIgnoreModifiers(0, SDL_GLOBAL_KEYBOARD_ID, @bitCast(@as(c_uint, @truncate(keycode))), scancode, @"true" != 0);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            20 => {
                X11_HandleModifierKeys(videodata, scancode, @"false" != 0);
                _ = SDL_SendKeyboardKeyIgnoreModifiers(0, SDL_GLOBAL_KEYBOARD_ID, @bitCast(@as(c_uint, @truncate(keycode))), scancode, @"false" != 0);
                {
                    sdl_pc = 22;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn X11_DispatchFocusIn(_this: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetKeyboardFocus(data.*.window);
    X11_ReconcileKeyboardState(_this);
    if (data.*.ic != null) {
        X11_XSetICFocus.?(data.*.ic);
    }
    if (data.*.flashing_window) {
        _ = X11_FlashWindow(_this, data.*.window, SDL_FLASH_CANCEL);
    }
}
pub fn X11_DispatchFocusOut(_: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.window == SDL_GetKeyboardFocus_REAL()) {
        _ = SDL_SetKeyboardFocus(null);
    }
    if (data.*.ic != null) {
        X11_XUnsetICFocus.?(data.*.ic);
    }
}
pub fn X11_DispatchMapNotify(data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = data.*.window;
    _ = &window;
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_SHOWN, 0, 0);
    data.*.was_shown = @"true" != 0;
    if ((window.*.flags & @as(c_ulong, 64)) != 0) {
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
        _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
    }
    if ((window.*.flags & @as(c_ulong, 512)) != 0) {
        SDL_UpdateWindowGrab(window);
    }
}
pub fn X11_DispatchUnmapNotify(data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = data.*.window;
    _ = &window;
    if (!window.*.is_hiding) {
        _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
        _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_OCCLUDED, 0, 0);
    } else {
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_HIDDEN, 0, 0);
    }
}
pub fn DispatchWindowMove(_this: [*c]SDL_VideoDevice, data: [*c]const SDL_WindowData, point: [*c]const SDL_Point) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var window: [*c]SDL_Window = data.*.window;
    _ = &window;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var evt: XEvent = undefined;
    _ = &evt;
    _ = X11_XUngrabPointer.?(display, 0);
    _ = X11_XFlush.?(display);
    evt.xclient.type = ClientMessage;
    evt.xclient.window = data.*.xwindow;
    evt.xclient.message_type = videodata.*.atoms._NET_WM_MOVERESIZE;
    evt.xclient.format = 32;
    evt.xclient.data.l[@as(c_int, 0)] = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, window.*.x))) +% @as(usize, @bitCast(@as(c_long, point.*.x))))));
    evt.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, window.*.y))) +% @as(usize, @bitCast(@as(c_long, point.*.y))))));
    evt.xclient.data.l[@as(c_int, 2)] = _NET_WM_MOVERESIZE_MOVE;
    evt.xclient.data.l[@as(c_int, 3)] = Button1;
    evt.xclient.data.l[@as(c_int, 4)] = 0;
    _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, False, (@as(c_long, 1) << @intCast(@as(c_long, 20))) | (@as(c_long, 1) << @intCast(@as(c_long, 19))), &evt);
    _ = X11_XSync.?(display, 0);
}
pub fn ScheduleWindowMove(_: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData, point: [*c]const SDL_Point) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.pending_move = @"true" != 0;
    data.*.pending_move_point = point.*;
}
pub fn InitiateWindowResize(_this: [*c]SDL_VideoDevice, data: [*c]const SDL_WindowData, point: [*c]const SDL_Point, direction: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var window: [*c]SDL_Window = data.*.window;
    _ = &window;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var evt: XEvent = undefined;
    _ = &evt;
    if ((direction < _NET_WM_MOVERESIZE_SIZE_TOPLEFT) or (direction > _NET_WM_MOVERESIZE_SIZE_LEFT)) {
        return;
    }
    _ = X11_XUngrabPointer.?(display, 0);
    _ = X11_XFlush.?(display);
    evt.xclient.type = ClientMessage;
    evt.xclient.window = data.*.xwindow;
    evt.xclient.message_type = videodata.*.atoms._NET_WM_MOVERESIZE;
    evt.xclient.format = 32;
    evt.xclient.data.l[@as(c_int, 0)] = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, window.*.x))) +% @as(usize, @bitCast(@as(c_long, point.*.x))))));
    evt.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, window.*.y))) +% @as(usize, @bitCast(@as(c_long, point.*.y))))));
    evt.xclient.data.l[@as(c_int, 2)] = direction;
    evt.xclient.data.l[@as(c_int, 3)] = Button1;
    evt.xclient.data.l[@as(c_int, 4)] = 0;
    _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, False, (@as(c_long, 1) << @intCast(@as(c_long, 20))) | (@as(c_long, 1) << @intCast(@as(c_long, 19))), &evt);
    _ = X11_XSync.?(display, 0);
}
pub export fn X11_ProcessHitTest(_: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData, x: f32, y: f32, force_new_result: bool) bool {
    @setEvalBranchQuota(100000);
    _ = &x;
    _ = &y;
    var window: [*c]SDL_Window = data.*.window;
    _ = &window;
    if (!(window.*.hit_test != null)) return @"false" != 0;
    const point: SDL_Point = SDL_Point{
        .x = @intFromFloat(x),
        .y = @intFromFloat(y),
    };
    _ = &point;
    var rc: SDL_HitTestResult = window.*.hit_test.?(window, &point, window.*.hit_test_data);
    _ = &rc;
    if (!force_new_result and (rc == data.*.hit_test_result)) {
        return @"true" != 0;
    }
    X11_SetHitTestCursor(rc);
    data.*.hit_test_result = rc;
    return @"true" != 0;
}
pub export fn X11_TriggerHitTestAction(_this: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData, x: f32, y: f32) bool {
    @setEvalBranchQuota(100000);
    _ = &x;
    _ = &y;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var point: SDL_Point = undefined;
    _ = &point;
    const static_local_directions = struct {
        const directions: [8]c_int = [8]c_int{
            _NET_WM_MOVERESIZE_SIZE_TOPLEFT,
            _NET_WM_MOVERESIZE_SIZE_TOP,
            _NET_WM_MOVERESIZE_SIZE_TOPRIGHT,
            _NET_WM_MOVERESIZE_SIZE_RIGHT,
            _NET_WM_MOVERESIZE_SIZE_BOTTOMRIGHT,
            _NET_WM_MOVERESIZE_SIZE_BOTTOM,
            _NET_WM_MOVERESIZE_SIZE_BOTTOMLEFT,
            _NET_WM_MOVERESIZE_SIZE_LEFT,
        };
    };
    _ = &static_local_directions;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window = data.*.window;
                if (window.*.hit_test != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                point = SDL_Point{
                    .x = @intFromFloat(x),
                    .y = @intFromFloat(y),
                };
                switch (data.*.hit_test_result) {
                    @as(SDL_HitTestResult, SDL_HITTEST_DRAGGABLE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOP) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPRIGHT) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_RIGHT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMRIGHT) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOM) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMLEFT) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_LEFT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                if ((data.*.window.*.flags & @as(c_ulong, 512)) != 0) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                DispatchWindowMove(_this, data, &point);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                ScheduleWindowMove(_this, data, &point);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return @"true" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
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
                InitiateWindowResize(_this, data, &point, static_local_directions.directions[data.*.hit_test_result -% @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT)]);
                return @"true" != 0;
            },
            17 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn X11_UpdateUserTime(data: [*c]SDL_WindowData, latest: c_ulong) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &latest;
    if ((latest != 0) and (@as(c_ulong, @bitCast(@as(c_long, @intFromBool(latest != data.*.user_time)))) != 0)) {
        var videodata: [*c]SDL_VideoData = data.*.videodata;
        _ = &videodata;
        var display: [*c]Display = videodata.*.display;
        _ = &display;
        _ = X11_XChangeProperty.?(display, data.*.xwindow, videodata.*.atoms._NET_WM_USER_TIME, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), 32, PropModeReplace, @ptrCast(@alignCast(&latest)), 1);
        data.*.user_time = latest;
    }
}
pub var x11_last_error: u8 = 0;
pub fn BadWindowErrorHandler(d: [*c]Display, e: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    x11_last_error = e.*.error_code;
    if (@as(c_int, e.*.error_code) != BadWindow) {
        var err_msg: [128]u8 = undefined;
        _ = &err_msg;
        _ = X11_XGetErrorText.?(d, e.*.error_code, @ptrCast(@alignCast(&err_msg)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(err_msg))))));
        SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "X failed request: %hhu (%s), major opcode: %hhu", e.*.error_code, @as([*c]u8, @ptrCast(@alignCast(&err_msg))), e.*.request_code);
    }
    return 0;
}
pub fn X11_HandleClipboardEvent(_this: [*c]SDL_VideoDevice, xevent: [*c]const XEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "X11_HandleClipboardEvent".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var display: [*c]Display = undefined;
    _ = &display;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "videodata->clipboard_window != 0L",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "xevent->xany.window == videodata->clipboard_window",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var req: [*c]const XSelectionRequestEvent = undefined;
    _ = &req;
    var sevent: XEvent = undefined;
    _ = &sevent;
    var mime_formats: c_int = undefined;
    _ = &mime_formats;
    var seln_data: [*c]u8 = undefined;
    _ = &seln_data;
    var seln_length: usize = undefined;
    _ = &seln_length;
    var XA_TARGETS: Atom = undefined;
    _ = &XA_TARGETS;
    var clipboard: [*c]SDLX11_ClipboardData = undefined;
    _ = &clipboard;
    var prev_handler: XErrorHandler = undefined;
    _ = &prev_handler;
    var supportedFormats: [*c]Atom = undefined;
    _ = &supportedFormats;
    var mime_type: [*c]const u8 = undefined;
    _ = &mime_type;
    var xsel: [*c]const XSelectionEvent = undefined;
    _ = &xsel;
    var atom: Atom = undefined;
    _ = &atom;
    var patom: [*c]Atom = undefined;
    _ = &patom;
    var data: [*c]u8 = undefined;
    _ = &data;
    var format_property: c_int = undefined;
    _ = &format_property;
    var length: c_ulong = undefined;
    _ = &length;
    var bytes_left: c_ulong = undefined;
    _ = &bytes_left;
    var j: c_int = undefined;
    _ = &j;
    var allocationsize: c_int = undefined;
    _ = &allocationsize;
    var atomStr: [*c]u8 = undefined;
    _ = &atomStr;
    var new_mime_types: [*c][*c]u8 = undefined;
    _ = &new_mime_types;
    var strPtr: [*c]u8 = undefined;
    _ = &strPtr;
    var atomStr_3: [*c]u8 = undefined;
    _ = &atomStr_3;
    var len: usize = undefined;
    _ = &len;
    var XA_CLIPBOARD: Atom = undefined;
    _ = &XA_CLIPBOARD;
    var clipboard_4: [*c]SDLX11_ClipboardData = undefined;
    _ = &clipboard_4;
    var name_of_atom: [*c]u8 = undefined;
    _ = &name_of_atom;
    j = 0;
    j += 1;
    j = 0;
    j += 1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                display = videodata.*.display;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            4 => {
                if (!(videodata.*.clipboard_window != @as(Window, None))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11events.c", 815);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                switch (xevent.*.type) {
                    SelectionRequest => {
                        sdl_pc = 26;
                        continue;
                    },
                    SelectionNotify => {
                        sdl_pc = 50;
                        continue;
                    },
                    SelectionClear => {
                        sdl_pc = 68;
                        continue;
                    },
                    PropertyNotify => {
                        sdl_pc = 81;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            16 => {
                if (!(xevent.*.xany.window == videodata.*.clipboard_window)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11events.c", 816);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 24;
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
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                {}
            },
            26 => {
                req = &xevent.*.xselectionrequest;
                seln_length = 0;
                XA_TARGETS = videodata.*.atoms.TARGETS;
                x11_last_error = 0;
                prev_handler = X11_XSetErrorHandler.?(BadWindowErrorHandler);
                if (req.*.selection == @as(Atom, @bitCast(@as(c_long, @as(c_int, 1))))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                clipboard = &videodata.*.primary_selection;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                clipboard = &videodata.*.clipboard;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                _ = memset(@ptrCast(@alignCast(&sevent)), 0, @sizeOf(@TypeOf(sevent)));
                sevent.xany.type = SelectionNotify;
                sevent.xselection.selection = req.*.selection;
                sevent.xselection.target = None;
                sevent.xselection.property = None;
                sevent.xselection.requestor = req.*.requestor;
                sevent.xselection.time = req.*.time;
                if (req.*.target == XA_TARGETS) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                supportedFormats = @ptrCast(@alignCast(SDL_malloc_REAL((clipboard.*.mime_count +% @as(usize, 1)) *% @sizeOf(Atom))));
                supportedFormats[@as(c_int, 0)] = XA_TARGETS;
                mime_formats = 1;
                i = 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                if (clipboard.*.callback != null) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            32 => {
                _ = X11_XSendEvent.?(display, req.*.requestor, False, 0, &sevent);
                _ = X11_XSync.?(display, False);
                _ = X11_XSetErrorHandler.?(prev_handler);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < clipboard.*.mime_count) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                supportedFormats[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &mime_formats;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = X11_XInternAtom.?(display, clipboard.*.mime_types[@bitCast(@as(isize, @intCast(i)))], False);
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                i += 1;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                _ = X11_XChangeProperty.?(display, req.*.requestor, req.*.property, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(supportedFormats)), mime_formats);
                sevent.xselection.property = req.*.property;
                sevent.xselection.target = XA_TARGETS;
                SDL_free_REAL(@ptrCast(@alignCast(supportedFormats)));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            37 => {
                i = 0;
                {
                    sdl_pc = 40;
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
                    sdl_pc = 32;
                    continue;
                }
            },
            40 => {
                if (@as(usize, @bitCast(@as(c_long, i))) < clipboard.*.mime_count) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                mime_type = clipboard.*.mime_types[@bitCast(@as(isize, @intCast(i)))];
                if (X11_XInternAtom.?(display, mime_type, False) != req.*.target) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                i += 1;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 42;
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
                seln_data = @ptrCast(@alignCast(@constCast(clipboard.*.callback.?(clipboard.*.userdata, mime_type, &seln_length))));
                if (seln_data != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                _ = X11_XChangeProperty.?(display, req.*.requestor, req.*.property, req.*.target, 8, PropModeReplace, seln_data, @bitCast(@as(c_uint, @truncate(seln_length))));
                sevent.xselection.property = req.*.property;
                sevent.xselection.target = req.*.target;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            50 => {
                xsel = &xevent.*.xselection;
                if ((xsel.*.target == videodata.*.atoms.TARGETS) and (xsel.*.property == videodata.*.atoms.SDL_FORMATS)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                atom = None;
                data = null;
                format_property = 0;
                length = 0;
                bytes_left = 0;
                _ = X11_XGetWindowProperty.?(display, GetWindow(_this), videodata.*.atoms.SDL_FORMATS, 0, 200, 0, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), &atom, &format_property, &length, &bytes_left, &data);
                allocationsize = @bitCast(@as(c_uint, @truncate((length +% @as(c_ulong, 1)) *% @sizeOf([*c]u8))));
                patom = @ptrCast(@alignCast(data));
                {
                    sdl_pc = 54;
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
                videodata.*.selection_waiting = @"false" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            54 => {
                if (@as(c_ulong, @bitCast(@as(c_long, j))) < length) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                atomStr = X11_XGetAtomName.?(display, patom.*);
                {
                    const ref = &allocationsize;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) +% (SDL_strlen_REAL(atomStr) +% @as(usize, 1)))));
                }
                _ = X11_XFree.?(@ptrCast(@alignCast(atomStr)));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                patom += 1;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                new_mime_types = @ptrCast(@alignCast(SDL_AllocateTemporaryMemory(@bitCast(@as(c_long, allocationsize)))));
                if (new_mime_types != null) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                strPtr = @ptrCast(@alignCast((new_mime_types + length) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
                {
                    const ref = &allocationsize;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) -% (@as(usize, @intCast(@intFromPtr(strPtr))) -% @as(usize, @intCast(@intFromPtr(new_mime_types)))))));
                }
                patom = @ptrCast(@alignCast(data));
                {
                    sdl_pc = 61;
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
                if (data != null) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            61 => {
                if (@as(c_ulong, @bitCast(@as(c_long, j))) < length) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                atomStr_3 = X11_XGetAtomName.?(display, patom.*);
                new_mime_types[@bitCast(@as(isize, @intCast(j)))] = strPtr;
                len = SDL_strlcpy_REAL(strPtr, atomStr_3, @bitCast(@as(c_long, allocationsize))) +% @as(usize, 1);
                strPtr += len;
                {
                    const ref = &allocationsize;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) -% len)));
                }
                _ = X11_XFree.?(@ptrCast(@alignCast(atomStr_3)));
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                patom += 1;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            64 => {
                new_mime_types[length] = null;
                SDL_SendClipboardUpdate(@"false" != 0, new_mime_types, length);
                _ = memset(@ptrCast(@alignCast(&videodata.*.clipboard)), 0, @sizeOf(@TypeOf(videodata.*.clipboard)));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            65 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(data)));
                {
                    sdl_pc = 67;
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
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            68 => {
                XA_CLIPBOARD = videodata.*.atoms.CLIPBOARD;
                clipboard_4 = null;
                if (xevent.*.xselectionclear.selection == @as(Atom, @bitCast(@as(c_long, @as(c_int, 1))))) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                clipboard_4 = &videodata.*.primary_selection;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                if ((XA_CLIPBOARD != @as(Atom, None)) and (xevent.*.xselectionclear.selection == XA_CLIPBOARD)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                if ((clipboard_4 != null) and (clipboard_4.*.callback != null)) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            72 => {
                clipboard_4 = &videodata.*.clipboard;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                if (clipboard_4.*.sequence != 0) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            78 => {
                SDL_CancelClipboardData(clipboard_4.*.sequence);
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                SDL_free_REAL(clipboard_4.*.userdata);
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                _ = memset(@ptrCast(@alignCast(clipboard_4)), 0, @sizeOf(@TypeOf(clipboard_4.*)));
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            81 => {
                name_of_atom = X11_XGetAtomName.?(display, xevent.*.xproperty.atom);
                if ((SDL_strncmp_REAL(name_of_atom, "SDL_SELECTION", @sizeOf(@TypeOf("SDL_SELECTION".*)) -% @as(c_ulong, 1)) == @as(c_int, 0)) and (xevent.*.xproperty.state == PropertyNewValue)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                videodata.*.selection_incr_waiting = @"false" != 0;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                if (name_of_atom != null) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(name_of_atom)));
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn isMapNotify(_: [*c]Display, ev: [*c]XEvent, arg: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var unmap: [*c]XUnmapEvent = undefined;
    _ = &unmap;
    unmap = @ptrCast(@alignCast(arg));
    return @intFromBool(((ev.*.type == MapNotify) and (ev.*.xmap.window == unmap.*.window)) and (ev.*.xmap.serial == unmap.*.serial));
}
pub fn isReparentNotify(_: [*c]Display, ev: [*c]XEvent, arg: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var unmap: [*c]XUnmapEvent = undefined;
    _ = &unmap;
    unmap = @ptrCast(@alignCast(arg));
    return @intFromBool(((ev.*.type == ReparentNotify) and (ev.*.xreparent.window == unmap.*.window)) and (ev.*.xreparent.serial == unmap.*.serial));
}
pub fn IsHighLatin1(arg_string: [*c]const u8, arg_length: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var string = arg_string;
    _ = &string;
    var length = arg_length;
    _ = &length;
    while ((blk: {
        const ref = &length;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) > @as(c_int, 0)) {
        var ch: Uint8 = string.*;
        _ = &ch;
        if (@as(c_int, ch) >= @as(c_int, 128)) {
            return @"true" != 0;
        }
        string += 1;
    }
    return @"false" != 0;
}
pub fn XLookupStringAsUTF8(event_struct: [*c]XKeyEvent, buffer_return: [*c]u8, bytes_buffer: c_int, keysym_return: [*c]KeySym, status_in_out: [*c]XComposeStatus) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var result: c_int = X11_XLookupString.?(event_struct, buffer_return, bytes_buffer, keysym_return, status_in_out);
    _ = &result;
    if (IsHighLatin1(buffer_return, result)) {
        var utf8_text: [*c]u8 = SDL_iconv_string_REAL("UTF-8", "ISO-8859-1", buffer_return, @bitCast(@as(c_long, result + @as(c_int, 1))));
        _ = &utf8_text;
        if (utf8_text != null) {
            _ = SDL_strlcpy_REAL(buffer_return, utf8_text, @bitCast(@as(c_long, bytes_buffer)));
            SDL_free_REAL(@ptrCast(@alignCast(utf8_text)));
            return @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(buffer_return))));
        } else {
            return 0;
        }
    }
    return result;
}
pub export fn X11_FindWindow(videodata: [*c]SDL_VideoData, window: Window) [*c]SDL_WindowData {
    @setEvalBranchQuota(100000);
    if ((videodata != null) and (videodata.*.windowlist != null)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < videodata.*.numwindows) : (i += 1) {
                if ((@as(?*anyopaque, @ptrCast(@alignCast(videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))]))) != @as(?*anyopaque, null)) and (videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))].*.xwindow == window)) {
                    return videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    }
    return null;
}
pub export fn X11_GetEventTimestamp(_: c_ulong) Uint64 {
    @setEvalBranchQuota(100000);
    return SDL_GetTicksNS_REAL();
}
pub export fn X11_HandleKeyEvent(_this: [*c]SDL_VideoDevice, windowdata: [*c]SDL_WindowData, keyboardID: SDL_KeyboardID, xevent: [*c]XEvent) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var keycode: KeyCode = @truncate(xevent.*.xkey.keycode);
    _ = &keycode;
    var keysym: KeySym = NoSymbol;
    _ = &keysym;
    var text_length: c_int = 0;
    _ = &text_length;
    var text: [64]u8 = undefined;
    _ = &text;
    var status: c_int = 0;
    _ = &status;
    var handled_by_ime: bool = @"false" != 0;
    _ = &handled_by_ime;
    var pressed: bool = xevent.*.type == KeyPress;
    _ = &pressed;
    var scancode: SDL_Scancode = videodata.*.keyboard.key_layout[keycode];
    _ = &scancode;
    var timestamp: Uint64 = X11_GetEventTimestamp(xevent.*.xkey.time);
    _ = &timestamp;
    text[@as(c_int, 0)] = '\x00';
    if (!videodata.*.keyboard.xkb_enabled) {
        videodata.*.keyboard.pressed_modifiers = xevent.*.xkey.state & @as(c_uint, @bitCast(@as(c_int, (((((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | (@as(c_int, 1) << @intCast(@as(c_int, 3)))) | (@as(c_int, 1) << @intCast(@as(c_int, 5)))) | (@as(c_int, 1) << @intCast(@as(c_int, 6)))) | (@as(c_int, 1) << @intCast(@as(c_int, 7))))));
        videodata.*.keyboard.locked_modifiers = xevent.*.xkey.state & ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))))) | videodata.*.keyboard.numlock_mask) | videodata.*.keyboard.scrolllock_mask);
    }
    if (SDL_TextInputActive_REAL(windowdata.*.window)) {
        if (X11_XFilterEvent.?(xevent, None) != 0) {
            handled_by_ime = @"true" != 0;
        }
        if (!handled_by_ime) {
            if ((windowdata.*.ic != null) and (xevent.*.type == KeyPress)) {
                text_length = X11_Xutf8LookupString.?(windowdata.*.ic, &xevent.*.xkey, @ptrCast(@alignCast(&text)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(text)) -% @as(c_ulong, 1)))), &keysym, &status);
            } else {
                text_length = XLookupStringAsUTF8(&xevent.*.xkey, @ptrCast(@alignCast(&text)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(text)) -% @as(c_ulong, 1)))), &keysym, null);
            }
        }
    }
    if (!handled_by_ime) {
        if (pressed) {
            X11_HandleModifierKeys(videodata, scancode, @"true" != 0);
            _ = SDL_SendKeyboardKeyIgnoreModifiers(timestamp, keyboardID, keycode, scancode, @"true" != 0);
            if ((@as(c_int, @as([*c]u8, @ptrCast(@alignCast(&text))).*) != 0) and !((@as(c_uint, @bitCast(@as(c_int, @as(c_int, SDL_GetModState_REAL())))) & ((SDL_KMOD_LCTRL | SDL_KMOD_RCTRL) | (SDL_KMOD_LALT | SDL_KMOD_RALT))) != 0)) {
                text[@bitCast(@as(isize, @intCast(text_length)))] = '\x00';
                X11_ClearComposition(windowdata);
                SDL_SendKeyboardText(@ptrCast(@alignCast(&text)));
            }
        } else {
            if (X11_KeyRepeat(display, xevent)) {
                return;
            }
            X11_HandleModifierKeys(videodata, scancode, @"false" != 0);
            _ = SDL_SendKeyboardKeyIgnoreModifiers(timestamp, keyboardID, keycode, scancode, @"false" != 0);
        }
    }
    if (pressed) {
        X11_UpdateUserTime(windowdata, xevent.*.xkey.time);
    }
}
pub export fn X11_HandleButtonPress(_this: [*c]SDL_VideoDevice, windowdata: [*c]SDL_WindowData, mouseID: SDL_MouseID, arg_button: c_int, x: f32, y: f32, time_1: c_ulong, serial: c_ulong) void {
    @setEvalBranchQuota(100000);
    var button = arg_button;
    _ = &button;
    var window: [*c]SDL_Window = windowdata.*.window;
    _ = &window;
    var xticks: c_int = 0;
    _ = &xticks;
    var yticks: c_int = 0;
    _ = &yticks;
    var timestamp: Uint64 = X11_GetEventTimestamp(time_1);
    _ = &timestamp;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!mouse.*.relative_mode and ((x != mouse.*.x) or (y != mouse.*.y))) {
        _ = X11_ProcessHitTest(_this, windowdata, x, y, @"false" != 0);
        SDL_SendMouseMotion(timestamp, window, mouseID, @"false" != 0, x, y);
    }
    if (X11_IsWheelEvent(button, &xticks, &yticks)) {
        SDL_SendMouseWheel(timestamp, window, mouseID, @floatFromInt(-xticks), @floatFromInt(yticks), SDL_MOUSEWHEEL_NORMAL);
    } else {
        if (button > @as(c_int, 7)) {
            button -= @as(c_int, 8) - SDL_BUTTON_X1;
        }
        if (button == Button1) {
            if (X11_TriggerHitTestAction(_this, windowdata, x, y)) {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_HIT_TEST, 0, 0);
                return;
            }
        }
        if (windowdata.*.last_focus_event_time != 0) {
            const X11_FOCUS_CLICK_TIMEOUT: c_int = 10;
            _ = &X11_FOCUS_CLICK_TIMEOUT;
            if (SDL_GetTicks_REAL() < (windowdata.*.last_focus_event_time +% @as(Uint64, @bitCast(@as(c_long, X11_FOCUS_CLICK_TIMEOUT))))) {
                if (!SDL_GetHintBoolean_REAL("SDL_MOUSE_FOCUS_CLICKTHROUGH", @"false" != 0)) {
                    windowdata.*.ignore_button_press_serial = serial;
                }
            }
            windowdata.*.last_focus_event_time = 0;
        }
        if (serial != windowdata.*.ignore_button_press_serial) {
            SDL_SendMouseButton(timestamp, window, mouseID, @bitCast(@as(i8, @truncate(button))), @"true" != 0);
        }
    }
    X11_UpdateUserTime(windowdata, time_1);
}
pub export fn X11_HandleButtonRelease(_this: [*c]SDL_VideoDevice, windowdata: [*c]SDL_WindowData, mouseID: SDL_MouseID, arg_button: c_int, time_1: c_ulong) void {
    @setEvalBranchQuota(100000);
    var button = arg_button;
    _ = &button;
    var window: [*c]SDL_Window = windowdata.*.window;
    _ = &window;
    var xticks: c_int = 0;
    _ = &xticks;
    var yticks: c_int = 0;
    _ = &yticks;
    var timestamp: Uint64 = X11_GetEventTimestamp(time_1);
    _ = &timestamp;
    if (!X11_IsWheelEvent(button, &xticks, &yticks)) {
        if (button > @as(c_int, 7)) {
            button -= @as(c_int, 8) - SDL_BUTTON_X1;
        }
        SDL_SendMouseButton(timestamp, window, mouseID, @bitCast(@as(i8, @truncate(button))), @"false" != 0);
        if (window.*.internal.*.pending_grab) {
            _ = X11_SetWindowMouseGrab(_this, window, @"true" != 0);
        }
    }
}
pub export fn X11_GetBorderValues(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = data.*.videodata;
    _ = &videodata;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var @"type": Atom = undefined;
    _ = &@"type";
    var format: c_int = undefined;
    _ = &format;
    var nitems: c_ulong = undefined;
    _ = &nitems;
    var bytes_after: c_ulong = undefined;
    _ = &bytes_after;
    var property: [*c]u8 = undefined;
    _ = &property;
    if (!((data.*.window.*.flags & @as(c_ulong, 16)) != 0)) {
        if (X11_XGetWindowProperty.?(display, data.*.xwindow, videodata.*.atoms._NET_FRAME_EXTENTS, 0, 16, 0, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), &@"type", &format, &nitems, &bytes_after, &property) == Success) {
            if ((@"type" != @as(Atom, None)) and (nitems == @as(c_ulong, 4))) {
                data.*.border_left = @truncate(@as([*c]c_long, @ptrCast(@alignCast(property)))[@as(c_int, 0)]);
                data.*.border_right = @truncate(@as([*c]c_long, @ptrCast(@alignCast(property)))[@as(c_int, 1)]);
                data.*.border_top = @truncate(@as([*c]c_long, @ptrCast(@alignCast(property)))[@as(c_int, 2)]);
                data.*.border_bottom = @truncate(@as([*c]c_long, @ptrCast(@alignCast(property)))[@as(c_int, 3)]);
            }
            _ = X11_XFree.?(@ptrCast(@alignCast(property)));
        }
    } else {
        data.*.border_left = blk: {
            const tmp = blk_1: {
                const tmp_2 = blk_2: {
                    const tmp_3 = @as(c_int, 0);
                    data.*.border_bottom = tmp_3;
                    break :blk_2 tmp_3;
                };
                data.*.border_right = tmp_2;
                break :blk_1 tmp_2;
            };
            data.*.border_top = tmp;
            break :blk tmp;
        };
    }
}
pub export fn X11_EmitConfigureNotifyEvents(data: [*c]SDL_WindowData, xevent: [*c]XConfigureEvent) void {
    @setEvalBranchQuota(100000);
    if (!(data.*.size_move_event_flags != 0)) {
        var x: c_int = xevent.*.x;
        _ = &x;
        var y: c_int = xevent.*.y;
        _ = &y;
        if ((xevent.*.x != data.*.last_xconfigure.x) or (xevent.*.y != data.*.last_xconfigure.y)) {
            data.*.pending_operation &= @bitCast(~X11_PENDING_OP_MOVE);
        }
        SDL_GlobalToRelativeForWindow(data.*.window, x, y, &x, &y);
        _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_MOVED, x, y);
        {
            var w: [*c]SDL_Window = data.*.window.*.first_child;
            _ = &w;
            while (w != null) : (w = w.*.next_sibling) {
                if (((w.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) and !((w.*.flags & @as(c_ulong, 8)) != 0)) {
                    X11_UpdateWindowPosition(w, @"true" != 0);
                }
            }
        }
        if ((xevent.*.width != data.*.last_xconfigure.width) or (xevent.*.height != data.*.last_xconfigure.height)) {
            data.*.pending_operation &= @bitCast(~X11_PENDING_OP_RESIZE);
        }
        _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_RESIZED, xevent.*.width, xevent.*.height);
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&data.*.last_xconfigure).*)) == @sizeOf(@TypeOf(xevent.*)))) @compileError("static assertion failed \"sizeof (*(&data->last_xconfigure)) == sizeof (*( xevent))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&data.*.last_xconfigure)), @ptrCast(@alignCast(xevent)), @sizeOf(@TypeOf(xevent.*)));
}
pub fn X11_DispatchEvent(_this: [*c]SDL_VideoDevice, xevent: [*c]XEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "X11_DispatchEvent".*;
    };
    _ = &static_local___func__;
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var display: [*c]Display = undefined;
    _ = &display;
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var m: XClientMessageEvent = undefined;
    _ = &m;
    var i: c_int = undefined;
    _ = &i;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "videodata != ((void*)0)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var ev: [*c]XFixesSelectionNotifyEvent = undefined;
    _ = &ev;
    var xkbevent: [*c]XkbEvent = undefined;
    _ = &xkbevent;
    var request: c_int = undefined;
    _ = &request;
    var name_of_atom: [*c]u8 = undefined;
    _ = &name_of_atom;
    var attrib: XWindowAttributes = undefined;
    _ = &attrib;
    var screennum: c_int = undefined;
    _ = &screennum;
    var iccscreennum: c_int = undefined;
    _ = &iccscreennum;
    var mouse: [*c]SDL_Mouse = undefined;
    _ = &mouse;
    var windowdata: [*c]SDL_WindowData = undefined;
    _ = &windowdata;
    var ev_1: XEvent = undefined;
    _ = &ev_1;
    var NumChildren: c_uint = undefined;
    _ = &NumChildren;
    var ChildReturn: Window = undefined;
    _ = &ChildReturn;
    var Root: Window = undefined;
    _ = &Root;
    var Parent: Window = undefined;
    _ = &Parent;
    var Children: [*c]Window = undefined;
    _ = &Children;
    var prev_handler: XErrorHandler = undefined;
    _ = &prev_handler;
    var changed: SDL_WindowFlags = undefined;
    _ = &changed;
    const static_local_xdnd_version = struct {
        var xdnd_version: c_int = 0;
    };
    _ = &static_local_xdnd_version;
    var use_list: bool = undefined;
    _ = &use_list;
    var p: SDL_x11Prop = undefined;
    _ = &p;
    var root_x: c_int = undefined;
    _ = &root_x;
    var root_y: c_int = undefined;
    _ = &root_y;
    var window_x: c_int = undefined;
    _ = &window_x;
    var window_y: c_int = undefined;
    _ = &window_y;
    var ChildReturn_2: Window = undefined;
    _ = &ChildReturn_2;
    var root: Window = undefined;
    _ = &root;
    var keyboardID: SDL_KeyboardID = undefined;
    _ = &keyboardID;
    var mouse_3: [*c]SDL_Mouse = undefined;
    _ = &mouse_3;
    var flags: SDL_WindowFlags = undefined;
    _ = &flags;
    var changed_4: SDL_WindowFlags = undefined;
    _ = &changed_4;
    var commit: bool = undefined;
    _ = &commit;
    var @"type": Atom = undefined;
    _ = &@"type";
    var format: c_int = undefined;
    _ = &format;
    var nitems: c_ulong = undefined;
    _ = &nitems;
    var bytes_after: c_ulong = undefined;
    _ = &bytes_after;
    var prop_data: [*c]u8 = undefined;
    _ = &prop_data;
    var state: Uint32 = undefined;
    _ = &state;
    var target: Atom = undefined;
    _ = &target;
    var p_5: SDL_x11Prop = undefined;
    _ = &p_5;
    var saveptr: [*c]u8 = undefined;
    _ = &saveptr;
    var name: [*c]u8 = undefined;
    _ = &name;
    var token: [*c]u8 = undefined;
    _ = &token;
    comptime {
        if (!(@sizeOf(@TypeOf((&data.*.pending_xconfigure).*)) == @sizeOf(@TypeOf((&xevent.*.xconfigure).*)))) @compileError("static assertion failed \"sizeof (*(&data->pending_xconfigure)) == sizeof (*( &xevent->xconfigure))\"");
    }
    comptime {
        if (!(@sizeOf(@TypeOf((&data.*.window.*.current_fullscreen_mode).*)) == @sizeOf(@TypeOf((&data.*.window.*.requested_fullscreen_mode).*)))) @compileError("static assertion failed \"sizeof (*(&data->window->current_fullscreen_mode)) == sizeof (*( &data->window->requested_fullscreen_mode))\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                display = videodata.*.display;
                if ((xevent.*.type != KeyPress) and (xevent.*.type != KeyRelease)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            4 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(videodata))) != @as(?*anyopaque, null))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11events.c", 1299);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                __builtin.debugtrap();
                {
                    sdl_pc = 12;
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
                if (X11_XFilterEvent.?(xevent, None) != 0) {
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
                if (xevent.*.type == GenericEvent) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            16 => {
                return;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                X11_HandleGenericEvent(_this, xevent);
                return;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if (g_X11EventHook != null) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                if (!g_X11EventHook.?(g_X11EventHookData, xevent)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
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
                if ((videodata.*.xrandr_event_base != 0) and (xevent.*.type == (videodata.*.xrandr_event_base + RRNotify))) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            25 => {
                return;
            },
            26 => {
                {
                    sdl_pc = 27;
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
                X11_HandleXRandREvent(_this, xevent);
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if ((SDL_X11_HAVE_XFIXES != 0) and (xevent.*.type == X11_GetXFixesSelectionNotifyEvent())) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                ev = @ptrCast(@alignCast(xevent));
                if (ev.*.subtype == XFixesSetSelectionOwnerNotify) {
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
                if ((videodata.*.clipboard_window != @as(Window, None)) and (videodata.*.clipboard_window == xevent.*.xany.window)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            34 => {
                if (ev.*.selection != videodata.*.atoms.CLIPBOARD) {
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
                return;
            },
            37 => {
                return;
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (X11_XGetSelectionOwner.?(display, ev.*.selection) == videodata.*.clipboard_window) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                return;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                _ = X11_XConvertSelection.?(display, videodata.*.atoms.CLIPBOARD, videodata.*.atoms.TARGETS, videodata.*.atoms.SDL_FORMATS, GetWindow(_this), CurrentTime);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            43 => {
                X11_HandleClipboardEvent(_this, xevent);
                return;
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                X11_HandleXsettingsEvent(_this, xevent);
                data = X11_FindWindow(videodata, xevent.*.xany.window);
                if (!(data != null)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                if (videodata.*.keyboard.xkb_enabled and (xevent.*.type == videodata.*.keyboard.unnamed_0.xkb.event)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                switch (xevent.*.type) {
                    EnterNotify => {
                        sdl_pc = 123;
                        continue;
                    },
                    LeaveNotify => {
                        sdl_pc = 133;
                        continue;
                    },
                    FocusIn => {
                        sdl_pc = 143;
                        continue;
                    },
                    FocusOut => {
                        sdl_pc = 153;
                        continue;
                    },
                    UnmapNotify => {
                        sdl_pc = 166;
                        continue;
                    },
                    MapNotify => {
                        sdl_pc = 173;
                        continue;
                    },
                    ConfigureNotify => {
                        sdl_pc = 177;
                        continue;
                    },
                    ClientMessage => {
                        sdl_pc = 190;
                        continue;
                    },
                    Expose => {
                        sdl_pc = 221;
                        continue;
                    },
                    KeyPress => {
                        sdl_pc = 222;
                        continue;
                    },
                    KeyRelease => {
                        sdl_pc = 223;
                        continue;
                    },
                    MotionNotify => {
                        sdl_pc = 230;
                        continue;
                    },
                    ButtonPress => {
                        sdl_pc = 237;
                        continue;
                    },
                    ButtonRelease => {
                        sdl_pc = 241;
                        continue;
                    },
                    PropertyNotify => {
                        sdl_pc = 245;
                        continue;
                    },
                    SelectionNotify => {
                        sdl_pc = 348;
                        continue;
                    },
                    else => {
                        sdl_pc = 370;
                        continue;
                    },
                }
            },
            49 => {
                xkbevent = @ptrCast(@alignCast(xevent));
                switch (xkbevent.*.any.xkb_type) {
                    XkbStateNotify => {
                        sdl_pc = 53;
                        continue;
                    },
                    XkbMapNotify => {
                        sdl_pc = 60;
                        continue;
                    },
                    XkbNewKeyboardNotify => {
                        sdl_pc = 61;
                        continue;
                    },
                    else => {
                        sdl_pc = 65;
                        continue;
                    },
                }
            },
            50 => {
                if (xevent.*.type == KeymapNotify) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            51 => {
                return;
            },
            52 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            53 => {
                if (((@as(c_long, xkbevent.*.state.changed) & (@as(c_long, 1) << @intCast(@as(c_long, 4)))) != 0) and (@as(c_long, @intFromBool(@as(Uint32, @bitCast(@as(c_int, xkbevent.*.state.group))) != videodata.*.keyboard.unnamed_0.xkb.current_group)) != 0)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                videodata.*.keyboard.unnamed_0.xkb.current_group = @bitCast(@as(c_int, xkbevent.*.state.group));
                SDL_SetKeymap(videodata.*.keyboard.unnamed_0.xkb.keymaps[videodata.*.keyboard.unnamed_0.xkb.current_group], @"true" != 0);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if ((@as(c_long, xkbevent.*.state.changed) & (@as(c_long, 1) << @intCast(@as(c_long, 0)))) != 0) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                videodata.*.keyboard.pressed_modifiers = xkbevent.*.state.base_mods;
                videodata.*.keyboard.locked_modifiers = xkbevent.*.state.latched_mods | xkbevent.*.state.locked_mods;
                X11_ReconcileModifiers(videodata, @"false" != 0);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 52;
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
                _ = X11_XkbRefreshKeyboardMapping.?(&xkbevent.*.map);
                if (xkbevent.*.any.serial != videodata.*.keyboard.unnamed_0.xkb.last_map_serial) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                videodata.*.keyboard.unnamed_0.xkb.last_map_serial = xkbevent.*.any.serial;
                X11_UpdateKeymap(_this, @"true" != 0);
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
                    sdl_pc = 52;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            66 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_GetKeyboardFocus_REAL()))) != @as(?*anyopaque, null)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                if (xevent.*.type == MappingNotify) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            69 => {
                if (!videodata.*.keyboard.xkb_enabled) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
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
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                X11_UpdateKeymap(_this, @"true" != 0);
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                X11_ReconcileKeyboardState(_this);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                request = xevent.*.xmapping.request;
                if (request == MappingPointer) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            76 => {
                if ((xevent.*.type == PropertyNotify) and (videodata != null)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            78 => {
                X11_Xinput2UpdatePointerMapping(_this);
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                if (!videodata.*.keyboard.xkb_enabled) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            81 => {
                if ((request == MappingKeyboard) or (request == MappingModifier)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
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
                    sdl_pc = 80;
                    continue;
                }
            },
            84 => {
                X11_XRefreshKeyboardMapping.?(&xevent.*.xmapping);
                {
                    sdl_pc = 86;
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
                X11_UpdateKeymap(_this, @"true" != 0);
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                name_of_atom = X11_XGetAtomName.?(display, xevent.*.xproperty.atom);
                if (name_of_atom != null) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
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
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            90 => {
                if (SDL_startswith(name_of_atom, "_ICC_PROFILE")) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            93 => {
                i = 0;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            94 => {
                if (SDL_strcmp_REAL(name_of_atom, "_NET_WORKAREA") == @as(c_int, 0)) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            95 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(name_of_atom)));
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            96 => {
                if (i < videodata.*.numwindows) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            97 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))]))) != @as(?*anyopaque, null)) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            98 => {
                i += 1;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            100 => {
                data = videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))];
                _ = X11_XGetWindowAttributes.?(display, data.*.xwindow, &attrib);
                screennum = X11_XScreenNumberOfScreen.?(attrib.screen);
                if ((screennum == @as(c_int, 0)) and (SDL_strcmp_REAL(name_of_atom, "_ICC_PROFILE") == @as(c_int, 0))) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
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
                    sdl_pc = 98;
                    continue;
                }
            },
            103 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_ICCPROF_CHANGED, 0, 0);
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                if ((SDL_strncmp_REAL(name_of_atom, "_ICC_PROFILE_", @sizeOf(@TypeOf("_ICC_PROFILE_".*)) -% @as(c_ulong, 1)) == @as(c_int, 0)) and (SDL_strlen_REAL(name_of_atom) > (@sizeOf(@TypeOf("_ICC_PROFILE_".*)) -% @as(c_ulong, 1)))) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                iccscreennum = SDL_atoi_REAL(&name_of_atom[@sizeOf(@TypeOf("_ICC_PROFILE_".*)) -% @as(c_ulong, 1)]);
                if (screennum == iccscreennum) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
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
                    sdl_pc = 105;
                    continue;
                }
            },
            109 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_ICCPROF_CHANGED, 0, 0);
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            112 => {
                i = 0;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            113 => {
                if ((SDL_strcmp_REAL(name_of_atom, "GAMESCOPE_DISPLAY_IS_EXTERNAL") == @as(c_int, 0)) or (SDL_strcmp_REAL(name_of_atom, "GAMESCOPE_SDR_ON_HDR_CONTENT_BRIGHTNESS") == @as(c_int, 0))) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            115 => {
                if (i < _this.*.num_displays) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            116 => {
                SDL_SendDisplayEvent(_this.*.displays[@bitCast(@as(isize, @intCast(i)))], SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED, 0, 0);
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                i += 1;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            119 => {
                X11_CheckDisplaysMoved(_this, display);
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
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            122 => {
                {}
            },
            123 => {
                mouse = SDL_GetMouse();
                SDL_SetMouseFocus(data.*.window);
                mouse.*.last_x = @floatFromInt(xevent.*.xcrossing.x);
                mouse.*.last_y = @floatFromInt(xevent.*.xcrossing.y);
                windowdata = data.*.window.*.internal;
                if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(@as(c_int, @intFromBool(data.*.pointer_barrier_active)) == @"true")))) != 0) and ((windowdata.*.window.*.flags & @as(c_ulong, 512)) != 0)) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                _ = X11_ConfineCursorWithFlags(_this, windowdata.*.window, &windowdata.*.barrier_rect, X11_BARRIER_HANDLED_BY_EVENT);
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                if (!mouse.*.relative_mode) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                SDL_SendMouseMotion(0, data.*.window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, @floatFromInt(xevent.*.xcrossing.x), @floatFromInt(xevent.*.xcrossing.y));
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                if (!((data.*.window.*.flags & @as(c_ulong, 16384)) != 0)) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                SDL_UpdateWindowGrab(data.*.window);
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                _ = X11_ProcessHitTest(_this, data, mouse.*.last_x, mouse.*.last_y, @"true" != 0);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            133 => {
                if (!SDL_GetMouse().*.relative_mode) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            134 => {
                SDL_SendMouseMotion(0, data.*.window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, @floatFromInt(xevent.*.xcrossing.x), @floatFromInt(xevent.*.xcrossing.y));
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
                if (((xevent.*.xcrossing.mode != NotifyGrab) and (xevent.*.xcrossing.mode != NotifyUngrab)) and (xevent.*.xcrossing.detail != NotifyInferior)) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            137 => {
                if (!((data.*.window.*.flags & @as(c_ulong, 1)) != 0)) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 141;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            140 => {
                _ = X11_SetWindowKeyboardGrab(_this, data.*.window, @"false" != 0);
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                SDL_SetMouseFocus(null);
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            143 => {
                if ((xevent.*.xfocus.mode == NotifyGrab) or (xevent.*.xfocus.mode == NotifyUngrab)) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 122;
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
                if ((xevent.*.xfocus.detail == NotifyInferior) or (xevent.*.xfocus.detail == NotifyPointer)) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 122;
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
                if (!(videodata.*.last_mode_change_deadline != 0)) {
                    sdl_pc = 150;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                data.*.pending_focus = PENDING_FOCUS_NONE;
                data.*.pending_focus_time = 0;
                X11_DispatchFocusIn(_this, data);
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                data.*.pending_focus = PENDING_FOCUS_IN;
                data.*.pending_focus_time = SDL_GetTicks_REAL() +% @as(Uint64, PENDING_FOCUS_TIME);
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                data.*.last_focus_event_time = SDL_GetTicks_REAL();
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            153 => {
                if ((xevent.*.xfocus.mode == NotifyGrab) or (xevent.*.xfocus.mode == NotifyUngrab)) {
                    sdl_pc = 154;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            155 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            156 => {
                if ((xevent.*.xfocus.detail == NotifyInferior) or (xevent.*.xfocus.detail == NotifyPointer)) {
                    sdl_pc = 157;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                if (!(videodata.*.last_mode_change_deadline != 0)) {
                    sdl_pc = 160;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                data.*.pending_focus = PENDING_FOCUS_NONE;
                data.*.pending_focus_time = 0;
                X11_DispatchFocusOut(_this, data);
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            161 => {
                data.*.pending_focus = PENDING_FOCUS_OUT;
                data.*.pending_focus_time = SDL_GetTicks_REAL() +% @as(Uint64, PENDING_FOCUS_TIME);
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                if (@as(c_int, @intFromBool(data.*.pointer_barrier_active)) == @"true") {
                    sdl_pc = 163;
                    continue;
                } else {
                    sdl_pc = 164;
                    continue;
                }
            },
            163 => {
                _ = X11_ConfineCursorWithFlags(_this, data.*.window, null, X11_BARRIER_HANDLED_BY_EVENT);
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            166 => {
                if (X11_XCheckIfEvent.?(display, &ev_1, &isReparentNotify, @ptrCast(@alignCast(&xevent.*.xunmap))) != 0) {
                    sdl_pc = 167;
                    continue;
                } else {
                    sdl_pc = 168;
                    continue;
                }
            },
            167 => {
                _ = X11_XCheckIfEvent.?(display, &ev_1, &isMapNotify, @ptrCast(@alignCast(&xevent.*.xunmap)));
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            168 => {
                X11_DispatchUnmapNotify(data);
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                if (@as(c_int, @intFromBool(data.*.pointer_barrier_active)) == @"true") {
                    sdl_pc = 170;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            170 => {
                _ = X11_ConfineCursorWithFlags(_this, data.*.window, null, X11_BARRIER_HANDLED_BY_EVENT);
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            172 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            173 => {
                X11_DispatchMapNotify(data);
                if (@as(c_int, @intFromBool(data.*.pointer_barrier_active)) == @"true") {
                    sdl_pc = 174;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            174 => {
                _ = X11_ConfineCursorWithFlags(_this, data.*.window, &data.*.barrier_rect, X11_BARRIER_HANDLED_BY_EVENT);
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            177 => {
                if (!(xevent.*.xconfigure.send_event != 0)) {
                    sdl_pc = 178;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            178 => {
                x11_last_error = 0;
                prev_handler = X11_XSetErrorHandler.?(BadWindowErrorHandler);
                _ = X11_XQueryTree.?(data.*.videodata.*.display, xevent.*.xconfigure.window, &Root, &Parent, &Children, &NumChildren);
                _ = X11_XTranslateCoordinates.?(xevent.*.xconfigure.display, Parent, (&@as(_XPrivDisplay, @ptrCast(@alignCast(xevent.*.xconfigure.display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(xevent.*.xconfigure.display))).*.default_screen)))]).*.root, xevent.*.xconfigure.x, xevent.*.xconfigure.y, &xevent.*.xconfigure.x, &xevent.*.xconfigure.y, &ChildReturn);
                _ = X11_XSync.?(display, False);
                _ = X11_XSetErrorHandler.?(prev_handler);
                if (@as(c_int, x11_last_error) == BadWindow) {
                    sdl_pc = 181;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                changed = X11_GetNetWMState(_this, data.*.window, xevent.*.xproperty.window) ^ data.*.window.*.flags;
                if ((changed & (@as(c_ulong, 1) | @as(c_ulong, 128))) != 0) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 185;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 122;
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
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            184 => {
                _ = memcpy(@ptrCast(@alignCast(&data.*.pending_xconfigure)), @ptrCast(@alignCast(&xevent.*.xconfigure)), @sizeOf(@TypeOf((&xevent.*.xconfigure).*)));
                data.*.emit_size_move_after_property_notify = @"true" != 0;
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            185 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                if (!data.*.emit_size_move_after_property_notify) {
                    sdl_pc = 187;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            187 => {
                X11_EmitConfigureNotifyEvents(data, &xevent.*.xconfigure);
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            188 => {
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                X11_HandleConfigure(data.*.window, &xevent.*.xconfigure);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            190 => {
                if (xevent.*.xclient.message_type == videodata.*.atoms.XdndEnter) {
                    sdl_pc = 191;
                    continue;
                } else {
                    sdl_pc = 192;
                    continue;
                }
            },
            191 => {
                use_list = (xevent.*.xclient.data.l[@as(c_int, 1)] & @as(c_long, 1)) != 0;
                data.*.xdnd_source = @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]));
                static_local_xdnd_version.xdnd_version = @truncate(xevent.*.xclient.data.l[@as(c_int, 1)] >> @intCast(@as(c_long, 24)));
                if (use_list) {
                    sdl_pc = 194;
                    continue;
                } else {
                    sdl_pc = 195;
                    continue;
                }
            },
            192 => {
                if (xevent.*.xclient.message_type == videodata.*.atoms.XdndLeave) {
                    sdl_pc = 197;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            193 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            194 => {
                X11_ReadProperty(&p, display, data.*.xdnd_source, videodata.*.atoms.XdndTypeList);
                data.*.xdnd_req = X11_PickTarget(display, @ptrCast(@alignCast(p.data)), p.count);
                _ = X11_XFree.?(@ptrCast(@alignCast(p.data)));
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            195 => {
                data.*.xdnd_req = X11_PickTargetFromAtoms(display, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 2)])), @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 3)])), @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 4)])));
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            197 => {
                _ = SDL_SendDropComplete(data.*.window);
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            198 => {
                if (xevent.*.xclient.message_type == videodata.*.atoms.XdndPosition) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            199 => {
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            200 => {
                root_x = @truncate(xevent.*.xclient.data.l[@as(c_int, 2)] >> @intCast(@as(c_long, 16)));
                root_y = @truncate(xevent.*.xclient.data.l[@as(c_int, 2)] & @as(c_long, 65535));
                _ = X11_XTranslateCoordinates.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, data.*.xwindow, root_x, root_y, &window_x, &window_y, &ChildReturn_2);
                _ = SDL_SendDropPosition(data.*.window, @floatFromInt(window_x), @floatFromInt(window_y));
                _ = memset(@ptrCast(@alignCast(&m)), 0, @sizeOf(@TypeOf(m)));
                m.type = ClientMessage;
                m.display = xevent.*.xclient.display;
                m.window = @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]));
                m.message_type = videodata.*.atoms.XdndStatus;
                m.format = 32;
                m.data.l[@as(c_int, 0)] = @bitCast(@as(c_ulong, @truncate(data.*.xwindow)));
                m.data.l[@as(c_int, 1)] = @intFromBool(data.*.xdnd_req != @as(Atom, None));
                m.data.l[@as(c_int, 2)] = 0;
                m.data.l[@as(c_int, 3)] = 0;
                m.data.l[@as(c_int, 4)] = @bitCast(@as(c_ulong, @truncate(videodata.*.atoms.XdndActionCopy)));
                _ = X11_XSendEvent.?(display, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)])), False, NoEventMask, @ptrCast(@alignCast(&m)));
                _ = X11_XFlush.?(display);
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            201 => {
                if (xevent.*.xclient.message_type == videodata.*.atoms.XdndDrop) {
                    sdl_pc = 203;
                    continue;
                } else {
                    sdl_pc = 204;
                    continue;
                }
            },
            202 => {
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            203 => {
                if (data.*.xdnd_req == @as(Atom, None)) {
                    sdl_pc = 206;
                    continue;
                } else {
                    sdl_pc = 207;
                    continue;
                }
            },
            204 => {
                if (((xevent.*.xclient.message_type == videodata.*.atoms.WM_PROTOCOLS) and (xevent.*.xclient.format == @as(c_int, 32))) and (@as(Atom, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]))) == videodata.*.atoms._NET_WM_PING)) {
                    sdl_pc = 212;
                    continue;
                } else {
                    sdl_pc = 213;
                    continue;
                }
            },
            205 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            206 => {
                _ = memset(@ptrCast(@alignCast(&m)), 0, @sizeOf(@TypeOf(m)));
                m.type = ClientMessage;
                m.display = xevent.*.xclient.display;
                m.window = @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]));
                m.message_type = videodata.*.atoms.XdndFinished;
                m.format = 32;
                m.data.l[@as(c_int, 0)] = @bitCast(@as(c_ulong, @truncate(data.*.xwindow)));
                m.data.l[@as(c_int, 1)] = 0;
                m.data.l[@as(c_int, 2)] = None;
                _ = X11_XSendEvent.?(display, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)])), False, NoEventMask, @ptrCast(@alignCast(&m)));
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            207 => {
                if (static_local_xdnd_version.xdnd_version >= @as(c_int, 1)) {
                    sdl_pc = 209;
                    continue;
                } else {
                    sdl_pc = 210;
                    continue;
                }
            },
            208 => {
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            209 => {
                _ = X11_XConvertSelection.?(display, videodata.*.atoms.XdndSelection, data.*.xdnd_req, videodata.*.atoms.PRIMARY, data.*.xwindow, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 2)])));
                {
                    sdl_pc = 211;
                    continue;
                }
            },
            210 => {
                _ = X11_XConvertSelection.?(display, videodata.*.atoms.XdndSelection, data.*.xdnd_req, videodata.*.atoms.PRIMARY, data.*.xwindow, CurrentTime);
                {
                    sdl_pc = 211;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            212 => {
                root = (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root;
                xevent.*.xclient.window = root;
                _ = X11_XSendEvent.?(display, root, False, (@as(c_long, 1) << @intCast(@as(c_long, 20))) | (@as(c_long, 1) << @intCast(@as(c_long, 19))), xevent);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            213 => {
                if (((xevent.*.xclient.message_type == videodata.*.atoms.WM_PROTOCOLS) and (xevent.*.xclient.format == @as(c_int, 32))) and (@as(Atom, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]))) == videodata.*.atoms.WM_DELETE_WINDOW)) {
                    sdl_pc = 215;
                    continue;
                } else {
                    sdl_pc = 216;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            215 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_CLOSE_REQUESTED, 0, 0);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            216 => {
                if (((xevent.*.xclient.message_type == videodata.*.atoms.WM_PROTOCOLS) and (xevent.*.xclient.format == @as(c_int, 32))) and (@as(Atom, @bitCast(@as(c_long, xevent.*.xclient.data.l[@as(c_int, 0)]))) == videodata.*.atoms._NET_WM_SYNC_REQUEST)) {
                    sdl_pc = 218;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 214;
                    continue;
                }
            },
            218 => {
                X11_HandleSyncRequest(data.*.window, &xevent.*.xclient);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            219 => {
                {
                    sdl_pc = 220;
                    continue;
                }
            },
            220 => {
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            221 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            222 => {
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            223 => {
                keyboardID = SDL_GLOBAL_KEYBOARD_ID;
                if (data.*.xinput2_keyboard_enabled) {
                    sdl_pc = 224;
                    continue;
                } else {
                    sdl_pc = 225;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            225 => {
                if (xevent.*.xkey.serial == videodata.*.xinput_last_key_serial) {
                    sdl_pc = 227;
                    continue;
                } else {
                    sdl_pc = 228;
                    continue;
                }
            },
            226 => {
                X11_HandleKeyEvent(_this, data, keyboardID, xevent);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            227 => {
                keyboardID = @bitCast(@as(c_int, videodata.*.xinput_last_keyboard_device));
                {
                    sdl_pc = 229;
                    continue;
                }
            },
            228 => {
                {
                    sdl_pc = 229;
                    continue;
                }
            },
            229 => {
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            230 => {
                if (X11_Xinput2HandlesMotionForWindow(data)) {
                    sdl_pc = 231;
                    continue;
                } else {
                    sdl_pc = 232;
                    continue;
                }
            },
            231 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                mouse_3 = SDL_GetMouse();
                if (!mouse_3.*.relative_mode) {
                    sdl_pc = 234;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            234 => {
                _ = X11_ProcessHitTest(_this, data, @floatFromInt(xevent.*.xmotion.x), @floatFromInt(xevent.*.xmotion.y), @"false" != 0);
                SDL_SendMouseMotion(0, data.*.window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, @floatFromInt(xevent.*.xmotion.x), @floatFromInt(xevent.*.xmotion.y));
                {
                    sdl_pc = 236;
                    continue;
                }
            },
            235 => {
                {
                    sdl_pc = 236;
                    continue;
                }
            },
            236 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            237 => {
                if (data.*.xinput2_mouse_enabled and (xevent.*.xbutton.serial == videodata.*.xinput_last_button_serial)) {
                    sdl_pc = 238;
                    continue;
                } else {
                    sdl_pc = 239;
                    continue;
                }
            },
            238 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            239 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            240 => {
                X11_HandleButtonPress(_this, data, SDL_GLOBAL_MOUSE_ID, @bitCast(@as(c_uint, @truncate(xevent.*.xbutton.button))), @floatFromInt(xevent.*.xbutton.x), @floatFromInt(xevent.*.xbutton.y), xevent.*.xbutton.time, xevent.*.xbutton.serial);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            241 => {
                if (data.*.xinput2_mouse_enabled and (xevent.*.xbutton.serial == videodata.*.xinput_last_button_serial)) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                X11_HandleButtonRelease(_this, data, SDL_GLOBAL_MOUSE_ID, @bitCast(@as(c_uint, @truncate(xevent.*.xbutton.button))), xevent.*.xbutton.time);
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            245 => {
                if (!(data.*.user_time != 0)) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 247;
                    continue;
                }
            },
            246 => {
                data.*.user_time = xevent.*.xproperty.time;
                {
                    sdl_pc = 248;
                    continue;
                }
            },
            247 => {
                {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                if (xevent.*.xproperty.atom == data.*.videodata.*.atoms._NET_WM_STATE) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            249 => {
                flags = X11_GetNetWMState(_this, data.*.window, xevent.*.xproperty.window);
                changed_4 = flags ^ data.*.window.*.flags;
                if (((changed_4 & @as(c_ulong, 8)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((flags & @as(c_ulong, 8)) != 0))))) != 0)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            250 => {
                if (xevent.*.xproperty.atom == videodata.*.atoms.WM_STATE) {
                    sdl_pc = 315;
                    continue;
                } else {
                    sdl_pc = 316;
                    continue;
                }
            },
            251 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            252 => {
                X11_DispatchMapNotify(data);
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                if (!((data.*.window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                if ((changed_4 & @as(c_ulong, 1)) != 0) {
                    sdl_pc = 258;
                    continue;
                } else {
                    sdl_pc = 259;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                if ((changed_4 & @as(c_ulong, 4)) != 0) {
                    sdl_pc = 312;
                    continue;
                } else {
                    sdl_pc = 313;
                    continue;
                }
            },
            258 => {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_FULLSCREEN);
                if ((flags & @as(c_ulong, 1)) != 0) {
                    sdl_pc = 261;
                    continue;
                } else {
                    sdl_pc = 262;
                    continue;
                }
            },
            259 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            260 => {
                if (((changed_4 & @as(c_ulong, 128)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(((flags & @as(c_ulong, 128)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((flags & @as(c_ulong, 64)) != 0))))) != 0))))) != 0)) {
                    sdl_pc = 282;
                    continue;
                } else {
                    sdl_pc = 283;
                    continue;
                }
            },
            261 => {
                if (!((flags & @as(c_ulong, 64)) != 0)) {
                    sdl_pc = 264;
                    continue;
                } else {
                    sdl_pc = 265;
                    continue;
                }
            },
            262 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_LEAVE_FULLSCREEN, 0, 0);
                _ = SDL_UpdateFullscreenMode(data.*.window, @"false", @"false" != 0);
                _ = memset(@ptrCast(@alignCast(&data.*.requested_fullscreen_mode)), 0, @sizeOf(@TypeOf(data.*.requested_fullscreen_mode)));
                X11_SetWindowMinMax(data.*.window, !!((flags & @as(c_ulong, 128)) != 0));
                if (data.*.fullscreen_borders_forced_on) {
                    sdl_pc = 270;
                    continue;
                } else {
                    sdl_pc = 271;
                    continue;
                }
            },
            263 => {
                if (((flags & @as(c_ulong, 1)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool((((data.*.border_top != 0) or (data.*.border_left != 0)) or (data.*.border_bottom != 0)) or (data.*.border_right != 0))))) != 0)) {
                    sdl_pc = 273;
                    continue;
                } else {
                    sdl_pc = 274;
                    continue;
                }
            },
            264 => {
                commit = SDL_memcmp_REAL(@ptrCast(@alignCast(&data.*.window.*.current_fullscreen_mode)), @ptrCast(@alignCast(&data.*.requested_fullscreen_mode)), @sizeOf(SDL_DisplayMode)) != @as(c_int, 0);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_ENTER_FULLSCREEN, 0, 0);
                if (commit) {
                    sdl_pc = 267;
                    continue;
                } else {
                    sdl_pc = 268;
                    continue;
                }
            },
            265 => {
                {
                    sdl_pc = 266;
                    continue;
                }
            },
            266 => {
                {
                    sdl_pc = 263;
                    continue;
                }
            },
            267 => {
                _ = memcpy(@ptrCast(@alignCast(&data.*.window.*.current_fullscreen_mode)), @ptrCast(@alignCast(&data.*.window.*.requested_fullscreen_mode)), @sizeOf(@TypeOf((&data.*.window.*.requested_fullscreen_mode).*)));
                _ = SDL_UpdateFullscreenMode(data.*.window, SDL_FULLSCREEN_OP_UPDATE, @"true" != 0);
                {
                    sdl_pc = 269;
                    continue;
                }
            },
            268 => {
                _ = SDL_UpdateFullscreenMode(data.*.window, SDL_FULLSCREEN_OP_ENTER, @"false" != 0);
                {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 266;
                    continue;
                }
            },
            270 => {
                data.*.toggle_borders = @"true" != 0;
                data.*.fullscreen_borders_forced_on = @"false" != 0;
                {
                    sdl_pc = 272;
                    continue;
                }
            },
            271 => {
                {
                    sdl_pc = 272;
                    continue;
                }
            },
            272 => {
                {
                    sdl_pc = 263;
                    continue;
                }
            },
            273 => {
                data.*.size_move_event_flags |= X11_SIZE_MOVE_EVENTS_WAIT_FOR_BORDERS;
                data.*.previous_borders_nonzero = @"true" != 0;
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            274 => {
                if ((!((flags & @as(c_ulong, 1)) != 0) and data.*.previous_borders_nonzero) and (((!(data.*.border_top != 0) and !(data.*.border_left != 0)) and !(data.*.border_bottom != 0)) and !(data.*.border_right != 0))) {
                    sdl_pc = 276;
                    continue;
                } else {
                    sdl_pc = 277;
                    continue;
                }
            },
            275 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            276 => {
                data.*.size_move_event_flags |= X11_SIZE_MOVE_EVENTS_WAIT_FOR_BORDERS;
                data.*.previous_borders_nonzero = @"false" != 0;
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            277 => {
                data.*.size_move_event_flags = 0;
                data.*.previous_borders_nonzero = @"false" != 0;
                if (!((data.*.window.*.flags & @as(c_ulong, 1)) != 0) and data.*.toggle_borders) {
                    sdl_pc = 279;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            278 => {
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            279 => {
                data.*.toggle_borders = @"false" != 0;
                X11_SetWindowBordered(_this, data.*.window, !((data.*.window.*.flags & @as(c_ulong, 16)) != 0));
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            280 => {
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            282 => {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_MAXIMIZE);
                if ((changed_4 & @as(c_ulong, 64)) != 0) {
                    sdl_pc = 285;
                    continue;
                } else {
                    sdl_pc = 286;
                    continue;
                }
            },
            283 => {
                {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                if (((changed_4 & @as(c_ulong, 64)) != 0) and ((flags & @as(c_ulong, 64)) != 0)) {
                    sdl_pc = 288;
                    continue;
                } else {
                    sdl_pc = 289;
                    continue;
                }
            },
            285 => {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_RESTORE);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
                {
                    sdl_pc = 287;
                    continue;
                }
            },
            286 => {
                {
                    sdl_pc = 287;
                    continue;
                }
            },
            287 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_MAXIMIZED, 0, 0);
                {
                    sdl_pc = 284;
                    continue;
                }
            },
            288 => {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_MINIMIZE);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
                {
                    sdl_pc = 290;
                    continue;
                }
            },
            289 => {
                {
                    sdl_pc = 290;
                    continue;
                }
            },
            290 => {
                if (!((flags & (@as(c_ulong, 128) | @as(c_ulong, 64))) != 0)) {
                    sdl_pc = 291;
                    continue;
                } else {
                    sdl_pc = 292;
                    continue;
                }
            },
            291 => {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_RESTORE);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
                if (!((flags & @as(c_ulong, 1)) != 0)) {
                    sdl_pc = 294;
                    continue;
                } else {
                    sdl_pc = 295;
                    continue;
                }
            },
            292 => {
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            293 => {
                if (data.*.emit_size_move_after_property_notify) {
                    sdl_pc = 303;
                    continue;
                } else {
                    sdl_pc = 304;
                    continue;
                }
            },
            294 => {
                if (data.*.pending_position) {
                    sdl_pc = 297;
                    continue;
                } else {
                    sdl_pc = 298;
                    continue;
                }
            },
            295 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            296 => {
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            297 => {
                data.*.pending_position = @"false" != 0;
                data.*.pending_operation |= X11_PENDING_OP_MOVE;
                data.*.expected.x = data.*.window.*.pending.x - data.*.border_left;
                data.*.expected.y = data.*.window.*.pending.y - data.*.border_top;
                _ = X11_XMoveWindow.?(display, data.*.xwindow, data.*.expected.x, data.*.expected.y);
                {
                    sdl_pc = 299;
                    continue;
                }
            },
            298 => {
                {
                    sdl_pc = 299;
                    continue;
                }
            },
            299 => {
                if (data.*.pending_size) {
                    sdl_pc = 300;
                    continue;
                } else {
                    sdl_pc = 301;
                    continue;
                }
            },
            300 => {
                data.*.pending_size = @"false" != 0;
                data.*.pending_operation |= X11_PENDING_OP_RESIZE;
                data.*.expected.w = data.*.window.*.pending.w;
                data.*.expected.h = data.*.window.*.pending.h;
                _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, data.*.window.*.pending.w)), @bitCast(@as(c_int, data.*.window.*.pending.h)));
                {
                    sdl_pc = 302;
                    continue;
                }
            },
            301 => {
                {
                    sdl_pc = 302;
                    continue;
                }
            },
            302 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            303 => {
                X11_EmitConfigureNotifyEvents(data, &data.*.pending_xconfigure);
                data.*.emit_size_move_after_property_notify = @"false" != 0;
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            304 => {
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            305 => {
                if ((flags & @as(c_ulong, 512)) != 0) {
                    sdl_pc = 306;
                    continue;
                } else {
                    sdl_pc = 307;
                    continue;
                }
            },
            306 => {
                if (data.*.pending_move) {
                    sdl_pc = 309;
                    continue;
                } else {
                    sdl_pc = 310;
                    continue;
                }
            },
            307 => {
                {
                    sdl_pc = 308;
                    continue;
                }
            },
            308 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            309 => {
                DispatchWindowMove(_this, data, &data.*.pending_move_point);
                data.*.pending_move = @"false" != 0;
                {
                    sdl_pc = 311;
                    continue;
                }
            },
            310 => {
                {
                    sdl_pc = 311;
                    continue;
                }
            },
            311 => {
                {
                    sdl_pc = 308;
                    continue;
                }
            },
            312 => {
                _ = SDL_SendWindowEvent(data.*.window, @bitCast(if ((flags & @as(c_ulong, 4)) != 0) SDL_EVENT_WINDOW_OCCLUDED else SDL_EVENT_WINDOW_EXPOSED), 0, 0);
                {
                    sdl_pc = 314;
                    continue;
                }
            },
            313 => {
                {
                    sdl_pc = 314;
                    continue;
                }
            },
            314 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            315 => {
                prop_data = null;
                if (X11_XGetWindowProperty.?(display, data.*.xwindow, videodata.*.atoms.WM_STATE, 0, 2, False, videodata.*.atoms.WM_STATE, &@"type", &format, &nitems, &bytes_after, &prop_data) == Success) {
                    sdl_pc = 318;
                    continue;
                } else {
                    sdl_pc = 319;
                    continue;
                }
            },
            316 => {
                if (xevent.*.xproperty.atom == videodata.*.atoms.XKLAVIER_STATE) {
                    sdl_pc = 336;
                    continue;
                } else {
                    sdl_pc = 337;
                    continue;
                }
            },
            317 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            318 => {
                if (nitems > @as(c_ulong, 0)) {
                    sdl_pc = 321;
                    continue;
                } else {
                    sdl_pc = 322;
                    continue;
                }
            },
            319 => {
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            320 => {
                {
                    sdl_pc = 317;
                    continue;
                }
            },
            321 => {
                state = @as([*c]Uint32, @ptrCast(@alignCast(prop_data))).*;
                if ((((state == @as(Uint32, 0)) or (state == @as(Uint32, 3))) and !data.*.window.*.is_hiding) and !((data.*.window.*.flags & @as(c_ulong, 8)) != 0)) {
                    sdl_pc = 324;
                    continue;
                } else {
                    sdl_pc = 325;
                    continue;
                }
            },
            322 => {
                {
                    sdl_pc = 323;
                    continue;
                }
            },
            323 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(prop_data)));
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            324 => {
                if (!((data.*.window.*.flags & @as(c_ulong, 64)) != 0)) {
                    sdl_pc = 327;
                    continue;
                } else {
                    sdl_pc = 328;
                    continue;
                }
            },
            325 => {
                if (state == @as(Uint32, 1)) {
                    sdl_pc = 330;
                    continue;
                } else {
                    sdl_pc = 331;
                    continue;
                }
            },
            326 => {
                {
                    sdl_pc = 323;
                    continue;
                }
            },
            327 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_OCCLUDED, 0, 0);
                {
                    sdl_pc = 329;
                    continue;
                }
            },
            328 => {
                {
                    sdl_pc = 329;
                    continue;
                }
            },
            329 => {
                {
                    sdl_pc = 326;
                    continue;
                }
            },
            330 => {
                if ((data.*.window.*.flags & @as(c_ulong, 64)) != 0) {
                    sdl_pc = 333;
                    continue;
                } else {
                    sdl_pc = 334;
                    continue;
                }
            },
            331 => {
                {
                    sdl_pc = 332;
                    continue;
                }
            },
            332 => {
                {
                    sdl_pc = 326;
                    continue;
                }
            },
            333 => {
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
                _ = SDL_SendWindowEvent(data.*.window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
                {
                    sdl_pc = 335;
                    continue;
                }
            },
            334 => {
                {
                    sdl_pc = 335;
                    continue;
                }
            },
            335 => {
                {
                    sdl_pc = 332;
                    continue;
                }
            },
            336 => {
                X11_UpdateKeymap(_this, @"true" != 0);
                {
                    sdl_pc = 338;
                    continue;
                }
            },
            337 => {
                if (xevent.*.xproperty.atom == videodata.*.atoms._NET_FRAME_EXTENTS) {
                    sdl_pc = 339;
                    continue;
                } else {
                    sdl_pc = 340;
                    continue;
                }
            },
            338 => {
                {
                    sdl_pc = 317;
                    continue;
                }
            },
            339 => {
                X11_GetBorderValues(data);
                if (data.*.size_move_event_flags != 0) {
                    sdl_pc = 342;
                    continue;
                } else {
                    sdl_pc = 343;
                    continue;
                }
            },
            340 => {
                {
                    sdl_pc = 341;
                    continue;
                }
            },
            341 => {
                {
                    sdl_pc = 338;
                    continue;
                }
            },
            342 => {
                data.*.size_move_event_flags &= @bitCast(~X11_SIZE_MOVE_EVENTS_WAIT_FOR_BORDERS);
                {
                    sdl_pc = 344;
                    continue;
                }
            },
            343 => {
                {
                    sdl_pc = 344;
                    continue;
                }
            },
            344 => {
                if (!((data.*.window.*.flags & @as(c_ulong, 1)) != 0) and data.*.toggle_borders) {
                    sdl_pc = 345;
                    continue;
                } else {
                    sdl_pc = 346;
                    continue;
                }
            },
            345 => {
                data.*.toggle_borders = @"false" != 0;
                X11_SetWindowBordered(_this, data.*.window, !((data.*.window.*.flags & @as(c_ulong, 16)) != 0));
                {
                    sdl_pc = 347;
                    continue;
                }
            },
            346 => {
                {
                    sdl_pc = 347;
                    continue;
                }
            },
            347 => {
                {
                    sdl_pc = 341;
                    continue;
                }
            },
            348 => {
                target = xevent.*.xselection.target;
                if (target == data.*.xdnd_req) {
                    sdl_pc = 349;
                    continue;
                } else {
                    sdl_pc = 350;
                    continue;
                }
            },
            349 => {
                X11_ReadProperty(&p_5, display, data.*.xwindow, videodata.*.atoms.PRIMARY);
                if (p_5.format == @as(c_int, 8)) {
                    sdl_pc = 352;
                    continue;
                } else {
                    sdl_pc = 353;
                    continue;
                }
            },
            350 => {
                {
                    sdl_pc = 351;
                    continue;
                }
            },
            351 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            352 => {
                saveptr = null;
                name = X11_XGetAtomName.?(display, target);
                if (name != null) {
                    sdl_pc = 355;
                    continue;
                } else {
                    sdl_pc = 356;
                    continue;
                }
            },
            353 => {
                {
                    sdl_pc = 354;
                    continue;
                }
            },
            354 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(p_5.data)));
                _ = memset(@ptrCast(@alignCast(&m)), 0, @sizeOf(@TypeOf(m)));
                m.type = ClientMessage;
                m.display = display;
                m.window = data.*.xdnd_source;
                m.message_type = videodata.*.atoms.XdndFinished;
                m.format = 32;
                m.data.l[@as(c_int, 0)] = @bitCast(@as(c_ulong, @truncate(data.*.xwindow)));
                m.data.l[@as(c_int, 1)] = 1;
                m.data.l[@as(c_int, 2)] = @bitCast(@as(c_ulong, @truncate(videodata.*.atoms.XdndActionCopy)));
                _ = X11_XSendEvent.?(display, data.*.xdnd_source, False, NoEventMask, @ptrCast(@alignCast(&m)));
                _ = X11_XSync.?(display, False);
                {
                    sdl_pc = 351;
                    continue;
                }
            },
            355 => {
                token = SDL_strtok_r_REAL(@ptrCast(@alignCast(p_5.data)), "\r\n", &saveptr);
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            356 => {
                {
                    sdl_pc = 357;
                    continue;
                }
            },
            357 => {
                _ = SDL_SendDropComplete(data.*.window);
                {
                    sdl_pc = 354;
                    continue;
                }
            },
            358 => {
                if (token != null) {
                    sdl_pc = 359;
                    continue;
                } else {
                    sdl_pc = 360;
                    continue;
                }
            },
            359 => {
                if ((((SDL_strcmp_REAL("text/plain;charset=utf-8", name) == @as(c_int, 0)) or (SDL_strcmp_REAL("UTF8_STRING", name) == @as(c_int, 0))) or (SDL_strcmp_REAL("text/plain", name) == @as(c_int, 0))) or (SDL_strcmp_REAL("TEXT", name) == @as(c_int, 0))) {
                    sdl_pc = 361;
                    continue;
                } else {
                    sdl_pc = 362;
                    continue;
                }
            },
            360 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(name)));
                {
                    sdl_pc = 357;
                    continue;
                }
            },
            361 => {
                _ = SDL_SendDropText(data.*.window, token);
                {
                    sdl_pc = 363;
                    continue;
                }
            },
            362 => {
                if (SDL_strcmp_REAL("text/uri-list", name) == @as(c_int, 0)) {
                    sdl_pc = 364;
                    continue;
                } else {
                    sdl_pc = 365;
                    continue;
                }
            },
            363 => {
                token = SDL_strtok_r_REAL(null, "\r\n", &saveptr);
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            364 => {
                if (SDL_URIToLocal(token, token) >= @as(c_int, 0)) {
                    sdl_pc = 367;
                    continue;
                } else {
                    sdl_pc = 368;
                    continue;
                }
            },
            365 => {
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            366 => {
                {
                    sdl_pc = 363;
                    continue;
                }
            },
            367 => {
                _ = SDL_SendDropFile(data.*.window, null, token);
                {
                    sdl_pc = 369;
                    continue;
                }
            },
            368 => {
                {
                    sdl_pc = 369;
                    continue;
                }
            },
            369 => {
                {
                    sdl_pc = 366;
                    continue;
                }
            },
            370 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn X11_HandleFocusChanges(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var i: c_int = undefined;
    _ = &i;
    if ((videodata != null) and (videodata.*.windowlist != null)) {
        {
            i = 0;
            while (i < videodata.*.numwindows) : (i += 1) {
                var data: [*c]SDL_WindowData = videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))];
                _ = &data;
                if ((data != null) and (data.*.pending_focus != @as(PendingFocusEnum, PENDING_FOCUS_NONE))) {
                    var now: Uint64 = SDL_GetTicks_REAL();
                    _ = &now;
                    if (now >= data.*.pending_focus_time) {
                        if (data.*.pending_focus == @as(PendingFocusEnum, PENDING_FOCUS_IN)) {
                            X11_DispatchFocusIn(_this, data);
                        } else {
                            X11_DispatchFocusOut(_this, data);
                        }
                        data.*.pending_focus = PENDING_FOCUS_NONE;
                    }
                }
            }
        }
    }
}
pub fn isAnyEvent(_: [*c]Display, _: [*c]XEvent, _: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return True;
}
pub fn X11_PollEvent(display: [*c]Display, event: [*c]XEvent) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(X11_XCheckIfEvent.?(display, event, isAnyEvent, null) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn X11_SendWakeupEvent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var req_display: [*c]Display = data.*.request_display;
    _ = &req_display;
    var xwindow: Window = window.*.internal.*.xwindow;
    _ = &xwindow;
    var event: XClientMessageEvent = undefined;
    _ = &event;
    _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
    event.type = ClientMessage;
    event.display = req_display;
    event.send_event = True;
    event.message_type = data.*.atoms._SDL_WAKEUP;
    event.format = 8;
    _ = X11_XSendEvent.?(req_display, xwindow, False, NoEventMask, @ptrCast(@alignCast(&event)));
    _ = X11_XFlush.?(req_display);
}
pub export fn X11_WaitEventTimeout(_this: [*c]SDL_VideoDevice, timeoutNS: Sint64) c_int {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var display: [*c]Display = undefined;
    _ = &display;
    var xevent: XEvent = undefined;
    _ = &xevent;
    display = videodata.*.display;
    _ = memset(@ptrCast(@alignCast(&xevent)), 0, @sizeOf(@TypeOf(xevent)));
    _ = X11_XFlush.?(display);
    if (X11_PollEvent(display, &xevent)) {} else if (timeoutNS == @as(Sint64, 0)) {
        return 0;
    } else {
        var err: c_int = SDL_IOReady(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.fd, SDL_IOR_READ | SDL_IOR_NO_RETRY, timeoutNS);
        _ = &err;
        if (err > @as(c_int, 0)) {
            if (!X11_PollEvent(display, &xevent)) {
                return 1;
            }
        } else if (err == @as(c_int, 0)) {
            return 0;
        } else {
            if (__errno_location().* == EINTR) {
                return 1;
            } else {
                return err;
            }
        }
    }
    X11_DispatchEvent(_this, &xevent);
    return 1;
}
pub export fn X11_PumpEvents(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var xevent: XEvent = undefined;
    _ = &xevent;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < _this.*.num_displays) : (i += 1) {
            if (_this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns != 0) {
                if (_this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.fullscreen_window != null) {
                    _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns = 0;
                } else if (SDL_GetTicksNS_REAL() >= _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Time out elapsed after mode switch on display %u with no window becoming fullscreen; reverting", _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.id);
                    _ = SDL_SetDisplayModeForDisplay(_this.*.displays[@bitCast(@as(isize, @intCast(i)))], null);
                    _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns = 0;
                }
            }
        }
    }
    if (data.*.last_mode_change_deadline != 0) {
        if (SDL_GetTicks_REAL() >= data.*.last_mode_change_deadline) {
            data.*.last_mode_change_deadline = 0;
        }
    }
    if (_this.*.suspend_screensaver) {
        var now: Uint64 = SDL_GetTicks_REAL();
        _ = &now;
        if (!(data.*.screensaver_activity != 0) or (now >= (data.*.screensaver_activity +% @as(Uint64, 30000)))) {
            _ = X11_XResetScreenSaver.?(data.*.display);
            SDL_DBus_ScreensaverTickle();
            data.*.screensaver_activity = now;
        }
    }
    _ = memset(@ptrCast(@alignCast(&xevent)), 0, @sizeOf(@TypeOf(xevent)));
    while (X11_PollEvent(data.*.display, &xevent)) {
        X11_DispatchEvent(_this, &xevent);
    }
    X11_HandleFocusChanges(_this);
    {
        i = 0;
        while (i < data.*.numwindows) : (i += 1) {
            if (((@as(Uint64, @bitCast(@as(c_long, @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(data.*.windowlist[@bitCast(@as(isize, @intCast(i)))]))) != @as(?*anyopaque, null))))) != 0) and (data.*.windowlist[@bitCast(@as(isize, @intCast(i)))].*.flash_cancel_time != 0)) and (SDL_GetTicks_REAL() >= data.*.windowlist[@bitCast(@as(isize, @intCast(i)))].*.flash_cancel_time)) {
                _ = X11_FlashWindow(_this, data.*.windowlist[@bitCast(@as(isize, @intCast(i)))].*.window, SDL_FLASH_CANCEL);
            }
        }
    }
    if (data.*.xinput_hierarchy_changed) {
        X11_Xinput2UpdateDevices(_this);
        data.*.xinput_hierarchy_changed = @"false" != 0;
    }
}
pub export fn X11_SuspendScreenSaver(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var dummy: c_int = undefined;
    _ = &dummy;
    var major_version: c_int = undefined;
    _ = &major_version;
    var minor_version: c_int = undefined;
    _ = &minor_version;
    if (SDL_DBus_ScreensaverInhibit(_this.*.suspend_screensaver)) {
        return @"true" != 0;
    }
    if (_this.*.suspend_screensaver) {
        SDL_DBus_ScreensaverTickle();
    }
    if (SDL_X11_HAVE_XSS != 0) {
        if (((!(X11_XScreenSaverQueryExtension.?(data.*.display, &dummy, &dummy) != 0) or !(X11_XScreenSaverQueryVersion.?(data.*.display, &major_version, &minor_version) != 0)) or (major_version < @as(c_int, 1))) or ((major_version == @as(c_int, 1)) and (minor_version < @as(c_int, 1)))) {
            return SDL_SetError_REAL("That operation is not supported");
        }
        X11_XScreenSaverSuspend.?(data.*.display, @intFromBool(_this.*.suspend_screensaver));
        _ = X11_XResetScreenSaver.?(data.*.display);
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}

pub const SDL_SetX11EventHook = SDL_SetX11EventHook_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDLK_CAPSLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000039, .hex);
pub const SDLK_SCROLLLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000047, .hex);
pub const SDLK_NUMLOCKCLEAR = __helpers.promoteIntLiteral(c_uint, 0x40000053, .hex);
pub const SDLK_LCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e0, .hex);
pub const SDLK_LSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e1, .hex);
pub const SDLK_LALT = __helpers.promoteIntLiteral(c_uint, 0x400000e2, .hex);
pub const SDLK_LGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e3, .hex);
pub const SDLK_RCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e4, .hex);
pub const SDLK_RSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e5, .hex);
pub const SDLK_RALT = __helpers.promoteIntLiteral(c_uint, 0x400000e6, .hex);
pub const SDLK_RGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e7, .hex);
pub const SDLK_MODE = __helpers.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDLK_LEVEL5_SHIFT = __helpers.promoteIntLiteral(c_uint, 0x20000002, .hex);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LEVEL5 = @as(c_uint, 0x0004);
pub const SDL_KMOD_LCTRL = @as(c_uint, 0x0040);
pub const SDL_KMOD_RCTRL = @as(c_uint, 0x0080);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_LGUI = @as(c_uint, 0x0400);
pub const SDL_KMOD_RGUI = @as(c_uint, 0x0800);
pub const SDL_KMOD_NUM = @as(c_uint, 0x1000);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const SDL_KMOD_SCROLL = @as(c_uint, 0x8000);
pub const SDL_BUTTON_X1 = @as(c_int, 4);
pub const None = @as(c_long, 0);
pub const AnyPropertyType = @as(c_long, 0);
pub const CurrentTime = @as(c_long, 0);
pub const NoSymbol = @as(c_long, 0);
pub const NoEventMask = @as(c_long, 0);
pub const KeyPress = @as(c_int, 2);
pub const KeyRelease = @as(c_int, 3);
pub const ButtonPress = @as(c_int, 4);
pub const ButtonRelease = @as(c_int, 5);
pub const MotionNotify = @as(c_int, 6);
pub const EnterNotify = @as(c_int, 7);
pub const LeaveNotify = @as(c_int, 8);
pub const FocusIn = @as(c_int, 9);
pub const FocusOut = @as(c_int, 10);
pub const KeymapNotify = @as(c_int, 11);
pub const Expose = @as(c_int, 12);
pub const UnmapNotify = @as(c_int, 18);
pub const MapNotify = @as(c_int, 19);
pub const ReparentNotify = @as(c_int, 21);
pub const ConfigureNotify = @as(c_int, 22);
pub const PropertyNotify = @as(c_int, 28);
pub const SelectionClear = @as(c_int, 29);
pub const SelectionRequest = @as(c_int, 30);
pub const SelectionNotify = @as(c_int, 31);
pub const ClientMessage = @as(c_int, 33);
pub const MappingNotify = @as(c_int, 34);
pub const GenericEvent = @as(c_int, 35);
pub const Button1 = @as(c_int, 1);
pub const NotifyGrab = @as(c_int, 1);
pub const NotifyUngrab = @as(c_int, 2);
pub const NotifyInferior = @as(c_int, 2);
pub const NotifyPointer = @as(c_int, 5);
pub const PropertyNewValue = @as(c_int, 0);
pub const Success = @as(c_int, 0);
pub const BadWindow = @as(c_int, 3);
pub const PropModeReplace = @as(c_int, 0);
pub const MappingModifier = @as(c_int, 0);
pub const MappingKeyboard = @as(c_int, 1);
pub const MappingPointer = @as(c_int, 2);
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub const XkbNewKeyboardNotify = @as(c_int, 0);
pub const XkbMapNotify = @as(c_int, 1);
pub const XkbStateNotify = @as(c_int, 2);
pub const XkbUseCoreKbd = @as(c_int, 0x0100);
pub const EINTR = @as(c_int, 4);
pub const XFixesSetSelectionOwnerNotify = @as(c_int, 0);
pub const RRNotify = @as(c_int, 1);
pub const PENDING_FOCUS_TIME = @as(c_int, 200);
pub const SDL_GLOBAL_MOUSE_ID = @as(c_int, 0);
pub const X11_BARRIER_HANDLED_BY_EVENT = @as(c_int, 1);
pub const SDL_IOR_READ = @as(c_int, 0x1);
pub const SDL_IOR_NO_RETRY = @as(c_int, 0x4);
pub const SDL_GLOBAL_KEYBOARD_ID = @as(c_int, 0);
pub const _NET_WM_MOVERESIZE_SIZE_TOPLEFT = @as(c_int, 0);
pub const _NET_WM_MOVERESIZE_SIZE_TOP = @as(c_int, 1);
pub const _NET_WM_MOVERESIZE_SIZE_TOPRIGHT = @as(c_int, 2);
pub const _NET_WM_MOVERESIZE_SIZE_RIGHT = @as(c_int, 3);
pub const _NET_WM_MOVERESIZE_SIZE_BOTTOMRIGHT = @as(c_int, 4);
pub const _NET_WM_MOVERESIZE_SIZE_BOTTOM = @as(c_int, 5);
pub const _NET_WM_MOVERESIZE_SIZE_BOTTOMLEFT = @as(c_int, 6);
pub const _NET_WM_MOVERESIZE_SIZE_LEFT = @as(c_int, 7);
pub const _NET_WM_MOVERESIZE_MOVE = @as(c_int, 8);
pub const shminfo = struct_shminfo;
