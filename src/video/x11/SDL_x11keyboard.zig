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
pub const __pid_t = c_int;
pub const __time_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const pid_t = __pid_t;
pub const time_t = __time_t;
pub const wchar_t = c_int;
pub const pthread_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_utf8strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_StepUTF8_REAL(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_RETURN: c_int = 40;
pub const SDL_SCANCODE_ESCAPE: c_int = 41;
pub const SDL_SCANCODE_BACKSPACE: c_int = 42;
pub const SDL_SCANCODE_CAPSLOCK: c_int = 57;
pub const SDL_SCANCODE_SCROLLLOCK: c_int = 71;
pub const SDL_SCANCODE_HOME: c_int = 74;
pub const SDL_SCANCODE_PAGEUP: c_int = 75;
pub const SDL_SCANCODE_DELETE: c_int = 76;
pub const SDL_SCANCODE_LEFT: c_int = 80;
pub const SDL_SCANCODE_UP: c_int = 82;
pub const SDL_SCANCODE_NUMLOCKCLEAR: c_int = 83;
pub const SDL_SCANCODE_KP_ENTER: c_int = 88;
pub const SDL_SCANCODE_APPLICATION: c_int = 101;
pub const SDL_SCANCODE_LCTRL: c_int = 224;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const SDL_SCANCODE_LALT: c_int = 226;
pub const SDL_SCANCODE_LGUI: c_int = 227;
pub const SDL_SCANCODE_RCTRL: c_int = 228;
pub const SDL_SCANCODE_RSHIFT: c_int = 229;
pub const SDL_SCANCODE_RALT: c_int = 230;
pub const SDL_SCANCODE_RGUI: c_int = 231;
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
pub const SDL_Keycode = Uint32;
pub extern fn SDL_SetScancodeName_REAL(scancode: SDL_Scancode, name: [*c]const u8) bool;
pub const SDL_TEXTINPUT_TYPE_TEXT_EMAIL: c_int = 2;
pub const SDL_TEXTINPUT_TYPE_NUMBER: c_int = 6;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN: c_int = 7;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE: c_int = 8;
pub const enum_SDL_TextInputType = c_uint;
pub const SDL_TextInputType = enum_SDL_TextInputType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
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
pub extern fn SDL_OpenURL_REAL(url: [*c]const u8) bool;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub extern fn SDL_GetTextInputType(props: SDL_PropertiesID) SDL_TextInputType;
pub extern fn SDL_GetTextInputMultiline(props: SDL_PropertiesID) bool;
pub extern fn SDL_SendScreenKeyboardShown() void;
pub extern fn SDL_SendScreenKeyboardHidden() void;
pub extern fn SDL_CreateKeymap(auto_release: bool) ?*SDL_Keymap;
pub extern fn SDL_SetKeymapEntry(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod, keycode: SDL_Keycode) void;
pub extern fn SDL_GetKeymapKeycode(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod) SDL_Keycode;
pub extern fn SDL_DestroyKeymap(keymap: ?*SDL_Keymap) void;
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
pub const XIMProc = ?*const fn (XIM, XPointer, XPointer) callconv(.c) void;
pub const XIDProc = ?*const fn ([*c]Display, XPointer, XPointer) callconv(.c) void;
pub const XVaNestedList = ?*anyopaque;
pub const XIMCallback = extern struct {
    client_data: XPointer = null,
    callback: XIMProc = null,
};
const union_unnamed_70 = extern union {
    multi_byte: [*c]u8,
    wide_char: [*c]wchar_t,
};
pub const struct__XIMText = extern struct {
    length: c_ushort = 0,
    feedback: [*c]XIMFeedback = null,
    encoding_is_wchar: c_int = 0,
    string: union_unnamed_70 = @import("std").mem.zeroes(union_unnamed_70),
};
pub const XIMText = struct__XIMText;
pub const XIMAbsolutePosition: c_int = 10;
pub const XIMDontChange: c_int = 11;
pub const XIMCaretDirection = c_uint;
pub const struct__XIMPreeditDrawCallbackStruct = extern struct {
    caret: c_int = 0,
    chg_first: c_int = 0,
    chg_length: c_int = 0,
    text: [*c]XIMText = null,
};
pub const XIMPreeditDrawCallbackStruct = struct__XIMPreeditDrawCallbackStruct;
pub const XIMCaretStyle = c_uint;
pub const struct__XIMPreeditCaretCallbackStruct = extern struct {
    position: c_int = 0,
    direction: XIMCaretDirection = @import("std").mem.zeroes(XIMCaretDirection),
    style: XIMCaretStyle = @import("std").mem.zeroes(XIMCaretStyle),
};
pub const XIMPreeditCaretCallbackStruct = struct__XIMPreeditCaretCallbackStruct;
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
pub const SDL_DYNX11FN_XDisplayKeycodes = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XDisplayKeycodes: SDL_DYNX11FN_XDisplayKeycodes;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XFreeModifiermap = ?*const fn (a: [*c]XModifierKeymap) callconv(.c) c_int;
pub extern var X11_XFreeModifiermap: SDL_DYNX11FN_XFreeModifiermap;
pub const SDL_DYNX11FN_XGetKeyboardMapping = ?*const fn (a: [*c]Display, b: KeyCode, c: c_int, d: [*c]c_int) callconv(.c) [*c]KeySym;
pub extern var X11_XGetKeyboardMapping: SDL_DYNX11FN_XGetKeyboardMapping;
pub const SDL_DYNX11FN_XGetModifierMapping = ?*const fn (a: [*c]Display) callconv(.c) [*c]XModifierKeymap;
pub extern var X11_XGetModifierMapping: SDL_DYNX11FN_XGetModifierMapping;
pub const SDL_DYNX11FN_XKeysymToKeycode = ?*const fn (a: [*c]Display, b: KeySym) callconv(.c) KeyCode;
pub extern var X11_XKeysymToKeycode: SDL_DYNX11FN_XKeysymToKeycode;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XkbQueryExtension = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int, d: [*c]c_int, e: [*c]c_int, f: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XkbQueryExtension: SDL_DYNX11FN_XkbQueryExtension;
pub const SDL_DYNX11FN_XkbKeycodeToKeysym = ?*const fn (a: [*c]Display, b: KeyCode, c: c_uint, d: c_uint) callconv(.c) KeySym;
pub extern var X11_XkbKeycodeToKeysym: SDL_DYNX11FN_XkbKeycodeToKeysym;
pub const SDL_DYNX11FN_XkbSelectEvents = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint, d: c_ulong) callconv(.c) c_int;
pub extern var X11_XkbSelectEvents: SDL_DYNX11FN_XkbSelectEvents;
pub const SDL_DYNX11FN_XkbSelectEventDetails = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint, d: c_ulong, e: c_ulong) callconv(.c) c_int;
pub extern var X11_XkbSelectEventDetails: SDL_DYNX11FN_XkbSelectEventDetails;
pub const SDL_DYNX11FN_XkbGetNames = ?*const fn (a: [*c]Display, b: c_uint, c: XkbDescPtr) callconv(.c) c_int;
pub extern var X11_XkbGetNames: SDL_DYNX11FN_XkbGetNames;
pub const SDL_DYNX11FN_XkbGetState = ?*const fn (a: [*c]Display, b: c_uint, c: XkbStatePtr) callconv(.c) c_int;
pub extern var X11_XkbGetState: SDL_DYNX11FN_XkbGetState;
pub const SDL_DYNX11FN_XkbGetUpdatedMap = ?*const fn (a: [*c]Display, b: c_uint, c: XkbDescPtr) callconv(.c) c_int;
pub extern var X11_XkbGetUpdatedMap: SDL_DYNX11FN_XkbGetUpdatedMap;
pub const SDL_DYNX11FN_XkbGetMap = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint) callconv(.c) XkbDescPtr;
pub extern var X11_XkbGetMap: SDL_DYNX11FN_XkbGetMap;
pub const SDL_DYNX11FN_XkbFreeKeyboard = ?*const fn (a: XkbDescPtr, b: c_uint, c: c_int) callconv(.c) void;
pub extern var X11_XkbFreeKeyboard: SDL_DYNX11FN_XkbFreeKeyboard;
pub const SDL_DYNX11FN_XkbSetDetectableAutoRepeat = ?*const fn (a: [*c]Display, b: c_int, c: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XkbSetDetectableAutoRepeat: SDL_DYNX11FN_XkbSetDetectableAutoRepeat;
pub const SDL_DYNX11FN_XCreateIC = ?*const fn (XIM, ...) callconv(.c) XIC;
pub extern var X11_XCreateIC: SDL_DYNX11FN_XCreateIC;
pub const SDL_DYNX11FN_XDestroyIC = ?*const fn (a: XIC) callconv(.c) void;
pub extern var X11_XDestroyIC: SDL_DYNX11FN_XDestroyIC;
pub const SDL_DYNX11FN_XSetICValues = ?*const fn (XIC, ...) callconv(.c) [*c]u8;
pub extern var X11_XSetICValues: SDL_DYNX11FN_XSetICValues;
pub const SDL_DYNX11FN_XVaCreateNestedList = ?*const fn (c_int, ...) callconv(.c) XVaNestedList;
pub extern var X11_XVaCreateNestedList: SDL_DYNX11FN_XVaCreateNestedList;
pub const SDL_DYNX11FN_XOpenIM = ?*const fn (a: [*c]Display, b: ?*struct__XrmHashBucketRec, c: [*c]u8, d: [*c]u8) callconv(.c) XIM;
pub extern var X11_XOpenIM: SDL_DYNX11FN_XOpenIM;
pub const SDL_DYNX11FN_XCloseIM = ?*const fn (a: XIM) callconv(.c) c_int;
pub extern var X11_XCloseIM: SDL_DYNX11FN_XCloseIM;
pub const SDL_DYNX11FN_XSetIMValues = ?*const fn (XIM, ...) callconv(.c) [*c]u8;
pub extern var X11_XSetIMValues: SDL_DYNX11FN_XSetIMValues;
pub const SDL_DYNX11FN_XRegisterIMInstantiateCallback = ?*const fn ([*c]Display, ?*struct__XrmHashBucketRec, [*c]u8, [*c]u8, XIDProc, XPointer) callconv(.c) c_int;
pub extern var X11_XRegisterIMInstantiateCallback: SDL_DYNX11FN_XRegisterIMInstantiateCallback;
pub const SDL_DYNX11FN_XUnregisterIMInstantiateCallback = ?*const fn ([*c]Display, ?*struct__XrmHashBucketRec, [*c]u8, [*c]u8, XIDProc, XPointer) callconv(.c) c_int;
pub extern var X11_XUnregisterIMInstantiateCallback: SDL_DYNX11FN_XUnregisterIMInstantiateCallback;
pub const SDL_DYNX11FN_XSetLocaleModifiers = ?*const fn (a: [*c]const u8) callconv(.c) [*c]u8;
pub extern var X11_XSetLocaleModifiers: SDL_DYNX11FN_XSetLocaleModifiers;
pub const SDL_DYNX11FN_Xutf8ResetIC = ?*const fn (a: XIC) callconv(.c) [*c]u8;
pub extern var X11_Xutf8ResetIC: SDL_DYNX11FN_Xutf8ResetIC;
pub extern var SDL_X11_HAVE_UTF8: c_int;
pub extern fn X11_ReconcileKeyboardState(_this: [*c]SDL_VideoDevice) void;
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
pub extern fn SDL_SetKeymap(keymap: ?*SDL_Keymap, send_event: bool) void;
pub extern fn SDL_SendEditingText(text: [*c]const u8, start: c_int, length: c_int) void;
pub const SDL_SCANCODE_TABLE_DARWIN: c_int = 0;
pub const SDL_SCANCODE_TABLE_XFREE86_1: c_int = 2;
pub const SDL_SCANCODE_TABLE_XFREE86_2: c_int = 3;
pub const SDL_SCANCODE_TABLE_XVNC: c_int = 4;
pub const SDL_ScancodeTable = c_uint;
pub extern fn SDL_GetScancodeTable(table: SDL_ScancodeTable, num_entries: [*c]c_int) [*c]const SDL_Scancode;
pub extern fn SDL_GetScancodeFromKeySym(keysym: Uint32, keycode: Uint32) SDL_Scancode;
pub extern fn SDL_GetKeyCodeFromKeySym(keysym: Uint32, keycode: Uint32, modifiers: SDL_Keymod) SDL_Keycode;
pub extern fn setlocale(__category: c_int, __locale: [*c]const u8) [*c]u8;
pub var scancode_set: [4]SDL_ScancodeTable = [4]SDL_ScancodeTable{
    SDL_SCANCODE_TABLE_DARWIN,
    SDL_SCANCODE_TABLE_XFREE86_1,
    SDL_SCANCODE_TABLE_XFREE86_2,
    SDL_SCANCODE_TABLE_XVNC,
};
pub fn X11_ScancodeIsRemappable(scancode: SDL_Scancode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (scancode) {
                    @as(SDL_Scancode, SDL_SCANCODE_ESCAPE) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_CAPSLOCK) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_NUMLOCKCLEAR) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LSHIFT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RSHIFT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LCTRL) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RCTRL) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LALT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RALT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_LGUI) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_RGUI) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
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
                return @"false" != 0;
            },
            13 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn X11_KeyCodeToSym(_this: [*c]SDL_VideoDevice, keycode: KeyCode, group: c_uint, level: c_uint) callconv(.c) KeySym {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var keysym: KeySym = undefined;
    _ = &keysym;
    if (data.*.keyboard.xkb_enabled) {
        keysym = X11_XkbKeycodeToKeysym.?(data.*.display, keycode, group, level);
    } else {
        if ((@as(c_int, keycode) >= data.*.keyboard.unnamed_0.core.min_keycode) and (@as(c_int, keycode) <= data.*.keyboard.unnamed_0.core.max_keycode)) {
            keysym = data.*.keyboard.unnamed_0.core.keysym_map[@bitCast(@as(isize, @intCast((@as(c_int, keycode) - data.*.keyboard.unnamed_0.core.min_keycode) * data.*.keyboard.unnamed_0.core.keysyms_per_key)))];
        } else {
            keysym = NoSymbol;
        }
    }
    return keysym;
}
pub fn X11_KeyCodeToSDLScancode(_this: [*c]SDL_VideoDevice, keycode: KeyCode) callconv(.c) SDL_Scancode {
    @setEvalBranchQuota(100000);
    const keysym: KeySym = X11_KeyCodeToSym(_this, keycode, 0, 0);
    _ = &keysym;
    if (keysym == @as(KeySym, NoSymbol)) {
        return SDL_SCANCODE_UNKNOWN;
    }
    return SDL_GetScancodeFromKeySym(@truncate(keysym), keycode);
}
pub fn im_instantiate_handler(_: [*c]Display, clientData: XPointer, _: XPointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = @ptrCast(@alignCast(clientData));
    _ = &videodata;
    if (X11_InitIM(videodata)) {
        _ = X11_XUnregisterIMInstantiateCallback.?(videodata.*.display, null, null, null, im_instantiate_handler, clientData);
    }
}
pub fn im_destroyed_handler(_: XIM, clientData: XPointer, _: XPointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = @ptrCast(@alignCast(clientData));
    _ = &videodata;
    videodata.*.im = null;
    _ = X11_XRegisterIMInstantiateCallback.?(videodata.*.display, null, null, null, im_instantiate_handler, clientData);
}
pub fn X11_InitIM(videodata: [*c]SDL_VideoData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prev_locale: [*c]u8 = setlocale(__LC_ALL, null);
    _ = &prev_locale;
    var prev_xmods: [*c]u8 = X11_XSetLocaleModifiers.?(null);
    _ = &prev_xmods;
    if (prev_locale != null) {
        prev_locale = SDL_strdup_REAL(prev_locale);
    }
    if (prev_xmods != null) {
        prev_xmods = SDL_strdup_REAL(prev_xmods);
    }
    _ = setlocale(__LC_ALL, "");
    _ = X11_XSetLocaleModifiers.?("");
    var im: XIM = X11_XOpenIM.?(videodata.*.display, null, null, null);
    _ = &im;
    _ = setlocale(__LC_ALL, prev_locale);
    _ = X11_XSetLocaleModifiers.?(prev_xmods);
    SDL_free_REAL(@ptrCast(@alignCast(prev_locale)));
    SDL_free_REAL(@ptrCast(@alignCast(prev_xmods)));
    if (im != null) {
        videodata.*.im = im;
        var destroyed_callback: XIMCallback = undefined;
        _ = &destroyed_callback;
        destroyed_callback.client_data = @ptrCast(@alignCast(videodata));
        destroyed_callback.callback = im_destroyed_handler;
        _ = X11_XSetIMValues.?(im, @as([*c]u8, @as([*c]u8, @constCast("destroyCallback"))), &destroyed_callback, @as([*c]u8, null));
        {
            var i: c_int = 0;
            _ = &i;
            while (i < videodata.*.numwindows) : (i += 1) {
                var w: [*c]SDL_WindowData = videodata.*.windowlist[@bitCast(@as(isize, @intCast(i)))];
                _ = &w;
                if (!(w.*.ic != null)) {
                    X11_CreateInputContext(w);
                }
            }
        }
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn X11_InitKeyboard(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var i: c_int = 0;
    _ = &i;
    var j: c_int = 0;
    _ = &j;
    var min_keycode: c_int = undefined;
    _ = &min_keycode;
    var max_keycode: c_int = undefined;
    _ = &max_keycode;
    const struct_unnamed_85 = extern struct {
        scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
        keysym: KeySym = 0,
        value: c_int = 0,
    };
    _ = &struct_unnamed_85;
    var fingerprint: [6]struct_unnamed_85 = [6]struct_unnamed_85{
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_HOME,
            .keysym = XK_Home,
            .value = 0,
        },
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_PAGEUP,
            .keysym = XK_Prior,
            .value = 0,
        },
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_UP,
            .keysym = XK_Up,
            .value = 0,
        },
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_LEFT,
            .keysym = XK_Left,
            .value = 0,
        },
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_DELETE,
            .keysym = XK_Delete,
            .value = 0,
        },
        struct_unnamed_85{
            .scancode = SDL_SCANCODE_KP_ENTER,
            .keysym = XK_KP_Enter,
            .value = 0,
        },
    };
    _ = &fingerprint;
    var best_distance: c_int = undefined;
    _ = &best_distance;
    var best_index: c_int = undefined;
    _ = &best_index;
    var distance: c_int = undefined;
    _ = &distance;
    var xkb_major: c_int = XkbMajorVersion;
    _ = &xkb_major;
    var xkb_minor: c_int = XkbMinorVersion;
    _ = &xkb_minor;
    if (X11_XkbQueryExtension.?(data.*.display, null, &data.*.keyboard.unnamed_0.xkb.event, null, &xkb_major, &xkb_minor) != 0) {
        var xkb_repeat: c_int = 0;
        _ = &xkb_repeat;
        data.*.keyboard.xkb_enabled = @"true" != 0;
        data.*.keyboard.unnamed_0.xkb.desc_ptr = X11_XkbGetMap.?(data.*.display, @bitCast(@as(c_int, ((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))), XkbUseCoreKbd);
        _ = X11_XkbSetDetectableAutoRepeat.?(data.*.display, True, &xkb_repeat);
        _ = X11_XkbSelectEvents.?(data.*.display, XkbUseCoreKbd, @bitCast(@as(c_int, @truncate(((@as(c_long, 1) << @intCast(@as(c_long, 0))) | (@as(c_long, 1) << @intCast(@as(c_long, 1)))) | (@as(c_long, 1) << @intCast(@as(c_long, 2)))))), @bitCast(@as(c_long, ((@as(c_long, 1) << @intCast(@as(c_long, 0))) | (@as(c_long, 1) << @intCast(@as(c_long, 1)))) | (@as(c_long, 1) << @intCast(@as(c_long, 2))))));
        _ = X11_XkbSelectEventDetails.?(data.*.display, XkbUseCoreKbd, XkbStateNotify, @bitCast(@as(c_long, (@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 0))))), @bitCast(@as(c_long, (@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 0))))));
    } else {
        _ = X11_XDisplayKeycodes.?(data.*.display, &data.*.keyboard.unnamed_0.core.min_keycode, &data.*.keyboard.unnamed_0.core.max_keycode);
        data.*.keyboard.unnamed_0.core.keysym_map = X11_XGetKeyboardMapping.?(data.*.display, @bitCast(@as(i8, @truncate(data.*.keyboard.unnamed_0.core.min_keycode))), data.*.keyboard.unnamed_0.core.max_keycode - data.*.keyboard.unnamed_0.core.min_keycode, &data.*.keyboard.unnamed_0.core.keysyms_per_key);
    }
    if (SDL_X11_HAVE_UTF8 != 0) {
        if (!X11_InitIM(data)) {
            _ = X11_XRegisterIMInstantiateCallback.?(data.*.display, null, null, null, im_instantiate_handler, @ptrCast(@alignCast(data)));
        }
    }
    best_distance = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(fingerprint)) / @sizeOf(@TypeOf(fingerprint[@as(c_int, 0)]))) +% @as(c_ulong, 1))));
    best_index = -@as(c_int, 1);
    _ = X11_XDisplayKeycodes.?(data.*.display, &min_keycode, &max_keycode);
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(fingerprint)) / @sizeOf(@TypeOf(fingerprint[@as(c_int, 0)])))) : (i += 1) {
            fingerprint[@bitCast(@as(isize, @intCast(i)))].value = @as(c_int, X11_XKeysymToKeycode.?(data.*.display, fingerprint[@bitCast(@as(isize, @intCast(i)))].keysym)) - min_keycode;
        }
    }
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(scancode_set)) / @sizeOf(@TypeOf(scancode_set[@as(c_int, 0)])))) : (i += 1) {
            var table_size: c_int = undefined;
            _ = &table_size;
            var table: [*c]const SDL_Scancode = SDL_GetScancodeTable(scancode_set[@bitCast(@as(isize, @intCast(i)))], &table_size);
            _ = &table;
            distance = 0;
            {
                j = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, j))) < (@sizeOf(@TypeOf(fingerprint)) / @sizeOf(@TypeOf(fingerprint[@as(c_int, 0)])))) : (j += 1) {
                    if ((fingerprint[@bitCast(@as(isize, @intCast(j)))].value < @as(c_int, 0)) or (fingerprint[@bitCast(@as(isize, @intCast(j)))].value >= table_size)) {
                        distance += 1;
                    } else if (table[@bitCast(@as(isize, @intCast(fingerprint[@bitCast(@as(isize, @intCast(j)))].value)))] != fingerprint[@bitCast(@as(isize, @intCast(j)))].scancode) {
                        distance += 1;
                    }
                }
            }
            if (distance < best_distance) {
                best_distance = distance;
                best_index = i;
            }
        }
    }
    if ((best_index < @as(c_int, 0)) or (best_distance > @as(c_int, 2))) {
        var fingerprint_value: c_int = @as(c_int, X11_XKeysymToKeycode.?(data.*.display, 269025115)) - min_keycode;
        _ = &fingerprint_value;
        if (fingerprint_value == @as(c_int, 235)) {
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(scancode_set)) / @sizeOf(@TypeOf(scancode_set[@as(c_int, 0)])))) : (i += 1) {
                    if (scancode_set[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_ScancodeTable, SDL_SCANCODE_TABLE_XFREE86_2)) {
                        best_index = i;
                        best_distance = 0;
                        break;
                    }
                }
            }
        }
    }
    if ((best_index >= @as(c_int, 0)) and (best_distance <= @as(c_int, 2))) {
        var table_size: c_int = undefined;
        _ = &table_size;
        var table: [*c]const SDL_Scancode = SDL_GetScancodeTable(scancode_set[@bitCast(@as(isize, @intCast(best_index)))], &table_size);
        _ = &table;
        if (@as(c_ulong, @bitCast(@as(c_long, table_size))) > ((@sizeOf(@TypeOf(data.*.keyboard.key_layout)) / @sizeOf(@TypeOf(data.*.keyboard.key_layout[@as(c_int, 0)]))) -% @as(c_ulong, @bitCast(@as(c_long, min_keycode))))) {
            table_size = @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(data.*.keyboard.key_layout)) / @sizeOf(@TypeOf(data.*.keyboard.key_layout[@as(c_int, 0)]))) -% @as(c_ulong, @bitCast(@as(c_long, min_keycode))))));
        }
        _ = memcpy(@ptrCast(@alignCast(&data.*.keyboard.key_layout[@bitCast(@as(isize, @intCast(min_keycode)))])), @ptrCast(@alignCast(table)), @sizeOf(SDL_Scancode) *% @as(c_ulong, @bitCast(@as(c_long, table_size))));
        {
            i = min_keycode;
            while (i <= max_keycode) : (i += 1) {
                var scancode: SDL_Scancode = X11_KeyCodeToSDLScancode(_this, @bitCast(@as(i8, @truncate(i))));
                _ = &scancode;
                if (scancode == data.*.keyboard.key_layout[@bitCast(@as(isize, @intCast(i)))]) {
                    continue;
                }
                if (((SDL_GetKeymapKeycode(null, scancode, SDL_KMOD_NONE) & ((@as(c_uint, 1) << @intCast(@as(c_uint, 30))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 29))))) != 0) and (@as(SDL_Keycode, @bitCast(@as(c_int, @as(c_int, @intFromBool(X11_ScancodeIsRemappable(scancode)))))) != 0)) {
                    data.*.keyboard.key_layout[@bitCast(@as(isize, @intCast(i)))] = scancode;
                }
            }
        }
    } else {
        {
            i = min_keycode;
            while (i <= max_keycode) : (i += 1) {
                var scancode: SDL_Scancode = X11_KeyCodeToSDLScancode(_this, @bitCast(@as(i8, @truncate(i))));
                _ = &scancode;
                data.*.keyboard.key_layout[@bitCast(@as(isize, @intCast(i)))] = scancode;
            }
        }
    }
    X11_UpdateKeymap(_this, @"false" != 0);
    _ = SDL_SetScancodeName_REAL(SDL_SCANCODE_APPLICATION, "Menu");
    X11_ReconcileKeyboardState(_this);
    return @"true" != 0;
}
pub fn X11_GetXkbVirtualModifierMask(_this: [*c]SDL_VideoDevice, vmod_name: [*c]const u8) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var mod_mask: c_uint = 0;
    _ = &mod_mask;
    const vmod: Atom = X11_XInternAtom.?(videodata.*.display, vmod_name, True);
    _ = &vmod;
    if (vmod != @as(Atom, None)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < XkbNumVirtualMods) : (i += 1) {
                if (vmod == videodata.*.keyboard.unnamed_0.xkb.desc_ptr.*.names.*.vmods[@bitCast(@as(isize, @intCast(i)))]) {
                    mod_mask = videodata.*.keyboard.unnamed_0.xkb.desc_ptr.*.server.*.vmods[@bitCast(@as(isize, @intCast(i)))];
                    break;
                }
            }
        }
    }
    return mod_mask;
}
pub fn X11_GetXModifierMask(_this: [*c]SDL_VideoDevice, scancode: SDL_Scancode) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var mod_mask: c_uint = 0;
    _ = &mod_mask;
    var xmods: [*c]XModifierKeymap = X11_XGetModifierMapping.?(display);
    _ = &xmods;
    var n: c_uint = @bitCast(@as(c_int, xmods.*.max_keypermod));
    _ = &n;
    {
        var i: c_int = 3;
        _ = &i;
        while (i < @as(c_int, 8)) : (i += 1) {
            {
                var j: c_int = 0;
                _ = &j;
                while (@as(c_uint, @bitCast(@as(c_int, j))) < n) : (j += 1) {
                    const kc: KeyCode = xmods.*.modifiermap[(@as(c_uint, @bitCast(@as(c_int, i))) *% n) +% @as(c_uint, @bitCast(@as(c_int, j)))];
                    _ = &kc;
                    if (videodata.*.keyboard.key_layout[kc] == scancode) {
                        mod_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(i)));
                        break;
                    }
                }
            }
        }
    }
    _ = X11_XFreeModifiermap.?(xmods);
    return mod_mask;
}
pub fn X11_AddKeymapEntry(keymap: ?*SDL_Keymap, xkeycode: Uint32, xkeysym: KeySym, sdl_scancode: SDL_Scancode, sdl_mod_mask: SDL_Keymod) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                keycode = SDL_GetKeyCodeFromKeySym(@truncate(xkeysym), xkeycode, sdl_mod_mask);
                if (!(keycode != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (sdl_scancode) {
                    @as(SDL_Scancode, SDL_SCANCODE_RETURN) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_ESCAPE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_BACKSPACE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_DELETE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
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
                SDL_SetKeymapEntry(keymap, sdl_scancode, sdl_mod_mask, keycode);
                {}
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                keycode = SDLK_RETURN;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                keycode = SDLK_ESCAPE;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                keycode = SDLK_BACKSPACE;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                keycode = SDLK_DELETE;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                keycode = sdl_scancode | (@as(c_uint, 1) << @intCast(@as(c_uint, 30)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11_UpdateKeymap(_this: [*c]SDL_VideoDevice, send_event: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = undefined;
    _ = &data;
    var state: XkbStateRec = undefined;
    _ = &state;
    var i: c_uint = undefined;
    _ = &i;
    var i_1: c_uint = undefined;
    _ = &i_1;
    var j: c_uint = undefined;
    _ = &j;
    var valid_mod_mask: Uint32 = undefined;
    _ = &valid_mod_mask;
    var xkeycode: Uint32 = undefined;
    _ = &xkeycode;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var group: Uint32 = undefined;
    _ = &group;
    var keymap: ?*SDL_Keymap = undefined;
    _ = &keymap;
    var effective_group: Uint32 = undefined;
    _ = &effective_group;
    var max_key_group: u8 = undefined;
    _ = &max_key_group;
    var key_group_info: u8 = undefined;
    _ = &key_group_info;
    var action: u8 = undefined;
    _ = &action;
    var key_type: XkbKeyTypePtr = undefined;
    _ = &key_type;
    var level: Uint32 = undefined;
    _ = &level;
    var keysym: KeySym = undefined;
    _ = &keysym;
    var key_added: bool = undefined;
    _ = &key_added;
    var map_idx: c_int = undefined;
    _ = &map_idx;
    var xkb_mod_mask: c_uint = undefined;
    _ = &xkb_mod_mask;
    var sdl_mod_mask: SDL_Keymod = undefined;
    _ = &sdl_mod_mask;
    var keymap_2: ?*SDL_Keymap = undefined;
    _ = &keymap_2;
    var xkeycode_3: Uint32 = undefined;
    _ = &xkeycode_3;
    var scancode_4: SDL_Scancode = undefined;
    _ = &scancode_4;
    var keysym_5: KeySym = undefined;
    _ = &keysym_5;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = _this.*.internal;
                if (data.*.keyboard.xkb_enabled) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                keymap_2 = SDL_CreateKeymap(@"true" != 0);
                if (!(keymap_2 != null)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if (i < @as(c_uint, XkbNumKbdGroups)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                SDL_DestroyKeymap(data.*.keyboard.unnamed_0.xkb.keymaps[i]);
                data.*.keyboard.unnamed_0.xkb.keymaps[i] = null;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                i +%= 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                _ = X11_XkbGetNames.?(data.*.display, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 11)))), data.*.keyboard.unnamed_0.xkb.desc_ptr);
                _ = X11_XkbGetUpdatedMap.?(data.*.display, @bitCast(@as(c_int, (((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2)))) | (@as(c_int, 1) << @intCast(@as(c_int, 6))))), data.*.keyboard.unnamed_0.xkb.desc_ptr);
                if (X11_XkbGetState.?(data.*.display, XkbUseCoreKbd, &state) == Success) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                data.*.keyboard.unnamed_0.xkb.current_group = state.group;
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
                data.*.keyboard.alt_mask = X11_GetXkbVirtualModifierMask(_this, "Alt");
                if (!(data.*.keyboard.alt_mask != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                data.*.keyboard.alt_mask = X11_GetXkbVirtualModifierMask(_this, "Meta");
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
                data.*.keyboard.gui_mask = X11_GetXkbVirtualModifierMask(_this, "Super");
                data.*.keyboard.level3_mask = X11_GetXkbVirtualModifierMask(_this, "LevelThree");
                data.*.keyboard.level5_mask = X11_GetXkbVirtualModifierMask(_this, "LevelFive");
                data.*.keyboard.numlock_mask = X11_GetXkbVirtualModifierMask(_this, "NumLock");
                data.*.keyboard.scrolllock_mask = X11_GetXkbVirtualModifierMask(_this, "ScrollLock");
                i_1 = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (i_1 < @as(c_uint, XkbNumKbdGroups)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                data.*.keyboard.unnamed_0.xkb.keymaps[i_1] = SDL_CreateKeymap(@"false" != 0);
                if (!(data.*.keyboard.unnamed_0.xkb.keymaps[i_1] != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                i_1 +%= 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                valid_mod_mask = ((@as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))))) | data.*.keyboard.alt_mask) | data.*.keyboard.level3_mask) | data.*.keyboard.level5_mask;
                xkeycode = data.*.keyboard.unnamed_0.xkb.desc_ptr.*.min_key_code;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            18 => {
                j = 0;
                {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                if (j < i_1) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                SDL_DestroyKeymap(data.*.keyboard.unnamed_0.xkb.keymaps[i_1]);
                data.*.keyboard.unnamed_0.xkb.keymaps[j] = null;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                j +%= 1;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                return;
            },
            25 => {
                if (xkeycode < @as(Uint32, @bitCast(@as(c_int, @as(c_int, data.*.keyboard.unnamed_0.xkb.desc_ptr.*.max_key_code))))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                scancode = data.*.keyboard.key_layout[xkeycode];
                if (scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                xkeycode +%= 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                SDL_SetKeymap(data.*.keyboard.unnamed_0.xkb.keymaps[data.*.keyboard.unnamed_0.xkb.current_group], send_event);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 27;
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
                group = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (group < @as(Uint32, XkbNumKbdGroups)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                keymap = data.*.keyboard.unnamed_0.xkb.keymaps[group];
                effective_group = group;
                max_key_group = @bitCast(@as(i8, @truncate(@as(c_int, data.*.keyboard.unnamed_0.xkb.desc_ptr.*.map.*.key_sym_map[xkeycode].group_info) & @as(c_int, 15))));
                key_group_info = data.*.keyboard.unnamed_0.xkb.desc_ptr.*.map.*.key_sym_map[xkeycode].group_info;
                if ((@as(c_int, max_key_group) != 0) and (effective_group >= @as(Uint32, @bitCast(@as(c_int, @as(c_int, max_key_group)))))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                group +%= 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            36 => {
                action = @bitCast(@as(i8, @truncate(@as(c_int, key_group_info) & @as(c_int, 192))));
                switch (@as(c_int, action)) {
                    @as(c_int, 64) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 128) => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 40;
                        continue;
                    },
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                key_type = &data.*.keyboard.unnamed_0.xkb.desc_ptr.*.map.*.types[data.*.keyboard.unnamed_0.xkb.desc_ptr.*.map.*.key_sym_map[xkeycode].kt_index[effective_group & @as(Uint32, 3)]];
                level = 0;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            40 => {
                effective_group %= @bitCast(@as(c_int, @as(c_int, max_key_group)));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            41 => {
                effective_group = @bitCast(@as(c_int, @as(c_int, max_key_group) - @as(c_int, 1)));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            42 => {
                effective_group = @bitCast(@as(c_int, (@as(c_int, key_group_info) & @as(c_int, 48)) >> @intCast(@as(c_int, 4))));
                if (effective_group >= @as(Uint32, @bitCast(@as(c_int, @as(c_int, max_key_group))))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                effective_group = 0;
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
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            46 => {
                if (level < @as(Uint32, @bitCast(@as(c_int, @as(c_int, key_type.*.num_levels))))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                keysym = X11_KeyCodeToSym(_this, @truncate(xkeycode), effective_group, level);
                if (keysym != @as(KeySym, NoSymbol)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                level +%= 1;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            50 => {
                key_added = @"false" != 0;
                map_idx = 0;
                {
                    sdl_pc = 53;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            53 => {
                if (map_idx < @as(c_int, key_type.*.map_count)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if ((key_type.*.map[@bitCast(@as(isize, @intCast(map_idx)))].active != 0) and (@as(Uint32, @bitCast(@as(c_int, @as(c_int, key_type.*.map[@bitCast(@as(isize, @intCast(map_idx)))].level)))) == level)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                map_idx += 1;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            56 => {
                if (!(level != 0) and !key_added) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            57 => {
                xkb_mod_mask = key_type.*.map[@bitCast(@as(isize, @intCast(map_idx)))].mods.mask;
                if ((xkb_mod_mask | valid_mod_mask) == valid_mod_mask) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
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
                    sdl_pc = 55;
                    continue;
                }
            },
            60 => {
                sdl_mod_mask = @truncate(((((if ((xkb_mod_mask & @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != 0) SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT else @as(c_uint, 0)) | (if ((xkb_mod_mask & @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0) SDL_KMOD_CAPS else @as(c_uint, 0))) | (if ((xkb_mod_mask & data.*.keyboard.alt_mask) != 0) SDL_KMOD_LALT | SDL_KMOD_RALT else @as(c_uint, 0))) | (if ((xkb_mod_mask & data.*.keyboard.level3_mask) != 0) SDL_KMOD_MODE else @as(c_uint, 0))) | (if ((xkb_mod_mask & data.*.keyboard.level5_mask) != 0) SDL_KMOD_LEVEL5 else @as(c_uint, 0)));
                X11_AddKeymapEntry(keymap, xkeycode, keysym, scancode, sdl_mod_mask);
                key_added = @"true" != 0;
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
                    sdl_pc = 59;
                    continue;
                }
            },
            63 => {
                X11_AddKeymapEntry(keymap, xkeycode, keysym, scancode, 0);
                {
                    sdl_pc = 65;
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
                    sdl_pc = 52;
                    continue;
                }
            },
            66 => {
                return;
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (send_event) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                if (data.*.keyboard.unnamed_0.core.keysym_map != null) {
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
                xkeycode_3 = @bitCast(@as(c_int, data.*.keyboard.unnamed_0.core.min_keycode));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            72 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(data.*.keyboard.unnamed_0.core.keysym_map)));
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
                _ = X11_XDisplayKeycodes.?(data.*.display, &data.*.keyboard.unnamed_0.core.min_keycode, &data.*.keyboard.unnamed_0.core.max_keycode);
                data.*.keyboard.unnamed_0.core.keysym_map = X11_XGetKeyboardMapping.?(data.*.display, @bitCast(@as(i8, @truncate(data.*.keyboard.unnamed_0.core.min_keycode))), data.*.keyboard.unnamed_0.core.max_keycode - data.*.keyboard.unnamed_0.core.min_keycode, &data.*.keyboard.unnamed_0.core.keysyms_per_key);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                if (xkeycode_3 <= @as(Uint32, @bitCast(@as(c_int, data.*.keyboard.unnamed_0.core.max_keycode)))) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            76 => {
                scancode_4 = data.*.keyboard.key_layout[xkeycode_3];
                if (scancode_4 == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            77 => {
                xkeycode_3 +%= 1;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            78 => {
                data.*.keyboard.alt_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3))));
                data.*.keyboard.gui_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 6))));
                data.*.keyboard.level3_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 7))));
                data.*.keyboard.level5_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 5))));
                data.*.keyboard.numlock_mask = X11_GetXModifierMask(_this, SDL_SCANCODE_NUMLOCKCLEAR);
                data.*.keyboard.scrolllock_mask = X11_GetXModifierMask(_this, SDL_SCANCODE_SCROLLLOCK);
                SDL_SetKeymap(keymap_2, send_event);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 77;
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
                keysym_5 = X11_KeyCodeToSym(_this, @truncate(xkeycode_3), 0, 0);
                if (keysym_5 != @as(KeySym, NoSymbol)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                X11_AddKeymapEntry(keymap_2, xkeycode_3, keysym_5, scancode_4, 0);
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
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11_QuitKeyboard(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (data.*.im != null) {
        _ = X11_XCloseIM.?(data.*.im);
        data.*.im = null;
    } else {
        _ = X11_XUnregisterIMInstantiateCallback.?(data.*.display, null, null, null, im_instantiate_handler, @ptrCast(@alignCast(data)));
    }
    if (data.*.keyboard.xkb_enabled) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < XkbNumKbdGroups) : (i += 1) {
                SDL_DestroyKeymap(data.*.keyboard.unnamed_0.xkb.keymaps[@bitCast(@as(isize, @intCast(i)))]);
                data.*.keyboard.unnamed_0.xkb.keymaps[@bitCast(@as(isize, @intCast(i)))] = null;
            }
        }
        if (data.*.keyboard.xkb_enabled) {
            X11_XkbFreeKeyboard.?(data.*.keyboard.unnamed_0.xkb.desc_ptr, 0, True);
            data.*.keyboard.unnamed_0.xkb.desc_ptr = null;
        }
    } else if (data.*.keyboard.unnamed_0.core.keysym_map != null) {
        _ = X11_XFree.?(@ptrCast(@alignCast(data.*.keyboard.unnamed_0.core.keysym_map)));
        data.*.keyboard.unnamed_0.core.keysym_map = null;
    }
}
pub export fn X11_ClearComposition(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    if (data.*.preedit_length > @as(c_int, 0)) {
        data.*.preedit_text[@as(c_int, 0)] = '\x00';
        data.*.preedit_length = 0;
    }
    if (data.*.ime_needs_clear_composition) {
        SDL_SendEditingText("", 0, 0);
        data.*.ime_needs_clear_composition = @"false" != 0;
    }
}
pub fn X11_SendEditingEvent(data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.preedit_length == @as(c_int, 0)) {
        X11_ClearComposition(data);
        return;
    }
    var in_highlight: bool = @"false" != 0;
    _ = &in_highlight;
    var start: c_int = -@as(c_int, 1);
    _ = &start;
    var length: c_int = 0;
    _ = &length;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < data.*.preedit_length) : (i += 1) {
            if ((data.*.preedit_feedback[@bitCast(@as(isize, @intCast(i)))] & @as(XIMFeedback, @bitCast(@as(c_long, XIMReverse | (@as(c_long, 1) << @intCast(@as(c_long, 2))))))) != 0) {
                if (start < @as(c_int, 0)) {
                    start = i;
                    in_highlight = @"true" != 0;
                }
            } else if (in_highlight) {
                break;
            }
        }
    }
    if (in_highlight) {
        length = i - start;
    } else {
        start = if (data.*.preedit_cursor < @as(c_int, 0)) @as(c_int, 0) else if (data.*.preedit_cursor > data.*.preedit_length) data.*.preedit_length else data.*.preedit_cursor;
    }
    SDL_SendEditingText(data.*.preedit_text, start, length);
    data.*.ime_needs_clear_composition = @"true" != 0;
}
pub fn preedit_start_callback(_: XIC, _: XPointer, _: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn preedit_done_callback(_: XIC, _: XPointer, _: XPointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn preedit_draw_callback(_: XIC, client_data: XPointer, call_data: [*c]XIMPreeditDrawCallbackStruct) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "preedit_draw_callback".*;
    };
    _ = &static_local___func__;
    var data: [*c]SDL_WindowData = @ptrCast(@alignCast(client_data));
    _ = &data;
    var chg_first: c_int = if (call_data.*.chg_first < @as(c_int, 0)) @as(c_int, 0) else if (call_data.*.chg_first > data.*.preedit_length) data.*.preedit_length else call_data.*.chg_first;
    _ = &chg_first;
    var chg_length: c_int = if (call_data.*.chg_length < @as(c_int, 0)) @as(c_int, 0) else if (call_data.*.chg_length > (data.*.preedit_length - chg_first)) data.*.preedit_length - chg_first else call_data.*.chg_length;
    _ = &chg_length;
    var start: [*c]const u8 = data.*.preedit_text;
    _ = &start;
    if (chg_length > @as(c_int, 0)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (((start != null) and (@as(c_int, start.*) != 0)) and (i < chg_first)) : (i += 1) {
                _ = SDL_StepUTF8_REAL(&start, null);
            }
        }
        var end: [*c]const u8 = start;
        _ = &end;
        {
            var i: c_int = 0;
            _ = &i;
            while (((end != null) and (@as(c_int, end.*) != 0)) and (i < chg_length)) : (i += 1) {
                _ = SDL_StepUTF8_REAL(&end, null);
            }
        }
        if (end > start) {
            _ = memmove(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(start)))))), @ptrCast(@alignCast(end)), SDL_strlen_REAL(end) +% @as(usize, 1));
            if ((chg_first + chg_length) > data.*.preedit_length) {
                _ = memmove(@ptrCast(@alignCast(&data.*.preedit_feedback[@bitCast(@as(isize, @intCast(chg_first)))])), @ptrCast(@alignCast(&data.*.preedit_feedback[@bitCast(@as(isize, @intCast(chg_first + chg_length)))])), @as(c_ulong, @bitCast(@as(c_long, (data.*.preedit_length - chg_first) - chg_length))) *% @sizeOf(@TypeOf(data.*.preedit_feedback.*)));
            }
        }
        data.*.preedit_length -= chg_length;
    }
    var text: [*c]XIMText = call_data.*.text;
    _ = &text;
    if (text != null) {
        while (true) {
            while (!!(text.*.encoding_is_wchar != 0)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!text->encoding_is_wchar",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11keyboard.c", 692);
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
        if (text.*.string.multi_byte != null) {
            text.*.length = @truncate(SDL_utf8strlen_REAL(text.*.string.multi_byte));
        }
        var string_size: usize = SDL_strlen_REAL(text.*.string.multi_byte);
        _ = &string_size;
        var size: usize = string_size +% @as(usize, 1);
        _ = &size;
        if (data.*.preedit_text != null) {
            size +%= SDL_strlen_REAL(data.*.preedit_text);
        }
        var preedit_text: [*c]u8 = undefined;
        preedit_text = @ptrCast(@alignCast(SDL_malloc_REAL(size *% @sizeOf(@TypeOf(preedit_text.*)))));
        _ = &preedit_text;
        if (preedit_text != null) {
            var pre_size: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(start) -% @intFromPtr(data.*.preedit_text))), @sizeOf(u8))));
            _ = &pre_size;
            var post_size: usize = if (start != null) SDL_strlen_REAL(start) else @as(usize, 0);
            _ = &post_size;
            if (pre_size > @as(usize, 0)) {
                _ = memcpy(@ptrCast(@alignCast(&preedit_text[@as(c_int, 0)])), @ptrCast(@alignCast(data.*.preedit_text)), pre_size);
            }
            _ = memcpy(@ptrCast(@alignCast(&preedit_text[pre_size])), @ptrCast(@alignCast(text.*.string.multi_byte)), string_size);
            if (post_size > @as(usize, 0)) {
                _ = memcpy(@ptrCast(@alignCast(&preedit_text[pre_size +% string_size])), @ptrCast(@alignCast(start)), post_size);
            }
            preedit_text[size -% @as(usize, 1)] = '\x00';
        }
        var feedback_size: usize = @bitCast(@as(c_long, data.*.preedit_length + @as(c_int, text.*.length)));
        _ = &feedback_size;
        var feedback: [*c]XIMFeedback = undefined;
        feedback = @ptrCast(@alignCast(SDL_malloc_REAL(feedback_size *% @sizeOf(@TypeOf(feedback.*)))));
        _ = &feedback;
        if (feedback != null) {
            var pre_size: usize = @bitCast(@as(c_long, chg_first));
            _ = &pre_size;
            var post_size: usize = @as(usize, @bitCast(@as(c_long, data.*.preedit_length))) -% pre_size;
            _ = &post_size;
            if (pre_size > @as(usize, 0)) {
                _ = memcpy(@ptrCast(@alignCast(&feedback[@as(c_int, 0)])), @ptrCast(@alignCast(data.*.preedit_feedback)), pre_size *% @sizeOf(@TypeOf(feedback.*)));
            }
            _ = memcpy(@ptrCast(@alignCast(&feedback[pre_size])), @ptrCast(@alignCast(text.*.feedback)), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, text.*.length)))) *% @sizeOf(@TypeOf(feedback.*)));
            if (post_size > @as(usize, 0)) {
                _ = memcpy(@ptrCast(@alignCast(&feedback[pre_size +% @as(usize, @bitCast(@as(c_long, @as(c_int, text.*.length))))])), @ptrCast(@alignCast(&data.*.preedit_feedback[pre_size])), post_size *% @sizeOf(@TypeOf(feedback.*)));
            }
        }
        if ((preedit_text != null) and (feedback != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(data.*.preedit_text)));
            data.*.preedit_text = preedit_text;
            SDL_free_REAL(@ptrCast(@alignCast(data.*.preedit_feedback)));
            data.*.preedit_feedback = feedback;
            data.*.preedit_length += text.*.length;
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(preedit_text)));
            SDL_free_REAL(@ptrCast(@alignCast(feedback)));
        }
    }
    data.*.preedit_cursor = call_data.*.caret;
    X11_SendEditingEvent(data);
}
pub fn preedit_caret_callback(_: XIC, client_data: XPointer, call_data: [*c]XIMPreeditCaretCallbackStruct) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = @ptrCast(@alignCast(client_data));
                switch (call_data.*.direction) {
                    @as(XIMCaretDirection, XIMAbsolutePosition) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(XIMCaretDirection, XIMDontChange) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                if (call_data.*.position != data.*.preedit_cursor) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                data.*.preedit_cursor = call_data.*.position;
                X11_SendEditingEvent(data);
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ic_destroyed_handler(_: XIC, clientData: XPointer, _: XPointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = @ptrCast(@alignCast(clientData));
    _ = &data;
    data.*.ic = null;
    X11_DestroyInputContext(data);
    if (data.*.videodata.*.im != null) {
        X11_CreateInputContext(data);
    }
}
pub export fn X11_CreateInputContext(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = data.*.videodata;
    _ = &videodata;
    if ((SDL_X11_HAVE_UTF8 != 0) and (videodata.*.im != null)) {
        var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_IME_IMPLEMENTED_UI");
        _ = &hint;
        var destroyed_callback: XIMCallback = undefined;
        _ = &destroyed_callback;
        destroyed_callback.client_data = @ptrCast(@alignCast(data));
        destroyed_callback.callback = @ptrCast(@alignCast(@constCast(&ic_destroyed_handler)));
        if ((hint != null) and (SDL_strstr_REAL(hint, "composition") != null)) {
            var draw_callback: XIMCallback = undefined;
            _ = &draw_callback;
            draw_callback.client_data = @ptrCast(@alignCast(data));
            draw_callback.callback = @ptrCast(@alignCast(@constCast(&preedit_draw_callback)));
            var start_callback: XIMCallback = undefined;
            _ = &start_callback;
            start_callback.client_data = @ptrCast(@alignCast(data));
            start_callback.callback = @ptrCast(@alignCast(@constCast(&preedit_start_callback)));
            var done_callback: XIMCallback = undefined;
            _ = &done_callback;
            done_callback.client_data = @ptrCast(@alignCast(data));
            done_callback.callback = @ptrCast(@alignCast(@constCast(&preedit_done_callback)));
            var caret_callback: XIMCallback = undefined;
            _ = &caret_callback;
            caret_callback.client_data = @ptrCast(@alignCast(data));
            caret_callback.callback = @ptrCast(@alignCast(@constCast(&preedit_caret_callback)));
            var attr: XVaNestedList = X11_XVaCreateNestedList.?(0, @as([*c]u8, @as([*c]u8, @constCast("preeditStartCallback"))), &start_callback, @as([*c]u8, @as([*c]u8, @constCast("preeditDoneCallback"))), &done_callback, @as([*c]u8, @as([*c]u8, @constCast("preeditDrawCallback"))), &draw_callback, @as([*c]u8, @as([*c]u8, @constCast("preeditCaretCallback"))), &caret_callback, @as(?*anyopaque, null));
            _ = &attr;
            if (attr != null) {
                data.*.ic = X11_XCreateIC.?(videodata.*.im, @as([*c]u8, @as([*c]u8, @constCast("inputStyle"))), XIMPreeditCallbacks | XIMStatusCallbacks, @as([*c]u8, @as([*c]u8, @constCast("preeditAttributes"))), attr, @as([*c]u8, @as([*c]u8, @constCast("clientWindow"))), data.*.xwindow, @as([*c]u8, @as([*c]u8, @constCast("destroyCallback"))), &destroyed_callback, @as(?*anyopaque, null));
                _ = X11_XFree.?(attr);
            }
        }
        if (!(data.*.ic != null)) {
            data.*.ic = X11_XCreateIC.?(videodata.*.im, @as([*c]u8, @as([*c]u8, @constCast("inputStyle"))), XIMPreeditNothing | XIMStatusNothing, @as([*c]u8, @as([*c]u8, @constCast("clientWindow"))), data.*.xwindow, @as([*c]u8, @as([*c]u8, @constCast("destroyCallback"))), &destroyed_callback, @as(?*anyopaque, null));
        }
        data.*.xim_spot.x = @truncate(-@as(c_int, 1));
        data.*.xim_spot.y = @truncate(-@as(c_int, 1));
    }
}
pub export fn X11_DestroyInputContext(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    if (data.*.ic != null) {
        X11_XDestroyIC.?(data.*.ic);
        data.*.ic = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(data.*.preedit_text)));
    SDL_free_REAL(@ptrCast(@alignCast(data.*.preedit_feedback)));
    data.*.preedit_text = null;
    data.*.preedit_feedback = null;
}
pub fn X11_ResetXIM(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if ((data != null) and (data.*.ic != null)) {
        var contents: [*c]u8 = X11_Xutf8ResetIC.?(data.*.ic);
        _ = &contents;
        if (contents != null) {
            _ = X11_XFree.?(@ptrCast(@alignCast(contents)));
        }
    }
}
pub export fn X11_StartTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    X11_ResetXIM(_this, window);
    return X11_UpdateTextInputArea(_this, window);
}
pub export fn X11_StopTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    X11_ResetXIM(_this, window);
    return @"true" != 0;
}
pub export fn X11_UpdateTextInputArea(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if ((data != null) and (data.*.ic != null)) {
        var spot: XPoint = undefined;
        _ = &spot;
        spot.x = @truncate(window.*.text_input_rect.x + window.*.text_input_cursor);
        spot.y = @truncate(window.*.text_input_rect.y + window.*.text_input_rect.h);
        if ((@as(c_int, spot.x) != @as(c_int, data.*.xim_spot.x)) or (@as(c_int, spot.y) != @as(c_int, data.*.xim_spot.y))) {
            var attr: XVaNestedList = X11_XVaCreateNestedList.?(0, @as([*c]u8, @as([*c]u8, @constCast("spotLocation"))), &spot, @as(?*anyopaque, null));
            _ = &attr;
            if (attr != null) {
                _ = X11_XSetICValues.?(data.*.ic, @as([*c]u8, @as([*c]u8, @constCast("preeditAttributes"))), attr, @as(?*anyopaque, null));
                _ = X11_XFree.?(attr);
            }
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&data.*.xim_spot).*)) == @sizeOf(@TypeOf((&spot).*)))) @compileError("static assertion failed \"sizeof (*(&data->xim_spot)) == sizeof (*( &spot))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&data.*.xim_spot)), @ptrCast(@alignCast(&spot)), @sizeOf(@TypeOf((&spot).*)));
        }
    }
    return @"true" != 0;
}
pub export fn X11_HasScreenKeyboardSupport(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    return videodata.*.use_steam_screen_keyboard;
}
pub export fn X11_ShowScreenKeyboard(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var k_EFloatingGamepadTextInputModeModeSingleLine: c_int = undefined;
    _ = &k_EFloatingGamepadTextInputModeModeSingleLine;
    var k_EFloatingGamepadTextInputModeModeMultipleLines: c_int = undefined;
    _ = &k_EFloatingGamepadTextInputModeModeMultipleLines;
    var k_EFloatingGamepadTextInputModeModeEmail: c_int = undefined;
    _ = &k_EFloatingGamepadTextInputModeModeEmail;
    var k_EFloatingGamepadTextInputModeModeNumeric: c_int = undefined;
    _ = &k_EFloatingGamepadTextInputModeModeNumeric;
    var deeplink: [128]u8 = undefined;
    _ = &deeplink;
    var mode: c_int = undefined;
    _ = &mode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                if (videodata.*.use_steam_screen_keyboard) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                k_EFloatingGamepadTextInputModeModeSingleLine = 0;
                k_EFloatingGamepadTextInputModeModeMultipleLines = 1;
                k_EFloatingGamepadTextInputModeModeEmail = 2;
                k_EFloatingGamepadTextInputModeModeNumeric = 3;
                switch (SDL_GetTextInputType(props)) {
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_EMAIL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
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
                {}
            },
            4 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&deeplink)), @sizeOf(@TypeOf(deeplink)), "steam://open/keyboard?XPosition=%i&YPosition=%i&Width=%i&Height=%i&Mode=%d", window.*.text_input_rect.x, window.*.text_input_rect.y, window.*.text_input_rect.w, window.*.text_input_rect.h, mode);
                _ = SDL_OpenURL_REAL(@ptrCast(@alignCast(&deeplink)));
                SDL_SendScreenKeyboardShown();
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                mode = k_EFloatingGamepadTextInputModeModeEmail;
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                mode = k_EFloatingGamepadTextInputModeModeNumeric;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                if (SDL_GetTextInputMultiline(props)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                mode = k_EFloatingGamepadTextInputModeModeMultipleLines;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                mode = k_EFloatingGamepadTextInputModeModeSingleLine;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11_HideScreenKeyboard(_this: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    if (videodata.*.use_steam_screen_keyboard) {
        _ = SDL_OpenURL_REAL("steam://close/keyboard");
        SDL_SendScreenKeyboardHidden();
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDLK_RETURN = @as(c_uint, 0x0000000d);
pub const SDLK_ESCAPE = @as(c_uint, 0x0000001b);
pub const SDLK_BACKSPACE = @as(c_uint, 0x00000008);
pub const SDLK_DELETE = @as(c_uint, 0x0000007f);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LEVEL5 = @as(c_uint, 0x0004);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const None = @as(c_long, 0);
pub const NoSymbol = @as(c_long, 0);
pub const Success = @as(c_int, 0);
pub const True = @as(c_int, 1);
pub const XIMPreeditCallbacks = @as(c_long, 0x0002);
pub const XIMPreeditNothing = @as(c_long, 0x0008);
pub const XIMStatusCallbacks = @as(c_long, 0x0200);
pub const XIMStatusNothing = @as(c_long, 0x0400);
pub const XIMReverse = @as(c_long, 1);
pub const XK_Delete = __helpers.promoteIntLiteral(c_int, 0xffff, .hex);
pub const XK_Home = __helpers.promoteIntLiteral(c_int, 0xff50, .hex);
pub const XK_Left = __helpers.promoteIntLiteral(c_int, 0xff51, .hex);
pub const XK_Up = __helpers.promoteIntLiteral(c_int, 0xff52, .hex);
pub const XK_Prior = __helpers.promoteIntLiteral(c_int, 0xff55, .hex);
pub const XK_KP_Enter = __helpers.promoteIntLiteral(c_int, 0xff8d, .hex);
pub const XkbStateNotify = @as(c_int, 2);
pub const XkbUseCoreKbd = @as(c_int, 0x0100);
pub const XkbNumKbdGroups = @as(c_int, 4);
pub const XkbNumVirtualMods = @as(c_int, 16);
pub const XkbMajorVersion = @as(c_int, 1);
pub const XkbMinorVersion = @as(c_int, 0);
pub const __LC_ALL = @as(c_int, 6);
pub const shminfo = struct_shminfo;
