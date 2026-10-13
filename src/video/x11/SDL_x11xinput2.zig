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
pub const pthread_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_fabs_REAL(x: f64) f64;
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
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_GetKeyboards_REAL(count: [*c]c_int) [*c]SDL_KeyboardID;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
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
pub extern fn SDL_GetMice_REAL(count: [*c]c_int) [*c]SDL_MouseID;
pub extern fn SDL_GetMouseFocus_REAL() [*c]SDL_Window;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const SDL_TOUCH_DEVICE_INDIRECT_RELATIVE: c_int = 2;
pub const enum_SDL_TouchDeviceType = c_int;
pub const SDL_TouchDeviceType = enum_SDL_TouchDeviceType;
pub extern fn SDL_GetTouchDevices_REAL(count: [*c]c_int) [*c]SDL_TouchID;
pub const SDL_PenID = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_PINCH_BEGIN: c_int = 1808;
pub const SDL_EVENT_PINCH_UPDATE: c_int = 1809;
pub const SDL_EVENT_PINCH_END: c_int = 1810;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub const XIModifierState = extern struct {
    base: c_int = 0,
    latched: c_int = 0,
    locked: c_int = 0,
    effective: c_int = 0,
};
pub const XIGroupState = XIModifierState;
pub const XIButtonState = extern struct {
    mask_len: c_int = 0,
    mask: [*c]u8 = null,
};
pub const XIValuatorState = extern struct {
    mask_len: c_int = 0,
    mask: [*c]u8 = null,
    values: [*c]f64 = null,
};
pub const XIEventMask = extern struct {
    deviceid: c_int = 0,
    mask_len: c_int = 0,
    mask: [*c]u8 = null,
};
pub const XIAnyClassInfo = extern struct {
    type: c_int = 0,
    sourceid: c_int = 0,
};
pub const XIValuatorClassInfo = extern struct {
    type: c_int = 0,
    sourceid: c_int = 0,
    number: c_int = 0,
    label: Atom = 0,
    min: f64 = 0,
    max: f64 = 0,
    value: f64 = 0,
    resolution: c_int = 0,
    mode: c_int = 0,
};
pub const XIScrollClassInfo = extern struct {
    type: c_int = 0,
    sourceid: c_int = 0,
    number: c_int = 0,
    scroll_type: c_int = 0,
    increment: f64 = 0,
    flags: c_int = 0,
};
pub const XITouchClassInfo = extern struct {
    type: c_int = 0,
    sourceid: c_int = 0,
    mode: c_int = 0,
    num_touches: c_int = 0,
};
pub const XIDeviceInfo = extern struct {
    deviceid: c_int = 0,
    name: [*c]u8 = null,
    use: c_int = 0,
    attachment: c_int = 0,
    enabled: c_int = 0,
    num_classes: c_int = 0,
    classes: [*c][*c]XIAnyClassInfo = null,
};
pub const XIGrabModifiers = extern struct {
    modifiers: c_int = 0,
    status: c_int = 0,
};
pub const XIHierarchyInfo = extern struct {
    deviceid: c_int = 0,
    attachment: c_int = 0,
    use: c_int = 0,
    enabled: c_int = 0,
    flags: c_int = 0,
};
pub const XIHierarchyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    flags: c_int = 0,
    num_info: c_int = 0,
    info: [*c]XIHierarchyInfo = null,
};
pub const XIDeviceChangedEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    deviceid: c_int = 0,
    sourceid: c_int = 0,
    reason: c_int = 0,
    num_classes: c_int = 0,
    classes: [*c][*c]XIAnyClassInfo = null,
};
pub const XIDeviceEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    deviceid: c_int = 0,
    sourceid: c_int = 0,
    detail: c_int = 0,
    root: Window = 0,
    event: Window = 0,
    child: Window = 0,
    root_x: f64 = 0,
    root_y: f64 = 0,
    event_x: f64 = 0,
    event_y: f64 = 0,
    flags: c_int = 0,
    buttons: XIButtonState = @import("std").mem.zeroes(XIButtonState),
    valuators: XIValuatorState = @import("std").mem.zeroes(XIValuatorState),
    mods: XIModifierState = @import("std").mem.zeroes(XIModifierState),
    group: XIGroupState = @import("std").mem.zeroes(XIGroupState),
};
pub const XIRawEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    deviceid: c_int = 0,
    sourceid: c_int = 0,
    detail: c_int = 0,
    flags: c_int = 0,
    valuators: XIValuatorState = @import("std").mem.zeroes(XIValuatorState),
    raw_values: [*c]f64 = null,
};
pub const XIPropertyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    deviceid: c_int = 0,
    property: Atom = 0,
    what: c_int = 0,
};
pub const XIGesturePinchEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    time: Time = 0,
    deviceid: c_int = 0,
    sourceid: c_int = 0,
    detail: c_int = 0,
    root: Window = 0,
    event: Window = 0,
    child: Window = 0,
    root_x: f64 = 0,
    root_y: f64 = 0,
    event_x: f64 = 0,
    event_y: f64 = 0,
    delta_x: f64 = 0,
    delta_y: f64 = 0,
    delta_unaccel_x: f64 = 0,
    delta_unaccel_y: f64 = 0,
    scale: f64 = 0,
    delta_angle: f64 = 0,
    flags: c_int = 0,
    mods: XIModifierState = @import("std").mem.zeroes(XIModifierState),
    group: XIGroupState = @import("std").mem.zeroes(XIGroupState),
};
pub const pointer = ?*anyopaque;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XQueryExtension = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c]c_int, d: [*c]c_int, e: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XQueryExtension: SDL_DYNX11FN_XQueryExtension;
pub const SDL_DYNX11FN_XGetPointerMapping = ?*const fn (a: [*c]Display, b: [*c]u8, c: c_uint) callconv(.c) c_int;
pub extern var X11_XGetPointerMapping: SDL_DYNX11FN_XGetPointerMapping;
pub const SDL_DYNX11FN_XIQueryDevice = ?*const fn (a: [*c]Display, b: c_int, c: [*c]c_int) callconv(.c) [*c]XIDeviceInfo;
pub extern var X11_XIQueryDevice: SDL_DYNX11FN_XIQueryDevice;
pub const SDL_DYNX11FN_XIFreeDeviceInfo = ?*const fn (a: [*c]XIDeviceInfo) callconv(.c) void;
pub extern var X11_XIFreeDeviceInfo: SDL_DYNX11FN_XIFreeDeviceInfo;
pub const SDL_DYNX11FN_XISelectEvents = ?*const fn (a: [*c]Display, b: Window, c: [*c]XIEventMask, d: c_int) callconv(.c) c_int;
pub extern var X11_XISelectEvents: SDL_DYNX11FN_XISelectEvents;
pub const SDL_DYNX11FN_XIGrabTouchBegin = ?*const fn (a: [*c]Display, b: c_int, c: Window, d: c_int, e: [*c]XIEventMask, f: c_int, g: [*c]XIGrabModifiers) callconv(.c) c_int;
pub extern var X11_XIGrabTouchBegin: SDL_DYNX11FN_XIGrabTouchBegin;
pub const SDL_DYNX11FN_XIUngrabTouchBegin = ?*const fn (a: [*c]Display, b: c_int, c: Window, d: c_int, e: [*c]XIGrabModifiers) callconv(.c) c_int;
pub extern var X11_XIUngrabTouchBegin: SDL_DYNX11FN_XIUngrabTouchBegin;
pub const SDL_DYNX11FN_XIQueryVersion = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XIQueryVersion: SDL_DYNX11FN_XIQueryVersion;
pub extern var SDL_X11_HAVE_XINPUT2: c_int;
pub extern fn X11_HandleButtonPress(_this: [*c]SDL_VideoDevice, windowdata: [*c]SDL_WindowData, mouseID: SDL_MouseID, button: c_int, x: f32, y: f32, time: c_ulong, serial: c_ulong) void;
pub extern fn X11_HandleButtonRelease(_this: [*c]SDL_VideoDevice, windowdata: [*c]SDL_WindowData, mouseID: SDL_MouseID, button: c_int, time: c_ulong) void;
pub extern fn X11_FindWindow(videodata: [*c]SDL_VideoData, window: Window) [*c]SDL_WindowData;
pub extern fn X11_ProcessHitTest(_this: [*c]SDL_VideoDevice, data: [*c]SDL_WindowData, x: f32, y: f32, force_new_result: bool) bool;
pub extern fn X11_IsWheelEvent(button: c_int, xticks: [*c]c_int, yticks: [*c]c_int) bool;
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
pub extern fn SDL_SendMouseWheel(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32, direction: SDL_MouseWheelDirection) void;
pub extern fn SDL_SendPenTouch(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, eraser: bool, down: bool) void;
pub extern fn SDL_SendPenMotion(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, x: f32, y: f32) void;
pub extern fn SDL_SendPenAxis(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, axis: SDL_PenAxis, value: f32) void;
pub extern fn SDL_SendPenButton(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, button: Uint8, down: bool) void;
pub const struct_X11_PenHandle = extern struct {
    pen: SDL_PenID = 0,
    is_eraser: bool = false,
    x11_deviceid: c_int = 0,
    valuator_for_axis: [7]c_int = @import("std").mem.zeroes([7]c_int),
    slider_bias: f32 = 0,
    rotation_bias: f32 = 0,
    axis_min: [7]f32 = @import("std").mem.zeroes([7]f32),
    axis_max: [7]f32 = @import("std").mem.zeroes([7]f32),
};
pub const X11_PenHandle = struct_X11_PenHandle;
pub extern fn X11_PenAxesFromValuators(pen: [*c]const X11_PenHandle, input_values: [*c]const f64, mask: [*c]const u8, mask_len: c_int, axis_values: [*c]f32) void;
pub extern fn X11_MaybeAddPenByDeviceID(_this: [*c]SDL_VideoDevice, deviceid: c_int) [*c]X11_PenHandle;
pub extern fn X11_RemovePenByDeviceID(deviceid: c_int) void;
pub extern fn X11_FindPenByDeviceID(deviceid: c_int) [*c]X11_PenHandle;
pub extern fn X11_NotifyPenProximityChange(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, deviceid: c_int) void;
pub extern fn SDL_AddKeyboard(keyboardID: SDL_KeyboardID, name: [*c]const u8) void;
pub extern fn SDL_RemoveKeyboard(keyboardID: SDL_KeyboardID) void;
pub extern fn SDL_AddTouch(id: SDL_TouchID, @"type": SDL_TouchDeviceType, name: [*c]const u8) c_int;
pub extern fn SDL_SendTouch(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, @"type": SDL_EventType, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendTouchMotion(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_DelTouch(id: SDL_TouchID) void;
pub extern fn SDL_SendPinch(@"type": SDL_EventType, timestamp: Uint64, window: [*c]SDL_Window, scale: f32, span_x: f32, span_y: f32, focus_x: f32, focus_y: f32) c_int;
pub var xinput2_initialized: bool = false;
pub var xinput2_grabbed_touch_raised: bool = false;
pub var xinput2_active_touch_count: c_int = 0;
pub var xinput2_scrolling_supported: bool = false;
pub var xinput2_multitouch_supported: bool = false;
pub var xinput2_gesture_supported: bool = false;
pub var xinput2_opcode: c_int = 0;
pub var xinput2_rel_x_atom: Atom = 0;
pub var xinput2_rel_y_atom: Atom = 0;
pub var xinput2_abs_x_atom: Atom = 0;
pub var xinput2_abs_y_atom: Atom = 0;
pub var xinput2_pointer_button_map: [*c]u8 = null;
pub var xinput2_pointer_button_map_size: c_int = 0;
pub const SDL_XInput2ScrollInfo = extern struct {
    number: c_int = 0,
    scroll_type: c_int = 0,
    prev_value: f64 = 0,
    increment: f64 = 0,
    prev_value_valid: bool = false,
};
pub const SDL_XInput2ScrollableDevice = extern struct {
    scroll_info_count: c_int = 0,
    scroll_info: [*c]SDL_XInput2ScrollInfo = null,
};
pub const SDL_XInput2RelativeDevice = extern struct {
    number: [2]c_int = @import("std").mem.zeroes([2]c_int),
    relative: [2]bool = @import("std").mem.zeroes([2]bool),
    prev_coord_valid: [2]bool = @import("std").mem.zeroes([2]bool),
    minval: [2]f64 = @import("std").mem.zeroes([2]f64),
    maxval: [2]f64 = @import("std").mem.zeroes([2]f64),
    prev_coords: [2]f64 = @import("std").mem.zeroes([2]f64),
};
pub const struct_SDL_XInput2DeviceInfo = extern struct {
    device_id: c_int = 0,
    relative: SDL_XInput2RelativeDevice = @import("std").mem.zeroes(SDL_XInput2RelativeDevice),
    scroll: SDL_XInput2ScrollableDevice = @import("std").mem.zeroes(SDL_XInput2ScrollableDevice),
    next: [*c]struct_SDL_XInput2DeviceInfo = null,
};
pub const SDL_XInput2DeviceInfo = struct_SDL_XInput2DeviceInfo;
pub var xinput2_device_info: [*c]SDL_XInput2DeviceInfo = null;
pub fn parse_relative_valuators(rel_dev: [*c]SDL_XInput2RelativeDevice, rawev: [*c]const XIRawEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var processed_coords: [2]f64 = [2]f64{
        0.0,
        0.0,
    };
    _ = &processed_coords;
    var values_i: c_int = 0;
    _ = &values_i;
    var found: c_int = 0;
    _ = &found;
    const use_raw_vals: bool = (mouse.*.InputTransform != null) or !mouse.*.enable_relative_system_scale;
    _ = &use_raw_vals;
    {
        var i: c_int = 0;
        _ = &i;
        while ((i < (rawev.*.valuators.mask_len * @as(c_int, 8))) and (found < @as(c_int, 2))) : (i += 1) {
            if (!((@as(c_int, rawev.*.valuators.mask[@bitCast(@as(isize, @intCast(i >> @intCast(@as(c_int, 3)))))]) & (@as(c_int, 1) << @intCast(i & @as(c_int, 7)))) != 0)) {
                continue;
            }
            {
                var j: c_int = 0;
                _ = &j;
                while (j < @as(c_int, 2)) : (j += 1) {
                    if (rel_dev.*.number[@bitCast(@as(isize, @intCast(j)))] == i) {
                        const current_val: f64 = if (use_raw_vals) rawev.*.raw_values[@bitCast(@as(isize, @intCast(values_i)))] else rawev.*.valuators.values[@bitCast(@as(isize, @intCast(values_i)))];
                        _ = &current_val;
                        if (rel_dev.*.relative[@bitCast(@as(isize, @intCast(j)))]) {
                            processed_coords[@bitCast(@as(isize, @intCast(j)))] = current_val;
                        } else {
                            if (rel_dev.*.prev_coord_valid[@bitCast(@as(isize, @intCast(j)))]) {
                                processed_coords[@bitCast(@as(isize, @intCast(j)))] = current_val - rel_dev.*.prev_coords[@bitCast(@as(isize, @intCast(j)))];
                            }
                            rel_dev.*.prev_coords[@bitCast(@as(isize, @intCast(j)))] = current_val;
                            rel_dev.*.prev_coord_valid[@bitCast(@as(isize, @intCast(j)))] = @"true" != 0;
                        }
                        found += 1;
                        break;
                    }
                }
            }
            values_i += 1;
        }
    }
    if (mouse.*.relative_mode and (SDL_GetKeyboardFocus_REAL() != null)) {
        SDL_SendMouseMotion(rawev.*.time, mouse.*.focus, @bitCast(@as(c_int, rawev.*.sourceid)), @"true" != 0, @floatCast(processed_coords[@as(c_int, 0)]), @floatCast(processed_coords[@as(c_int, 1)]));
    }
}
pub fn query_xinput2_version(display: [*c]Display, arg_major: c_int, arg_minor: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var major = arg_major;
    _ = &major;
    var minor = arg_minor;
    _ = &minor;
    _ = X11_XIQueryVersion.?(display, &major, &minor);
    return (major * @as(c_int, 1000)) + minor;
}
pub fn xinput2_version_atleast(version: c_int, wantmajor: c_int, wantminor: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &version;
    _ = &wantmajor;
    _ = &wantminor;
    return version >= ((wantmajor * @as(c_int, 1000)) + wantminor);
}
pub fn xinput2_get_sdlwindow(videodata: [*c]SDL_VideoData, window: Window) callconv(.c) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var windowdata: [*c]const SDL_WindowData = X11_FindWindow(videodata, window);
    _ = &windowdata;
    return @ptrCast(@alignCast(if (windowdata != null) @as(?*anyopaque, @ptrCast(@alignCast(windowdata.*.window))) else @as(?*anyopaque, null)));
}
pub fn xinput2_parse_scrollable_valuators(scroll_dev: [*c]SDL_XInput2ScrollableDevice, xev: [*c]const XIDeviceEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var values_i: c_int = 0;
    _ = &values_i;
    {
        var j: c_int = 0;
        _ = &j;
        while (j < (xev.*.valuators.mask_len * @as(c_int, 8))) : (j += 1) {
            if (!((@as(c_int, xev.*.valuators.mask[@bitCast(@as(isize, @intCast(j >> @intCast(@as(c_int, 3)))))]) & (@as(c_int, 1) << @intCast(j & @as(c_int, 7)))) != 0)) {
                continue;
            }
            {
                var k: c_int = 0;
                _ = &k;
                while (k < scroll_dev.*.scroll_info_count) : (k += 1) {
                    var info: [*c]SDL_XInput2ScrollInfo = &scroll_dev.*.scroll_info[@bitCast(@as(isize, @intCast(k)))];
                    _ = &info;
                    if (info.*.number == j) {
                        const current_val: f64 = xev.*.valuators.values[@bitCast(@as(isize, @intCast(values_i)))];
                        _ = &current_val;
                        const delta: f64 = (info.*.prev_value - current_val) / info.*.increment;
                        _ = &delta;
                        if (info.*.prev_value_valid and (SDL_fabs_REAL(delta) < (@as(f64, @floatFromInt(@as(c_int, 2147483647))) * @as(f64, 0.95)))) {
                            const x: f64 = if (info.*.scroll_type == XIScrollTypeHorizontal) delta else @as(f64, @floatFromInt(@as(c_int, 0)));
                            _ = &x;
                            const y: f64 = if (info.*.scroll_type == XIScrollTypeVertical) delta else @as(f64, @floatFromInt(@as(c_int, 0)));
                            _ = &y;
                            var mouse: [*c]SDL_Mouse = SDL_GetMouse();
                            _ = &mouse;
                            SDL_SendMouseWheel(xev.*.time, mouse.*.focus, @bitCast(@as(c_int, xev.*.sourceid)), @floatCast(-x), @floatCast(y), SDL_MOUSEWHEEL_NORMAL);
                        }
                        info.*.prev_value = current_val;
                        info.*.prev_value_valid = @"true" != 0;
                    }
                }
            }
            values_i += 1;
        }
    }
}
pub fn xinput2_normalize_touch_coordinates(window: [*c]SDL_Window, in_x: f64, in_y: f64, out_x: [*c]f32, out_y: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (window != null) {
        if (window.*.w == @as(c_int, 1)) {
            out_x.* = 0.5;
        } else {
            out_x.* = @as(f32, @floatCast(in_x)) / @as(f32, @floatFromInt(window.*.w - @as(c_int, 1)));
        }
        if (window.*.h == @as(c_int, 1)) {
            out_y.* = 0.5;
        } else {
            out_y.* = @as(f32, @floatCast(in_y)) / @as(f32, @floatFromInt(window.*.h - @as(c_int, 1)));
        }
    } else {
        out_x.* = @floatCast(in_x);
        out_y.* = @floatCast(in_y);
    }
}
pub export fn X11_InitXinput2(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var version: c_int = 0;
    _ = &version;
    var eventmask: XIEventMask = undefined;
    _ = &eventmask;
    var mask: [5]u8 = [5]u8{
        0,
        0,
        0,
        0,
        0,
    };
    _ = &mask;
    var event: c_int = undefined;
    _ = &event;
    var err: c_int = undefined;
    _ = &err;
    if (!SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_XINPUT2", @"true" != 0)) {
        return @"false" != 0;
    }
    if (!(SDL_X11_HAVE_XINPUT2 != 0) or !(X11_XQueryExtension.?(data.*.display, "XInputExtension", &xinput2_opcode, &event, &err) != 0)) {
        return @"false" != 0;
    }
    version = query_xinput2_version(data.*.display, 2, 4);
    if (!xinput2_version_atleast(version, 2, 0)) {
        return @"false" != 0;
    }
    xinput2_initialized = @"true" != 0;
    xinput2_scrolling_supported = xinput2_version_atleast(version, 2, 1);
    xinput2_multitouch_supported = xinput2_version_atleast(version, 2, 2);
    xinput2_gesture_supported = xinput2_version_atleast(version, 2, 4);
    xinput2_rel_x_atom = X11_XInternAtom.?(data.*.display, "Rel X", False);
    xinput2_rel_y_atom = X11_XInternAtom.?(data.*.display, "Rel Y", False);
    xinput2_abs_x_atom = X11_XInternAtom.?(data.*.display, "Abs X", False);
    xinput2_abs_y_atom = X11_XInternAtom.?(data.*.display, "Abs Y", False);
    _ = memset(@ptrCast(@alignCast(&eventmask)), 0, @sizeOf(@TypeOf(eventmask)));
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&mask))))), 0, @sizeOf(@TypeOf(mask)));
    eventmask.deviceid = XIAllMasterDevices;
    eventmask.mask_len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(mask)))));
    eventmask.mask = @ptrCast(@alignCast(&mask));
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawMotion >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawMotion & @as(c_int, 7))))));
    }
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawButtonPress >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawButtonPress & @as(c_int, 7))))));
    }
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawButtonRelease >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawButtonRelease & @as(c_int, 7))))));
    }
    if (xinput2_scrolling_supported) {
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Motion >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Motion & @as(c_int, 7))))));
        }
    }
    if (xinput2_multitouch_supported) {
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawTouchBegin >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawTouchBegin & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawTouchUpdate >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawTouchUpdate & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_RawTouchEnd >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_RawTouchEnd & @as(c_int, 7))))));
        }
    }
    _ = X11_XISelectEvents.?(data.*.display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(data.*.display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(data.*.display))).*.default_screen)))]).*.root, &eventmask, 1);
    _ = memset(@ptrCast(@alignCast(&eventmask)), 0, @sizeOf(@TypeOf(eventmask)));
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&mask))))), 0, @sizeOf(@TypeOf(mask)));
    eventmask.deviceid = XIAllDevices;
    eventmask.mask_len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(mask)))));
    eventmask.mask = @ptrCast(@alignCast(&mask));
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_KeyPress >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_KeyPress & @as(c_int, 7))))));
    }
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_KeyRelease >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_KeyRelease & @as(c_int, 7))))));
    }
    {
        const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_HierarchyChanged >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_HierarchyChanged & @as(c_int, 7))))));
    }
    _ = X11_XISelectEvents.?(data.*.display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(data.*.display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(data.*.display))).*.default_screen)))]).*.root, &eventmask, 1);
    X11_Xinput2UpdateDevices(_this);
    X11_Xinput2UpdatePointerMapping(_this);
    return @"true" != 0;
}
pub export fn X11_QuitXinput2(_: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    {
        var i: [*c]SDL_XInput2DeviceInfo = xinput2_device_info;
        _ = &i;
        var next: [*c]SDL_XInput2DeviceInfo = null;
        _ = &next;
        while (i != null) : (i = next) {
            next = i.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(i.*.scroll.scroll_info)));
            SDL_free_REAL(@ptrCast(@alignCast(i)));
        }
    }
    xinput2_device_info = null;
    SDL_free_REAL(@ptrCast(@alignCast(xinput2_pointer_button_map)));
    xinput2_pointer_button_map = null;
    xinput2_pointer_button_map_size = 0;
}
pub export fn X11_Xinput2UpdatePointerMapping(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    if (X11_Xinput2IsInitialized()) {
        var vid: [*c]SDL_VideoData = _this.*.internal;
        _ = &vid;
        SDL_free_REAL(@ptrCast(@alignCast(xinput2_pointer_button_map)));
        xinput2_pointer_button_map = null;
        xinput2_pointer_button_map_size = 0;
        xinput2_pointer_button_map_size = X11_XGetPointerMapping.?(vid.*.display, null, 0);
        if (xinput2_pointer_button_map_size != 0) {
            xinput2_pointer_button_map = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, xinput2_pointer_button_map_size)), @sizeOf(u8))));
            if (xinput2_pointer_button_map != null) {
                xinput2_pointer_button_map_size = X11_XGetPointerMapping.?(vid.*.display, xinput2_pointer_button_map, @bitCast(@as(c_int, xinput2_pointer_button_map_size)));
            } else {
                xinput2_pointer_button_map_size = 0;
            }
        }
    }
}
pub fn xinput2_remove_device_info(device_id: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &device_id;
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "xinput2_remove_device_info".*;
    };
    _ = &static_local___func__;
    {
        var devinfo: [*c]SDL_XInput2DeviceInfo = xinput2_device_info;
        _ = &devinfo;
        var prev: [*c]SDL_XInput2DeviceInfo = null;
        _ = &prev;
        while (devinfo != null) : (devinfo = devinfo.*.next) {
            if (devinfo.*.device_id == device_id) {
                while (true) {
                    while (!(@intFromBool(devinfo == xinput2_device_info) == @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(prev))) == @as(?*anyopaque, null)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "(devinfo == xinput2_device_info) == (prev == ((void*)0))",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11xinput2.c", 379);
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
                if (!(prev != null)) {
                    xinput2_device_info = devinfo.*.next;
                } else {
                    prev.*.next = devinfo.*.next;
                }
                SDL_free_REAL(@ptrCast(@alignCast(devinfo.*.scroll.scroll_info)));
                SDL_free_REAL(@ptrCast(@alignCast(devinfo)));
                return;
            }
            prev = devinfo;
        }
    }
}
pub fn xinput2_reset_device_valuators() callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var devinfo: [*c]SDL_XInput2DeviceInfo = xinput2_device_info;
        _ = &devinfo;
        while (devinfo != null) : (devinfo = devinfo.*.next) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < devinfo.*.scroll.scroll_info_count) : (i += 1) {
                    devinfo.*.scroll.scroll_info[@bitCast(@as(isize, @intCast(i)))].prev_value_valid = @"false" != 0;
                }
            }
            devinfo.*.relative.prev_coord_valid[@as(c_int, 0)] = @"false" != 0;
            devinfo.*.relative.prev_coord_valid[@as(c_int, 1)] = @"false" != 0;
        }
    }
}
pub fn xinput2_update_device_info(devinfo: [*c]SDL_XInput2DeviceInfo, classes: [*c][*c]XIAnyClassInfo, num_classes: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(devinfo != null)) {
        return;
    }
    var have_rel_x: bool = @"false" != 0;
    _ = &have_rel_x;
    var have_rel_y: bool = @"false" != 0;
    _ = &have_rel_y;
    var have_abs_x: bool = @"false" != 0;
    _ = &have_abs_x;
    var have_abs_y: bool = @"false" != 0;
    _ = &have_abs_y;
    var rel_axis_index: c_int = 0;
    _ = &rel_axis_index;
    _ = memset(@ptrCast(@alignCast(&devinfo.*.relative)), 0, @sizeOf(@TypeOf(devinfo.*.relative)));
    var allocated_scroll_info_count: c_int = devinfo.*.scroll.scroll_info_count;
    _ = &allocated_scroll_info_count;
    devinfo.*.scroll.scroll_info_count = 0;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_classes) : (i += 1) {
            if (classes[@bitCast(@as(isize, @intCast(i)))].*.type == XIValuatorClass) {
                var v: [*c]const XIValuatorClassInfo = @ptrCast(@alignCast(classes[@bitCast(@as(isize, @intCast(i)))]));
                _ = &v;
                if (((v.*.label == xinput2_rel_x_atom) or ((v.*.label == xinput2_abs_x_atom) and !have_rel_x)) or (((rel_axis_index == @as(c_int, 0)) and !have_rel_x) and !have_abs_x)) {
                    devinfo.*.relative.number[@as(c_int, 0)] = v.*.number;
                    devinfo.*.relative.relative[@as(c_int, 0)] = v.*.mode == XIModeRelative;
                    devinfo.*.relative.minval[@as(c_int, 0)] = v.*.min;
                    devinfo.*.relative.maxval[@as(c_int, 0)] = v.*.max;
                    if (v.*.label == xinput2_rel_x_atom) {
                        have_rel_x = @"true" != 0;
                    } else if (v.*.label == xinput2_abs_x_atom) {
                        have_abs_x = @"true" != 0;
                    }
                } else if (((v.*.label == xinput2_rel_y_atom) or ((v.*.label == xinput2_abs_y_atom) and !have_rel_y)) or (((rel_axis_index == @as(c_int, 1)) and !have_rel_y) and !have_abs_y)) {
                    devinfo.*.relative.number[@as(c_int, 1)] = v.*.number;
                    devinfo.*.relative.relative[@as(c_int, 1)] = v.*.mode == XIModeRelative;
                    devinfo.*.relative.minval[@as(c_int, 1)] = v.*.min;
                    devinfo.*.relative.maxval[@as(c_int, 1)] = v.*.max;
                    if (v.*.label == xinput2_rel_y_atom) {
                        have_rel_y = @"true" != 0;
                    } else if (v.*.label == xinput2_abs_y_atom) {
                        have_abs_y = @"true" != 0;
                    }
                }
                rel_axis_index += 1;
            } else if (classes[@bitCast(@as(isize, @intCast(i)))].*.type == XIScrollClass) {
                var s: [*c]const XIScrollClassInfo = @ptrCast(@alignCast(classes[@bitCast(@as(isize, @intCast(i)))]));
                _ = &s;
                if (devinfo.*.scroll.scroll_info_count == allocated_scroll_info_count) {
                    devinfo.*.scroll.scroll_info = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(devinfo.*.scroll.scroll_info)), @as(c_ulong, @bitCast(@as(c_long, allocated_scroll_info_count + @as(c_int, 2)))) *% @sizeOf(SDL_XInput2ScrollInfo))));
                    if (!(devinfo.*.scroll.scroll_info != null)) {
                        allocated_scroll_info_count = 0;
                        devinfo.*.scroll.scroll_info_count = 0;
                        continue;
                    }
                    allocated_scroll_info_count += 2;
                }
                var scroll_info: [*c]SDL_XInput2ScrollInfo = &devinfo.*.scroll.scroll_info[@bitCast(@as(isize, @intCast(devinfo.*.scroll.scroll_info_count)))];
                _ = &scroll_info;
                devinfo.*.scroll.scroll_info_count += 1;
                _ = memset(@ptrCast(@alignCast(scroll_info)), 0, @sizeOf(@TypeOf(scroll_info.*)));
                scroll_info.*.number = s.*.number;
                scroll_info.*.scroll_type = s.*.scroll_type;
                scroll_info.*.increment = s.*.increment;
            }
        }
    }
}
pub fn xinput2_get_cached_device_info(device_id: c_int) callconv(.c) [*c]SDL_XInput2DeviceInfo {
    @setEvalBranchQuota(100000);
    _ = &device_id;
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "xinput2_get_cached_device_info".*;
    };
    _ = &static_local___func__;
    {
        var devinfo: [*c]SDL_XInput2DeviceInfo = xinput2_device_info;
        _ = &devinfo;
        var prev: [*c]SDL_XInput2DeviceInfo = null;
        _ = &prev;
        while (devinfo != null) : (devinfo = devinfo.*.next) {
            if (devinfo.*.device_id == device_id) {
                while (true) {
                    while (!(@intFromBool(devinfo == xinput2_device_info) == @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(prev))) == @as(?*anyopaque, null)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "(devinfo == xinput2_device_info) == (prev == ((void*)0))",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11xinput2.c", 495);
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
                if (prev != null) {
                    prev.*.next = devinfo.*.next;
                    devinfo.*.next = xinput2_device_info;
                    xinput2_device_info = devinfo;
                }
                return devinfo;
            }
            prev = devinfo;
        }
    }
    return null;
}
pub fn xinput2_get_device_info(videodata: [*c]SDL_VideoData, device_id: c_int) callconv(.c) [*c]SDL_XInput2DeviceInfo {
    @setEvalBranchQuota(100000);
    _ = &device_id;
    var devinfo: [*c]SDL_XInput2DeviceInfo = xinput2_get_cached_device_info(device_id);
    _ = &devinfo;
    if (devinfo != null) {
        return devinfo;
    }
    devinfo = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_XInput2DeviceInfo))));
    if (!(devinfo != null)) {
        return null;
    }
    var i: c_int = undefined;
    _ = &i;
    var xidevinfo: [*c]XIDeviceInfo = X11_XIQueryDevice.?(videodata.*.display, device_id, &i);
    _ = &xidevinfo;
    if (!(xidevinfo != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(devinfo)));
        return null;
    }
    xinput2_update_device_info(devinfo, xidevinfo.*.classes, xidevinfo.*.num_classes);
    X11_XIFreeDeviceInfo.?(xidevinfo);
    devinfo.*.device_id = device_id;
    devinfo.*.next = xinput2_device_info;
    xinput2_device_info = devinfo;
    return devinfo;
}
pub export fn X11_HandleXinput2Event(_this: [*c]SDL_VideoDevice, cookie: [*c]XGenericEventCookie) void {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var hierev: [*c]const XIHierarchyEvent = undefined;
    _ = &hierev;
    var i: c_int = undefined;
    _ = &i;
    var dcev: [*c]const XIDeviceChangedEvent = undefined;
    _ = &dcev;
    var devinfo: [*c]SDL_XInput2DeviceInfo = undefined;
    _ = &devinfo;
    var proev: [*c]const XIPropertyEvent = undefined;
    _ = &proev;
    var xev: [*c]const XIDeviceEvent = undefined;
    _ = &xev;
    var windowdata: [*c]SDL_WindowData = undefined;
    _ = &windowdata;
    var rawev: [*c]const XIRawEvent = undefined;
    _ = &rawev;
    var is_pen: bool = undefined;
    _ = &is_pen;
    var devinfo_1: [*c]SDL_XInput2DeviceInfo = undefined;
    _ = &devinfo_1;
    var xev_2: [*c]const XIDeviceEvent = undefined;
    _ = &xev_2;
    var xev_3: [*c]const XIDeviceEvent = undefined;
    _ = &xev_3;
    var pen: [*c]X11_PenHandle = undefined;
    _ = &pen;
    var button: c_int = undefined;
    _ = &button;
    var down: bool = undefined;
    _ = &down;
    var pointer_emulated: bool = undefined;
    _ = &pointer_emulated;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var windowdata_4: [*c]SDL_WindowData = undefined;
    _ = &windowdata_4;
    var x_ticks: c_int = undefined;
    _ = &x_ticks;
    var y_ticks: c_int = undefined;
    _ = &y_ticks;
    var xev_5: [*c]const XIDeviceEvent = undefined;
    _ = &xev_5;
    var pointer_emulated_6: bool = undefined;
    _ = &pointer_emulated_6;
    var pen_7: [*c]X11_PenHandle = undefined;
    _ = &pen_7;
    var window_8: [*c]SDL_Window = undefined;
    _ = &window_8;
    var axes: [7]f32 = undefined;
    _ = &axes;
    var i_9: c_int = undefined;
    _ = &i_9;
    var devinfo_10: [*c]SDL_XInput2DeviceInfo = undefined;
    _ = &devinfo_10;
    var window_11: [*c]SDL_Window = undefined;
    _ = &window_11;
    var mouse: [*c]SDL_Mouse = undefined;
    _ = &mouse;
    var xev_12: [*c]const XIDeviceEvent = undefined;
    _ = &xev_12;
    var x: f32 = undefined;
    _ = &x;
    var y: f32 = undefined;
    _ = &y;
    var window_13: [*c]SDL_Window = undefined;
    _ = &window_13;
    var xev_14: [*c]const XIDeviceEvent = undefined;
    _ = &xev_14;
    var x_15: f32 = undefined;
    _ = &x_15;
    var y_16: f32 = undefined;
    _ = &y_16;
    var window_17: [*c]SDL_Window = undefined;
    _ = &window_17;
    var xev_18: [*c]const XIDeviceEvent = undefined;
    _ = &xev_18;
    var x_19: f32 = undefined;
    _ = &x_19;
    var y_20: f32 = undefined;
    _ = &y_20;
    var window_21: [*c]SDL_Window = undefined;
    _ = &window_21;
    var xev_22: [*c]const XIGesturePinchEvent = undefined;
    _ = &xev_22;
    var x_23: f32 = undefined;
    _ = &x_23;
    var y_24: f32 = undefined;
    _ = &y_24;
    var window_25: [*c]SDL_Window = undefined;
    _ = &window_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                if (cookie.*.extension != xinput2_opcode) {
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
                switch (cookie.*.evtype) {
                    XI_HierarchyChanged => {
                        sdl_pc = 5;
                        continue;
                    },
                    XI_DeviceChanged => {
                        sdl_pc = 19;
                        continue;
                    },
                    XI_PropertyEvent => {
                        sdl_pc = 23;
                        continue;
                    },
                    XI_RawMotion => {
                        sdl_pc = 27;
                        continue;
                    },
                    XI_KeyPress => {
                        sdl_pc = 34;
                        continue;
                    },
                    XI_KeyRelease => {
                        sdl_pc = 35;
                        continue;
                    },
                    XI_RawButtonPress => {
                        sdl_pc = 36;
                        continue;
                    },
                    XI_RawButtonRelease => {
                        sdl_pc = 37;
                        continue;
                    },
                    XI_RawTouchBegin => {
                        sdl_pc = 38;
                        continue;
                    },
                    XI_RawTouchUpdate => {
                        sdl_pc = 39;
                        continue;
                    },
                    XI_RawTouchEnd => {
                        sdl_pc = 40;
                        continue;
                    },
                    XI_ButtonPress => {
                        sdl_pc = 41;
                        continue;
                    },
                    XI_ButtonRelease => {
                        sdl_pc = 42;
                        continue;
                    },
                    XI_Enter => {
                        sdl_pc = 70;
                        continue;
                    },
                    XI_Motion => {
                        sdl_pc = 71;
                        continue;
                    },
                    XI_TouchBegin => {
                        sdl_pc = 100;
                        continue;
                    },
                    XI_TouchEnd => {
                        sdl_pc = 101;
                        continue;
                    },
                    XI_TouchUpdate => {
                        sdl_pc = 105;
                        continue;
                    },
                    XI_GesturePinchBegin => {
                        sdl_pc = 106;
                        continue;
                    },
                    XI_GesturePinchUpdate => {
                        sdl_pc = 107;
                        continue;
                    },
                    XI_GesturePinchEnd => {
                        sdl_pc = 108;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            4 => {
                {}
            },
            5 => {
                hierev = @ptrCast(@alignCast(cookie.*.data));
                i = 0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (i < hierev.*.num_info) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((hierev.*.info[@bitCast(@as(isize, @intCast(i)))].flags & ((@as(c_int, 1) << @intCast(@as(c_int, 3))) | (@as(c_int, 1) << @intCast(@as(c_int, 7))))) != @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                i += 1;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                videodata.*.xinput_hierarchy_changed = @"true" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                X11_RemovePenByDeviceID(hierev.*.info[@bitCast(@as(isize, @intCast(i)))].deviceid);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if ((hierev.*.info[@bitCast(@as(isize, @intCast(i)))].flags & ((@as(c_int, 1) << @intCast(@as(c_int, 2))) | (@as(c_int, 1) << @intCast(@as(c_int, 6))))) != @as(c_int, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if ((hierev.*.info[@bitCast(@as(isize, @intCast(i)))].flags & ((@as(c_int, 1) << @intCast(@as(c_int, 1))) | (@as(c_int, 1) << @intCast(@as(c_int, 3))))) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            13 => {
                _ = X11_MaybeAddPenByDeviceID(_this, hierev.*.info[@bitCast(@as(isize, @intCast(i)))].deviceid);
                {
                    sdl_pc = 15;
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
                xinput2_remove_device_info(hierev.*.info[@bitCast(@as(isize, @intCast(i)))].deviceid);
                {
                    sdl_pc = 18;
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
                    sdl_pc = 8;
                    continue;
                }
            },
            19 => {
                dcev = @ptrCast(@alignCast(cookie.*.data));
                devinfo = xinput2_get_cached_device_info(dcev.*.deviceid);
                if (devinfo != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                xinput2_update_device_info(devinfo, dcev.*.classes, dcev.*.num_classes);
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
                    sdl_pc = 4;
                    continue;
                }
            },
            23 => {
                proev = @ptrCast(@alignCast(cookie.*.data));
                if ((proev.*.what == XIPropertyModified) and (proev.*.property == videodata.*.atoms.pen_atom_wacom_serial_ids)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                xev = @ptrCast(@alignCast(cookie.*.data));
                windowdata = X11_FindWindow(videodata, xev.*.event);
                X11_NotifyPenProximityChange(_this, @ptrCast(@alignCast(if (windowdata != null) @as(?*anyopaque, @ptrCast(@alignCast(windowdata.*.window))) else @as(?*anyopaque, null))), proev.*.deviceid);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            27 => {
                rawev = @ptrCast(@alignCast(cookie.*.data));
                is_pen = @as(?*anyopaque, @ptrCast(@alignCast(X11_FindPenByDeviceID(rawev.*.sourceid)))) != @as(?*anyopaque, null);
                videodata.*.global_mouse_changed = @"true" != 0;
                if (is_pen) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 4;
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
                devinfo_1 = xinput2_get_device_info(videodata, rawev.*.deviceid);
                if (!(devinfo_1 != null)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 4;
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
                parse_relative_valuators(&devinfo_1.*.relative, rawev);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                xev_2 = @ptrCast(@alignCast(cookie.*.data));
                videodata.*.xinput_last_key_serial = xev_2.*.serial;
                videodata.*.xinput_last_keyboard_device = xev_2.*.sourceid;
                {
                    sdl_pc = 4;
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
                    sdl_pc = 38;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                videodata.*.global_mouse_changed = @"true" != 0;
                {
                    sdl_pc = 4;
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
                xev_3 = @ptrCast(@alignCast(cookie.*.data));
                pen = X11_FindPenByDeviceID(xev_3.*.sourceid);
                button = xev_3.*.detail;
                down = cookie.*.evtype == XI_ButtonPress;
                pointer_emulated = (xev_3.*.flags & (@as(c_int, 1) << @intCast(@as(c_int, 16)))) != @as(c_int, 0);
                videodata.*.xinput_last_button_serial = xev_3.*.serial;
                if (pen != null) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                if (xev_3.*.deviceid != xev_3.*.sourceid) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            44 => {
                if (!pointer_emulated) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 4;
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
                window = xinput2_get_sdlwindow(videodata, xev_3.*.event);
                if (button == @as(c_int, 1)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                SDL_SendPenTouch(0, pen.*.pen, window, pen.*.is_eraser, down);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                SDL_SendPenButton(0, pen.*.pen, window, @bitCast(@as(i8, @truncate(button - @as(c_int, 1)))), down);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            52 => {
                windowdata_4 = X11_FindWindow(videodata, xev_3.*.event);
                x_ticks = 0;
                y_ticks = 0;
                if (xev_3.*.deviceid != videodata.*.xinput_master_pointer_device) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            55 => {
                if (SDL_GetMouseFocus_REAL() != windowdata_4.*.window) {
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
                if ((xev_3.*.deviceid != xev_3.*.sourceid) and X11_IsWheelEvent(button, &x_ticks, &y_ticks)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 4;
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
                if (button <= xinput2_pointer_button_map_size) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                button = xinput2_pointer_button_map[@bitCast(@as(isize, @intCast(button - @as(c_int, 1))))];
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
                {
                    sdl_pc = 4;
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
                if (down) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                X11_HandleButtonPress(_this, windowdata_4, @bitCast(@as(c_int, xev_3.*.sourceid)), button, @floatCast(xev_3.*.event_x), @floatCast(xev_3.*.event_y), xev_3.*.time, xev_3.*.serial);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                X11_HandleButtonRelease(_this, windowdata_4, @bitCast(@as(c_int, xev_3.*.sourceid)), button, xev_3.*.time);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            70 => {
                xinput2_reset_device_valuators();
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            71 => {
                xev_5 = @ptrCast(@alignCast(cookie.*.data));
                pointer_emulated_6 = (xev_5.*.flags & (@as(c_int, 1) << @intCast(@as(c_int, 16)))) != @as(c_int, 0);
                videodata.*.global_mouse_changed = @"true" != 0;
                pen_7 = X11_FindPenByDeviceID(xev_5.*.sourceid);
                if (pen_7 != null) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                if (xev_5.*.deviceid != xev_5.*.sourceid) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            73 => {
                if (!pointer_emulated_6) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 4;
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
                window_8 = xinput2_get_sdlwindow(videodata, xev_5.*.event);
                SDL_SendPenMotion(0, pen_7.*.pen, window_8, @floatCast(xev_5.*.event_x), @floatCast(xev_5.*.event_y));
                X11_PenAxesFromValuators(pen_7, xev_5.*.valuators.values, xev_5.*.valuators.mask, xev_5.*.valuators.mask_len, @ptrCast(@alignCast(&axes)));
                i_9 = 0;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i_9))) < (@sizeOf(@TypeOf(axes)) / @sizeOf(@TypeOf(axes[@as(c_int, 0)])))) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            79 => {
                if (pen_7.*.valuator_for_axis[@bitCast(@as(isize, @intCast(i_9)))] != -@as(c_int, 1)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            80 => {
                i_9 += 1;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            82 => {
                SDL_SendPenAxis(0, pen_7.*.pen, window_8, @bitCast(i_9), axes[@bitCast(@as(isize, @intCast(i_9)))]);
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
                    sdl_pc = 80;
                    continue;
                }
            },
            85 => {
                if (xev_5.*.deviceid == xev_5.*.sourceid) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
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
                    sdl_pc = 74;
                    continue;
                }
            },
            88 => {
                devinfo_10 = xinput2_get_device_info(videodata, xev_5.*.deviceid);
                if (devinfo_10 != null) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                window_11 = xinput2_get_sdlwindow(videodata, xev_5.*.event);
                if ((window_11 != null) and ((xev_5.*.deviceid == videodata.*.xinput_master_pointer_device) or ((xinput2_active_touch_count != 0) and window_11.*.internal.*.mouse_grabbed))) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            91 => {
                xinput2_parse_scrollable_valuators(&devinfo_10.*.scroll, xev_5);
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
                    sdl_pc = 90;
                    continue;
                }
            },
            94 => {
                mouse = SDL_GetMouse();
                if (!mouse.*.relative_mode) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            97 => {
                _ = X11_ProcessHitTest(_this, window_11.*.internal, @floatCast(xev_5.*.event_x), @floatCast(xev_5.*.event_y), @"false" != 0);
                SDL_SendMouseMotion(0, window_11, SDL_GLOBAL_MOUSE_ID, @"false" != 0, @floatCast(xev_5.*.event_x), @floatCast(xev_5.*.event_y));
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            100 => {
                xev_12 = @ptrCast(@alignCast(cookie.*.data));
                xinput2_active_touch_count += 1;
                window_13 = xinput2_get_sdlwindow(videodata, xev_12.*.event);
                xinput2_normalize_touch_coordinates(window_13, xev_12.*.event_x, xev_12.*.event_y, &x, &y);
                SDL_SendTouch(0, @bitCast(@as(c_long, xev_12.*.sourceid)), @bitCast(@as(c_long, xev_12.*.detail)), window_13, SDL_EVENT_FINGER_DOWN, x, y, @floatCast(@as(f64, 1.0)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            101 => {
                xev_14 = @ptrCast(@alignCast(cookie.*.data));
                window_17 = xinput2_get_sdlwindow(videodata, xev_14.*.event);
                if ((!((blk: {
                    const ref = &xinput2_active_touch_count;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) and (window_17 != null)) and window_17.*.internal.*.mouse_grabbed) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                xinput2_grabbed_touch_raised = @"true" != 0;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                xinput2_normalize_touch_coordinates(window_17, xev_14.*.event_x, xev_14.*.event_y, &x_15, &y_16);
                SDL_SendTouch(0, @bitCast(@as(c_long, xev_14.*.sourceid)), @bitCast(@as(c_long, xev_14.*.detail)), window_17, SDL_EVENT_FINGER_UP, x_15, y_16, @floatCast(@as(f64, 1.0)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            105 => {
                xev_18 = @ptrCast(@alignCast(cookie.*.data));
                window_21 = xinput2_get_sdlwindow(videodata, xev_18.*.event);
                xinput2_normalize_touch_coordinates(window_21, xev_18.*.event_x, xev_18.*.event_y, &x_19, &y_20);
                SDL_SendTouchMotion(0, @bitCast(@as(c_long, xev_18.*.sourceid)), @bitCast(@as(c_long, xev_18.*.detail)), window_21, x_19, y_20, @floatCast(@as(f64, 1.0)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 107;
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
                xev_22 = @ptrCast(@alignCast(cookie.*.data));
                window_25 = xinput2_get_sdlwindow(videodata, xev_22.*.event);
                xinput2_normalize_touch_coordinates(window_25, xev_22.*.event_x, xev_22.*.event_y, &x_23, &y_24);
                if (cookie.*.evtype == XI_GesturePinchBegin) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                _ = SDL_SendPinch(SDL_EVENT_PINCH_BEGIN, 0, window_25, @floatFromInt(@as(c_int, 0)), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                if (cookie.*.evtype == XI_GesturePinchUpdate) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            112 => {
                _ = SDL_SendPinch(SDL_EVENT_PINCH_UPDATE, 0, window_25, @floatCast(xev_22.*.scale), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                _ = SDL_SendPinch(SDL_EVENT_PINCH_END, 0, window_25, @floatFromInt(@as(c_int, 0)), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11_InitXinput2Multitouch(_: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    xinput2_grabbed_touch_raised = @"false" != 0;
    xinput2_active_touch_count = 0;
}
pub export fn X11_Xinput2HandlesMotionForWindow(window_data: [*c]SDL_WindowData) bool {
    @setEvalBranchQuota(100000);
    const ret: bool = window_data.*.xinput2_mouse_enabled and ((!window_data.*.mouse_grabbed or (xinput2_active_touch_count != 0)) or xinput2_grabbed_touch_raised);
    _ = &ret;
    xinput2_grabbed_touch_raised = @"false" != 0;
    return ret;
}
pub export fn X11_Xinput2Select(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var window_data: [*c]SDL_WindowData = window.*.internal;
    _ = &window_data;
    var eventmask: XIEventMask = undefined;
    _ = &eventmask;
    var mask: [5]u8 = [5]u8{
        0,
        0,
        0,
        0,
        0,
    };
    _ = &mask;
    if (!xinput2_scrolling_supported and !xinput2_multitouch_supported) {
        return;
    }
    eventmask.deviceid = XIAllMasterDevices;
    eventmask.mask_len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(mask)))));
    eventmask.mask = @ptrCast(@alignCast(&mask));
    if (xinput2_scrolling_supported) {
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Enter >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Enter & @as(c_int, 7))))));
        }
    }
    if (xinput2_multitouch_supported) {
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_TouchBegin >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchBegin & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_TouchUpdate >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchUpdate & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_TouchEnd >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchEnd & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Motion >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Motion & @as(c_int, 7))))));
        }
    }
    if (xinput2_gesture_supported) {
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_GesturePinchBegin >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_GesturePinchBegin & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_GesturePinchUpdate >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_GesturePinchUpdate & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_GesturePinchEnd >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_GesturePinchEnd & @as(c_int, 7))))));
        }
    }
    _ = X11_XISelectEvents.?(data.*.display, window_data.*.xwindow, &eventmask, 1);
}
pub export fn X11_Xinput2IsInitialized() bool {
    @setEvalBranchQuota(100000);
    return xinput2_initialized;
}
pub export fn X11_Xinput2SelectMouseAndKeyboard(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var windowdata: [*c]SDL_WindowData = window.*.internal;
    _ = &windowdata;
    var data: [*c]const SDL_VideoData = _this.*.internal;
    _ = &data;
    if (X11_Xinput2IsInitialized()) {
        var eventmask: XIEventMask = undefined;
        _ = &eventmask;
        var mask: [4]u8 = [4]u8{
            0,
            0,
            0,
            0,
        };
        _ = &mask;
        eventmask.mask_len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(mask)))));
        eventmask.mask = @ptrCast(@alignCast(&mask));
        eventmask.deviceid = XIAllDevices;
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_ButtonPress >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_ButtonPress & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_ButtonRelease >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_ButtonRelease & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Motion >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Motion & @as(c_int, 7))))));
        }
        windowdata.*.xinput2_mouse_enabled = @"true" != 0;
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Enter >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Enter & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_Leave >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Leave & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_DeviceChanged >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_DeviceChanged & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_HierarchyChanged >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_HierarchyChanged & @as(c_int, 7))))));
        }
        {
            const ref = &@as([*c]u8, @ptrCast(@alignCast(&mask)))[XI_PropertyEvent >> @intCast(@as(c_int, 3))];
            ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_PropertyEvent & @as(c_int, 7))))));
        }
        if (X11_XISelectEvents.?(data.*.display, windowdata.*.xwindow, &eventmask, 1) != Success) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Could not enable XInput2 event handling");
            windowdata.*.xinput2_keyboard_enabled = @"false" != 0;
            windowdata.*.xinput2_mouse_enabled = @"false" != 0;
        }
    }
    if (windowdata.*.xinput2_keyboard_enabled or windowdata.*.xinput2_mouse_enabled) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn X11_Xinput2GrabTouch(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var mask: [4]u8 = [4]u8{
        0,
        0,
        0,
        0,
    };
    _ = &mask;
    var mods: XIGrabModifiers = undefined;
    _ = &mods;
    var eventmask: XIEventMask = undefined;
    _ = &eventmask;
    if (!xinput2_multitouch_supported) {
        return;
    }
    mods.modifiers = @bitCast(@as(c_uint, @truncate(@as(c_uint, 1) << @intCast(@as(c_uint, 31)))));
    mods.status = 0;
    eventmask.deviceid = XIAllDevices;
    eventmask.mask_len = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(mask)))));
    eventmask.mask = @ptrCast(@alignCast(&mask));
    {
        const ref = &eventmask.mask[XI_TouchBegin >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchBegin & @as(c_int, 7))))));
    }
    {
        const ref = &eventmask.mask[XI_TouchUpdate >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchUpdate & @as(c_int, 7))))));
    }
    {
        const ref = &eventmask.mask[XI_TouchEnd >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_TouchEnd & @as(c_int, 7))))));
    }
    {
        const ref = &eventmask.mask[XI_Motion >> @intCast(@as(c_int, 3))];
        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | (@as(c_int, 1) << @intCast(XI_Motion & @as(c_int, 7))))));
    }
    _ = X11_XIGrabTouchBegin.?(display, XIAllDevices, data.*.xwindow, True, &eventmask, 1, &mods);
}
pub export fn X11_Xinput2UngrabTouch(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var mods: XIGrabModifiers = undefined;
    _ = &mods;
    if (!xinput2_multitouch_supported) {
        return;
    }
    xinput2_grabbed_touch_raised = @"false" != 0;
    mods.modifiers = @bitCast(@as(c_uint, @truncate(@as(c_uint, 1) << @intCast(@as(c_uint, 31)))));
    mods.status = 0;
    _ = X11_XIUngrabTouchBegin.?(display, XIAllDevices, data.*.xwindow, 1, &mods);
}
pub fn AddDeviceID(deviceID: Uint32, list: [*c][*c]Uint32, count: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var new_count: c_int = count.* + @as(c_int, 1);
    _ = &new_count;
    var new_list: [*c]Uint32 = undefined;
    new_list = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(list.*)), @as(c_ulong, @bitCast(@as(c_long, new_count))) *% @sizeOf(@TypeOf(new_list.*)))));
    _ = &new_list;
    if (!(new_list != null)) {
        return;
    }
    new_list[@bitCast(@as(isize, @intCast(new_count - @as(c_int, 1))))] = deviceID;
    count.* = new_count;
    list.* = new_list;
}
pub fn HasDeviceID(deviceID: Uint32, list: [*c]const Uint32, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < count) : (i += 1) {
            if (deviceID == list[@bitCast(@as(isize, @intCast(i)))]) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn AddDeviceID64(deviceID: Uint64, list: [*c][*c]Uint64, count: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var new_count: c_int = count.* + @as(c_int, 1);
    _ = &new_count;
    var new_list: [*c]Uint64 = undefined;
    new_list = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(list.*)), @as(c_ulong, @bitCast(@as(c_long, new_count))) *% @sizeOf(@TypeOf(new_list.*)))));
    _ = &new_list;
    if (!(new_list != null)) {
        return;
    }
    new_list[@bitCast(@as(isize, @intCast(new_count - @as(c_int, 1))))] = deviceID;
    count.* = new_count;
    list.* = new_list;
}
pub fn HasDeviceID64(deviceID: Uint64, list: [*c]const Uint64, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < count) : (i += 1) {
            if (deviceID == list[@bitCast(@as(isize, @intCast(i)))]) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn X11_Xinput2UpdateDevices(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "X11_Xinput2UpdateDevices".*;
    };
    _ = &static_local___func__;
    var data: [*c]SDL_VideoData = undefined;
    _ = &data;
    var info: [*c]XIDeviceInfo = undefined;
    _ = &info;
    var ndevices: c_int = undefined;
    _ = &ndevices;
    var old_keyboard_count: c_int = undefined;
    _ = &old_keyboard_count;
    var old_keyboards: [*c]SDL_KeyboardID = undefined;
    _ = &old_keyboards;
    var new_keyboard_count: c_int = undefined;
    _ = &new_keyboard_count;
    var new_keyboards: [*c]SDL_KeyboardID = undefined;
    _ = &new_keyboards;
    var old_mouse_count: c_int = undefined;
    _ = &old_mouse_count;
    var old_mice: [*c]SDL_MouseID = undefined;
    _ = &old_mice;
    var new_mouse_count: c_int = undefined;
    _ = &new_mouse_count;
    var new_mice: [*c]SDL_MouseID = undefined;
    _ = &new_mice;
    var old_touch_count: c_int = undefined;
    _ = &old_touch_count;
    var old_touch_devices: [*c]Uint64 = undefined;
    _ = &old_touch_devices;
    var new_touch_count: c_int = undefined;
    _ = &new_touch_count;
    var new_touch_devices: [*c]Uint64 = undefined;
    _ = &new_touch_devices;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "X11_Xinput2IsInitialized()",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var i: c_int = undefined;
    _ = &i;
    var dev: [*c]XIDeviceInfo = undefined;
    _ = &dev;
    var keyboardID: SDL_KeyboardID = undefined;
    _ = &keyboardID;
    var mouseID: SDL_MouseID = undefined;
    _ = &mouseID;
    var devinfo: [*c]SDL_XInput2DeviceInfo = undefined;
    _ = &devinfo;
    var j: c_int = undefined;
    _ = &j;
    var touchID: Uint64 = undefined;
    _ = &touchID;
    var touchType: SDL_TouchDeviceType = undefined;
    _ = &touchType;
    var class: [*c]XIAnyClassInfo = undefined;
    _ = &class;
    var t: [*c]XITouchClassInfo = undefined;
    _ = &t;
    var i_1: c_int = undefined;
    _ = &i_1;
    var i_2: c_int = undefined;
    _ = &i_2;
    var i_3: c_int = undefined;
    _ = &i_3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = _this.*.internal;
                old_keyboard_count = 0;
                old_keyboards = null;
                new_keyboard_count = 0;
                new_keyboards = null;
                old_mouse_count = 0;
                old_mice = null;
                new_mouse_count = 0;
                new_mice = null;
                old_touch_count = 0;
                old_touch_devices = null;
                new_touch_count = 0;
                new_touch_devices = null;
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
                info = X11_XIQueryDevice.?(data.*.display, XIAllDevices, &ndevices);
                old_keyboards = SDL_GetKeyboards_REAL(&old_keyboard_count);
                old_mice = SDL_GetMice_REAL(&old_mouse_count);
                old_touch_devices = SDL_GetTouchDevices_REAL(&old_touch_count);
                i = 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            4 => {
                if (!X11_Xinput2IsInitialized()) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11xinput2.c", 1098);
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
                if (i < ndevices) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                dev = &info[@bitCast(@as(isize, @intCast(i)))];
                switch (dev.*.use) {
                    XIMasterKeyboard => {
                        sdl_pc = 18;
                        continue;
                    },
                    XISlaveKeyboard => {
                        sdl_pc = 19;
                        continue;
                    },
                    XIMasterPointer => {
                        sdl_pc = 23;
                        continue;
                    },
                    XISlavePointer => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            15 => {
                i += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                i_1 = old_keyboard_count;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            17 => {
                devinfo = xinput2_get_cached_device_info(dev.*.deviceid);
                if (devinfo != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                keyboardID = @bitCast(@as(c_int, dev.*.deviceid));
                AddDeviceID(keyboardID, &new_keyboards, &new_keyboard_count);
                if (!HasDeviceID(keyboardID, old_keyboards, old_keyboard_count)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                SDL_AddKeyboard(keyboardID, dev.*.name);
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
                    sdl_pc = 17;
                    continue;
                }
            },
            23 => {
                data.*.xinput_master_pointer_device = dev.*.deviceid;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                mouseID = @bitCast(@as(c_int, dev.*.deviceid));
                AddDeviceID(mouseID, &new_mice, &new_mouse_count);
                if (!HasDeviceID(mouseID, old_mice, old_mouse_count)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                SDL_AddMouse(mouseID, dev.*.name);
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            29 => {
                xinput2_update_device_info(devinfo, dev.*.classes, dev.*.num_classes);
                {
                    sdl_pc = 31;
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
                j = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (j < dev.*.num_classes) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                class = dev.*.classes[@bitCast(@as(isize, @intCast(j)))];
                t = @ptrCast(@alignCast(class));
                if (class.*.type != XITouchClass) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                j += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                touchID = @bitCast(@as(c_long, t.*.sourceid));
                AddDeviceID64(touchID, &new_touch_devices, &new_touch_count);
                if (!HasDeviceID64(touchID, old_touch_devices, old_touch_count)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                if (t.*.mode == XIDependentTouch) {
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            42 => {
                touchType = SDL_TOUCH_DEVICE_INDIRECT_RELATIVE;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                touchType = SDL_TOUCH_DEVICE_DIRECT;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                _ = SDL_AddTouch(touchID, touchType, dev.*.name);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                if ((blk: {
                    const ref = &i_1;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                if (!HasDeviceID(old_keyboards[@bitCast(@as(isize, @intCast(i_1)))], new_keyboards, new_keyboard_count)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                i_2 = old_mouse_count;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            49 => {
                SDL_RemoveKeyboard(old_keyboards[@bitCast(@as(isize, @intCast(i_1)))]);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            52 => {
                if ((blk: {
                    const ref = &i_2;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            53 => {
                if (!HasDeviceID(old_mice[@bitCast(@as(isize, @intCast(i_2)))], new_mice, new_mouse_count)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                i_3 = old_touch_count;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            56 => {
                SDL_RemoveMouse(old_mice[@bitCast(@as(isize, @intCast(i_2)))]);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                if ((blk: {
                    const ref = &i_3;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            60 => {
                if (!HasDeviceID64(old_touch_devices[@bitCast(@as(isize, @intCast(i_3)))], new_touch_devices, new_touch_count)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            62 => {
                SDL_free_REAL(@ptrCast(@alignCast(old_keyboards)));
                SDL_free_REAL(@ptrCast(@alignCast(new_keyboards)));
                SDL_free_REAL(@ptrCast(@alignCast(old_mice)));
                SDL_free_REAL(@ptrCast(@alignCast(new_mice)));
                SDL_free_REAL(@ptrCast(@alignCast(old_touch_devices)));
                SDL_free_REAL(@ptrCast(@alignCast(new_touch_devices)));
                X11_XIFreeDeviceInfo.?(info);
                {}
            },
            63 => {
                SDL_DelTouch(old_touch_devices[@bitCast(@as(isize, @intCast(i_3)))]);
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
                    sdl_pc = 61;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const Success = @as(c_int, 0);
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub inline fn min(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a < b)) a else b) {
    @setEvalBranchQuota(100000);
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a < b)) a else b;
}
pub inline fn max(a: anytype, b: anytype) @TypeOf(if (__helpers.cast(bool, a > b)) a else b) {
    @setEvalBranchQuota(100000);
    _ = &a;
    _ = &b;
    return if (__helpers.cast(bool, a > b)) a else b;
}
pub const XIPropertyModified = @as(c_int, 2);
pub const XIModeRelative = @as(c_int, 0);
pub const XIMasterPointer = @as(c_int, 1);
pub const XIMasterKeyboard = @as(c_int, 2);
pub const XISlavePointer = @as(c_int, 3);
pub const XISlaveKeyboard = @as(c_int, 4);
pub const XIValuatorClass = @as(c_int, 2);
pub const XIScrollClass = @as(c_int, 3);
pub const XITouchClass = @as(c_int, 8);
pub const XIScrollTypeVertical = @as(c_int, 1);
pub const XIScrollTypeHorizontal = @as(c_int, 2);
pub const XIDependentTouch = @as(c_int, 2);
pub const XIAllDevices = @as(c_int, 0);
pub const XIAllMasterDevices = @as(c_int, 1);
pub const XI_DeviceChanged = @as(c_int, 1);
pub const XI_KeyPress = @as(c_int, 2);
pub const XI_KeyRelease = @as(c_int, 3);
pub const XI_ButtonPress = @as(c_int, 4);
pub const XI_ButtonRelease = @as(c_int, 5);
pub const XI_Motion = @as(c_int, 6);
pub const XI_Enter = @as(c_int, 7);
pub const XI_Leave = @as(c_int, 8);
pub const XI_HierarchyChanged = @as(c_int, 11);
pub const XI_PropertyEvent = @as(c_int, 12);
pub const XI_RawButtonPress = @as(c_int, 15);
pub const XI_RawButtonRelease = @as(c_int, 16);
pub const XI_RawMotion = @as(c_int, 17);
pub const XI_TouchBegin = @as(c_int, 18);
pub const XI_TouchUpdate = @as(c_int, 19);
pub const XI_TouchEnd = @as(c_int, 20);
pub const XI_RawTouchBegin = @as(c_int, 22);
pub const XI_RawTouchUpdate = @as(c_int, 23);
pub const XI_RawTouchEnd = @as(c_int, 24);
pub const XI_GesturePinchBegin = @as(c_int, 27);
pub const XI_GesturePinchUpdate = @as(c_int, 28);
pub const XI_GesturePinchEnd = @as(c_int, 29);
pub const SDL_GLOBAL_MOUSE_ID = @as(c_int, 0);
pub const shminfo = struct_shminfo;
