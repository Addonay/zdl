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
pub const __pid_t = c_int;
pub const __time_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const pid_t = __pid_t;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn gamma(f64) f64;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_sqrtf_REAL(x: f32) f32;
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
pub extern fn SDL_LoadFile_REAL(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB: c_int = 286261504;
pub const SDL_PIXELFORMAT_INDEX1MSB: c_int = 287310080;
pub const SDL_PIXELFORMAT_INDEX4LSB: c_int = 303039488;
pub const SDL_PIXELFORMAT_INDEX4MSB: c_int = 304088064;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
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
pub extern fn SDL_GetPixelFormatForMasks_REAL(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) SDL_PixelFormat;
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
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
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
pub extern fn SDL_GetDisplays_REAL(count: [*c]c_int) [*c]SDL_DisplayID;
pub const SDL_EVENT_DISPLAY_ADDED: c_int = 338;
pub const SDL_EVENT_DISPLAY_MOVED: c_int = 340;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
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
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
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
pub extern fn SDL_AddVideoDisplay(display: [*c]const SDL_VideoDisplay, send_event: bool) SDL_DisplayID;
pub extern fn SDL_DelVideoDisplay(display: SDL_DisplayID, send_event: bool) void;
pub extern fn SDL_AddFullscreenDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) bool;
pub extern fn SDL_SetDesktopDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) void;
pub extern fn SDL_SetDisplayContentScale(display: [*c]SDL_VideoDisplay, scale: f32) void;
pub extern fn SDL_SetDisplayHDRProperties(display: [*c]SDL_VideoDisplay, HDR: [*c]const SDL_HDROutputProperties) void;
pub extern fn SDL_GetVideoDisplay(display: SDL_DisplayID) [*c]SDL_VideoDisplay;
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
pub const XPixmapFormatValues = extern struct {
    depth: c_int = 0,
    bits_per_pixel: c_int = 0,
    scanline_pad: c_int = 0,
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
pub const XrmValue = extern struct {
    size: c_uint = 0,
    addr: XPointer = null,
};
pub const XrmDatabase = ?*struct__XrmHashBucketRec;
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
pub const Rotation = c_ushort;
pub const SubpixelOrder = c_ushort;
pub const Connection = c_ushort;
pub const pointer = ?*anyopaque;
pub const XFixed = c_int;
pub const struct__XTransform = extern struct {
    matrix: [3][3]XFixed = @import("std").mem.zeroes([3][3]XFixed),
};
pub const XTransform = struct__XTransform;
pub const RRCrtc = XID;
pub const XRRNotifyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    subtype: c_int = 0,
};
pub const XRROutputChangeNotifyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: [*c]Display = null,
    window: Window = 0,
    subtype: c_int = 0,
    output: RROutput = 0,
    crtc: RRCrtc = 0,
    mode: RRMode = 0,
    rotation: Rotation = 0,
    connection: Connection = 0,
    subpixel_order: SubpixelOrder = 0,
};
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
pub const struct__XRRCrtcTransformAttributes = extern struct {
    pendingTransform: XTransform = @import("std").mem.zeroes(XTransform),
    pendingFilter: [*c]u8 = null,
    pendingNparams: c_int = 0,
    pendingParams: [*c]XFixed = null,
    currentTransform: XTransform = @import("std").mem.zeroes(XTransform),
    currentFilter: [*c]u8 = null,
    currentNparams: c_int = 0,
    currentParams: [*c]XFixed = null,
};
pub const XRRCrtcTransformAttributes = struct__XRRCrtcTransformAttributes;
pub const SDL_DYNX11FN_XCloseDisplay = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XCloseDisplay: SDL_DYNX11FN_XCloseDisplay;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XGetVisualInfo = ?*const fn (a: [*c]Display, b: c_long, c: [*c]XVisualInfo, d: [*c]c_int) callconv(.c) [*c]XVisualInfo;
pub extern var X11_XGetVisualInfo: SDL_DYNX11FN_XGetVisualInfo;
pub const SDL_DYNX11FN_XGetWindowProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XGetWindowProperty: SDL_DYNX11FN_XGetWindowProperty;
pub const SDL_DYNX11FN_XGrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XGrabServer: SDL_DYNX11FN_XGrabServer;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XListPixmapFormats = ?*const fn (a: [*c]Display, b: [*c]c_int) callconv(.c) [*c]XPixmapFormatValues;
pub extern var X11_XListPixmapFormats: SDL_DYNX11FN_XListPixmapFormats;
pub const SDL_DYNX11FN_XMatchVisualInfo = ?*const fn (a: [*c]Display, b: c_int, c: c_int, d: c_int, e: [*c]XVisualInfo) callconv(.c) c_int;
pub extern var X11_XMatchVisualInfo: SDL_DYNX11FN_XMatchVisualInfo;
pub const SDL_DYNX11FN_XOpenDisplay = ?*const fn (a: [*c]const u8) callconv(.c) [*c]Display;
pub extern var X11_XOpenDisplay: SDL_DYNX11FN_XOpenDisplay;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub extern var X11_XSync: SDL_DYNX11FN_XSync;
pub const SDL_DYNX11FN_XUngrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XUngrabServer: SDL_DYNX11FN_XUngrabServer;
pub const SDL_DYNX11FN_XVisualIDFromVisual = ?*const fn (a: [*c]Visual) callconv(.c) VisualID;
pub extern var X11_XVisualIDFromVisual: SDL_DYNX11FN_XVisualIDFromVisual;
pub const SDL_DYNX11FN_XrmInitialize = ?*const fn () callconv(.c) void;
pub extern var X11_XrmInitialize: SDL_DYNX11FN_XrmInitialize;
pub const SDL_DYNX11FN_XResourceManagerString = ?*const fn (display: [*c]Display) callconv(.c) [*c]u8;
pub extern var X11_XResourceManagerString: SDL_DYNX11FN_XResourceManagerString;
pub const SDL_DYNX11FN_XrmGetStringDatabase = ?*const fn (data: [*c]u8) callconv(.c) XrmDatabase;
pub extern var X11_XrmGetStringDatabase: SDL_DYNX11FN_XrmGetStringDatabase;
pub const SDL_DYNX11FN_XrmDestroyDatabase = ?*const fn (db: XrmDatabase) callconv(.c) void;
pub extern var X11_XrmDestroyDatabase: SDL_DYNX11FN_XrmDestroyDatabase;
pub const SDL_DYNX11FN_XrmGetResource = ?*const fn (db: XrmDatabase, str_name: [*c]u8, str_class: [*c]u8, str_type_return: [*c][*c]u8, [*c]XrmValue) callconv(.c) c_int;
pub extern var X11_XrmGetResource: SDL_DYNX11FN_XrmGetResource;
pub const SDL_DYNX11FN_XRRQueryVersion = ?*const fn (dpy: [*c]Display, major_versionp: [*c]c_int, minor_versionp: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XRRQueryVersion: SDL_DYNX11FN_XRRQueryVersion;
pub const SDL_DYNX11FN_XRRQueryExtension = ?*const fn (dpy: [*c]Display, event_base_return: [*c]c_int, error_base_return: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XRRQueryExtension: SDL_DYNX11FN_XRRQueryExtension;
pub const SDL_DYNX11FN_XRRSetScreenSize = ?*const fn (dpy: [*c]Display, window: Window, width: c_int, height: c_int, mmWidth: c_int, mmHeight: c_int) callconv(.c) void;
pub extern var X11_XRRSetScreenSize: SDL_DYNX11FN_XRRSetScreenSize;
pub const SDL_DYNX11FN_XRRGetScreenResources = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) [*c]XRRScreenResources;
pub extern var X11_XRRGetScreenResources: SDL_DYNX11FN_XRRGetScreenResources;
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
pub const SDL_DYNX11FN_XRRSetCrtcConfig = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, crtc: RRCrtc, timestamp: Time, x: c_int, y: c_int, mode: RRMode, rotation: Rotation, outputs: [*c]RROutput, noutputs: c_int) callconv(.c) c_int;
pub extern var X11_XRRSetCrtcConfig: SDL_DYNX11FN_XRRSetCrtcConfig;
pub const SDL_DYNX11FN_XRRListOutputProperties = ?*const fn (dpy: [*c]Display, output: RROutput, nprop: [*c]c_int) callconv(.c) [*c]Atom;
pub extern var X11_XRRListOutputProperties: SDL_DYNX11FN_XRRListOutputProperties;
pub const SDL_DYNX11FN_XRRGetOutputProperty = ?*const fn (dpy: [*c]Display, output: RROutput, property: Atom, offset: c_long, length: c_long, _delete: c_int, pending: c_int, req_type: Atom, actual_type: [*c]Atom, actual_format: [*c]c_int, nitems: [*c]c_ulong, bytes_after: [*c]c_ulong, prop: [*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XRRGetOutputProperty: SDL_DYNX11FN_XRRGetOutputProperty;
pub const SDL_DYNX11FN_XRRGetOutputPrimary = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) RROutput;
pub extern var X11_XRRGetOutputPrimary: SDL_DYNX11FN_XRRGetOutputPrimary;
pub const SDL_DYNX11FN_XRRSelectInput = ?*const fn (dpy: [*c]Display, window: Window, mask: c_int) callconv(.c) void;
pub extern var X11_XRRSelectInput: SDL_DYNX11FN_XRRSelectInput;
pub const SDL_DYNX11FN_XRRGetCrtcTransform = ?*const fn (dpy: [*c]Display, crtc: RRCrtc, attributes: [*c][*c]XRRCrtcTransformAttributes) callconv(.c) c_int;
pub extern var X11_XRRGetCrtcTransform: SDL_DYNX11FN_XRRGetCrtcTransform;
pub extern var SDL_X11_HAVE_XRANDR: c_int;
pub extern fn X11_GetXsettingsClientIntKey(client: ?*XSettingsClient, key: [*c]const u8, fallback_value: c_int) c_int;
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
pub extern fn X11_UseDirectColorVisuals() bool;
pub const uchar = u8;
const struct_unnamed_86 = extern struct {
    bits_per_primary: c_int = 0,
    interface: Interface = @import("std").mem.zeroes(Interface),
    rgb444: c_int = 0,
    ycrcb444: c_int = 0,
    ycrcb422: c_int = 0,
};
const struct_unnamed_87 = extern struct {
    video_signal_level: f64 = 0,
    sync_signal_level: f64 = 0,
    total_signal_level: f64 = 0,
    blank_to_black: c_int = 0,
    separate_hv_sync: c_int = 0,
    composite_sync_on_h: c_int = 0,
    composite_sync_on_green: c_int = 0,
    serration_on_vsync: c_int = 0,
    color_type: ColorType = @import("std").mem.zeroes(ColorType),
};
const union_unnamed_85 = extern union {
    digital: struct_unnamed_86,
    analog: struct_unnamed_87,
};
pub const struct_Timing = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    frequency: c_int = 0,
};
pub const Timing = struct_Timing;
const struct_unnamed_89 = extern struct {
    bipolar: c_int = 0,
    serrations: c_int = 0,
    sync_on_green: c_int = 0,
};
const struct_unnamed_90 = extern struct {
    composite: c_int = 0,
    serrations: c_int = 0,
    negative_vsync: c_int = 0,
    negative_hsync: c_int = 0,
};
const union_unnamed_88 = extern union {
    analog: struct_unnamed_89,
    digital: struct_unnamed_90,
};
pub const struct_DetailedTiming = extern struct {
    pixel_clock: c_int = 0,
    h_addr: c_int = 0,
    h_blank: c_int = 0,
    h_sync: c_int = 0,
    h_front_porch: c_int = 0,
    v_addr: c_int = 0,
    v_blank: c_int = 0,
    v_sync: c_int = 0,
    v_front_porch: c_int = 0,
    width_mm: c_int = 0,
    height_mm: c_int = 0,
    right_border: c_int = 0,
    top_border: c_int = 0,
    interlaced: c_int = 0,
    stereo: StereoType = @import("std").mem.zeroes(StereoType),
    digital_sync: c_int = 0,
    ad: union_unnamed_88 = @import("std").mem.zeroes(union_unnamed_88),
};
pub const DetailedTiming = struct_DetailedTiming;
pub const struct_MonitorInfo = extern struct {
    checksum: c_int = 0,
    manufacturer_code: [4]u8 = @import("std").mem.zeroes([4]u8),
    product_code: c_int = 0,
    serial_number: c_uint = 0,
    production_week: c_int = 0,
    production_year: c_int = 0,
    model_year: c_int = 0,
    major_version: c_int = 0,
    minor_version: c_int = 0,
    is_digital: c_int = 0,
    ad: union_unnamed_85 = @import("std").mem.zeroes(union_unnamed_85),
    width_mm: c_int = 0,
    height_mm: c_int = 0,
    aspect_ratio: f64 = 0,
    gamma: f64 = 0,
    standby: c_int = 0,
    @"suspend": c_int = 0,
    active_off: c_int = 0,
    srgb_is_standard: c_int = 0,
    preferred_timing_includes_native: c_int = 0,
    continuous_frequency: c_int = 0,
    red_x: f64 = 0,
    red_y: f64 = 0,
    green_x: f64 = 0,
    green_y: f64 = 0,
    blue_x: f64 = 0,
    blue_y: f64 = 0,
    white_x: f64 = 0,
    white_y: f64 = 0,
    min_luminance: f64 = 0,
    max_luminance: f64 = 0,
    max_frame_average_luminance: f64 = 0,
    established: [24]Timing = @import("std").mem.zeroes([24]Timing),
    standard: [8]Timing = @import("std").mem.zeroes([8]Timing),
    n_detailed_timings: c_int = 0,
    detailed_timings: [4]DetailedTiming = @import("std").mem.zeroes([4]DetailedTiming),
    dsc_serial_number: [14]u8 = @import("std").mem.zeroes([14]u8),
    dsc_product_name: [14]u8 = @import("std").mem.zeroes([14]u8),
    dsc_string: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const MonitorInfo = struct_MonitorInfo;
pub const Interface = c_uint;
pub const ColorType = c_uint;
pub const StereoType = c_uint;
pub extern fn decode_edid(data: [*c]const uchar, size: usize) [*c]MonitorInfo;
pub extern fn SDL_SendDisplayEvent(display: [*c]SDL_VideoDisplay, displayevent: SDL_EventType, data1: c_int, data2: c_int) void;
pub export fn X11_GetGlobalContentScale(display: [*c]Display, client: ?*XSettingsClient) f32 {
    @setEvalBranchQuota(100000);
    var scale_factor: f64 = 0.0;
    _ = &scale_factor;
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_X11_SCALING_FACTOR");
    _ = &hint;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        var value: f64 = SDL_atof_REAL(hint);
        _ = &value;
        if ((value >= @as(f64, @floatCast(@as(f32, 1.0)))) and (value <= @as(f64, @floatCast(@as(f32, 10.0))))) {
            scale_factor = value;
        }
    }
    if (scale_factor <= @as(f64, 0.0)) {
        var status: c_int = undefined;
        _ = &status;
        var real_format: c_int = undefined;
        _ = &real_format;
        var real_type: Atom = undefined;
        _ = &real_type;
        var res_mgr: Atom = undefined;
        _ = &res_mgr;
        var items_read: c_ulong = undefined;
        _ = &items_read;
        var items_left: c_ulong = undefined;
        _ = &items_left;
        var resource_manager: [*c]u8 = undefined;
        _ = &resource_manager;
        var owns_resource_manager: bool = @"false" != 0;
        _ = &owns_resource_manager;
        X11_XrmInitialize.?();
        res_mgr = X11_XInternAtom.?(display, "RESOURCE_MANAGER", False);
        status = X11_XGetWindowProperty.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, res_mgr, 0, 8192, False, @as(Atom, @bitCast(@as(c_long, @as(c_int, 31)))), &real_type, &real_format, &items_read, &items_left, @ptrCast(@alignCast(&resource_manager)));
        if ((status == Success) and (resource_manager != null)) {
            owns_resource_manager = @"true" != 0;
        } else {
            resource_manager = X11_XResourceManagerString.?(display);
        }
        if (resource_manager != null) {
            var db: XrmDatabase = undefined;
            _ = &db;
            var value: XrmValue = undefined;
            _ = &value;
            var @"type": [*c]u8 = undefined;
            _ = &@"type";
            db = X11_XrmGetStringDatabase.?(resource_manager);
            if (X11_XrmGetResource.?(db, @as([*c]u8, @as([*c]u8, @constCast("Xft.dpi"))), @as([*c]u8, @as([*c]u8, @constCast("String"))), &@"type", &value) != 0) {
                if (((value.addr != null) and (@"type" != null)) and (SDL_strcmp_REAL(@"type", "String") == @as(c_int, 0))) {
                    var dpi: c_int = SDL_atoi_REAL(value.addr);
                    _ = &dpi;
                    scale_factor = @as(f64, @floatFromInt(dpi)) / @as(f64, 96.0);
                }
            }
            X11_XrmDestroyDatabase.?(db);
            if (owns_resource_manager) {
                _ = X11_XFree.?(@ptrCast(@alignCast(resource_manager)));
            }
        }
    }
    if (scale_factor <= @as(f64, 0.0)) {
        scale_factor = @floatFromInt(X11_GetXsettingsClientIntKey(client, "Gdk/WindowScalingFactor", -@as(c_int, 1)));
        if (scale_factor <= @as(f64, 0.0)) {
            var dpi: c_int = X11_GetXsettingsClientIntKey(client, "Xft/DPI", -@as(c_int, 1));
            _ = &dpi;
            if (dpi > @as(c_int, 0)) {
                scale_factor = @as(f64, @floatFromInt(dpi)) / @as(f64, 1024.0);
                scale_factor /= 96.0;
            }
        }
    }
    if (scale_factor <= @as(f64, 0.0)) {
        var scale_str: [*c]const u8 = SDL_getenv_REAL("GDK_SCALE");
        _ = &scale_str;
        if (scale_str != null) {
            scale_factor = @floatFromInt(SDL_atoi_REAL(scale_str));
        }
    }
    if (scale_factor <= @as(f64, 0.0)) {
        scale_factor = 1.0;
    }
    return @floatCast(scale_factor);
}
pub export fn X11_GetGlobalContentScaleForDevice(_this: [*c]SDL_VideoDevice) f32 {
    @setEvalBranchQuota(100000);
    return X11_GetGlobalContentScale(_this.*.internal.*.display, _this.*.internal.*.xsettings_data.xsettings);
}
pub fn get_visualinfo(display: [*c]Display, screen: c_int, vinfo: [*c]XVisualInfo) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var visual_id: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_X11_VISUALID");
    _ = &visual_id;
    var depth: c_int = undefined;
    _ = &depth;
    if ((visual_id != null) and (@as(c_int, visual_id.*) != 0)) {
        var vi: [*c]XVisualInfo = undefined;
        _ = &vi;
        var template: XVisualInfo = undefined;
        _ = &template;
        var nvis: c_int = undefined;
        _ = &nvis;
        _ = memset(@ptrCast(@alignCast(&template)), 0, @sizeOf(@TypeOf(template)));
        template.visualid = @bitCast(@as(c_long, SDL_strtol_REAL(visual_id, null, 0)));
        vi = X11_XGetVisualInfo.?(display, VisualIDMask, &template, &nvis);
        if (vi != null) {
            vinfo.* = vi.*;
            _ = X11_XFree.?(@ptrCast(@alignCast(vi)));
            return @"true" != 0;
        }
    }
    depth = (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root_depth;
    if ((((X11_UseDirectColorVisuals() and (X11_XMatchVisualInfo.?(display, screen, depth, DirectColor, vinfo) != 0)) or (X11_XMatchVisualInfo.?(display, screen, depth, TrueColor, vinfo) != 0)) or (X11_XMatchVisualInfo.?(display, screen, depth, PseudoColor, vinfo) != 0)) or (X11_XMatchVisualInfo.?(display, screen, depth, StaticColor, vinfo) != 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn X11_GetVisualInfoFromVisual(display: [*c]Display, visual: [*c]Visual, vinfo: [*c]XVisualInfo) bool {
    @setEvalBranchQuota(100000);
    var vi: [*c]XVisualInfo = undefined;
    _ = &vi;
    var nvis: c_int = undefined;
    _ = &nvis;
    vinfo.*.visualid = X11_XVisualIDFromVisual.?(visual);
    vi = X11_XGetVisualInfo.?(display, VisualIDMask, vinfo, &nvis);
    if (vi != null) {
        vinfo.* = vi.*;
        _ = X11_XFree.?(@ptrCast(@alignCast(vi)));
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn X11_GetPixelFormatFromVisualInfo(display: [*c]Display, vinfo: [*c]XVisualInfo) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    var bpp: c_int = undefined;
    _ = &bpp;
    var Rmask: Uint32 = undefined;
    _ = &Rmask;
    var Gmask: Uint32 = undefined;
    _ = &Gmask;
    var Bmask: Uint32 = undefined;
    _ = &Bmask;
    var Amask: Uint32 = undefined;
    _ = &Amask;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]XPixmapFormatValues = undefined;
    _ = &p;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((vinfo.*.class == DirectColor) or (vinfo.*.class == TrueColor)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                Rmask = @truncate(vinfo.*.visual.*.red_mask);
                Gmask = @truncate(vinfo.*.visual.*.green_mask);
                Bmask = @truncate(vinfo.*.visual.*.blue_mask);
                if (vinfo.*.depth == @as(c_int, 32)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                if ((vinfo.*.class == PseudoColor) or (vinfo.*.class == StaticColor)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            4 => {
                Amask = @as(c_uint, 4294967295) & ~((Rmask | Gmask) | Bmask);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                Amask = 0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                bpp = vinfo.*.depth;
                if (bpp == @as(c_int, 24)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                p = X11_XListPixmapFormats.?(display, &n);
                if (p != null) {
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
                return SDL_GetPixelFormatForMasks_REAL(bpp, Rmask, Gmask, Bmask, Amask);
            },
            10 => {
                i = 0;
                {
                    sdl_pc = 13;
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
                if (i < n) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if (p[@bitCast(@as(isize, @intCast(i)))].depth == @as(c_int, 24)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
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
                _ = X11_XFree.?(@ptrCast(@alignCast(p)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                bpp = p[@bitCast(@as(isize, @intCast(i)))].bits_per_pixel;
                {
                    sdl_pc = 16;
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
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                switch (vinfo.*.depth) {
                    @as(c_int, 8) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                return SDL_PIXELFORMAT_UNKNOWN;
            },
            23 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                return SDL_PIXELFORMAT_INDEX8;
            },
            25 => {
                if (@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.bitmap_bit_order == LSBFirst) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                return SDL_PIXELFORMAT_INDEX4LSB;
            },
            27 => {
                return SDL_PIXELFORMAT_INDEX4MSB;
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.bitmap_bit_order == LSBFirst) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                return SDL_PIXELFORMAT_INDEX1LSB;
            },
            31 => {
                return SDL_PIXELFORMAT_INDEX1MSB;
            },
            32 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn X11_AddGenericDisplay(_this: [*c]SDL_VideoDevice, send_event: bool) callconv(.c) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var dpy: [*c]Display = data.*.display;
    _ = &dpy;
    const default_screen: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.default_screen;
    _ = &default_screen;
    var screen: [*c]Screen = &@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(default_screen)))];
    _ = &screen;
    var scanline_pad: c_int = undefined;
    _ = &scanline_pad;
    var n: c_int = undefined;
    _ = &n;
    var i: c_int = undefined;
    _ = &i;
    var modedata: [*c]SDL_DisplayModeData = undefined;
    _ = &modedata;
    var displaydata: [*c]SDL_DisplayData = undefined;
    _ = &displaydata;
    var mode: SDL_DisplayMode = undefined;
    _ = &mode;
    var pixmapformats: [*c]XPixmapFormatValues = undefined;
    _ = &pixmapformats;
    var pixelformat: Uint32 = undefined;
    _ = &pixelformat;
    var vinfo: XVisualInfo = undefined;
    _ = &vinfo;
    var display: SDL_VideoDisplay = undefined;
    _ = &display;
    if (!get_visualinfo(dpy, default_screen, &vinfo)) {
        return @intFromBool(SDL_SetError_REAL("Failed to find an X11 visual for the primary display"));
    }
    pixelformat = X11_GetPixelFormatFromVisualInfo(dpy, &vinfo);
    if (!((pixelformat != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((pixelformat >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and ((((((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX1)) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX2))) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX4))) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX8)))) {
        return @intFromBool(SDL_SetError_REAL("Palettized video modes are no longer supported"));
    }
    _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
    mode.w = screen.*.width;
    mode.h = screen.*.height;
    mode.format = pixelformat;
    displaydata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(displaydata.*)))));
    if (!(displaydata != null)) {
        return @"false";
    }
    modedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayModeData))));
    if (!(modedata != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(displaydata)));
        return @"false";
    }
    mode.internal = modedata;
    displaydata.*.screen = default_screen;
    displaydata.*.visual = vinfo.visual;
    displaydata.*.depth = vinfo.depth;
    scanline_pad = @bitCast(@as(c_uint, @truncate((if ((pixelformat != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((pixelformat >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) @as(Uint32, @bitCast(@as(c_int, if ((((((pixelformat == @as(Uint32, SDL_PIXELFORMAT_YUY2)) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_UYVY))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_YVYU))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_P010))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_I0FL))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1)))) else (pixelformat >> @intCast(@as(Uint32, 0))) & @as(Uint32, 255)) *% @as(Uint32, 8))));
    pixmapformats = X11_XListPixmapFormats.?(dpy, &n);
    if (pixmapformats != null) {
        {
            i = 0;
            while (i < n) : (i += 1) {
                if (pixmapformats[@bitCast(@as(isize, @intCast(i)))].depth == vinfo.depth) {
                    scanline_pad = pixmapformats[@bitCast(@as(isize, @intCast(i)))].scanline_pad;
                    break;
                }
            }
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(pixmapformats)));
    }
    displaydata.*.scanline_pad = scanline_pad;
    displaydata.*.x = 0;
    displaydata.*.y = 0;
    displaydata.*.use_xrandr = @"false" != 0;
    _ = memset(@ptrCast(@alignCast(&display)), 0, @sizeOf(@TypeOf(display)));
    display.name = @as([*c]u8, @as([*c]u8, @constCast("Generic X11 Display")));
    display.desktop_mode = mode;
    display.internal = displaydata;
    display.content_scale = X11_GetGlobalContentScaleForDevice(_this);
    return SDL_AddVideoDisplay(&display, send_event);
}
pub fn X11_RemoveGenericDisplay(_: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var displays: [*c]SDL_DisplayID = SDL_GetDisplays_REAL(null);
    _ = &displays;
    if (displays != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (displays[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                _ = &display;
                var displaydata: [*c]const SDL_DisplayData = display.*.internal;
                _ = &displaydata;
                if (!(displaydata.*.xrandr_output != 0)) {
                    SDL_DelVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))], @"true" != 0);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(displays)));
    }
}
pub fn CheckXRandR(display: [*c]Display, major: [*c]c_int, minor: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    major.* = blk: {
        const tmp = @as(c_int, 0);
        minor.* = tmp;
        break :blk tmp;
    };
    if (!SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_XRANDR", @"true" != 0)) {
        return @"false" != 0;
    }
    if (!(SDL_X11_HAVE_XRANDR != 0)) {
        return @"false" != 0;
    }
    major.* = 1;
    minor.* = 3;
    if (!(X11_XRRQueryVersion.?(display, major, minor) != 0)) {
        major.* = blk: {
            const tmp = @as(c_int, 0);
            minor.* = tmp;
            break :blk tmp;
        };
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn CalculateXRandRRefreshRate(info: [*c]const XRRModeInfo, numerator: [*c]c_int, denominator: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vTotal: c_uint = info.*.vTotal;
    _ = &vTotal;
    if ((info.*.modeFlags & @as(XRRModeFlags, RR_DoubleScan)) != 0) {
        vTotal *%= 2;
    }
    if ((info.*.modeFlags & @as(XRRModeFlags, RR_Interlace)) != 0) {
        vTotal /= 2;
    }
    if ((info.*.hTotal != 0) and (vTotal != 0)) {
        numerator.* = @bitCast(@as(c_uint, @truncate(info.*.dotClock)));
        denominator.* = @bitCast(@as(c_uint, @truncate(info.*.hTotal *% vTotal)));
    } else {
        numerator.* = 0;
        denominator.* = 0;
    }
}
pub fn SetXRandRModeInfo(display: [*c]Display, res: [*c]XRRScreenResources, crtc: RRCrtc, modeID: RRMode, mode: [*c]SDL_DisplayMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < res.*.nmode) : (i += 1) {
            var info: [*c]const XRRModeInfo = &res.*.modes[@bitCast(@as(isize, @intCast(i)))];
            _ = &info;
            if (info.*.id == modeID) {
                var crtcinfo: [*c]XRRCrtcInfo = undefined;
                _ = &crtcinfo;
                var rotation: Rotation = 0;
                _ = &rotation;
                var scale_w: XFixed = 65536;
                _ = &scale_w;
                var scale_h: XFixed = 65536;
                _ = &scale_h;
                var attr: [*c]XRRCrtcTransformAttributes = undefined;
                _ = &attr;
                crtcinfo = X11_XRRGetCrtcInfo.?(display, res, crtc);
                if (crtcinfo != null) {
                    rotation = crtcinfo.*.rotation;
                    X11_XRRFreeCrtcInfo.?(crtcinfo);
                }
                if ((X11_XRRGetCrtcTransform.?(display, crtc, &attr) != 0) and (attr != null)) {
                    scale_w = attr.*.currentTransform.matrix[@as(c_int, 0)][@as(c_int, 0)];
                    scale_h = attr.*.currentTransform.matrix[@as(c_int, 1)][@as(c_int, 1)];
                    _ = X11_XFree.?(@ptrCast(@alignCast(attr)));
                }
                if ((@as(c_int, rotation) & ((@as(c_int, 1) << @intCast(@as(c_int, 1))) | (@as(c_int, 1) << @intCast(@as(c_int, 3))))) != 0) {
                    mode.*.w = @bitCast(@as(c_uint, @truncate(((info.*.height *% @as(c_uint, @bitCast(@as(c_int, scale_w)))) +% @as(c_uint, 65535)) >> @intCast(@as(c_uint, 16)))));
                    mode.*.h = @bitCast(@as(c_uint, @truncate(((info.*.width *% @as(c_uint, @bitCast(@as(c_int, scale_h)))) +% @as(c_uint, 65535)) >> @intCast(@as(c_uint, 16)))));
                } else {
                    mode.*.w = @bitCast(@as(c_uint, @truncate(((info.*.width *% @as(c_uint, @bitCast(@as(c_int, scale_w)))) +% @as(c_uint, 65535)) >> @intCast(@as(c_uint, 16)))));
                    mode.*.h = @bitCast(@as(c_uint, @truncate(((info.*.height *% @as(c_uint, @bitCast(@as(c_int, scale_h)))) +% @as(c_uint, 65535)) >> @intCast(@as(c_uint, 16)))));
                }
                CalculateXRandRRefreshRate(info, &mode.*.refresh_rate_numerator, &mode.*.refresh_rate_denominator);
                mode.*.internal.*.xrandr_mode = modeID;
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn GetRootWindowCardinalProperty(dpy: [*c]Display, screen: c_int, name: [*c]const u8, value: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var atom: Atom = undefined;
    _ = &atom;
    var real_format: c_int = undefined;
    _ = &real_format;
    var real_type: Atom = undefined;
    _ = &real_type;
    var items_read: c_ulong = undefined;
    _ = &items_read;
    var items_left: c_ulong = undefined;
    _ = &items_left;
    var propdata: [*c]u8 = undefined;
    _ = &propdata;
    var status: c_int = undefined;
    _ = &status;
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                atom = X11_XInternAtom.?(dpy, name, False);
                if (atom == @as(Atom, None)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                items_read = 0;
                items_left = 0;
                propdata = null;
                result = @"false" != 0;
                status = X11_XGetWindowProperty.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, atom, 0, 1024, False, AnyPropertyType, &real_type, &real_format, &items_read, &items_left, &propdata);
                if ((status == Success) and (propdata != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if ((real_type == @as(Atom, @bitCast(@as(c_long, @as(c_int, 6))))) and (items_read > @as(c_ulong, 0))) {
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
                return result;
            },
            7 => {
                switch (real_format) {
                    @as(c_int, 8) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                result = @"true" != 0;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                value.* = propdata[@as(c_int, 0)];
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                value.* = @bitCast(@as(c_int, @as(c_int, propdata[@as(c_int, 0)]) | (@as(c_int, propdata[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                value.* = @bitCast(@as(c_int, ((@as(c_int, propdata[@as(c_int, 0)]) | (@as(c_int, propdata[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | (@as(c_int, propdata[@as(c_int, 2)]) << @intCast(@as(c_int, 16)))) | (@as(c_int, propdata[@as(c_int, 3)]) << @intCast(@as(c_int, 24)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GetRootWindowBoolProperty(dpy: [*c]Display, screen: c_int, name: [*c]const u8, value: [*c]bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var v: Uint32 = undefined;
    _ = &v;
    if (GetRootWindowCardinalProperty(dpy, screen, name, &v)) {
        value.* = v != @as(Uint32, 0);
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn GetRootWindowFloatProperty(dpy: [*c]Display, screen: c_int, name: [*c]const u8, value: [*c]f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var v: Uint32 = undefined;
    _ = &v;
    if (GetRootWindowCardinalProperty(dpy, screen, name, &v)) {
        _ = memcpy(@ptrCast(@alignCast(value)), @ptrCast(@alignCast(&v)), @sizeOf(@TypeOf(v)));
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn GetGamescopeSDRWhiteLevel(arg_dpy: [*c]Display, arg_screen: c_int) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    var dpy = arg_dpy;
    _ = &dpy;
    var screen = arg_screen;
    _ = &screen;
    dpy = X11_XOpenDisplay.?(":0");
    screen = 0;
    if (!(dpy != null)) {
        return 0.0;
    }
    var SDR_white_level: f32 = 0.0;
    _ = &SDR_white_level;
    var external_display: bool = @"false" != 0;
    _ = &external_display;
    if (GetRootWindowBoolProperty(dpy, screen, "GAMESCOPE_DISPLAY_IS_EXTERNAL", &external_display) and external_display) {
        _ = GetRootWindowFloatProperty(dpy, screen, "GAMESCOPE_SDR_ON_HDR_CONTENT_BRIGHTNESS", &SDR_white_level);
    } else {
        SDR_white_level = 500.0;
    }
    _ = X11_XCloseDisplay.?(dpy);
    return SDR_white_level;
}
pub fn GetMonitorInfo(dpy: [*c]Display, screen: c_int, output: RROutput, gamescope: [*c]bool) callconv(.c) [*c]MonitorInfo {
    @setEvalBranchQuota(100000);
    var info: [*c]MonitorInfo = null;
    _ = &info;
    var real_format: c_int = undefined;
    _ = &real_format;
    var real_type: Atom = undefined;
    _ = &real_type;
    var items_read: c_ulong = 0;
    _ = &items_read;
    var items_left: c_ulong = 0;
    _ = &items_left;
    var propdata: [*c]u8 = null;
    _ = &propdata;
    var status: c_int = undefined;
    _ = &status;
    gamescope.* = @"false" != 0;
    if (!(info != null)) {
        var GAMESCOPE_DISPLAY_EDID_PATH: Atom = X11_XInternAtom.?(dpy, "GAMESCOPE_DISPLAY_EDID_PATH", False);
        _ = &GAMESCOPE_DISPLAY_EDID_PATH;
        if (GAMESCOPE_DISPLAY_EDID_PATH != @as(Atom, None)) {
            status = X11_XGetWindowProperty.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, GAMESCOPE_DISPLAY_EDID_PATH, 0, 1024, False, AnyPropertyType, &real_type, &real_format, &items_read, &items_left, &propdata);
            if ((status == Success) and (propdata != null)) {
                var size: usize = 0;
                _ = &size;
                var data: ?*anyopaque = SDL_LoadFile_REAL(@ptrCast(@alignCast(propdata)), &size);
                _ = &data;
                if (data != null) {
                    info = decode_edid(@ptrCast(@alignCast(data)), size);
                    if (info != null) {
                        gamescope.* = @"true" != 0;
                    }
                    SDL_free_REAL(data);
                }
            }
            if (propdata != null) {
                _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
            }
        }
    }
    if (!(info != null)) {
        var EDID: Atom = X11_XInternAtom.?(dpy, "EDID", False);
        _ = &EDID;
        if (EDID != @as(Atom, None)) {
            var nprop: c_int = 0;
            _ = &nprop;
            var props: [*c]Atom = X11_XRRListOutputProperties.?(dpy, output, &nprop);
            _ = &props;
            {
                var i: c_int = 0;
                _ = &i;
                while (i < nprop) : (i += 1) {
                    if (props[@bitCast(@as(isize, @intCast(i)))] == EDID) {
                        status = X11_XRRGetOutputProperty.?(dpy, output, props[@bitCast(@as(isize, @intCast(i)))], 0, 128, False, False, AnyPropertyType, &real_type, &real_format, &items_read, &items_left, &propdata);
                        if ((status == Success) and (propdata != null)) {
                            info = decode_edid(propdata, items_read);
                        }
                        if (propdata != null) {
                            _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
                        }
                        break;
                    }
                }
            }
            if (props != null) {
                _ = X11_XFree.?(@ptrCast(@alignCast(props)));
            }
        }
    }
    return info;
}
pub fn SetXRandRDisplayName(info: [*c]MonitorInfo, name: [*c]u8, namelen: usize, widthmm: c_ulong, heightmm: c_ulong) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (info != null) {
        _ = SDL_strlcpy_REAL(name, @ptrCast(@alignCast(&info.*.dsc_product_name)), namelen);
    }
    var inches: c_int = @intFromFloat((SDL_sqrtf_REAL(@floatFromInt((widthmm *% widthmm) +% (heightmm *% heightmm))) / @as(f32, 25.4)) + @as(f32, 0.5));
    _ = &inches;
    if ((@as(c_int, name.*) != 0) and (inches != 0)) {
        const len: usize = SDL_strlen_REAL(name);
        _ = &len;
        _ = SDL_snprintf_REAL(&name[len], namelen -% len, " %d\"", inches);
    }
}
pub fn X11_FillXRandRDisplayInfo(_this: [*c]SDL_VideoDevice, dpy: [*c]Display, screen: c_int, outputid: RROutput, res: [*c]XRRScreenResources, display: [*c]SDL_VideoDisplay, display_name: [*c]u8, display_name_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var output_info: [*c]XRROutputInfo = undefined;
    _ = &output_info;
    var display_x: c_int = undefined;
    _ = &display_x;
    var display_y: c_int = undefined;
    _ = &display_y;
    var display_mm_width: c_ulong = undefined;
    _ = &display_mm_width;
    var display_mm_height: c_ulong = undefined;
    _ = &display_mm_height;
    var displaydata: [*c]SDL_DisplayData = undefined;
    _ = &displaydata;
    var mode: SDL_DisplayMode = undefined;
    _ = &mode;
    var modedata: [*c]SDL_DisplayModeData = undefined;
    _ = &modedata;
    var modeID: RRMode = undefined;
    _ = &modeID;
    var output_crtc: RRCrtc = undefined;
    _ = &output_crtc;
    var crtc: [*c]XRRCrtcInfo = undefined;
    _ = &crtc;
    var vinfo: XVisualInfo = undefined;
    _ = &vinfo;
    var pixelformat: Uint32 = undefined;
    _ = &pixelformat;
    var pixmapformats: [*c]XPixmapFormatValues = undefined;
    _ = &pixmapformats;
    var scanline_pad: c_int = undefined;
    _ = &scanline_pad;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    if (!(display != null) or !(display_name != null)) {
        return @"false" != 0;
    }
    if (!get_visualinfo(dpy, screen, &vinfo)) {
        return @"false" != 0;
    }
    pixelformat = X11_GetPixelFormatFromVisualInfo(dpy, &vinfo);
    if (!((pixelformat != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((pixelformat >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) and ((((((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX1)) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX2))) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX4))) or (((pixelformat >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15)) == @as(Uint32, SDL_PIXELTYPE_INDEX8)))) {
        return @"false" != 0;
    }
    scanline_pad = @bitCast(@as(c_uint, @truncate((if ((pixelformat != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((pixelformat >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) @as(Uint32, @bitCast(@as(c_int, if ((((((pixelformat == @as(Uint32, SDL_PIXELFORMAT_YUY2)) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_UYVY))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_YVYU))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_P010))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_I0FL))) or (pixelformat == @as(Uint32, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1)))) else (pixelformat >> @intCast(@as(Uint32, 0))) & @as(Uint32, 255)) *% @as(Uint32, 8))));
    pixmapformats = X11_XListPixmapFormats.?(dpy, &n);
    if (pixmapformats != null) {
        {
            i = 0;
            while (i < n) : (i += 1) {
                if (pixmapformats[@bitCast(@as(isize, @intCast(i)))].depth == vinfo.depth) {
                    scanline_pad = pixmapformats[@bitCast(@as(isize, @intCast(i)))].scanline_pad;
                    break;
                }
            }
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(pixmapformats)));
    }
    output_info = X11_XRRGetOutputInfo.?(dpy, res, outputid);
    if ((!(output_info != null) or !(output_info.*.crtc != 0)) or (@as(c_int, output_info.*.connection) == RR_Disconnected)) {
        X11_XRRFreeOutputInfo.?(output_info);
        return @"false" != 0;
    }
    _ = SDL_strlcpy_REAL(display_name, output_info.*.name, display_name_size);
    display_mm_width = output_info.*.mm_width;
    display_mm_height = output_info.*.mm_height;
    output_crtc = output_info.*.crtc;
    X11_XRRFreeOutputInfo.?(output_info);
    crtc = X11_XRRGetCrtcInfo.?(dpy, res, output_crtc);
    if (!(crtc != null)) {
        return @"false" != 0;
    }
    _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
    modeID = crtc.*.mode;
    mode.w = @bitCast(@as(c_uint, @truncate(crtc.*.width)));
    mode.h = @bitCast(@as(c_uint, @truncate(crtc.*.height)));
    mode.format = pixelformat;
    display_x = crtc.*.x;
    display_y = crtc.*.y;
    X11_XRRFreeCrtcInfo.?(crtc);
    displaydata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(displaydata.*)))));
    if (!(displaydata != null)) {
        return @"false" != 0;
    }
    modedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayModeData))));
    if (!(modedata != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(displaydata)));
        return @"false" != 0;
    }
    modedata.*.xrandr_mode = modeID;
    mode.internal = modedata;
    displaydata.*.screen = screen;
    displaydata.*.visual = vinfo.visual;
    displaydata.*.depth = vinfo.depth;
    displaydata.*.scanline_pad = scanline_pad;
    displaydata.*.x = display_x;
    displaydata.*.y = display_y;
    displaydata.*.use_xrandr = @"true" != 0;
    displaydata.*.xrandr_output = outputid;
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&displaydata.*.connector_name)), display_name, @sizeOf(@TypeOf(displaydata.*.connector_name)));
    var gamescope: bool = @"false" != 0;
    _ = &gamescope;
    var info: [*c]MonitorInfo = GetMonitorInfo(dpy, screen, outputid, &gamescope);
    _ = &info;
    _ = SetXRandRModeInfo(dpy, res, output_crtc, modeID, &mode);
    SetXRandRDisplayName(info, display_name, display_name_size, display_mm_width, display_mm_height);
    _ = memset(@ptrCast(@alignCast(&display.*)), 0, @sizeOf(@TypeOf(display.*)));
    if (@as(c_int, display_name.*) != 0) {
        display.*.name = display_name;
    }
    display.*.desktop_mode = mode;
    display.*.content_scale = X11_GetGlobalContentScaleForDevice(_this);
    display.*.internal = displaydata;
    if (info != null) {
        var SDR_white_level: f32 = undefined;
        _ = &SDR_white_level;
        gamescope = @"false" != 0;
        if (gamescope) {
            SDR_white_level = GetGamescopeSDRWhiteLevel(dpy, screen);
        } else {
            SDR_white_level = 0.0;
        }
        if ((SDR_white_level > @as(f32, 0.0)) and (info.*.max_luminance > @as(f64, @floatCast(SDR_white_level)))) {
            display.*.HDR.HDR_headroom = @as(f32, @floatCast(info.*.max_luminance)) / SDR_white_level;
            display.*.HDR.SDR_white_level = SDR_white_level / SCRGB_NITS;
        }
        SDL_free_REAL(@ptrCast(@alignCast(info)));
    }
    return @"true" != 0;
}
pub fn X11_AddXRandRDisplay(_this: [*c]SDL_VideoDevice, dpy: [*c]Display, screen: c_int, outputid: RROutput, res: [*c]XRRScreenResources, send_event: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var display: SDL_VideoDisplay = undefined;
    _ = &display;
    var display_name: [128]u8 = undefined;
    _ = &display_name;
    if (!X11_FillXRandRDisplayInfo(_this, dpy, screen, outputid, res, &display, @ptrCast(@alignCast(&display_name)), @sizeOf(@TypeOf(display_name)))) {
        return @"true" != 0;
    }
    var displayID: SDL_DisplayID = SDL_AddVideoDisplay(&display, @"false" != 0);
    _ = &displayID;
    if (displayID == @as(SDL_DisplayID, 0)) {
        return @"false" != 0;
    }
    X11_RemoveGenericDisplay(_this);
    if (send_event) {
        SDL_SendDisplayEvent(SDL_GetVideoDisplay(displayID), SDL_EVENT_DISPLAY_ADDED, 0, 0);
    }
    return @"true" != 0;
}
pub fn X11_UpdateXRandRDisplay(_this: [*c]SDL_VideoDevice, dpy: [*c]Display, screen: c_int, outputid: RROutput, res: [*c]XRRScreenResources, existing_display: [*c]SDL_VideoDisplay) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var display: SDL_VideoDisplay = undefined;
    _ = &display;
    var display_name: [128]u8 = undefined;
    _ = &display_name;
    if (!X11_FillXRandRDisplayInfo(_this, dpy, screen, outputid, res, &display, @ptrCast(@alignCast(&display_name)), @sizeOf(@TypeOf(display_name)))) {
        return @"false" != 0;
    }
    SDL_SetDesktopDisplayMode(existing_display, &display.desktop_mode);
    if ((existing_display.*.internal.*.x != display.internal.*.x) or (existing_display.*.internal.*.y != display.internal.*.y)) {
        existing_display.*.internal.*.x = display.internal.*.x;
        existing_display.*.internal.*.y = display.internal.*.y;
        SDL_SendDisplayEvent(existing_display, SDL_EVENT_DISPLAY_MOVED, 0, 0);
    }
    SDL_SetDisplayContentScale(existing_display, display.content_scale);
    SDL_SetDisplayHDRProperties(existing_display, &display.HDR);
    SDL_free_REAL(@ptrCast(@alignCast(display.internal)));
    return @"true" != 0;
}
pub fn X11_GetScreenResources(dpy: [*c]Display, screen: c_int) callconv(.c) [*c]XRRScreenResources {
    @setEvalBranchQuota(100000);
    var res: [*c]XRRScreenResources = X11_XRRGetScreenResourcesCurrent.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root);
    _ = &res;
    if (!(res != null) or (res.*.noutput == @as(c_int, 0))) {
        if (res != null) {
            X11_XRRFreeScreenResources.?(res);
        }
        res = X11_XRRGetScreenResources.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root);
    }
    return res;
}
pub export fn X11_CheckDisplaysMoved(_this: [*c]SDL_VideoDevice, dpy: [*c]Display) void {
    @setEvalBranchQuota(100000);
    const screencount: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.nscreens;
    _ = &screencount;
    var displays: [*c]SDL_DisplayID = SDL_GetDisplays_REAL(null);
    _ = &displays;
    if (!(displays != null)) {
        return;
    }
    {
        var screen: c_int = 0;
        _ = &screen;
        while (screen < screencount) : (screen += 1) {
            var res: [*c]XRRScreenResources = X11_GetScreenResources(dpy, screen);
            _ = &res;
            if (!(res != null)) {
                continue;
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (displays[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                    _ = &display;
                    var displaydata: [*c]const SDL_DisplayData = display.*.internal;
                    _ = &displaydata;
                    if ((displaydata.*.xrandr_output != 0) and (@as(RROutput, @bitCast(@as(c_long, @intFromBool(displaydata.*.screen == screen)))) != 0)) {
                        _ = X11_UpdateXRandRDisplay(_this, dpy, screen, displaydata.*.xrandr_output, res, display);
                    }
                }
            }
            X11_XRRFreeScreenResources.?(res);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(displays)));
}
pub fn X11_CheckDisplaysRemoved(_: [*c]SDL_VideoDevice, dpy: [*c]Display) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const screencount: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.nscreens;
    _ = &screencount;
    var num_displays: c_int = 0;
    _ = &num_displays;
    var displays: [*c]SDL_DisplayID = SDL_GetDisplays_REAL(&num_displays);
    _ = &displays;
    if (!(displays != null)) {
        return;
    }
    {
        var screen: c_int = 0;
        _ = &screen;
        while (screen < screencount) : (screen += 1) {
            var res: [*c]XRRScreenResources = X11_GetScreenResources(dpy, screen);
            _ = &res;
            if (!(res != null)) {
                continue;
            }
            {
                var output: c_int = 0;
                _ = &output;
                while (output < res.*.noutput) : (output += 1) {
                    {
                        var i: c_int = 0;
                        _ = &i;
                        while (i < num_displays) : (i += 1) {
                            if (!(displays[@bitCast(@as(isize, @intCast(i)))] != 0)) {
                                continue;
                            }
                            var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                            _ = &display;
                            var displaydata: [*c]const SDL_DisplayData = display.*.internal;
                            _ = &displaydata;
                            if (displaydata.*.xrandr_output == res.*.outputs[@bitCast(@as(isize, @intCast(output)))]) {
                                displays[@bitCast(@as(isize, @intCast(i)))] = 0;
                                break;
                            }
                        }
                    }
                }
            }
            X11_XRRFreeScreenResources.?(res);
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < num_displays) : (i += 1) {
            if (displays[@bitCast(@as(isize, @intCast(i)))] != 0) {
                var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                _ = &display;
                var displaydata: [*c]const SDL_DisplayData = display.*.internal;
                _ = &displaydata;
                if (displaydata.*.xrandr_output != 0) {
                    SDL_DelVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))], @"true" != 0);
                }
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(displays)));
}
pub fn X11_HandleXRandROutputChange(_this: [*c]SDL_VideoDevice, ev: [*c]const XRROutputChangeNotifyEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var displays: [*c]SDL_DisplayID = undefined;
    _ = &displays;
    var display: [*c]SDL_VideoDisplay = null;
    _ = &display;
    var i: c_int = undefined;
    _ = &i;
    X11_CheckDisplaysRemoved(_this, ev.*.display);
    displays = SDL_GetDisplays_REAL(null);
    if (displays != null) {
        {
            i = 0;
            while (displays[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                var thisdisplay: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                _ = &thisdisplay;
                var displaydata: [*c]const SDL_DisplayData = thisdisplay.*.internal;
                _ = &displaydata;
                if (displaydata.*.xrandr_output == ev.*.output) {
                    display = thisdisplay;
                    break;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(displays)));
    }
    if (@as(c_int, ev.*.connection) == RR_Disconnected) {
        if (display != null) {
            var generic_display: SDL_DisplayID = 0;
            _ = &generic_display;
            if (_this.*.num_displays == @as(c_int, 1)) {
                generic_display = X11_AddGenericDisplay(_this, @"false" != 0);
            }
            SDL_DelVideoDisplay(display.*.id, @"true" != 0);
            if (generic_display != 0) {
                SDL_SendDisplayEvent(SDL_GetVideoDisplay(generic_display), SDL_EVENT_DISPLAY_ADDED, 0, 0);
            }
        }
        X11_CheckDisplaysMoved(_this, ev.*.display);
    } else if (@as(c_int, ev.*.connection) == RR_Connected) {
        if (!(display != null)) {
            var dpy: [*c]Display = ev.*.display;
            _ = &dpy;
            const screen: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.default_screen;
            _ = &screen;
            var res: [*c]XRRScreenResources = X11_GetScreenResources(dpy, screen);
            _ = &res;
            if (res != null) {
                _ = X11_AddXRandRDisplay(_this, dpy, screen, ev.*.output, res, @"true" != 0);
                X11_XRRFreeScreenResources.?(res);
            }
        }
        X11_CheckDisplaysMoved(_this, ev.*.display);
    }
}
pub export fn X11_HandleXRandREvent(_this: [*c]SDL_VideoDevice, xevent: [*c]const XEvent) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "X11_HandleXRandREvent".*;
    };
    _ = &static_local___func__;
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "xevent->type == (videodata->xrandr_event_base + 1)",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
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
                switch (@as([*c]const XRRNotifyEvent, @ptrCast(@alignCast(xevent))).*.subtype) {
                    RRNotify_OutputChange => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            4 => {
                if (!(xevent.*.type == (videodata.*.xrandr_event_base + RRNotify))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11modes.c", 959);
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
                {}
            },
            14 => {
                X11_HandleXRandROutputChange(_this, @ptrCast(@alignCast(xevent)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn X11_SortOutputsByPriorityHint(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var name_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_DISPLAY_PRIORITY");
    _ = &name_hint;
    if (name_hint != null) {
        var saveptr: [*c]u8 = undefined;
        _ = &saveptr;
        var str: [*c]u8 = SDL_strdup_REAL(name_hint);
        _ = &str;
        var sorted_list: [*c][*c]SDL_VideoDisplay = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]SDL_VideoDisplay) *% @as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays))))));
        _ = &sorted_list;
        if ((str != null) and (sorted_list != null)) {
            var sorted_index: c_int = 0;
            _ = &sorted_index;
            var token: [*c]const u8 = SDL_strtok_r_REAL(str, ",", &saveptr);
            _ = &token;
            while (token != null) {
                {
                    var i: c_int = 0;
                    _ = &i;
                    while (i < _this.*.num_displays) : (i += 1) {
                        var d: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                        _ = &d;
                        if (d != null) {
                            var data: [*c]SDL_DisplayData = d.*.internal;
                            _ = &data;
                            if (SDL_strcmp_REAL(token, @ptrCast(@alignCast(&data.*.connector_name))) == @as(c_int, 0)) {
                                sorted_list[
                                    @bitCast(@as(isize, @intCast(blk: {
                                        const ref = &sorted_index;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    })))
                                ] = d;
                                _this.*.displays[@bitCast(@as(isize, @intCast(i)))] = null;
                                break;
                            }
                        }
                    }
                }
                token = SDL_strtok_r_REAL(null, ",", &saveptr);
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (i < _this.*.num_displays) : (i += 1) {
                    if (_this.*.displays[@bitCast(@as(isize, @intCast(i)))] != null) {
                        sorted_list[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &sorted_index;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ] = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                    }
                }
            }
            _ = memcpy(@ptrCast(@alignCast(_this.*.displays)), @ptrCast(@alignCast(sorted_list)), @sizeOf([*c]SDL_VideoDisplay) *% @as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays))));
        }
        SDL_free_REAL(@ptrCast(@alignCast(str)));
        SDL_free_REAL(@ptrCast(@alignCast(sorted_list)));
    }
}
pub fn X11_InitModes_XRandR(_this: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var dpy: [*c]Display = data.*.display;
    _ = &dpy;
    const screencount: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.nscreens;
    _ = &screencount;
    const default_screen: c_int = @as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.default_screen;
    _ = &default_screen;
    var primary: RROutput = X11_XRRGetOutputPrimary.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(default_screen)))]).*.root);
    _ = &primary;
    var xrandr_error_base: c_int = 0;
    _ = &xrandr_error_base;
    var looking_for_primary: c_int = undefined;
    _ = &looking_for_primary;
    var output: c_int = undefined;
    _ = &output;
    var screen: c_int = undefined;
    _ = &screen;
    if (!(X11_XRRQueryExtension.?(dpy, &data.*.xrandr_event_base, &xrandr_error_base) != 0)) {
        return SDL_SetError_REAL("XRRQueryExtension failed");
    }
    {
        looking_for_primary = 1;
        while (looking_for_primary >= @as(c_int, 0)) : (looking_for_primary -= 1) {
            {
                screen = 0;
                while (screen < screencount) : (screen += 1) {
                    if ((looking_for_primary != 0) and (screen != default_screen)) {
                        continue;
                    }
                    var res: [*c]XRRScreenResources = X11_GetScreenResources(dpy, screen);
                    _ = &res;
                    if (!(res != null)) {
                        continue;
                    }
                    {
                        output = 0;
                        while (output < res.*.noutput) : (output += 1) {
                            if (((looking_for_primary != 0) and (res.*.outputs[@bitCast(@as(isize, @intCast(output)))] != primary)) or ((!(looking_for_primary != 0) and (screen == default_screen)) and (res.*.outputs[@bitCast(@as(isize, @intCast(output)))] == primary))) {
                                continue;
                            }
                            if (!X11_AddXRandRDisplay(_this, dpy, screen, res.*.outputs[@bitCast(@as(isize, @intCast(output)))], res, @"false" != 0)) {
                                break;
                            }
                        }
                    }
                    X11_XRRFreeScreenResources.?(res);
                    X11_XRRSelectInput.?(dpy, (&@as(_XPrivDisplay, @ptrCast(@alignCast(dpy))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, @truncate(@as(c_long, 1) << @intCast(@as(c_long, 2))));
                }
            }
        }
    }
    if (_this.*.num_displays == @as(c_int, 0)) {
        return SDL_SetError_REAL("No available displays");
    }
    X11_SortOutputsByPriorityHint(_this);
    return @"true" != 0;
}
pub fn X11_InitModes_StdXlib(_this: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (X11_AddGenericDisplay(_this, @"true" != 0) == @as(SDL_DisplayID, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn X11_InitModes(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    {
        var data: [*c]SDL_VideoData = _this.*.internal;
        _ = &data;
        var xrandr_major: c_int = undefined;
        _ = &xrandr_major;
        var xrandr_minor: c_int = undefined;
        _ = &xrandr_minor;
        if ((CheckXRandR(data.*.display, &xrandr_major, &xrandr_minor) and ((xrandr_major >= @as(c_int, 2)) or ((xrandr_major == @as(c_int, 1)) and (xrandr_minor >= @as(c_int, 3))))) and X11_InitModes_XRandR(_this)) {
            return @"true" != 0;
        }
    }
    return X11_InitModes_StdXlib(_this);
}
pub export fn X11_GetDisplayModes(_this: [*c]SDL_VideoDevice, sdl_display: [*c]SDL_VideoDisplay) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_DisplayData = sdl_display.*.internal;
    _ = &data;
    var mode: SDL_DisplayMode = undefined;
    _ = &mode;
    _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
    mode.format = sdl_display.*.desktop_mode.format;
    if (data.*.use_xrandr) {
        var display: [*c]Display = _this.*.internal.*.display;
        _ = &display;
        var res: [*c]XRRScreenResources = undefined;
        _ = &res;
        res = X11_XRRGetScreenResources.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.root);
        if (res != null) {
            var modedata: [*c]SDL_DisplayModeData = undefined;
            _ = &modedata;
            var output_info: [*c]XRROutputInfo = undefined;
            _ = &output_info;
            var i: c_int = undefined;
            _ = &i;
            output_info = X11_XRRGetOutputInfo.?(display, res, data.*.xrandr_output);
            if ((output_info != null) and (@as(c_int, output_info.*.connection) != RR_Disconnected)) {
                {
                    i = 0;
                    while (i < output_info.*.nmode) : (i += 1) {
                        modedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayModeData))));
                        if (!(modedata != null)) {
                            continue;
                        }
                        mode.internal = modedata;
                        if (!SetXRandRModeInfo(display, res, output_info.*.crtc, output_info.*.modes[@bitCast(@as(isize, @intCast(i)))], &mode) or !SDL_AddFullscreenDisplayMode(sdl_display, &mode)) {
                            SDL_free_REAL(@ptrCast(@alignCast(modedata)));
                        }
                    }
                }
            }
            X11_XRRFreeOutputInfo.?(output_info);
            X11_XRRFreeScreenResources.?(res);
        }
    }
    return @"true" != 0;
}
pub var PreXRRSetScreenSizeErrorHandler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = null;
pub fn SDL_XRRSetScreenSizeErrHandler(d: [*c]Display, e: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if ((@as(c_int, e.*.error_code) == BadMatch) or (@as(c_int, e.*.error_code) == BadValue)) {
        return 0;
    }
    return PreXRRSetScreenSizeErrorHandler.?(d, e);
}
pub export fn X11_SetDisplayMode(_this: [*c]SDL_VideoDevice, sdl_display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var data: [*c]SDL_DisplayData = undefined;
    _ = &data;
    var display: [*c]Display = undefined;
    _ = &display;
    var modedata: [*c]SDL_DisplayModeData = undefined;
    _ = &modedata;
    var mm_width: c_int = undefined;
    _ = &mm_width;
    var mm_height: c_int = undefined;
    _ = &mm_height;
    var res: [*c]XRRScreenResources = undefined;
    _ = &res;
    var output_info: [*c]XRROutputInfo = undefined;
    _ = &output_info;
    var crtc: [*c]XRRCrtcInfo = undefined;
    _ = &crtc;
    var status: c_int = undefined;
    _ = &status;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                viddata = _this.*.internal;
                data = sdl_display.*.internal;
                viddata.*.last_mode_change_deadline = SDL_GetTicks_REAL() +% @as(Uint64, @bitCast(@as(c_long, PENDING_FOCUS_TIME * @as(c_int, 2))));
                if (!viddata.*.is_xwayland) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                _ = X11_XUngrabServer.?(display);
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            2 => {
                X11_XRRFreeCrtcInfo.?(crtc);
                X11_XRRFreeOutputInfo.?(output_info);
                X11_XRRFreeScreenResources.?(res);
                if (status != Success) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            3 => {
                if (sdl_display.*.current_mode != mode) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                if (data.*.use_xrandr) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            6 => {
                data.*.mode_switch_deadline_ns = @truncate(@as(c_ulonglong, SDL_GetTicksNS_REAL()) +% @as(c_ulonglong, @bitCast(@as(c_longlong, SDL_NS_PER_SECOND * @as(c_longlong, 5)))));
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                data.*.mode_switch_deadline_ns = 0;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                display = viddata.*.display;
                modedata = mode.*.internal;
                res = X11_XRRGetScreenResources.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.root);
                if (!(res != null)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                return @"true" != 0;
            },
            12 => {
                return SDL_SetError_REAL("Couldn't get XRandR screen resources");
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                output_info = X11_XRRGetOutputInfo.?(display, res, data.*.xrandr_output);
                if (!(output_info != null) or (@as(c_int, output_info.*.connection) == RR_Disconnected)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                X11_XRRFreeScreenResources.?(res);
                return SDL_SetError_REAL("Couldn't get XRandR output info");
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                crtc = X11_XRRGetCrtcInfo.?(display, res, output_info.*.crtc);
                if (!(crtc != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                X11_XRRFreeOutputInfo.?(output_info);
                X11_XRRFreeScreenResources.?(res);
                return SDL_SetError_REAL("Couldn't get XRandR crtc info");
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (crtc.*.mode == modedata.*.xrandr_mode) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                status = Success;
                {
                    sdl_pc = 2;
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
                _ = X11_XGrabServer.?(display);
                status = X11_XRRSetCrtcConfig.?(display, res, output_info.*.crtc, CurrentTime, 0, 0, None, crtc.*.rotation, null, 0);
                if (status != Success) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 1;
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
                mm_width = @divTrunc(mode.*.w * (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.mwidth, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.width);
                mm_height = @divTrunc(mode.*.h * (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.mheight, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.height);
                _ = X11_XSync.?(display, False);
                PreXRRSetScreenSizeErrorHandler = X11_XSetErrorHandler.?(SDL_XRRSetScreenSizeErrHandler);
                X11_XRRSetScreenSize.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(data.*.screen)))]).*.root, mode.*.w, mode.*.h, mm_width, mm_height);
                _ = X11_XSync.?(display, False);
                _ = X11_XSetErrorHandler.?(PreXRRSetScreenSizeErrorHandler);
                status = X11_XRRSetCrtcConfig.?(display, res, output_info.*.crtc, CurrentTime, crtc.*.x, crtc.*.y, modedata.*.xrandr_mode, crtc.*.rotation, &data.*.xrandr_output, 1);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                return SDL_SetError_REAL("X11_XRRSetCrtcConfig failed");
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn X11_QuitModes(_: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
}
pub export fn X11_GetDisplayBounds(_: [*c]SDL_VideoDevice, sdl_display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_DisplayData = sdl_display.*.internal;
    _ = &data;
    rect.*.x = data.*.x;
    rect.*.y = data.*.y;
    rect.*.w = sdl_display.*.current_mode.*.w;
    rect.*.h = sdl_display.*.current_mode.*.h;
    return @"true" != 0;
}
pub export fn X11_GetDisplayUsableBounds(_this: [*c]SDL_VideoDevice, sdl_display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.display;
    _ = &display;
    var _NET_WORKAREA: Atom = undefined;
    _ = &_NET_WORKAREA;
    var real_format: c_int = undefined;
    _ = &real_format;
    var real_type: Atom = undefined;
    _ = &real_type;
    var items_read: c_ulong = 0;
    _ = &items_read;
    var items_left: c_ulong = 0;
    _ = &items_left;
    var propdata: [*c]u8 = null;
    _ = &propdata;
    var result: bool = @"false" != 0;
    _ = &result;
    if (!X11_GetDisplayBounds(_this, sdl_display, rect)) {
        return @"false" != 0;
    }
    _NET_WORKAREA = X11_XInternAtom.?(display, "_NET_WORKAREA", False);
    var status: c_int = X11_XGetWindowProperty.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, _NET_WORKAREA, 0, 4, False, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), &real_type, &real_format, &items_read, &items_left, &propdata);
    _ = &status;
    if ((status == Success) and (items_read >= @as(c_ulong, 4))) {
        var p: [*c]const c_long = @ptrCast(@alignCast(propdata));
        _ = &p;
        const usable: SDL_Rect = SDL_Rect{
            .x = @truncate(p[@as(c_int, 0)]),
            .y = @truncate(p[@as(c_int, 1)]),
            .w = @truncate(p[@as(c_int, 2)]),
            .h = @truncate(p[@as(c_int, 3)]),
        };
        _ = &usable;
        result = @"true" != 0;
        if (!SDL_GetRectIntersection_REAL(rect, &usable, rect)) {
            _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
        }
    }
    if (propdata != null) {
        _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
    }
    return result;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const None = @as(c_long, 0);
pub const AnyPropertyType = @as(c_long, 0);
pub const CurrentTime = @as(c_long, 0);
pub const Success = @as(c_int, 0);
pub const BadValue = @as(c_int, 2);
pub const BadMatch = @as(c_int, 8);
pub const StaticColor = @as(c_int, 2);
pub const PseudoColor = @as(c_int, 3);
pub const TrueColor = @as(c_int, 4);
pub const DirectColor = @as(c_int, 5);
pub const LSBFirst = @as(c_int, 0);
pub const False = @as(c_int, 0);
pub const VisualIDMask = @as(c_int, 0x1);
pub const RRNotify = @as(c_int, 1);
pub const RRNotify_OutputChange = @as(c_int, 1);
pub const RR_Interlace = @as(c_int, 0x00000010);
pub const RR_DoubleScan = @as(c_int, 0x00000020);
pub const RR_Connected = @as(c_int, 0);
pub const RR_Disconnected = @as(c_int, 1);
pub const PENDING_FOCUS_TIME = @as(c_int, 200);
pub const SCRGB_NITS = @as(f32, 80.0);
pub const XRANDR_ROTATION_LEFT = @as(c_int, 1) << @as(c_int, 1);
pub const shminfo = struct_shminfo;
