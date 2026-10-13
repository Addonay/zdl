// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//   Copyright (C) 2021 NVIDIA Corporation
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
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
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
pub extern fn SDL_GL_GetCurrentWindow_REAL() [*c]SDL_Window;
pub extern fn SDL_GL_GetCurrentContext_REAL() SDL_GLContext;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
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
pub const SDL_SWAPINTERVALTEAR_UNTESTED: c_int = 0;
pub const SDL_SWAPINTERVALTEAR_UNKNOWN: c_int = 1;
pub const SDL_SWAPINTERVALTEAR_MESA: c_int = 2;
pub const SDL_SWAPINTERVALTEAR_NVIDIA: c_int = 3;
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
pub const EGLDisplay = ?*anyopaque;
pub const EGLConfig = ?*anyopaque;
pub const khronos_int32_t = i32;
pub const EGLint = khronos_int32_t;
pub const EGLenum = c_uint;
pub const EGLNativeDisplayType = ?*anyopaque;
pub const PFNEGLGETDISPLAYPROC = ?*const fn (display_id: EGLNativeDisplayType) callconv(.c) EGLDisplay;
pub const EGLBoolean = c_uint;
pub const PFNEGLINITIALIZEPROC = ?*const fn (dpy: EGLDisplay, major: [*c]EGLint, minor: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLTERMINATEPROC = ?*const fn (dpy: EGLDisplay) callconv(.c) EGLBoolean;
pub const __eglMustCastToProperFunctionPointerType = ?*const fn () callconv(.c) void;
pub const PFNEGLGETPROCADDRESSPROC = ?*const fn (procname: [*c]const u8) callconv(.c) __eglMustCastToProperFunctionPointerType;
pub const PFNEGLCHOOSECONFIGPROC = ?*const fn (dpy: EGLDisplay, attrib_list: [*c]const EGLint, configs: [*c]EGLConfig, config_size: EGLint, num_config: [*c]EGLint) callconv(.c) EGLBoolean;
pub const EGLContext = ?*anyopaque;
pub const PFNEGLCREATECONTEXTPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, share_context: EGLContext, attrib_list: [*c]const EGLint) callconv(.c) EGLContext;
pub const PFNEGLDESTROYCONTEXTPROC = ?*const fn (dpy: EGLDisplay, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const PFNEGLCREATEPBUFFERSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const khronos_uintptr_t = c_ulong;
pub const EGLNativeWindowType = khronos_uintptr_t;
pub const PFNEGLCREATEWINDOWSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, win: EGLNativeWindowType, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const PFNEGLDESTROYSURFACEPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLMAKECURRENTPROC = ?*const fn (dpy: EGLDisplay, draw: EGLSurface, read: EGLSurface, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const PFNEGLSWAPBUFFERSPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLSWAPINTERVALPROC = ?*const fn (dpy: EGLDisplay, interval: EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLQUERYSTRINGPROC = ?*const fn (dpy: EGLDisplay, name: EGLint) callconv(.c) [*c]const u8;
pub const PFNEGLGETCONFIGATTRIBPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attribute: EGLint, value: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLWAITNATIVEPROC = ?*const fn (engine: EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLWAITGLPROC = ?*const fn () callconv(.c) EGLBoolean;
pub const PFNEGLBINDAPIPROC = ?*const fn (api: EGLenum) callconv(.c) EGLBoolean;
pub const PFNEGLGETERRORPROC = ?*const fn () callconv(.c) EGLint;
pub const EGLDeviceEXT = ?*anyopaque;
pub const PFNEGLQUERYDEVICESEXTPROC = ?*const fn (max_devices: EGLint, devices: [*c]EGLDeviceEXT, num_devices: [*c]EGLint) callconv(.c) EGLBoolean;
pub const EGLAttrib = isize;
pub const PFNEGLGETPLATFORMDISPLAYPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) callconv(.c) EGLDisplay;
pub const PFNEGLGETPLATFORMDISPLAYEXTPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLint) callconv(.c) EGLDisplay;
pub const EGLSyncKHR = ?*anyopaque;
pub const PFNEGLCREATESYNCKHRPROC = ?*const fn (dpy: EGLDisplay, @"type": EGLenum, attrib_list: [*c]const EGLint) callconv(.c) EGLSyncKHR;
pub const PFNEGLDESTROYSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLBoolean;
pub const PFNEGLDUPNATIVEFENCEFDANDROIDPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLint;
pub const PFNEGLWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint) callconv(.c) EGLint;
pub const khronos_uint64_t = u64;
pub const khronos_utime_nanoseconds_t = khronos_uint64_t;
pub const EGLTimeKHR = khronos_utime_nanoseconds_t;
pub const PFNEGLCLIENTWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint, timeout: EGLTimeKHR) callconv(.c) EGLint;
pub const struct_SDL_EGL_VideoData = extern struct {
    opengl_dll_handle: ?*SDL_SharedObject = null,
    egl_dll_handle: ?*SDL_SharedObject = null,
    egl_display: EGLDisplay = null,
    egl_config: EGLConfig = null,
    egl_swapinterval: c_int = 0,
    egl_surfacetype: c_int = 0,
    egl_version_major: c_int = 0,
    egl_version_minor: c_int = 0,
    egl_required_visual_id: EGLint = 0,
    is_offscreen: bool = false,
    apitype: EGLenum = 0,
    eglGetDisplay: PFNEGLGETDISPLAYPROC = null,
    eglInitialize: PFNEGLINITIALIZEPROC = null,
    eglTerminate: PFNEGLTERMINATEPROC = null,
    eglGetProcAddress: PFNEGLGETPROCADDRESSPROC = null,
    eglChooseConfig: PFNEGLCHOOSECONFIGPROC = null,
    eglCreateContext: PFNEGLCREATECONTEXTPROC = null,
    eglDestroyContext: PFNEGLDESTROYCONTEXTPROC = null,
    eglCreatePbufferSurface: PFNEGLCREATEPBUFFERSURFACEPROC = null,
    eglCreateWindowSurface: PFNEGLCREATEWINDOWSURFACEPROC = null,
    eglDestroySurface: PFNEGLDESTROYSURFACEPROC = null,
    eglMakeCurrent: PFNEGLMAKECURRENTPROC = null,
    eglSwapBuffers: PFNEGLSWAPBUFFERSPROC = null,
    eglSwapInterval: PFNEGLSWAPINTERVALPROC = null,
    eglQueryString: PFNEGLQUERYSTRINGPROC = null,
    eglGetConfigAttrib: PFNEGLGETCONFIGATTRIBPROC = null,
    eglWaitNative: PFNEGLWAITNATIVEPROC = null,
    eglWaitGL: PFNEGLWAITGLPROC = null,
    eglBindAPI: PFNEGLBINDAPIPROC = null,
    eglGetError: PFNEGLGETERRORPROC = null,
    eglQueryDevicesEXT: PFNEGLQUERYDEVICESEXTPROC = null,
    eglGetPlatformDisplay: PFNEGLGETPLATFORMDISPLAYPROC = null,
    eglGetPlatformDisplayEXT: PFNEGLGETPLATFORMDISPLAYEXTPROC = null,
    eglCreateSyncKHR: PFNEGLCREATESYNCKHRPROC = null,
    eglDestroySyncKHR: PFNEGLDESTROYSYNCKHRPROC = null,
    eglDupNativeFenceFDANDROID: PFNEGLDUPNATIVEFENCEFDANDROIDPROC = null,
    eglWaitSyncKHR: PFNEGLWAITSYNCKHRPROC = null,
    eglClientWaitSyncKHR: PFNEGLCLIENTWAITSYNCKHRPROC = null,
};
pub const struct_SDL_PrivateGLESData = extern struct {
    dummy: c_int = 0,
};
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
    egl_data: [*c]struct_SDL_EGL_VideoData = null,
    gles_data: [*c]struct_SDL_PrivateGLESData = null,
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
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub extern fn SDL_GL_DeduceMaxSupportedESProfile(major: [*c]c_int, minor: [*c]c_int) void;
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
pub const XPoint = extern struct {
    x: c_short = 0,
    y: c_short = 0,
};
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int = 0,
    modifiermap: [*c]KeyCode = null,
};
pub const struct__XPrivate = opaque {};
const struct_unnamed_66 = extern struct {
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
pub const _XPrivDisplay = [*c]struct_unnamed_66;
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
const union_unnamed_67 = extern union {
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
    data: union_unnamed_67 = @import("std").mem.zeroes(union_unnamed_67),
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
pub const pointer = ?*anyopaque;
pub const SDL_DYNX11FN_XCreateColormap = ?*const fn (a: [*c]Display, b: Window, c: [*c]Visual, d: c_int) callconv(.c) Colormap;
pub extern var X11_XCreateColormap: SDL_DYNX11FN_XCreateColormap;
pub const SDL_DYNX11FN_XCreateWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_uint, h: c_int, i: c_uint, j: [*c]Visual, k: c_ulong, l: [*c]XSetWindowAttributes) callconv(.c) Window;
pub extern var X11_XCreateWindow: SDL_DYNX11FN_XCreateWindow;
pub const SDL_DYNX11FN_XDestroyWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XDestroyWindow: SDL_DYNX11FN_XDestroyWindow;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XGetVisualInfo = ?*const fn (a: [*c]Display, b: c_long, c: [*c]XVisualInfo, d: [*c]c_int) callconv(.c) [*c]XVisualInfo;
pub extern var X11_XGetVisualInfo: SDL_DYNX11FN_XGetVisualInfo;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub extern var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub extern var X11_XSync: SDL_DYNX11FN_XSync;
pub const SDL_DYNX11FN_XVisualIDFromVisual = ?*const fn (a: [*c]Visual) callconv(.c) VisualID;
pub extern var X11_XVisualIDFromVisual: SDL_DYNX11FN_XVisualIDFromVisual;
pub const SDL_DYNX11FN_XGetErrorText = ?*const fn (a: [*c]Display, b: c_int, c: [*c]u8, d: c_int) callconv(.c) c_int;
pub extern var X11_XGetErrorText: SDL_DYNX11FN_XGetErrorText;
pub extern fn X11_PumpEvents(_this: [*c]SDL_VideoDevice) void;
pub extern fn X11_GetPixelFormatFromVisualInfo(display: [*c]Display, vinfo: [*c]XVisualInfo) SDL_PixelFormat;
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
pub extern fn eglChooseConfig(dpy: EGLDisplay, attrib_list: [*c]const EGLint, configs: [*c]EGLConfig, config_size: EGLint, num_config: [*c]EGLint) EGLBoolean;
pub extern fn eglCreateContext(dpy: EGLDisplay, config: EGLConfig, share_context: EGLContext, attrib_list: [*c]const EGLint) EGLContext;
pub extern fn eglCreatePbufferSurface(dpy: EGLDisplay, config: EGLConfig, attrib_list: [*c]const EGLint) EGLSurface;
pub extern fn eglCreateWindowSurface(dpy: EGLDisplay, config: EGLConfig, win: EGLNativeWindowType, attrib_list: [*c]const EGLint) EGLSurface;
pub extern fn eglDestroyContext(dpy: EGLDisplay, ctx: EGLContext) EGLBoolean;
pub extern fn eglDestroySurface(dpy: EGLDisplay, surface: EGLSurface) EGLBoolean;
pub extern fn eglGetConfigAttrib(dpy: EGLDisplay, config: EGLConfig, attribute: EGLint, value: [*c]EGLint) EGLBoolean;
pub extern fn eglGetDisplay(display_id: EGLNativeDisplayType) EGLDisplay;
pub extern fn eglGetError() EGLint;
pub extern fn eglGetProcAddress(procname: [*c]const u8) __eglMustCastToProperFunctionPointerType;
pub extern fn eglInitialize(dpy: EGLDisplay, major: [*c]EGLint, minor: [*c]EGLint) EGLBoolean;
pub extern fn eglMakeCurrent(dpy: EGLDisplay, draw: EGLSurface, read: EGLSurface, ctx: EGLContext) EGLBoolean;
pub extern fn eglQueryString(dpy: EGLDisplay, name: EGLint) [*c]const u8;
pub extern fn eglSwapBuffers(dpy: EGLDisplay, surface: EGLSurface) EGLBoolean;
pub extern fn eglTerminate(dpy: EGLDisplay) EGLBoolean;
pub extern fn eglWaitGL() EGLBoolean;
pub extern fn eglWaitNative(engine: EGLint) EGLBoolean;
pub extern fn eglSwapInterval(dpy: EGLDisplay, interval: EGLint) EGLBoolean;
pub extern fn eglBindAPI(api: EGLenum) EGLBoolean;
pub extern fn eglGetPlatformDisplay(platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) EGLDisplay;
pub const PendingFocusEnum = c_uint;
pub extern fn X11_UseDirectColorVisuals() bool;
pub extern fn X11_HandlePresent(window: [*c]SDL_Window) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_EGL_GetProcAddressInternal(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_EGL_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn SDL_EGL_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool;
pub extern fn SDL_EGL_GetSwapInterval(_this: [*c]SDL_VideoDevice, interval: [*c]c_int) bool;
pub extern fn SDL_EGL_DestroyContext(_this: [*c]SDL_VideoDevice, context: SDL_GLContext) bool;
pub extern fn X11_GLES_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8) bool;
pub extern fn X11_GLES_CreateContext(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_GLContext;
pub extern fn X11_GLES_SwapWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn X11_GLES_MakeCurrent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) bool;
pub extern fn X11_GLES_GetEGLSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_EGLSurface;
pub extern fn dlopen(__file: [*c]const u8, __mode: c_int) ?*anyopaque;
pub extern fn dlsym(noalias __handle: ?*anyopaque, noalias __name: [*c]const u8) ?*anyopaque;
pub extern fn dlerror() [*c]u8;
pub fn X11_GL_LoadLibrary_EGLFallback(_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    X11_GL_UnloadLibrary(_this);
    _this.*.GL_LoadLibrary = X11_GLES_LoadLibrary;
    _this.*.GL_GetProcAddress = SDL_EGL_GetProcAddressInternal;
    _this.*.GL_UnloadLibrary = SDL_EGL_UnloadLibrary;
    _this.*.GL_CreateContext = X11_GLES_CreateContext;
    _this.*.GL_MakeCurrent = X11_GLES_MakeCurrent;
    _this.*.GL_SetSwapInterval = SDL_EGL_SetSwapInterval;
    _this.*.GL_GetSwapInterval = SDL_EGL_GetSwapInterval;
    _this.*.GL_SwapWindow = X11_GLES_SwapWindow;
    _this.*.GL_DestroyContext = SDL_EGL_DestroyContext;
    _this.*.GL_GetEGLSurface = X11_GLES_GetEGLSurface;
    return X11_GLES_LoadLibrary(_this, path);
}
pub export fn X11_GL_LoadLibrary(_this: [*c]SDL_VideoDevice, arg_path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    var display: [*c]Display = undefined;
    _ = &display;
    var handle: ?*SDL_SharedObject = undefined;
    _ = &handle;
    if (_this.*.gl_data != null) {
        return SDL_SetError_REAL("OpenGL context already created");
    }
    if ((_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) and SDL_GetHintBoolean_REAL("SDL_OPENGL_ES_DRIVER", @"false" != 0)) {
        return X11_GL_LoadLibrary_EGLFallback(_this, path);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(path)))) == @as(?*anyopaque, null)) {
        path = SDL_GetHint_REAL("SDL_OPENGL_LIBRARY");
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(path)))) == @as(?*anyopaque, null)) {
        path = "libGL.so.1";
    }
    _this.*.gl_config.dll_handle = @ptrCast(@alignCast(dlopen(path, RTLD_NOW | RTLD_GLOBAL)));
    if (!(_this.*.gl_config.dll_handle != null)) {
        _ = SDL_SetError_REAL("Failed loading %s: %s", path, dlerror());
        return @"false" != 0;
    }
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&_this.*.gl_config.driver_path)), path, @sizeOf(@TypeOf(_this.*.gl_config.driver_path)) / @sizeOf(@TypeOf(_this.*.gl_config.driver_path[@as(c_int, 0)])));
    _this.*.gl_data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_SDL_GLDriverData))));
    if (!(_this.*.gl_data != null)) {
        return @"false" != 0;
    }
    handle = _this.*.gl_config.dll_handle;
    _this.*.gl_data.*.glXQueryExtension = @ptrCast(@alignCast(dlsym(@ptrCast(@alignCast(handle)), "glXQueryExtension")));
    _this.*.gl_data.*.glXGetProcAddress = @ptrCast(@alignCast(dlsym(@ptrCast(@alignCast(handle)), "glXGetProcAddressARB")));
    _this.*.gl_data.*.glXChooseVisual = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXChooseVisual"))));
    _this.*.gl_data.*.glXCreateContext = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXCreateContext"))));
    _this.*.gl_data.*.glXDestroyContext = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXDestroyContext"))));
    _this.*.gl_data.*.glXMakeCurrent = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXMakeCurrent"))));
    _this.*.gl_data.*.glXSwapBuffers = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXSwapBuffers"))));
    _this.*.gl_data.*.glXQueryDrawable = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXQueryDrawable"))));
    if (((((!(_this.*.gl_data.*.glXQueryExtension != null) or !(_this.*.gl_data.*.glXChooseVisual != null)) or !(_this.*.gl_data.*.glXCreateContext != null)) or !(_this.*.gl_data.*.glXDestroyContext != null)) or !(_this.*.gl_data.*.glXMakeCurrent != null)) or !(_this.*.gl_data.*.glXSwapBuffers != null)) {
        return SDL_SetError_REAL("Could not retrieve OpenGL functions");
    }
    display = _this.*.internal.*.display;
    if (!(_this.*.gl_data.*.glXQueryExtension.?(display, &_this.*.gl_data.*.errorBase, &_this.*.gl_data.*.eventBase) != 0)) {
        return SDL_SetError_REAL("GLX is not supported");
    }
    _this.*.gl_data.*.swap_interval_tear_behavior = SDL_SWAPINTERVALTEAR_UNTESTED;
    _this.*.gl_config.driver_loaded += 1;
    X11_GL_InitExtensions(_this);
    _this.*.gl_config.driver_loaded -= 1;
    if (((_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) or SDL_GetHintBoolean_REAL("SDL_VIDEO_FORCE_EGL", @"false" != 0)) and X11_GL_UseEGL(_this)) {
        return X11_GL_LoadLibrary_EGLFallback(_this, null);
    }
    return @"true" != 0;
}
pub export fn X11_GL_GetProcAddress(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    if (_this.*.gl_data.*.glXGetProcAddress != null) {
        return _this.*.gl_data.*.glXGetProcAddress.?(@ptrCast(@alignCast(proc)));
    }
    return @ptrCast(@alignCast(dlsym(@ptrCast(@alignCast(_this.*.gl_config.dll_handle)), proc)));
}
pub export fn X11_GL_UnloadLibrary(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(_this.*.gl_data)));
    _this.*.gl_data = null;
}
pub fn HasExtension(extension: [*c]const u8, extensions: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var start: [*c]const u8 = undefined;
    _ = &start;
    var where: [*c]const u8 = undefined;
    _ = &where;
    var terminator: [*c]const u8 = undefined;
    _ = &terminator;
    if (!(extensions != null)) {
        return @"false" != 0;
    }
    where = SDL_strchr_REAL(extension, ' ');
    if ((where != null) or (@as(c_int, extension.*) == @as(c_int, '\x00'))) {
        return @"false" != 0;
    }
    start = extensions;
    while (true) {
        where = SDL_strstr_REAL(start, extension);
        if (!(where != null)) {
            break;
        }
        terminator = where + SDL_strlen_REAL(extension);
        if ((where == start) or (@as(c_int, (where - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))).*) == @as(c_int, ' '))) {
            if ((@as(c_int, terminator.*) == @as(c_int, ' ')) or (@as(c_int, terminator.*) == @as(c_int, '\x00'))) {
                return @"true" != 0;
            }
        }
        start = terminator;
    }
    return @"false" != 0;
}
pub fn X11_GL_InitExtensions(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var display: [*c]Display = _this.*.internal.*.display;
    _ = &display;
    const screen: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen;
    _ = &screen;
    var vinfo: [*c]XVisualInfo = null;
    _ = &vinfo;
    var w: Window = 0;
    _ = &w;
    var prev_ctx: GLXContext = null;
    _ = &prev_ctx;
    var prev_drawable: GLXDrawable = 0;
    _ = &prev_drawable;
    var context: GLXContext = null;
    _ = &context;
    var glXQueryExtensionsStringFunc: ?*const fn ([*c]Display, c_int) callconv(.c) [*c]const u8 = undefined;
    _ = &glXQueryExtensionsStringFunc;
    var extensions: [*c]const u8 = undefined;
    _ = &extensions;
    vinfo = X11_GL_GetVisual(_this, display, screen, @"false" != 0);
    if (vinfo != null) {
        var glXGetCurrentContextFunc: ?*const fn () callconv(.c) GLXContext = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXGetCurrentContext"))));
        _ = &glXGetCurrentContextFunc;
        var glXGetCurrentDrawableFunc: ?*const fn () callconv(.c) GLXDrawable = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXGetCurrentDrawable"))));
        _ = &glXGetCurrentDrawableFunc;
        if ((glXGetCurrentContextFunc != null) and (glXGetCurrentDrawableFunc != null)) {
            var xattr: XSetWindowAttributes = undefined;
            _ = &xattr;
            prev_ctx = glXGetCurrentContextFunc.?();
            prev_drawable = glXGetCurrentDrawableFunc.?();
            xattr.background_pixel = 0;
            xattr.border_pixel = 0;
            xattr.colormap = X11_XCreateColormap.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, vinfo.*.visual, AllocNone);
            w = X11_XCreateWindow.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, 0, 0, 32, 32, 0, vinfo.*.depth, InputOutput, vinfo.*.visual, @bitCast(@as(c_long, ((@as(c_long, 1) << @intCast(@as(c_long, 1))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 13))))), &xattr);
            context = _this.*.gl_data.*.glXCreateContext.?(display, vinfo, null, True);
            if (context != null) {
                _ = _this.*.gl_data.*.glXMakeCurrent.?(display, w, context);
            }
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(vinfo)));
    }
    glXQueryExtensionsStringFunc = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXQueryExtensionsString"))));
    if (glXQueryExtensionsStringFunc != null) {
        extensions = glXQueryExtensionsStringFunc.?(display, screen);
    } else {
        extensions = null;
    }
    _this.*.gl_data.*.HAS_GLX_EXT_swap_control_tear = @"false" != 0;
    if (HasExtension("GLX_EXT_swap_control", extensions)) {
        _this.*.gl_data.*.glXSwapIntervalEXT = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXSwapIntervalEXT"))));
        if (HasExtension("GLX_EXT_swap_control_tear", extensions)) {
            _this.*.gl_data.*.HAS_GLX_EXT_swap_control_tear = @"true" != 0;
        }
    }
    if (HasExtension("GLX_MESA_swap_control", extensions)) {
        _this.*.gl_data.*.glXSwapIntervalMESA = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXSwapIntervalMESA"))));
        _this.*.gl_data.*.glXGetSwapIntervalMESA = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXGetSwapIntervalMESA"))));
    }
    if (HasExtension("GLX_SGI_swap_control", extensions)) {
        _this.*.gl_data.*.glXSwapIntervalSGI = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXSwapIntervalSGI"))));
    }
    if (HasExtension("GLX_ARB_create_context", extensions)) {
        _this.*.gl_data.*.glXCreateContextAttribsARB = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXCreateContextAttribsARB"))));
        _this.*.gl_data.*.glXChooseFBConfig = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXChooseFBConfig"))));
        _this.*.gl_data.*.glXGetVisualFromFBConfig = @ptrCast(@alignCast(@constCast(X11_GL_GetProcAddress(_this, "glXGetVisualFromFBConfig"))));
    }
    if (HasExtension("GLX_EXT_visual_rating", extensions)) {
        _this.*.gl_data.*.HAS_GLX_EXT_visual_rating = @"true" != 0;
    }
    if (HasExtension("GLX_EXT_visual_info", extensions)) {
        _this.*.gl_data.*.HAS_GLX_EXT_visual_info = @"true" != 0;
    }
    if (HasExtension("GLX_EXT_create_context_es2_profile", extensions)) {
        if (context != null) {
            SDL_GL_DeduceMaxSupportedESProfile(&_this.*.gl_data.*.es_profile_max_supported_version.major, &_this.*.gl_data.*.es_profile_max_supported_version.minor);
        }
    }
    if (HasExtension("GLX_ARB_context_flush_control", extensions)) {
        _this.*.gl_data.*.HAS_GLX_ARB_context_flush_control = @"true" != 0;
    }
    if (HasExtension("GLX_ARB_create_context_robustness", extensions)) {
        _this.*.gl_data.*.HAS_GLX_ARB_create_context_robustness = @"true" != 0;
    }
    if (HasExtension("GLX_ARB_create_context_no_error", extensions)) {
        _this.*.gl_data.*.HAS_GLX_ARB_create_context_no_error = @"true" != 0;
    }
    if (HasExtension("GLX_ARB_framebuffer_sRGB", extensions)) {
        _this.*.gl_data.*.HAS_GLX_ARB_framebuffer_sRGB = @"true" != 0;
    } else if (HasExtension("GLX_EXT_framebuffer_sRGB", extensions)) {
        _this.*.gl_data.*.HAS_GLX_ARB_framebuffer_sRGB = @"true" != 0;
    }
    if (context != null) {
        _ = _this.*.gl_data.*.glXMakeCurrent.?(display, None, null);
        _this.*.gl_data.*.glXDestroyContext.?(display, context);
        if ((prev_ctx != null) and (prev_drawable != 0)) {
            _ = _this.*.gl_data.*.glXMakeCurrent.?(display, prev_drawable, prev_ctx);
        }
    }
    if (w != 0) {
        _ = X11_XDestroyWindow.?(display, w);
    }
    X11_PumpEvents(_this);
}
pub fn X11_GL_GetAttributes(_this: [*c]SDL_VideoDevice, _: [*c]Display, _: c_int, attribs: [*c]c_int, arg_size: c_int, for_FBConfig: c_int, _pvistypeattr: [*c][*c]c_int, transparent: bool) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "X11_GL_GetAttributes".*;
    };
    _ = &static_local___func__;
    var i: c_int = 0;
    _ = &i;
    const MAX_ATTRIBUTES: c_int = 64;
    _ = &MAX_ATTRIBUTES;
    var pvistypeattr: [*c]c_int = null;
    _ = &pvistypeattr;
    while (true) {
        while (!(size >= MAX_ATTRIBUTES)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "size >= MAX_ATTRIBUTES",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11opengl.c", 516);
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
    if (for_FBConfig != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_RENDER_TYPE;
        if (_this.*.gl_config.floatbuffers != 0) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLX_RGBA_FLOAT_BIT_ARB;
        } else {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLX_RGBA_BIT;
        }
    } else {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_RGBA;
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = GLX_RED_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.red_size;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = GLX_GREEN_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.green_size;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = GLX_BLUE_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.blue_size;
    if (_this.*.gl_config.alpha_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_ALPHA_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.alpha_size;
    }
    if (_this.*.gl_config.double_buffer != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_DOUBLEBUFFER;
        if (for_FBConfig != 0) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = True;
        }
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = GLX_DEPTH_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.depth_size;
    if (_this.*.gl_config.stencil_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_STENCIL_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.stencil_size;
    }
    if (_this.*.gl_config.accum_red_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_ACCUM_RED_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.accum_red_size;
    }
    if (_this.*.gl_config.accum_green_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_ACCUM_GREEN_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.accum_green_size;
    }
    if (_this.*.gl_config.accum_blue_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_ACCUM_BLUE_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.accum_blue_size;
    }
    if (_this.*.gl_config.accum_alpha_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_ACCUM_ALPHA_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.accum_alpha_size;
    }
    if (_this.*.gl_config.stereo != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_STEREO;
        if (for_FBConfig != 0) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = True;
        }
    }
    if (_this.*.gl_config.multisamplebuffers != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_SAMPLE_BUFFERS_ARB;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.multisamplebuffers;
    }
    if (_this.*.gl_config.multisamplesamples != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_SAMPLES_ARB;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.multisamplesamples;
    }
    if (_this.*.gl_config.floatbuffers != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_RENDER_TYPE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_RGBA_FLOAT_TYPE_ARB;
    }
    if (_this.*.gl_data.*.HAS_GLX_ARB_framebuffer_sRGB) {
        var srgbhint: [*c]const u8 = SDL_GetHint_REAL("SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER");
        _ = &srgbhint;
        if ((srgbhint != null) and (@as(c_int, srgbhint.*) != 0)) {
            if (SDL_strcmp_REAL(srgbhint, "skip") == @as(c_int, 0)) {} else {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &i;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &i;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = if (SDL_GetStringBoolean(srgbhint, @"false" != 0)) True else False;
            }
        } else if (_this.*.gl_config.framebuffer_srgb_capable != 0) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = True;
        }
    }
    if ((_this.*.gl_config.accelerated >= @as(c_int, 0)) and _this.*.gl_data.*.HAS_GLX_EXT_visual_rating) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = GLX_VISUAL_CAVEAT_EXT;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = if (_this.*.gl_config.accelerated != 0) GLX_NONE_EXT else GLX_SLOW_VISUAL_EXT;
    }
    if (!transparent) {
        if (X11_UseDirectColorVisuals() and _this.*.gl_data.*.HAS_GLX_EXT_visual_info) {
            pvistypeattr = &attribs[@bitCast(@as(isize, @intCast(i)))];
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLX_X_VISUAL_TYPE_EXT;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLX_DIRECT_COLOR_EXT;
        }
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = None;
    while (true) {
        while (!(i <= MAX_ATTRIBUTES)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "i <= MAX_ATTRIBUTES",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11opengl.c", 632);
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
    if (_pvistypeattr != null) {
        _pvistypeattr.* = pvistypeattr;
    }
    return i;
}
pub fn X11_GL_GetTransparentVisualInfo(display: [*c]Display, screen: c_int) callconv(.c) [*c]XVisualInfo {
    @setEvalBranchQuota(100000);
    var visualinfo: [*c]XVisualInfo = null;
    _ = &visualinfo;
    var vi_in: XVisualInfo = undefined;
    _ = &vi_in;
    var out_count: c_int = 0;
    _ = &out_count;
    vi_in.screen = screen;
    visualinfo = X11_XGetVisualInfo.?(display, VisualScreenMask, &vi_in, &out_count);
    if (@as(?*anyopaque, @ptrCast(@alignCast(visualinfo))) != @as(?*anyopaque, null)) {
        var i: c_int = 0;
        _ = &i;
        {
            i = 0;
            while (i < out_count) : (i += 1) {
                var v: [*c]XVisualInfo = &visualinfo[@bitCast(@as(isize, @intCast(i)))];
                _ = &v;
                var format: Uint32 = X11_GetPixelFormatFromVisualInfo(display, v);
                _ = &format;
                if (((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_BGRA))))) {
                    vi_in.screen = screen;
                    vi_in.visualid = v.*.visualid;
                    _ = X11_XFree.?(@ptrCast(@alignCast(visualinfo)));
                    visualinfo = X11_XGetVisualInfo.?(display, VisualScreenMask | VisualIDMask, &vi_in, &out_count);
                    break;
                }
            }
        }
    }
    return visualinfo;
}
pub export fn X11_GL_GetVisual(_this: [*c]SDL_VideoDevice, display: [*c]Display, screen: c_int, transparent: bool) [*c]XVisualInfo {
    @setEvalBranchQuota(100000);
    var attribs: [64]c_int = undefined;
    _ = &attribs;
    var vinfo: [*c]XVisualInfo = null;
    _ = &vinfo;
    var pvistypeattr: [*c]c_int = null;
    _ = &pvistypeattr;
    if (!(_this.*.gl_data != null)) {
        return null;
    }
    if ((_this.*.gl_data.*.glXChooseFBConfig != null) and (_this.*.gl_data.*.glXGetVisualFromFBConfig != null)) {
        var framebuffer_config: [*c]GLXFBConfig = null;
        _ = &framebuffer_config;
        var fbcount: c_int = 0;
        _ = &fbcount;
        _ = X11_GL_GetAttributes(_this, display, screen, @ptrCast(@alignCast(&attribs)), 64, @"true", &pvistypeattr, transparent);
        framebuffer_config = _this.*.gl_data.*.glXChooseFBConfig.?(display, screen, @ptrCast(@alignCast(&attribs)), &fbcount);
        if (!(framebuffer_config != null) and (@as(?*anyopaque, @ptrCast(@alignCast(pvistypeattr))) != @as(?*anyopaque, null))) {
            pvistypeattr.* = None;
            framebuffer_config = _this.*.gl_data.*.glXChooseFBConfig.?(display, screen, @ptrCast(@alignCast(&attribs)), &fbcount);
        }
        if (transparent) {
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < fbcount) : (i += 1) {
                    var format: Uint32 = undefined;
                    _ = &format;
                    vinfo = _this.*.gl_data.*.glXGetVisualFromFBConfig.?(display, framebuffer_config[@bitCast(@as(isize, @intCast(i)))]);
                    format = X11_GetPixelFormatFromVisualInfo(display, vinfo);
                    if (((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_BGRA))))) {
                        _ = X11_XFree.?(@ptrCast(@alignCast(framebuffer_config)));
                        framebuffer_config = null;
                        break;
                    }
                    _ = X11_XFree.?(@ptrCast(@alignCast(vinfo)));
                    vinfo = null;
                }
            }
        }
        if (framebuffer_config != null) {
            vinfo = _this.*.gl_data.*.glXGetVisualFromFBConfig.?(display, framebuffer_config[@as(c_int, 0)]);
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(framebuffer_config)));
    }
    if (!(vinfo != null)) {
        _ = X11_GL_GetAttributes(_this, display, screen, @ptrCast(@alignCast(&attribs)), 64, @"false", &pvistypeattr, transparent);
        vinfo = _this.*.gl_data.*.glXChooseVisual.?(display, screen, @ptrCast(@alignCast(&attribs)));
        if (!(vinfo != null) and (@as(?*anyopaque, @ptrCast(@alignCast(pvistypeattr))) != @as(?*anyopaque, null))) {
            pvistypeattr.* = None;
            vinfo = _this.*.gl_data.*.glXChooseVisual.?(display, screen, @ptrCast(@alignCast(&attribs)));
        }
    }
    if (transparent and (vinfo != null)) {
        var format: Uint32 = X11_GetPixelFormatFromVisualInfo(display, vinfo);
        _ = &format;
        if (!(((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_BGRA)))))) {
            var visualinfo: [*c]XVisualInfo = X11_GL_GetTransparentVisualInfo(display, screen);
            _ = &visualinfo;
            if (@as(?*anyopaque, @ptrCast(@alignCast(visualinfo))) != @as(?*anyopaque, null)) {
                _ = X11_XFree.?(@ptrCast(@alignCast(vinfo)));
                vinfo = visualinfo;
            }
        }
    }
    if (!(vinfo != null)) {
        _ = SDL_SetError_REAL("Couldn't find matching GLX visual");
    }
    return vinfo;
}
pub var handler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = null;
pub var errorHandlerOperation: [*c]const u8 = null;
pub var errorBase: c_int = 0;
pub var errorCode: c_int = 0;
pub fn X11_GL_ErrorHandler(d: [*c]Display, e: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var x11_error: [*c]u8 = null;
    _ = &x11_error;
    var x11_error_locale: [256]u8 = undefined;
    _ = &x11_error_locale;
    errorCode = e.*.error_code;
    if (X11_XGetErrorText.?(d, errorCode, @ptrCast(@alignCast(&x11_error_locale)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(x11_error_locale)))))) == Success) {
        x11_error = SDL_iconv_string_REAL("UTF-8", "", @ptrCast(@alignCast(&x11_error_locale)), SDL_strlen_REAL(@ptrCast(@alignCast(&x11_error_locale))) +% @as(usize, 1));
    }
    if (x11_error != null) {
        _ = SDL_SetError_REAL("Could not %s: %s", errorHandlerOperation, x11_error);
        SDL_free_REAL(@ptrCast(@alignCast(x11_error)));
    } else {
        _ = SDL_SetError_REAL("Could not %s: %i (Base %i)", errorHandlerOperation, errorCode, errorBase);
    }
    return 0;
}
pub export fn X11_GL_UseEGL(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "X11_GL_UseEGL".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(_this.*.gl_data))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "_this->gl_data != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11opengl.c", 769);
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
    if (SDL_GetHintBoolean_REAL("SDL_VIDEO_FORCE_EGL", @"false" != 0)) {
        return @"true" != 0;
    }
    while (true) {
        while (!(_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "_this->gl_config.profile_mask == 0x0004",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11opengl.c", 775);
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
    return ((SDL_GetHintBoolean_REAL("SDL_OPENGL_ES_DRIVER", @"false" != 0) or (_this.*.gl_config.major_version == @as(c_int, 1))) or (_this.*.gl_config.major_version > _this.*.gl_data.*.es_profile_max_supported_version.major)) or ((_this.*.gl_config.major_version == _this.*.gl_data.*.es_profile_max_supported_version.major) and (_this.*.gl_config.minor_version > _this.*.gl_data.*.es_profile_max_supported_version.minor));
}
pub export fn X11_GL_CreateContext(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_GLContext {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var screen: c_int = SDL_GetDisplayDriverDataForWindow(window).*.screen;
    _ = &screen;
    var xattr: XWindowAttributes = undefined;
    _ = &xattr;
    var v: XVisualInfo = undefined;
    _ = &v;
    var vinfo: [*c]XVisualInfo = undefined;
    _ = &vinfo;
    var n: c_int = undefined;
    _ = &n;
    var context: SDL_GLContext = null;
    _ = &context;
    var share_context: GLXContext = undefined;
    _ = &share_context;
    const transparent: c_int = if ((window.*.flags & @as(c_ulong, 1073741824)) != 0) @"true" else @"false";
    _ = &transparent;
    if (_this.*.gl_config.share_with_current_context != 0) {
        share_context = @ptrCast(@alignCast(SDL_GL_GetCurrentContext_REAL()));
    } else {
        share_context = null;
    }
    _ = X11_XSync.?(display, False);
    errorHandlerOperation = "create GL context";
    errorBase = _this.*.gl_data.*.errorBase;
    errorCode = Success;
    handler = X11_XSetErrorHandler.?(X11_GL_ErrorHandler);
    _ = X11_XGetWindowAttributes.?(display, data.*.xwindow, &xattr);
    v.screen = screen;
    v.visualid = X11_XVisualIDFromVisual.?(xattr.visual);
    vinfo = X11_XGetVisualInfo.?(display, VisualScreenMask | VisualIDMask, &v, &n);
    if (vinfo != null) {
        if ((((_this.*.gl_config.major_version < @as(c_int, 3)) and (_this.*.gl_config.profile_mask == @as(c_int, 0))) and (_this.*.gl_config.flags == @as(c_int, 0))) and !(transparent != 0)) {
            context = @ptrCast(@alignCast(_this.*.gl_data.*.glXCreateContext.?(display, vinfo, share_context, True)));
        } else {
            var attribs: [15]c_int = [5]c_int{
                GLX_CONTEXT_MAJOR_VERSION_ARB,
                _this.*.gl_config.major_version,
                GLX_CONTEXT_MINOR_VERSION_ARB,
                _this.*.gl_config.minor_version,
                0,
            } ++ @as([10]c_int, @splat(0));
            _ = &attribs;
            var iattr: c_int = 4;
            _ = &iattr;
            if (_this.*.gl_config.profile_mask != @as(c_int, 0)) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_CONTEXT_PROFILE_MASK_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = _this.*.gl_config.profile_mask;
            }
            if (_this.*.gl_config.flags != @as(c_int, 0)) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_CONTEXT_FLAGS_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = _this.*.gl_config.flags;
            }
            if (_this.*.gl_data.*.HAS_GLX_ARB_context_flush_control and (_this.*.gl_config.release_behavior == @as(c_int, 0))) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_CONTEXT_RELEASE_BEHAVIOR_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = if (_this.*.gl_config.release_behavior != 0) GLX_CONTEXT_RELEASE_BEHAVIOR_FLUSH_ARB else GLX_CONTEXT_RELEASE_BEHAVIOR_NONE_ARB;
            }
            if (_this.*.gl_data.*.HAS_GLX_ARB_create_context_robustness and (_this.*.gl_config.reset_notification != @as(c_int, 0))) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = if (_this.*.gl_config.reset_notification != 0) GLX_LOSE_CONTEXT_ON_RESET_ARB else GLX_NO_RESET_NOTIFICATION_ARB;
            }
            if (_this.*.gl_data.*.HAS_GLX_ARB_create_context_no_error and (_this.*.gl_config.no_error != @as(c_int, 0))) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = GLX_CONTEXT_OPENGL_NO_ERROR_ARB;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &iattr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = _this.*.gl_config.no_error;
            }
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &iattr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = 0;
            if (!(_this.*.gl_data.*.glXCreateContextAttribsARB != null)) {
                _ = SDL_SetError_REAL("OpenGL 3.0 and later are not supported by this system");
            } else {
                var glxAttribs: [64]c_int = undefined;
                _ = &glxAttribs;
                var framebuffer_config: [*c]GLXFBConfig = null;
                _ = &framebuffer_config;
                var fbcount: c_int = 0;
                _ = &fbcount;
                var pvistypeattr: [*c]c_int = null;
                _ = &pvistypeattr;
                _ = X11_GL_GetAttributes(_this, display, screen, @ptrCast(@alignCast(&glxAttribs)), 64, @"true", &pvistypeattr, transparent != 0);
                if (_this.*.gl_data.*.glXChooseFBConfig != null) {
                    framebuffer_config = _this.*.gl_data.*.glXChooseFBConfig.?(display, @as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen, @ptrCast(@alignCast(&glxAttribs)), &fbcount);
                    if (!(framebuffer_config != null) and (@as(?*anyopaque, @ptrCast(@alignCast(pvistypeattr))) != @as(?*anyopaque, null))) {
                        pvistypeattr.* = None;
                        framebuffer_config = _this.*.gl_data.*.glXChooseFBConfig.?(display, @as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen, @ptrCast(@alignCast(&glxAttribs)), &fbcount);
                    }
                    if ((transparent != 0) and (@as(?*anyopaque, @ptrCast(@alignCast(framebuffer_config))) != @as(?*anyopaque, null))) {
                        var i: c_int = undefined;
                        _ = &i;
                        {
                            i = 0;
                            while (i < fbcount) : (i += 1) {
                                var vinfo_temp: [*c]XVisualInfo = _this.*.gl_data.*.glXGetVisualFromFBConfig.?(display, framebuffer_config[@bitCast(@as(isize, @intCast(i)))]);
                                _ = &vinfo_temp;
                                if (@as(?*anyopaque, @ptrCast(@alignCast(vinfo_temp))) != @as(?*anyopaque, null)) {
                                    var format: Uint32 = X11_GetPixelFormatFromVisualInfo(display, vinfo_temp);
                                    _ = &format;
                                    if (((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and (((((((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15)) == @as(Uint32, SDL_ARRAYORDER_BGRA))))) {
                                        context = @ptrCast(@alignCast(_this.*.gl_data.*.glXCreateContextAttribsARB.?(display, framebuffer_config[@bitCast(@as(isize, @intCast(i)))], share_context, True, @ptrCast(@alignCast(&attribs)))));
                                        _ = X11_XFree.?(@ptrCast(@alignCast(framebuffer_config)));
                                        framebuffer_config = null;
                                        _ = X11_XFree.?(@ptrCast(@alignCast(vinfo_temp)));
                                        break;
                                    }
                                    _ = X11_XFree.?(@ptrCast(@alignCast(vinfo_temp)));
                                }
                            }
                        }
                    }
                    if (framebuffer_config != null) {
                        context = @ptrCast(@alignCast(_this.*.gl_data.*.glXCreateContextAttribsARB.?(display, framebuffer_config[@as(c_int, 0)], share_context, True, @ptrCast(@alignCast(&attribs)))));
                        _ = X11_XFree.?(@ptrCast(@alignCast(framebuffer_config)));
                    }
                }
            }
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(vinfo)));
    }
    _ = X11_XSync.?(display, False);
    _ = X11_XSetErrorHandler.?(handler);
    if (!(context != null)) {
        if (errorCode == Success) {
            _ = SDL_SetError_REAL("Could not create GL context");
        }
        return null;
    }
    if (!X11_GL_MakeCurrent(_this, window, context)) {
        _ = X11_GL_DestroyContext(_this, context);
        return null;
    }
    return context;
}
pub export fn X11_GL_MakeCurrent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]Display = _this.*.internal.*.display;
    _ = &display;
    var drawable: Window = if (context != null) window.*.internal.*.xwindow else @as(Window, None);
    _ = &drawable;
    var glx_context: GLXContext = @ptrCast(@alignCast(context));
    _ = &glx_context;
    var rc: c_int = undefined;
    _ = &rc;
    if (!(_this.*.gl_data != null)) {
        return SDL_SetError_REAL("OpenGL not initialized");
    }
    _ = X11_XSync.?(display, False);
    errorHandlerOperation = "make GL context current";
    errorBase = _this.*.gl_data.*.errorBase;
    errorCode = Success;
    handler = X11_XSetErrorHandler.?(X11_GL_ErrorHandler);
    rc = _this.*.gl_data.*.glXMakeCurrent.?(display, drawable, glx_context);
    _ = X11_XSetErrorHandler.?(handler);
    if (errorCode != Success) {
        return @"false" != 0;
    } else if (!(rc != 0)) {
        return SDL_SetError_REAL("Unable to make GL context current");
    }
    return @"true" != 0;
}
pub var swapinterval: c_int = 0;
pub export fn X11_GL_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    if ((interval < @as(c_int, 0)) and !_this.*.gl_data.*.HAS_GLX_EXT_swap_control_tear) {
        return SDL_SetError_REAL("Negative swap interval unsupported in this GL");
    } else if (_this.*.gl_data.*.glXSwapIntervalEXT != null) {
        var display: [*c]Display = _this.*.internal.*.display;
        _ = &display;
        var windowdata: [*c]const SDL_WindowData = SDL_GL_GetCurrentWindow_REAL().*.internal;
        _ = &windowdata;
        var drawable: Window = windowdata.*.xwindow;
        _ = &drawable;
        var currentInterval: c_int = 0;
        _ = &currentInterval;
        _ = X11_GL_GetSwapInterval(_this, &currentInterval);
        _this.*.gl_data.*.glXSwapIntervalEXT.?(display, drawable, currentInterval);
        _this.*.gl_data.*.glXSwapIntervalEXT.?(display, drawable, interval);
        result = @"true" != 0;
        swapinterval = interval;
    } else if (_this.*.gl_data.*.glXSwapIntervalMESA != null) {
        const rc: c_int = _this.*.gl_data.*.glXSwapIntervalMESA.?(interval);
        _ = &rc;
        if (rc == @as(c_int, 0)) {
            swapinterval = interval;
            result = @"true" != 0;
        } else {
            result = SDL_SetError_REAL("glXSwapIntervalMESA failed");
        }
    } else if (_this.*.gl_data.*.glXSwapIntervalSGI != null) {
        const rc: c_int = _this.*.gl_data.*.glXSwapIntervalSGI.?(interval);
        _ = &rc;
        if (rc == @as(c_int, 0)) {
            swapinterval = interval;
            result = @"true" != 0;
        } else {
            result = SDL_SetError_REAL("glXSwapIntervalSGI failed");
        }
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return result;
}
pub fn CheckSwapIntervalTearBehavior(_this: [*c]SDL_VideoDevice, drawable: Window, current_val: c_uint, current_allow_late: c_uint) callconv(.c) SDL_GLSwapIntervalTearBehavior {
    @setEvalBranchQuota(100000);
    if (_this.*.gl_data.*.swap_interval_tear_behavior == @as(SDL_GLSwapIntervalTearBehavior, SDL_SWAPINTERVALTEAR_UNTESTED)) {
        if (!_this.*.gl_data.*.HAS_GLX_EXT_swap_control_tear) {
            _this.*.gl_data.*.swap_interval_tear_behavior = SDL_SWAPINTERVALTEAR_UNKNOWN;
        } else {
            var display: [*c]Display = _this.*.internal.*.display;
            _ = &display;
            var allow_late_swap_tearing: c_uint = 22;
            _ = &allow_late_swap_tearing;
            var original_val: c_int = @bitCast(@as(c_uint, @truncate(current_val)));
            _ = &original_val;
            _this.*.gl_data.*.glXSwapIntervalEXT.?(display, drawable, @bitCast(@as(c_uint, @truncate(current_val))));
            _this.*.gl_data.*.glXSwapIntervalEXT.?(display, drawable, 0);
            _this.*.gl_data.*.glXQueryDrawable.?(display, drawable, GLX_LATE_SWAPS_TEAR_EXT, &allow_late_swap_tearing);
            if (allow_late_swap_tearing == @as(c_uint, 0)) {
                _this.*.gl_data.*.swap_interval_tear_behavior = SDL_SWAPINTERVALTEAR_NVIDIA;
                if (current_allow_late != 0) {
                    original_val = -original_val;
                }
            } else if (allow_late_swap_tearing == @as(c_uint, 1)) {
                _this.*.gl_data.*.swap_interval_tear_behavior = SDL_SWAPINTERVALTEAR_MESA;
            } else {
                _this.*.gl_data.*.swap_interval_tear_behavior = SDL_SWAPINTERVALTEAR_UNKNOWN;
            }
            _this.*.gl_data.*.glXSwapIntervalEXT.?(display, drawable, original_val);
        }
    }
    return _this.*.gl_data.*.swap_interval_tear_behavior;
}
pub export fn X11_GL_GetSwapInterval(_this: [*c]SDL_VideoDevice, interval: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]Display = undefined;
    _ = &display;
    var windowdata: [*c]const SDL_WindowData = undefined;
    _ = &windowdata;
    var drawable: Window = undefined;
    _ = &drawable;
    var allow_late_swap_tearing: c_uint = undefined;
    _ = &allow_late_swap_tearing;
    var val: c_uint = undefined;
    _ = &val;
    var val_1: c_int = undefined;
    _ = &val_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (_this.*.gl_data.*.glXSwapIntervalEXT != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                display = _this.*.internal.*.display;
                windowdata = SDL_GL_GetCurrentWindow_REAL().*.internal;
                drawable = windowdata.*.xwindow;
                allow_late_swap_tearing = 0;
                val = 0;
                if (_this.*.gl_data.*.HAS_GLX_EXT_swap_control_tear) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                if (_this.*.gl_data.*.glXGetSwapIntervalMESA != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            3 => {
                return undefined;
            },
            4 => {
                allow_late_swap_tearing = 22;
                _this.*.gl_data.*.glXQueryDrawable.?(display, drawable, GLX_LATE_SWAPS_TEAR_EXT, &allow_late_swap_tearing);
                {
                    sdl_pc = 6;
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
                _this.*.gl_data.*.glXQueryDrawable.?(display, drawable, GLX_SWAP_INTERVAL_EXT, &val);
                interval.* = @bitCast(@as(c_uint, @truncate(val)));
                switch (CheckSwapIntervalTearBehavior(_this, drawable, val, allow_late_swap_tearing)) {
                    @as(SDL_GLSwapIntervalTearBehavior, SDL_SWAPINTERVALTEAR_MESA) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GLSwapIntervalTearBehavior, SDL_SWAPINTERVALTEAR_NVIDIA) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                interval.* = @bitCast(@as(c_uint, @truncate(val)));
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
                if ((allow_late_swap_tearing != 0) and (@as(c_uint, @bitCast(@as(c_int, @intFromBool(val > @as(c_uint, 0))))) != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                interval.* = -@as(c_int, @bitCast(@as(c_uint, @truncate(val))));
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                val_1 = _this.*.gl_data.*.glXGetSwapIntervalMESA.?();
                if (val_1 == GLX_BAD_CONTEXT) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                interval.* = swapinterval;
                return @"true" != 0;
            },
            16 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            17 => {
                return SDL_SetError_REAL("GLX_BAD_CONTEXT");
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                interval.* = val_1;
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn X11_GL_SwapWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    _this.*.gl_data.*.glXSwapBuffers.?(display, data.*.xwindow);
    X11_HandlePresent(data.*.window);
    return @"true" != 0;
}
pub export fn X11_GL_DestroyContext(_this: [*c]SDL_VideoDevice, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]Display = _this.*.internal.*.display;
    _ = &display;
    var glx_context: GLXContext = @ptrCast(@alignCast(context));
    _ = &glx_context;
    if (!(_this.*.gl_data != null)) {
        return @"true" != 0;
    }
    _this.*.gl_data.*.glXDestroyContext.?(display, glx_context);
    _ = X11_XSync.?(display, False);
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const None = @as(c_long, 0);
pub const Success = @as(c_int, 0);
pub const InputOutput = @as(c_int, 1);
pub const AllocNone = @as(c_int, 0);
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub const VisualIDMask = @as(c_int, 0x1);
pub const VisualScreenMask = @as(c_int, 0x2);
pub const GLX_RGBA = @as(c_int, 4);
pub const GLX_DOUBLEBUFFER = @as(c_int, 5);
pub const GLX_STEREO = @as(c_int, 6);
pub const GLX_RED_SIZE = @as(c_int, 8);
pub const GLX_GREEN_SIZE = @as(c_int, 9);
pub const GLX_BLUE_SIZE = @as(c_int, 10);
pub const GLX_ALPHA_SIZE = @as(c_int, 11);
pub const GLX_DEPTH_SIZE = @as(c_int, 12);
pub const GLX_STENCIL_SIZE = @as(c_int, 13);
pub const GLX_ACCUM_RED_SIZE = @as(c_int, 14);
pub const GLX_ACCUM_GREEN_SIZE = @as(c_int, 15);
pub const GLX_ACCUM_BLUE_SIZE = @as(c_int, 16);
pub const GLX_ACCUM_ALPHA_SIZE = @as(c_int, 17);
pub const GLX_BAD_CONTEXT = @as(c_int, 5);
pub const GLX_RENDER_TYPE = __helpers.promoteIntLiteral(c_int, 0x8011, .hex);
pub const GLX_RGBA_BIT = @as(c_int, 0x00000001);
pub const GLX_CONTEXT_RELEASE_BEHAVIOR_ARB = @as(c_int, 0x2097);
pub const GLX_CONTEXT_RELEASE_BEHAVIOR_NONE_ARB = @as(c_int, 0);
pub const GLX_CONTEXT_RELEASE_BEHAVIOR_FLUSH_ARB = @as(c_int, 0x2098);
pub const GLX_CONTEXT_MAJOR_VERSION_ARB = @as(c_int, 0x2091);
pub const GLX_CONTEXT_MINOR_VERSION_ARB = @as(c_int, 0x2092);
pub const GLX_CONTEXT_FLAGS_ARB = @as(c_int, 0x2094);
pub const GLX_CONTEXT_OPENGL_NO_ERROR_ARB = @as(c_int, 0x31B3);
pub const GLX_CONTEXT_PROFILE_MASK_ARB = __helpers.promoteIntLiteral(c_int, 0x9126, .hex);
pub const GLX_LOSE_CONTEXT_ON_RESET_ARB = __helpers.promoteIntLiteral(c_int, 0x8252, .hex);
pub const GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = __helpers.promoteIntLiteral(c_int, 0x8256, .hex);
pub const GLX_NO_RESET_NOTIFICATION_ARB = __helpers.promoteIntLiteral(c_int, 0x8261, .hex);
pub const GLX_RGBA_FLOAT_TYPE_ARB = @as(c_int, 0x20B9);
pub const GLX_RGBA_FLOAT_BIT_ARB = @as(c_int, 0x00000004);
pub const GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB = @as(c_int, 0x20B2);
pub const GLX_SAMPLE_BUFFERS_ARB = __helpers.promoteIntLiteral(c_int, 100000, .decimal);
pub const GLX_SAMPLES_ARB = __helpers.promoteIntLiteral(c_int, 100001, .decimal);
pub const GLX_SWAP_INTERVAL_EXT = @as(c_int, 0x20F1);
pub const GLX_LATE_SWAPS_TEAR_EXT = @as(c_int, 0x20F3);
pub const GLX_X_VISUAL_TYPE_EXT = @as(c_int, 0x22);
pub const GLX_NONE_EXT = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const GLX_DIRECT_COLOR_EXT = __helpers.promoteIntLiteral(c_int, 0x8003, .hex);
pub const GLX_VISUAL_CAVEAT_EXT = @as(c_int, 0x20);
pub const GLX_SLOW_VISUAL_EXT = __helpers.promoteIntLiteral(c_int, 0x8001, .hex);
pub const RTLD_NOW = @as(c_int, 0x00002);
pub const RTLD_GLOBAL = @as(c_int, 0x00100);
pub const shminfo = struct_shminfo;
