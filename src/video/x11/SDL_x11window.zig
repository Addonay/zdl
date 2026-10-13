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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
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
pub const struct_SDL_Environment = opaque {
};
pub const SDL_Environment = struct_SDL_Environment;
pub extern fn SDL_GetEnvironment_REAL() ?*SDL_Environment;
pub extern fn SDL_GetEnvironmentVariable_REAL(env: ?*SDL_Environment, name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcasestr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
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
pub const SDL_HITTEST_NORMAL: c_int = 0;
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
pub const X11_PENDING_OP_NONE: c_int = 0;
pub const X11_PENDING_OP_RESTORE: c_int = 1;
pub const X11_PENDING_OP_MINIMIZE: c_int = 2;
pub const X11_PENDING_OP_MAXIMIZE: c_int = 4;
pub const X11_PENDING_OP_FULLSCREEN: c_int = 8;
pub const X11_PENDING_OP_MOVE: c_int = 16;
pub const X11_PENDING_OP_RESIZE: c_int = 32;
const enum_unnamed_55 = c_uint;
pub const X11_SIZE_MOVE_EVENTS_DISABLE: c_int = 1;
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
pub const SDL_FLASH_BRIEFLY: c_int = 1;
pub const SDL_FLASH_UNTIL_FOCUSED: c_int = 2;
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
pub extern fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID;
pub extern fn SDL_GetDisplayBounds_REAL(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetDisplayUsableBounds_REAL(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetDisplayForWindow_REAL(window: [*c]SDL_Window) SDL_DisplayID;
pub extern fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID;
pub extern fn SDL_SyncWindow_REAL(window: [*c]SDL_Window) bool;
pub const SDL_MouseButtonFlags = Uint32;
pub extern fn SDL_GetMouseState_REAL(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_CalculateFraction(x: f32, numerator: [*c]c_int, denominator: [*c]c_int) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn SDL_GetExeName() [*c]const u8;
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
pub const SDL_FULLSCREEN_OP_LEAVE: c_int = 0;
pub const SDL_FULLSCREEN_OP_UPDATE: c_int = 2;
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FULLSCREEN_FAILED: c_int = 0;
pub const SDL_FULLSCREEN_SUCCEEDED: c_int = 1;
pub const SDL_FULLSCREEN_PENDING: c_int = 2;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetDisplayForWindowPosition(window: [*c]SDL_Window) SDL_DisplayID;
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub extern fn SDL_RelativeToGlobalForWindow(window: [*c]SDL_Window, rel_x: c_int, rel_y: c_int, abs_x: [*c]c_int, abs_y: [*c]c_int) void;
pub extern fn SDL_GlobalToRelativeForWindow(window: [*c]SDL_Window, abs_x: c_int, abs_y: c_int, rel_x: [*c]c_int, rel_y: [*c]c_int) void;
pub extern fn SDL_ShouldFocusPopup(window: [*c]SDL_Window) bool;
pub extern fn SDL_ShouldRelinquishPopupFocus(window: [*c]SDL_Window, new_focus: [*c][*c]SDL_Window) bool;
pub extern fn SDL_UpdateFullscreenMode(window: [*c]SDL_Window, fullscreen: SDL_FullscreenOp, commit: bool) bool;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_GetAppID() [*c]const u8;
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
const struct_unnamed_71 = extern struct {
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
    min_aspect: struct_unnamed_71 = @import("std").mem.zeroes(struct_unnamed_71),
    max_aspect: struct_unnamed_71 = @import("std").mem.zeroes(struct_unnamed_71),
    base_width: c_int = 0,
    base_height: c_int = 0,
    win_gravity: c_int = 0,
};
pub const XWMHints = extern struct {
    flags: c_long = 0,
    input: c_int = 0,
    initial_state: c_int = 0,
    icon_pixmap: Pixmap = 0,
    icon_window: Window = 0,
    icon_x: c_int = 0,
    icon_y: c_int = 0,
    icon_mask: Pixmap = 0,
    window_group: XID = 0,
};
pub const XTextProperty = extern struct {
    value: [*c]u8 = null,
    encoding: Atom = 0,
    format: c_int = 0,
    nitems: c_ulong = 0,
};
pub const XTextStyle: c_int = 2;
pub const XUTF8StringStyle: c_int = 4;
pub const XICCEncodingStyle = c_uint;
pub const XClassHint = extern struct {
    res_name: [*c]u8 = null,
    res_class: [*c]u8 = null,
};
pub const struct__XRegion = opaque {
};
pub const Region = ?*struct__XRegion;
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
pub const SDL_DYNX11FN_XAllocSizeHints = ?*const fn () callconv(.c) [*c]XSizeHints;
pub extern var X11_XAllocSizeHints: SDL_DYNX11FN_XAllocSizeHints;
pub const SDL_DYNX11FN_XAllocWMHints = ?*const fn () callconv(.c) [*c]XWMHints;
pub extern var X11_XAllocWMHints: SDL_DYNX11FN_XAllocWMHints;
pub const SDL_DYNX11FN_XAllocClassHint = ?*const fn () callconv(.c) [*c]XClassHint;
pub extern var X11_XAllocClassHint: SDL_DYNX11FN_XAllocClassHint;
pub const SDL_DYNX11FN_XChangeProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: Atom, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) c_int;
pub extern var X11_XChangeProperty: SDL_DYNX11FN_XChangeProperty;
pub const SDL_DYNX11FN_XCheckIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub extern var X11_XCheckIfEvent: SDL_DYNX11FN_XCheckIfEvent;
pub const SDL_DYNX11FN_XCreateColormap = ?*const fn (a: [*c]Display, b: Window, c: [*c]Visual, d: c_int) callconv(.c) Colormap;
pub extern var X11_XCreateColormap: SDL_DYNX11FN_XCreateColormap;
pub const SDL_DYNX11FN_XCreateWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_uint, h: c_int, i: c_uint, j: [*c]Visual, k: c_ulong, l: [*c]XSetWindowAttributes) callconv(.c) Window;
pub extern var X11_XCreateWindow: SDL_DYNX11FN_XCreateWindow;
pub const SDL_DYNX11FN_XDeleteProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom) callconv(.c) c_int;
pub extern var X11_XDeleteProperty: SDL_DYNX11FN_XDeleteProperty;
pub const SDL_DYNX11FN_XDestroyWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XDestroyWindow: SDL_DYNX11FN_XDestroyWindow;
pub const SDL_DYNX11FN_XFlush = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XFlush: SDL_DYNX11FN_XFlush;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XGetInputFocus = ?*const fn (a: [*c]Display, b: [*c]Window, c: [*c]c_int) callconv(.c) c_int;
pub extern var X11_XGetInputFocus: SDL_DYNX11FN_XGetInputFocus;
pub const SDL_DYNX11FN_XGetVisualInfo = ?*const fn (a: [*c]Display, b: c_long, c: [*c]XVisualInfo, d: [*c]c_int) callconv(.c) [*c]XVisualInfo;
pub extern var X11_XGetVisualInfo: SDL_DYNX11FN_XGetVisualInfo;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub extern var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes;
pub const SDL_DYNX11FN_XGetWindowProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XGetWindowProperty: SDL_DYNX11FN_XGetWindowProperty;
pub const SDL_DYNX11FN_XGetWMHints = ?*const fn (a: [*c]Display, b: Window) callconv(.c) [*c]XWMHints;
pub extern var X11_XGetWMHints: SDL_DYNX11FN_XGetWMHints;
pub const SDL_DYNX11FN_XGetWMNormalHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XSizeHints, d: [*c]c_long) callconv(.c) c_int;
pub extern var X11_XGetWMNormalHints: SDL_DYNX11FN_XGetWMNormalHints;
pub const SDL_DYNX11FN_XIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub extern var X11_XIfEvent: SDL_DYNX11FN_XIfEvent;
pub const SDL_DYNX11FN_XGrabKeyboard = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: Time) callconv(.c) c_int;
pub extern var X11_XGrabKeyboard: SDL_DYNX11FN_XGrabKeyboard;
pub const SDL_DYNX11FN_XGrabPointer = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_uint, e: c_int, f: c_int, g: Window, h: Cursor, i: Time) callconv(.c) c_int;
pub extern var X11_XGrabPointer: SDL_DYNX11FN_XGrabPointer;
pub const SDL_DYNX11FN_XIconifyWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int) callconv(.c) c_int;
pub extern var X11_XIconifyWindow: SDL_DYNX11FN_XIconifyWindow;
pub const SDL_DYNX11FN_XInstallColormap = ?*const fn (a: [*c]Display, b: Colormap) callconv(.c) c_int;
pub extern var X11_XInstallColormap: SDL_DYNX11FN_XInstallColormap;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XMapRaised = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XMapRaised: SDL_DYNX11FN_XMapRaised;
pub const SDL_DYNX11FN_XMoveWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int) callconv(.c) c_int;
pub extern var X11_XMoveWindow: SDL_DYNX11FN_XMoveWindow;
pub const SDL_DYNX11FN_XRaiseWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub extern var X11_XRaiseWindow: SDL_DYNX11FN_XRaiseWindow;
pub const SDL_DYNX11FN_XResizeWindow = ?*const fn (a: [*c]Display, b: Window, c: c_uint, d: c_uint) callconv(.c) c_int;
pub extern var X11_XResizeWindow: SDL_DYNX11FN_XResizeWindow;
pub const SDL_DYNX11FN_XScreenNumberOfScreen = ?*const fn (a: [*c]Screen) callconv(.c) c_int;
pub extern var X11_XScreenNumberOfScreen: SDL_DYNX11FN_XScreenNumberOfScreen;
pub const SDL_DYNX11FN_XSelectInput = ?*const fn (a: [*c]Display, b: Window, c: c_long) callconv(.c) c_int;
pub extern var X11_XSelectInput: SDL_DYNX11FN_XSelectInput;
pub const SDL_DYNX11FN_XSendEvent = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_long, e: [*c]XEvent) callconv(.c) c_int;
pub extern var X11_XSendEvent: SDL_DYNX11FN_XSendEvent;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XSetInputFocus = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: Time) callconv(.c) c_int;
pub extern var X11_XSetInputFocus: SDL_DYNX11FN_XSetInputFocus;
pub const SDL_DYNX11FN_XSetTransientForHint = ?*const fn (a: [*c]Display, b: Window, c: Window) callconv(.c) c_int;
pub extern var X11_XSetTransientForHint: SDL_DYNX11FN_XSetTransientForHint;
pub const SDL_DYNX11FN_XSetTextProperty = ?*const fn (a: [*c]Display, b: Window, c: [*c]XTextProperty, d: Atom) callconv(.c) void;
pub extern var X11_XSetTextProperty: SDL_DYNX11FN_XSetTextProperty;
pub const SDL_DYNX11FN_XSetWMHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWMHints) callconv(.c) void;
pub extern var X11_XSetWMHints: SDL_DYNX11FN_XSetWMHints;
pub const SDL_DYNX11FN_XSetWMNormalHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XSizeHints) callconv(.c) void;
pub extern var X11_XSetWMNormalHints: SDL_DYNX11FN_XSetWMNormalHints;
pub const SDL_DYNX11FN_XSetWMProperties = ?*const fn (a: [*c]Display, b: Window, c: [*c]XTextProperty, d: [*c]XTextProperty, e: [*c][*c]u8, f: c_int, g: [*c]XSizeHints, h: [*c]XWMHints, i: [*c]XClassHint) callconv(.c) void;
pub extern var X11_XSetWMProperties: SDL_DYNX11FN_XSetWMProperties;
pub const SDL_DYNX11FN_XSetWMProtocols = ?*const fn (a: [*c]Display, b: Window, c: [*c]Atom, d: c_int) callconv(.c) c_int;
pub extern var X11_XSetWMProtocols: SDL_DYNX11FN_XSetWMProtocols;
pub const SDL_DYNX11FN_XStoreColors = ?*const fn (a: [*c]Display, b: Colormap, c: [*c]XColor, d: c_int) callconv(.c) c_int;
pub extern var X11_XStoreColors: SDL_DYNX11FN_XStoreColors;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub extern var X11_XSync: SDL_DYNX11FN_XSync;
pub const SDL_DYNX11FN_XTranslateCoordinates = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]Window) callconv(.c) c_int;
pub extern var X11_XTranslateCoordinates: SDL_DYNX11FN_XTranslateCoordinates;
pub const SDL_DYNX11FN_XUngrabKeyboard = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub extern var X11_XUngrabKeyboard: SDL_DYNX11FN_XUngrabKeyboard;
pub const SDL_DYNX11FN_XUngrabPointer = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub extern var X11_XUngrabPointer: SDL_DYNX11FN_XUngrabPointer;
pub const SDL_DYNX11FN_XUninstallColormap = ?*const fn (a: [*c]Display, b: Colormap) callconv(.c) c_int;
pub extern var X11_XUninstallColormap: SDL_DYNX11FN_XUninstallColormap;
pub const SDL_DYNX11FN_XWithdrawWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int) callconv(.c) c_int;
pub extern var X11_XWithdrawWindow: SDL_DYNX11FN_XWithdrawWindow;
pub const SDL_DYNX11FN_XQueryTree = ?*const fn (a: [*c]Display, b: Window, c: [*c]Window, d: [*c]Window, e: [*c][*c]Window, f: [*c]c_uint) callconv(.c) c_int;
pub extern var X11_XQueryTree: SDL_DYNX11FN_XQueryTree;
pub const SDL_DYNX11FN_XSupportsLocale = ?*const fn () callconv(.c) c_int;
pub extern var X11_XSupportsLocale: SDL_DYNX11FN_XSupportsLocale;
pub const SDL_DYNX11FN_XmbTextListToTextProperty = ?*const fn (a: [*c]Display, b: [*c][*c]u8, c: c_int, d: XICCEncodingStyle, e: [*c]XTextProperty) callconv(.c) c_int;
pub extern var X11_XmbTextListToTextProperty: SDL_DYNX11FN_XmbTextListToTextProperty;
pub const SDL_DYNX11FN_XCreateRegion = ?*const fn () callconv(.c) Region;
pub extern var X11_XCreateRegion: SDL_DYNX11FN_XCreateRegion;
pub const SDL_DYNX11FN_XDestroyRegion = ?*const fn (Region) callconv(.c) void;
pub extern var X11_XDestroyRegion: SDL_DYNX11FN_XDestroyRegion;
pub const SDL_DYNX11FN_Xutf8TextListToTextProperty = ?*const fn (a: [*c]Display, b: [*c][*c]u8, c: c_int, d: XICCEncodingStyle, e: [*c]XTextProperty) callconv(.c) c_int;
pub extern var X11_Xutf8TextListToTextProperty: SDL_DYNX11FN_Xutf8TextListToTextProperty;
pub const SDL_DYNX11FN_XGetICValues = ?*const fn (XIC, ...) callconv(.c) [*c]u8;
pub extern var X11_XGetICValues: SDL_DYNX11FN_XGetICValues;
pub const SDL_DYNX11FN_XShapeCombineRegion = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: Region, g: c_int) callconv(.c) void;
pub extern var X11_XShapeCombineRegion: SDL_DYNX11FN_XShapeCombineRegion;
pub extern var SDL_X11_HAVE_UTF8: c_int;
pub extern fn X11_PumpEvents(_this: [*c]SDL_VideoDevice) void;
pub extern fn X11_GetBorderValues(data: [*c]SDL_WindowData) void;
pub extern fn X11_CreateInputContext(data: [*c]SDL_WindowData) void;
pub extern fn X11_DestroyInputContext(data: [*c]SDL_WindowData) void;
pub extern fn X11_GetDisplayBounds(_this: [*c]SDL_VideoDevice, sdl_display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) bool;
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
pub extern fn X11_GL_UseEGL(_this: [*c]SDL_VideoDevice) bool;
pub extern fn X11_GL_GetVisual(_this: [*c]SDL_VideoDevice, display: [*c]Display, screen: c_int, transparent: bool) [*c]XVisualInfo;
pub const NativeWindowType = EGLNativeWindowType;
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
pub extern fn X11_Xinput2Select(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn X11_Xinput2GrabTouch(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn X11_Xinput2UngrabTouch(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn X11_Xinput2SelectMouseAndKeyboard(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn X11_DestroyPointerBarrier(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn SDL_EGL_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, nw: NativeWindowType) EGLSurface;
pub extern fn X11_GLES_GetVisual(_this: [*c]SDL_VideoDevice, display: [*c]Display, screen: c_int, transparent: bool) [*c]XVisualInfo;
pub extern fn X11_InitResizeSync(window: [*c]SDL_Window) bool;
pub extern fn X11_TermResizeSync(window: [*c]SDL_Window) void;
pub fn isMapNotify(_: [*c]Display, ev: [*c]XEvent, win: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((ev.*.type == MapNotify) and (ev.*.xmap.window == @as([*c]Window, @ptrCast(@alignCast(win))).*));
}
pub fn isUnmapNotify(_: [*c]Display, ev: [*c]XEvent, win: XPointer) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((ev.*.type == UnmapNotify) and (ev.*.xunmap.window == @as([*c]Window, @ptrCast(@alignCast(win))).*));
}
pub fn X11_CheckCurrentDesktop(name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var env: ?*SDL_Environment = SDL_GetEnvironment_REAL();
    _ = &env;
    var desktopVar: [*c]const u8 = SDL_GetEnvironmentVariable_REAL(env, "DESKTOP_SESSION");
    _ = &desktopVar;
    if ((desktopVar != null) and (SDL_strcasecmp_REAL(desktopVar, name) == @as(c_int, 0))) {
        return @"true" != 0;
    }
    desktopVar = SDL_GetEnvironmentVariable_REAL(env, "XDG_CURRENT_DESKTOP");
    if ((desktopVar != null) and (SDL_strcasestr_REAL(desktopVar, name) != null)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn X11_IsWindowMapped(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var attr: XWindowAttributes = undefined;
    _ = &attr;
    _ = X11_XGetWindowAttributes.?(videodata.*.display, data.*.xwindow, &attr);
    if (attr.map_state != IsUnmapped) {
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub fn X11_IsDisplayOk(display: [*c]Display) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((display.*.flags & @as(c_ulong, @bitCast(@as(c_long, @as(c_long, 1) << @intCast(@as(c_long, 0)))))) != 0) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn X11_FlushPendingEvents(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const last_position_pending: bool = window.*.last_position_pending;
    _ = &last_position_pending;
    const last_size_pending: bool = window.*.last_size_pending;
    _ = &last_size_pending;
    _ = X11_SyncWindow(_this, window);
    window.*.last_position_pending = last_position_pending;
    window.*.last_size_pending = last_size_pending;
}
pub export fn X11_SetNetWMState(_this: [*c]SDL_VideoDevice, xwindow: Window, flags: SDL_WindowFlags) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "X11_SetNetWMState".*;
    };
    _ = &static_local___func__;
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var _NET_WM_STATE: Atom = videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_FOCUSED: Atom = videodata.*.atoms._NET_WM_STATE_FOCUSED;
    _ = &_NET_WM_STATE_FOCUSED;
    var _NET_WM_STATE_MAXIMIZED_VERT: Atom = videodata.*.atoms._NET_WM_STATE_MAXIMIZED_VERT;
    _ = &_NET_WM_STATE_MAXIMIZED_VERT;
    var _NET_WM_STATE_MAXIMIZED_HORZ: Atom = videodata.*.atoms._NET_WM_STATE_MAXIMIZED_HORZ;
    _ = &_NET_WM_STATE_MAXIMIZED_HORZ;
    var _NET_WM_STATE_FULLSCREEN: Atom = videodata.*.atoms._NET_WM_STATE_FULLSCREEN;
    _ = &_NET_WM_STATE_FULLSCREEN;
    var _NET_WM_STATE_ABOVE: Atom = videodata.*.atoms._NET_WM_STATE_ABOVE;
    _ = &_NET_WM_STATE_ABOVE;
    var _NET_WM_STATE_SKIP_TASKBAR: Atom = videodata.*.atoms._NET_WM_STATE_SKIP_TASKBAR;
    _ = &_NET_WM_STATE_SKIP_TASKBAR;
    var _NET_WM_STATE_SKIP_PAGER: Atom = videodata.*.atoms._NET_WM_STATE_SKIP_PAGER;
    _ = &_NET_WM_STATE_SKIP_PAGER;
    var _NET_WM_STATE_MODAL: Atom = videodata.*.atoms._NET_WM_STATE_MODAL;
    _ = &_NET_WM_STATE_MODAL;
    var atoms: [16]Atom = undefined;
    _ = &atoms;
    var count: c_int = 0;
    _ = &count;
    if ((flags & @as(c_ulong, 65536)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_ABOVE;
    }
    if ((flags & @as(c_ulong, 131072)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_SKIP_TASKBAR;
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_SKIP_PAGER;
    }
    if ((flags & @as(c_ulong, 512)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_FOCUSED;
    }
    if ((flags & @as(c_ulong, 128)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_MAXIMIZED_VERT;
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_MAXIMIZED_HORZ;
    }
    if ((flags & @as(c_ulong, 1)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_FULLSCREEN;
    }
    if ((flags & @as(c_ulong, 4096)) != 0) {
        atoms[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _NET_WM_STATE_MODAL;
    }
    while (true) {
        while (!(@as(c_ulong, @bitCast(@as(c_long, count))) <= (@sizeOf(@TypeOf(atoms)) / @sizeOf(@TypeOf(atoms[@as(c_int, 0)]))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "count <= (sizeof(atoms)/sizeof(atoms[0]))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11window.c", 214);
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
    if (count > @as(c_int, 0)) {
        _ = X11_XChangeProperty.?(display, xwindow, _NET_WM_STATE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(@as([*c]Atom, @ptrCast(@alignCast(&atoms))))), count);
    } else {
        _ = X11_XDeleteProperty.?(display, xwindow, _NET_WM_STATE);
    }
}
pub fn X11_ConstrainPopup(window: [*c]SDL_Window, output_to_pending: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        var w: [*c]SDL_Window = undefined;
        _ = &w;
        var displayID: SDL_DisplayID = undefined;
        _ = &displayID;
        var rect: SDL_Rect = undefined;
        _ = &rect;
        var abs_x: c_int = if (window.*.last_position_pending) window.*.pending.x else window.*.floating.x;
        _ = &abs_x;
        var abs_y: c_int = if (window.*.last_position_pending) window.*.pending.y else window.*.floating.y;
        _ = &abs_y;
        var offset_x: c_int = 0;
        _ = &offset_x;
        var offset_y: c_int = 0;
        _ = &offset_y;
        if (window.*.constrain_popup) {
            {
                w = window.*.parent;
                while ((w.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) : (w = w.*.parent) {
                    offset_x += w.*.x;
                    offset_y += w.*.y;
                }
            }
            offset_x += w.*.x;
            offset_y += w.*.y;
            abs_x += offset_x;
            abs_y += offset_y;
            displayID = SDL_GetDisplayForWindow_REAL(w);
            _ = SDL_GetDisplayBounds_REAL(displayID, &rect);
            if ((abs_x + window.*.w) > (rect.x + rect.w)) {
                abs_x -= (abs_x + window.*.w) - (rect.x + rect.w);
            }
            if ((abs_y + window.*.h) > (rect.y + rect.h)) {
                abs_y -= (abs_y + window.*.h) - (rect.y + rect.h);
            }
            abs_x = if (abs_x > rect.x) abs_x else rect.x;
            abs_y = if (abs_y > rect.y) abs_y else rect.y;
        }
        if (output_to_pending) {
            window.*.pending.x = abs_x - offset_x;
            window.*.pending.y = abs_y - offset_y;
        } else {
            window.*.floating.x = blk: {
                const tmp = abs_x - offset_x;
                window.*.windowed.x = tmp;
                break :blk tmp;
            };
            window.*.floating.y = blk: {
                const tmp = abs_y - offset_y;
                window.*.windowed.y = tmp;
                break :blk tmp;
            };
        }
    }
}
pub fn X11_SetKeyboardFocus(window: [*c]SDL_Window, set_active_focus: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var toplevel: [*c]SDL_Window = window;
    _ = &toplevel;
    while ((toplevel.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        toplevel = toplevel.*.parent;
    }
    toplevel.*.keyboard_focus = window;
    if ((set_active_focus and !window.*.is_hiding) and !window.*.is_destroying) {
        _ = SDL_SetKeyboardFocus(window);
    }
}
pub export fn X11_GetNetWMState(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, xwindow: Window) SDL_WindowFlags {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = _this.*.internal;
    _ = &videodata;
    var display: [*c]Display = videodata.*.display;
    _ = &display;
    var _NET_WM_STATE: Atom = videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_HIDDEN: Atom = videodata.*.atoms._NET_WM_STATE_HIDDEN;
    _ = &_NET_WM_STATE_HIDDEN;
    var _NET_WM_STATE_FOCUSED: Atom = videodata.*.atoms._NET_WM_STATE_FOCUSED;
    _ = &_NET_WM_STATE_FOCUSED;
    var _NET_WM_STATE_MAXIMIZED_VERT: Atom = videodata.*.atoms._NET_WM_STATE_MAXIMIZED_VERT;
    _ = &_NET_WM_STATE_MAXIMIZED_VERT;
    var _NET_WM_STATE_MAXIMIZED_HORZ: Atom = videodata.*.atoms._NET_WM_STATE_MAXIMIZED_HORZ;
    _ = &_NET_WM_STATE_MAXIMIZED_HORZ;
    var _NET_WM_STATE_FULLSCREEN: Atom = videodata.*.atoms._NET_WM_STATE_FULLSCREEN;
    _ = &_NET_WM_STATE_FULLSCREEN;
    var actualType: Atom = undefined;
    _ = &actualType;
    var actualFormat: c_int = undefined;
    _ = &actualFormat;
    var i: c_ulong = undefined;
    _ = &i;
    var numItems: c_ulong = undefined;
    _ = &numItems;
    var bytesAfter: c_ulong = undefined;
    _ = &bytesAfter;
    var propertyValue: [*c]u8 = null;
    _ = &propertyValue;
    var maxLength: c_long = 1024;
    _ = &maxLength;
    var flags: SDL_WindowFlags = 0;
    _ = &flags;
    if (X11_XGetWindowProperty.?(display, xwindow, _NET_WM_STATE, 0, maxLength, False, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), &actualType, &actualFormat, &numItems, &bytesAfter, &propertyValue) == Success) {
        var atoms: [*c]Atom = @ptrCast(@alignCast(propertyValue));
        _ = &atoms;
        var maximized: c_int = 0;
        _ = &maximized;
        var fullscreen: c_int = 0;
        _ = &fullscreen;
        {
            i = 0;
            while (i < numItems) : (i +%= 1) {
                if (atoms[i] == _NET_WM_STATE_HIDDEN) {
                    flags |= @as(c_ulong, 64) | @as(c_ulong, 4);
                } else if (atoms[i] == _NET_WM_STATE_FOCUSED) {
                    flags |= 512;
                } else if (atoms[i] == _NET_WM_STATE_MAXIMIZED_VERT) {
                    maximized |= 1;
                } else if (atoms[i] == _NET_WM_STATE_MAXIMIZED_HORZ) {
                    maximized |= 2;
                } else if (atoms[i] == _NET_WM_STATE_FULLSCREEN) {
                    fullscreen = 1;
                }
            }
        }
        if (fullscreen == @as(c_int, 1)) {
            flags |= 1;
        } else if (!videodata.*.net_wm) {
            flags |= window.*.flags & @as(c_ulong, 1);
        }
        if (maximized == @as(c_int, 3)) {
            if (fullscreen != 0) {
                flags |= window.*.flags & @as(c_ulong, 128);
            } else {
                flags |= 128;
            }
        }
        {
            var attr: XWindowAttributes = undefined;
            _ = &attr;
            _ = memset(@ptrCast(@alignCast(&attr)), 0, @sizeOf(@TypeOf(attr)));
            _ = X11_XGetWindowAttributes.?(videodata.*.display, xwindow, &attr);
            if (attr.map_state == IsUnmapped) {
                flags |= 8;
            }
        }
        _ = X11_XFree.?(@ptrCast(@alignCast(propertyValue)));
    }
    return flags;
}
pub fn SetupWindowData(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var videodata: [*c]SDL_VideoData = undefined;
    _ = &videodata;
    var displaydata: [*c]SDL_DisplayData = undefined;
    _ = &displaydata;
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var new_windowlist: [*c][*c]SDL_WindowData = undefined;
    _ = &new_windowlist;
    var attrib: XWindowAttributes = undefined;
    _ = &attrib;
    var FocalWindow: Window = undefined;
    _ = &FocalWindow;
    var RevertTo: c_int = undefined;
    _ = &RevertTo;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var screen: c_int = undefined;
    _ = &screen;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                videodata = _this.*.internal;
                displaydata = SDL_GetDisplayDriverDataForWindow(window);
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                X11_DestroyInputContext(data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                data.*.videodata = videodata;
                data.*.window = window;
                data.*.xwindow = w;
                data.*.hit_test_result = SDL_HITTEST_NORMAL;
                X11_CreateInputContext(data);
                if (videodata.*.numwindows >= videodata.*.windowlistlength) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                new_windowlist = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(videodata.*.windowlist)), @as(c_ulong, @bitCast(@as(c_long, videodata.*.numwindows + @as(c_int, 1)))) *% @sizeOf(@TypeOf(videodata.*.windowlist.*)))));
                if (!(new_windowlist != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                _ = X11_XGetWindowAttributes.?(data.*.videodata.*.display, w, &attrib);
                if (!((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
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
                videodata.*.windowlistlength += 1;
                videodata.*.windowlist = new_windowlist;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                window.*.x = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = attrib.x;
                        window.*.floating.x = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    window.*.windowed.x = tmp;
                    break :blk tmp;
                };
                window.*.y = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = attrib.y - data.*.border_top;
                        window.*.floating.y = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    window.*.windowed.y = tmp;
                    break :blk tmp;
                };
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
                window.*.w = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = attrib.width;
                        window.*.floating.w = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    window.*.windowed.w = tmp;
                    break :blk tmp;
                };
                window.*.h = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = attrib.height;
                        window.*.floating.h = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    window.*.windowed.h = tmp;
                    break :blk tmp;
                };
                if (attrib.map_state != IsUnmapped) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                window.*.flags &= ~@as(c_ulong, 8);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                window.*.flags |= 8;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                data.*.visual = attrib.visual;
                data.*.colormap = attrib.colormap;
                window.*.flags |= X11_GetNetWMState(_this, window, w);
                RevertTo = 0;
                _ = X11_XGetInputFocus.?(data.*.videodata.*.display, &FocalWindow, &RevertTo);
                if (FocalWindow == w) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                window.*.flags |= 512;
                {
                    sdl_pc = 19;
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
                if ((window.*.flags & @as(c_ulong, 512)) != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetKeyboardFocus(data.*.window);
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
                if ((window.*.flags & @as(c_ulong, 256)) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 25;
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
                if ((window.*.flags & @as(c_ulong, 2048)) != 0) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                window.*.title = X11_GetWindowTitle(_this, w);
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
                props = SDL_GetWindowProperties_REAL(window);
                screen = if (displaydata != null) displaydata.*.screen else @as(c_int, 0);
                _ = SDL_SetPointerProperty_REAL(props, "SDL.window.x11.display", @ptrCast(@alignCast(data.*.videodata.*.display)));
                _ = SDL_SetNumberProperty_REAL(props, "SDL.window.x11.screen", screen);
                _ = SDL_SetNumberProperty_REAL(props, "SDL.window.x11.window", @bitCast(@as(c_ulong, @truncate(data.*.xwindow))));
                if ((((window.*.flags & @as(c_ulong, 2)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool((_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) or SDL_GetHintBoolean_REAL("SDL_VIDEO_FORCE_EGL", @"false" != 0))))) != 0)) and (!(_this.*.gl_data != null) or X11_GL_UseEGL(_this))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                if (!(_this.*.egl_data != null)) {
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
                window.*.internal = data;
                videodata.*.windowlist[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &videodata.*.numwindows;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = data;
                return @"true" != 0;
            },
            32 => {
                {
                    sdl_pc = 1;
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
                data.*.egl_surface = SDL_EGL_CreateSurface(_this, window, w);
                if (data.*.egl_surface == @as(EGLSurface, null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                _ = SDL_SetError_REAL("Could not create GLES window surface");
                {
                    sdl_pc = 1;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SetupWindowInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var fevent: c_long = 0;
    _ = &fevent;
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var xwindow: Window = data.*.xwindow;
    _ = &xwindow;
    if ((SDL_X11_HAVE_UTF8 != 0) and (data.*.ic != null)) {
        _ = X11_XGetICValues.?(data.*.ic, @as([*c]u8, @as([*c]u8, @constCast("filterEvents"))), &fevent, @as(?*anyopaque, null));
    }
    X11_Xinput2Select(_this, window);
    {
        var x11_keyboard_events: c_uint = @bitCast(@as(c_int, @truncate((@as(c_long, 1) << @intCast(@as(c_long, 0))) | (@as(c_long, 1) << @intCast(@as(c_long, 1))))));
        _ = &x11_keyboard_events;
        var x11_pointer_events: c_uint = @bitCast(@as(c_int, @truncate(((@as(c_long, 1) << @intCast(@as(c_long, 2))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 6))))));
        _ = &x11_pointer_events;
        _ = X11_Xinput2SelectMouseAndKeyboard(_this, window);
        if (data.*.xinput2_keyboard_enabled) {
            x11_keyboard_events = 0;
        }
        if (data.*.xinput2_mouse_enabled) {
            x11_pointer_events = 0;
        }
        _ = X11_XSelectInput.?(data.*.videodata.*.display, xwindow, (((((((((@as(c_long, 1) << @intCast(@as(c_long, 21))) | (@as(c_long, 1) << @intCast(@as(c_long, 4)))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)))) | (@as(c_long, 1) << @intCast(@as(c_long, 15)))) | @as(c_long, x11_keyboard_events)) | @as(c_long, x11_pointer_events)) | (@as(c_long, 1) << @intCast(@as(c_long, 22)))) | (@as(c_long, 1) << @intCast(@as(c_long, 17)))) | (@as(c_long, 1) << @intCast(@as(c_long, 14)))) | fevent);
    }
}
pub fn SetWindowBordered(display: [*c]Display, screen: c_int, window: Window, border: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var WM_HINTS: Atom = X11_XInternAtom.?(display, "_MOTIF_WM_HINTS", True);
    _ = &WM_HINTS;
    if (WM_HINTS != @as(Atom, None)) {
        const struct_unnamed_83 = extern struct {
            flags: c_ulong = 0,
            functions: c_ulong = 0,
            decorations: c_ulong = 0,
            input_mode: c_long = 0,
            status: c_ulong = 0,
        };
        _ = &struct_unnamed_83;
        var MWMHints: struct_unnamed_83 = struct_unnamed_83{
            .flags = @bitCast(@as(c_long, @as(c_long, 1) << @intCast(@as(c_long, 1)))),
            .functions = 0,
            .decorations = @bitCast(@as(c_long, if (border) @as(c_int, 1) else @as(c_int, 0))),
            .input_mode = 0,
            .status = 0,
        };
        _ = &MWMHints;
        _ = X11_XChangeProperty.?(display, window, WM_HINTS, WM_HINTS, 32, PropModeReplace, @ptrCast(@alignCast(&MWMHints)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(MWMHints)) / @sizeOf(c_long)))));
    } else {
        _ = X11_XSetTransientForHint.?(display, window, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root);
    }
}
pub export fn X11_CreateWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "X11_CreateWindow".*;
    };
    _ = &static_local___func__;
    var w: Window = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(create_props, "SDL.window.create.x11.window", @bitCast(@as(c_ulong, @truncate(@as(Window, @intCast(@intFromPtr(SDL_GetPointerProperty_REAL(create_props, "sdl2-compat.external_window", null))))))))));
    _ = &w;
    if (w != 0) {
        window.*.flags |= 2048;
        if (!SetupWindowData(_this, window, w)) {
            return @"false" != 0;
        }
        if (SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_EXTERNAL_WINDOW_INPUT", @"true" != 0)) {
            SetupWindowInput(_this, window);
        }
        return @"true" != 0;
    }
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    if (!(displaydata != null)) {
        return SDL_SetError_REAL("Could not find display info");
    }
    const force_override_redirect: bool = SDL_GetHintBoolean_REAL("SDL_X11_FORCE_OVERRIDE_REDIRECT", @"false" != 0);
    _ = &force_override_redirect;
    const use_resize_sync: bool = SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_ENABLE_XSYNC_EXT", @"false" != 0) and ((window.*.flags & @as(c_ulong, 2)) != @as(SDL_WindowFlags, 0));
    _ = &use_resize_sync;
    var windowdata: [*c]SDL_WindowData = undefined;
    _ = &windowdata;
    var display: [*c]Display = data.*.display;
    _ = &display;
    var screen: c_int = displaydata.*.screen;
    _ = &screen;
    var visual: [*c]Visual = undefined;
    _ = &visual;
    var depth: c_int = undefined;
    _ = &depth;
    var xattr: XSetWindowAttributes = undefined;
    _ = &xattr;
    var sizehints: [*c]XSizeHints = undefined;
    _ = &sizehints;
    var wmhints: [*c]XWMHints = undefined;
    _ = &wmhints;
    var classhints: [*c]XClassHint = undefined;
    _ = &classhints;
    var _NET_WM_BYPASS_COMPOSITOR: Atom = undefined;
    _ = &_NET_WM_BYPASS_COMPOSITOR;
    var _NET_WM_WINDOW_TYPE: Atom = undefined;
    _ = &_NET_WM_WINDOW_TYPE;
    var wintype: Atom = undefined;
    _ = &wintype;
    var wintype_name: [*c]const u8 = null;
    _ = &wintype_name;
    var compositor: c_long = 1;
    _ = &compositor;
    var _NET_WM_PID: Atom = undefined;
    _ = &_NET_WM_PID;
    var hint: [*c]const u8 = null;
    _ = &hint;
    var win_x: c_int = undefined;
    _ = &win_x;
    var win_y: c_int = undefined;
    _ = &win_y;
    var undefined_position: bool = @"false" != 0;
    _ = &undefined_position;
    const transparent: c_int = if ((window.*.flags & @as(c_ulong, 1073741824)) != 0) @"true" else @"false";
    _ = &transparent;
    var forced_visual_id: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_X11_WINDOW_VISUALID");
    _ = &forced_visual_id;
    var display_visual_id: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_X11_VISUALID");
    _ = &display_visual_id;
    if ((forced_visual_id != null) and (@as(c_int, forced_visual_id.*) != 0)) {
        var vi: [*c]XVisualInfo = undefined;
        _ = &vi;
        var template: XVisualInfo = undefined;
        _ = &template;
        var nvis: c_int = undefined;
        _ = &nvis;
        _ = memset(@ptrCast(@alignCast(&template)), 0, @sizeOf(@TypeOf(template)));
        template.visualid = @bitCast(@as(c_long, SDL_strtol_REAL(forced_visual_id, null, 0)));
        vi = X11_XGetVisualInfo.?(display, VisualIDMask, &template, &nvis);
        if (vi != null) {
            visual = vi.*.visual;
            depth = vi.*.depth;
            _ = X11_XFree.?(@ptrCast(@alignCast(vi)));
        } else {
            return @"false" != 0;
        }
    } else if (((window.*.flags & @as(c_ulong, 2)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(display_visual_id != null) or !(@as(c_int, display_visual_id.*) != 0))))) != 0)) {
        var vinfo: [*c]XVisualInfo = null;
        _ = &vinfo;
        if (((_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) or SDL_GetHintBoolean_REAL("SDL_VIDEO_FORCE_EGL", @"false" != 0)) and (!(_this.*.gl_data != null) or X11_GL_UseEGL(_this))) {
            vinfo = X11_GLES_GetVisual(_this, display, screen, transparent != 0);
        } else {
            vinfo = X11_GL_GetVisual(_this, display, screen, transparent != 0);
        }
        if (!(vinfo != null)) {
            return @"false" != 0;
        }
        visual = vinfo.*.visual;
        depth = vinfo.*.depth;
        _ = X11_XFree.?(@ptrCast(@alignCast(vinfo)));
    } else {
        visual = displaydata.*.visual;
        depth = displaydata.*.depth;
    }
    xattr.override_redirect = if ((((window.*.flags & @as(c_ulong, 262144)) != 0) or ((window.*.flags & @as(c_ulong, 524288)) != 0)) or force_override_redirect) True else False;
    xattr.backing_store = NotUseful;
    xattr.background_pixmap = None;
    xattr.border_pixel = 0;
    if (visual.*.class == DirectColor) {
        var colorcells: [*c]XColor = undefined;
        _ = &colorcells;
        var i: c_int = undefined;
        _ = &i;
        var ncolors: c_int = undefined;
        _ = &ncolors;
        var rmax: c_int = undefined;
        _ = &rmax;
        var gmax: c_int = undefined;
        _ = &gmax;
        var bmax: c_int = undefined;
        _ = &bmax;
        var rmask: c_int = undefined;
        _ = &rmask;
        var gmask: c_int = undefined;
        _ = &gmask;
        var bmask: c_int = undefined;
        _ = &bmask;
        var rshift: c_int = undefined;
        _ = &rshift;
        var gshift: c_int = undefined;
        _ = &gshift;
        var bshift: c_int = undefined;
        _ = &bshift;
        xattr.colormap = X11_XCreateColormap.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, visual, AllocAll);
        if (!(xattr.colormap != 0)) {
            return SDL_SetError_REAL("Could not create writable colormap");
        }
        colorcells = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, visual.*.map_entries))) *% @sizeOf(XColor))));
        if (!(colorcells != null)) {
            return @"false" != 0;
        }
        ncolors = visual.*.map_entries;
        rmax = 65535;
        gmax = 65535;
        bmax = 65535;
        rshift = 0;
        rmask = @bitCast(@as(c_uint, @truncate(visual.*.red_mask)));
        while (@as(c_int, 0) == (rmask & @as(c_int, 1))) {
            rshift += 1;
            rmask >>= @intCast(@as(c_int, 1));
        }
        gshift = 0;
        gmask = @bitCast(@as(c_uint, @truncate(visual.*.green_mask)));
        while (@as(c_int, 0) == (gmask & @as(c_int, 1))) {
            gshift += 1;
            gmask >>= @intCast(@as(c_int, 1));
        }
        bshift = 0;
        bmask = @bitCast(@as(c_uint, @truncate(visual.*.blue_mask)));
        while (@as(c_int, 0) == (bmask & @as(c_int, 1))) {
            bshift += 1;
            bmask >>= @intCast(@as(c_int, 1));
        }
        {
            i = 0;
            while (i < ncolors) : (i += 1) {
                var red: Uint32 = @bitCast(@as(c_int, @divTrunc(rmax * i, ncolors - @as(c_int, 1))));
                _ = &red;
                var green: Uint32 = @bitCast(@as(c_int, @divTrunc(gmax * i, ncolors - @as(c_int, 1))));
                _ = &green;
                var blue: Uint32 = @bitCast(@as(c_int, @divTrunc(bmax * i, ncolors - @as(c_int, 1))));
                _ = &blue;
                var rbits: Uint32 = @bitCast(@as(c_int, @divTrunc(rmask * i, ncolors - @as(c_int, 1))));
                _ = &rbits;
                var gbits: Uint32 = @bitCast(@as(c_int, @divTrunc(gmask * i, ncolors - @as(c_int, 1))));
                _ = &gbits;
                var bbits: Uint32 = @bitCast(@as(c_int, @divTrunc(bmask * i, ncolors - @as(c_int, 1))));
                _ = &bbits;
                var pix: Uint32 = ((rbits << @intCast(@as(Uint32, @bitCast(@as(c_int, rshift))))) | (gbits << @intCast(@as(Uint32, @bitCast(@as(c_int, gshift)))))) | (bbits << @intCast(@as(Uint32, @bitCast(@as(c_int, bshift)))));
                _ = &pix;
                colorcells[@bitCast(@as(isize, @intCast(i)))].pixel = pix;
                colorcells[@bitCast(@as(isize, @intCast(i)))].red = @truncate(red);
                colorcells[@bitCast(@as(isize, @intCast(i)))].green = @truncate(green);
                colorcells[@bitCast(@as(isize, @intCast(i)))].blue = @truncate(blue);
                colorcells[@bitCast(@as(isize, @intCast(i)))].flags = @bitCast(@as(i8, @truncate(((@as(c_int, 1) << @intCast(@as(c_int, 0))) | (@as(c_int, 1) << @intCast(@as(c_int, 1)))) | (@as(c_int, 1) << @intCast(@as(c_int, 2))))));
            }
        }
        _ = X11_XStoreColors.?(display, xattr.colormap, colorcells, ncolors);
        SDL_free_REAL(@ptrCast(@alignCast(colorcells)));
    } else {
        xattr.colormap = X11_XCreateColormap.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, visual, AllocNone);
    }
    if ((window.*.undefined_x and window.*.undefined_y) and (window.*.displayID == SDL_GetPrimaryDisplay_REAL())) {
        undefined_position = @"true" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        X11_ConstrainPopup(window, @"false" != 0);
    }
    SDL_RelativeToGlobalForWindow(window, window.*.floating.x, window.*.floating.y, &win_x, &win_y);
    w = X11_XCreateWindow.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, win_x, win_y, @bitCast(@as(c_int, window.*.floating.w)), @bitCast(@as(c_int, window.*.floating.h)), 0, depth, InputOutput, visual, @bitCast(@as(c_long, ((((@as(c_long, 1) << @intCast(@as(c_long, 9))) | (@as(c_long, 1) << @intCast(@as(c_long, 0)))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 6)))) | (@as(c_long, 1) << @intCast(@as(c_long, 13))))), &xattr);
    if (!(w != 0)) {
        return SDL_SetError_REAL("Couldn't create window");
    }
    if (!((window.*.pending_flags & @as(c_ulong, 1)) != 0)) {
        SetWindowBordered(display, screen, w, !((window.*.flags & @as(c_ulong, 16)) != 0));
    }
    sizehints = X11_XAllocSizeHints.?();
    sizehints.*.flags = 0;
    if (!((window.*.flags & @as(c_ulong, 32)) != 0)) {
        sizehints.*.min_width = blk: {
            const tmp = window.*.floating.w;
            sizehints.*.max_width = tmp;
            break :blk tmp;
        };
        sizehints.*.min_height = blk: {
            const tmp = window.*.floating.h;
            sizehints.*.max_height = tmp;
            break :blk tmp;
        };
        sizehints.*.flags |= (@as(c_long, 1) << @intCast(@as(c_long, 5))) | (@as(c_long, 1) << @intCast(@as(c_long, 4)));
    }
    if (!undefined_position) {
        sizehints.*.x = win_x;
        sizehints.*.y = win_y;
        sizehints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 0));
    }
    wmhints = X11_XAllocWMHints.?();
    wmhints.*.input = if (!((window.*.flags & @as(c_ulong, 2147483648)) != 0)) True else False;
    wmhints.*.window_group = data.*.window_group;
    wmhints.*.flags = (@as(c_long, 1) << @intCast(@as(c_long, 0))) | (@as(c_long, 1) << @intCast(@as(c_long, 6)));
    classhints = X11_XAllocClassHint.?();
    classhints.*.res_name = @ptrCast(@alignCast(@constCast(SDL_GetExeName())));
    classhints.*.res_class = @ptrCast(@alignCast(@constCast(SDL_GetAppID())));
    X11_XSetWMProperties.?(display, w, null, null, null, 0, sizehints, wmhints, classhints);
    _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
    _ = X11_XFree.?(@ptrCast(@alignCast(wmhints)));
    _ = X11_XFree.?(@ptrCast(@alignCast(classhints)));
    if (data.*.pid > @as(c_int, 0)) {
        var pid: c_long = data.*.pid;
        _ = &pid;
        _NET_WM_PID = X11_XInternAtom.?(display, "_NET_WM_PID", False);
        _ = X11_XChangeProperty.?(display, w, _NET_WM_PID, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), 32, PropModeReplace, @ptrCast(@alignCast(&pid)), 1);
    }
    X11_SetNetWMState(_this, w, window.*.flags);
    compositor = 2;
    hint = SDL_GetHint_REAL("SDL_X11_WINDOW_TYPE");
    if ((window.*.flags & @as(c_ulong, 131072)) != 0) {
        wintype_name = "_NET_WM_WINDOW_TYPE_UTILITY";
    } else if ((window.*.flags & @as(c_ulong, 262144)) != 0) {
        wintype_name = "_NET_WM_WINDOW_TYPE_TOOLTIP";
    } else if ((window.*.flags & @as(c_ulong, 524288)) != 0) {
        wintype_name = "_NET_WM_WINDOW_TYPE_POPUP_MENU";
    } else if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        wintype_name = hint;
    } else {
        wintype_name = "_NET_WM_WINDOW_TYPE_NORMAL";
        compositor = 1;
    }
    _NET_WM_WINDOW_TYPE = X11_XInternAtom.?(display, "_NET_WM_WINDOW_TYPE", False);
    wintype = X11_XInternAtom.?(display, wintype_name, False);
    _ = X11_XChangeProperty.?(display, w, _NET_WM_WINDOW_TYPE, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(&wintype)), 1);
    if (SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR", @"true" != 0)) {
        _NET_WM_BYPASS_COMPOSITOR = X11_XInternAtom.?(display, "_NET_WM_BYPASS_COMPOSITOR", False);
        _ = X11_XChangeProperty.?(display, w, _NET_WM_BYPASS_COMPOSITOR, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), 32, PropModeReplace, @ptrCast(@alignCast(&compositor)), 1);
    }
    {
        var protocols: [4]Atom = undefined;
        _ = &protocols;
        var proto_count: c_int = 0;
        _ = &proto_count;
        protocols[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &proto_count;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = data.*.atoms.WM_DELETE_WINDOW;
        if (SDL_GetHintBoolean_REAL("SDL_VIDEO_X11_NET_WM_PING", @"true" != 0)) {
            protocols[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &proto_count;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = data.*.atoms._NET_WM_PING;
        }
        if (use_resize_sync) {
            protocols[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &proto_count;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = data.*.atoms._NET_WM_SYNC_REQUEST;
        }
        while (true) {
            while (!(@as(c_ulong, @bitCast(@as(c_long, proto_count))) <= (@sizeOf(@TypeOf(protocols)) / @sizeOf(@TypeOf(protocols[@as(c_int, 0)]))))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "proto_count <= (sizeof(protocols)/sizeof(protocols[0]))",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11window.c", 856);
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
        _ = X11_XSetWMProtocols.?(display, w, @ptrCast(@alignCast(&protocols)), proto_count);
    }
    if (!SetupWindowData(_this, window, w)) {
        _ = X11_XDestroyWindow.?(display, w);
        return @"false" != 0;
    }
    windowdata = window.*.internal;
    if (!((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) and (window.*.parent != null)) {
        _ = X11_XSetTransientForHint.?(display, w, window.*.parent.*.internal.*.xwindow);
    }
    windowdata.*.fullscreen_borders_forced_on = !!((window.*.pending_flags & @as(c_ulong, 1)) != 0) and !!((window.*.flags & @as(c_ulong, 16)) != 0);
    if (use_resize_sync) {
        _ = X11_InitResizeSync(window);
    }
    if ((window.*.flags & @as(c_ulong, 262144)) != 0) {
        var region: Region = X11_XCreateRegion.?();
        _ = &region;
        X11_XShapeCombineRegion.?(display, w, ShapeInput, 0, 0, region, ShapeSet);
        X11_XDestroyRegion.?(region);
    }
    SetupWindowInput(_this, window);
    _ = X11_XSelectInput.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, @as(c_long, 1) << @intCast(@as(c_long, 22)));
    _ = X11_XFlush.?(display);
    return @"true" != 0;
}
pub export fn X11_GetWindowTitle(_this: [*c]SDL_VideoDevice, xwindow: Window) [*c]u8 {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.display;
    _ = &display;
    var status: c_int = undefined;
    _ = &status;
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
    var title: [*c]u8 = null;
    _ = &title;
    status = X11_XGetWindowProperty.?(display, xwindow, data.*.atoms._NET_WM_NAME, 0, 8192, False, data.*.atoms.UTF8_STRING, &real_type, &real_format, &items_read, &items_left, &propdata);
    if ((status == Success) and (propdata != null)) {
        title = SDL_strdup_REAL(@as([*c]u8, @ptrCast(@alignCast(propdata))));
        _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
    } else {
        status = X11_XGetWindowProperty.?(display, xwindow, @as(Atom, @bitCast(@as(c_long, @as(c_int, 39)))), 0, 8192, False, @as(Atom, @bitCast(@as(c_long, @as(c_int, 31)))), &real_type, &real_format, &items_read, &items_left, &propdata);
        if ((status == Success) and (propdata != null)) {
            title = SDL_iconv_string_REAL("UTF-8", "", @as([*c]u8, @ptrCast(@alignCast(propdata))), items_read +% @as(c_ulong, 1));
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Failed to convert WM_NAME title expecting UTF8! Title: %s", title);
            _ = X11_XFree.?(@ptrCast(@alignCast(propdata)));
        } else {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Could not get any window title response from Xorg, returning empty string!");
            title = SDL_strdup_REAL("");
        }
    }
    return title;
}
pub export fn X11_SetWindowTitle(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var xwindow: Window = data.*.xwindow;
    _ = &xwindow;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var title: [*c]u8 = if (window.*.title != null) window.*.title else @as([*c]u8, @as([*c]u8, @constCast("")));
    _ = &title;
    _ = SDL_X11_SetWindowTitle(display, xwindow, title);
}
pub var caught_x11_error: bool = @"false" != 0;
pub fn X11_CatchAnyError(_: [*c]Display, _: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    caught_x11_error = @"true" != 0;
    return 0;
}
pub fn X11_ExternalResizeMoveSync(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var prev_handler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = undefined;
    _ = &prev_handler;
    var childCount: c_uint = undefined;
    _ = &childCount;
    var childReturn: Window = undefined;
    _ = &childReturn;
    var root: Window = undefined;
    _ = &root;
    var parent: Window = undefined;
    _ = &parent;
    var children: [*c]Window = undefined;
    _ = &children;
    var attrs: XWindowAttributes = undefined;
    _ = &attrs;
    var timeout: Uint64 = 0;
    _ = &timeout;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const send_move: bool = !!((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_MOVE)) != 0);
    _ = &send_move;
    const send_resize: bool = !!((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_RESIZE)) != 0);
    _ = &send_resize;
    _ = X11_XSync.?(display, False);
    _ = X11_XQueryTree.?(display, data.*.xwindow, &root, &parent, &children, &childCount);
    prev_handler = X11_XSetErrorHandler.?(X11_CatchAnyError);
    timeout = SDL_GetTicksNS_REAL() +% (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 100)))) *% @as(Uint64, SDL_NS_PER_MS));
    while (true) {
        caught_x11_error = @"false" != 0;
        _ = X11_XSync.?(display, False);
        _ = X11_XGetWindowAttributes.?(display, data.*.xwindow, &attrs);
        _ = X11_XTranslateCoordinates.?(display, parent, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, attrs.x, attrs.y, &x, &y, &childReturn);
        SDL_GlobalToRelativeForWindow(window, x, y, &x, &y);
        if (!caught_x11_error) {
            if (((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_MOVE)) != 0) and (@as(enum_unnamed_55, @intCast(@intFromBool((x == (data.*.expected.x + data.*.border_left)) and (y == (data.*.expected.y + data.*.border_top))))) != 0)) {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_MOVE);
            }
            if (((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_RESIZE)) != 0) and (@as(enum_unnamed_55, @intCast(@intFromBool((attrs.width == data.*.expected.w) and (attrs.height == data.*.expected.h)))) != 0)) {
                data.*.pending_operation &= @bitCast(~X11_PENDING_OP_RESIZE);
            }
            if (data.*.pending_operation == @as(enum_unnamed_55, X11_PENDING_OP_NONE)) {
                break;
            }
        }
        if (SDL_GetTicksNS_REAL() >= timeout) {
            data.*.pending_operation &= @bitCast(~(X11_PENDING_OP_MOVE | X11_PENDING_OP_RESIZE));
            data.*.expected.x = x;
            data.*.expected.y = y;
            data.*.expected.w = attrs.width;
            data.*.expected.h = attrs.height;
            break;
        }
        SDL_Delay_REAL(10);
    }
    if (!caught_x11_error) {
        if (send_move) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, x, y);
        }
        if (send_resize) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, attrs.width, attrs.height);
        }
    }
    _ = X11_XSetErrorHandler.?(prev_handler);
    caught_x11_error = @"false" != 0;
}
pub fn X11_SyncWindowTimeout(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, param_timeout: Uint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var prev_handler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = undefined;
    _ = &prev_handler;
    var timeout: Uint64 = 0;
    _ = &timeout;
    var force_exit: bool = @"false" != 0;
    _ = &force_exit;
    var result: bool = @"true" != 0;
    _ = &result;
    _ = X11_XSync.?(display, False);
    prev_handler = X11_XSetErrorHandler.?(X11_CatchAnyError);
    if (param_timeout != 0) {
        timeout = SDL_GetTicksNS_REAL() +% param_timeout;
    }
    while (true) {
        _ = X11_XSync.?(display, False);
        X11_PumpEvents(_this);
        if (((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_MOVE)) != 0) and (@as(enum_unnamed_55, @intCast(@intFromBool((window.*.x == (data.*.expected.x + data.*.border_left)) and (window.*.y == (data.*.expected.y + data.*.border_top))))) != 0)) {
            data.*.pending_operation &= @bitCast(~X11_PENDING_OP_MOVE);
        }
        if (((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_RESIZE)) != 0) and (@as(enum_unnamed_55, @intCast(@intFromBool((window.*.w == data.*.expected.w) and (window.*.h == data.*.expected.h)))) != 0)) {
            data.*.pending_operation &= @bitCast(~X11_PENDING_OP_RESIZE);
        }
        if (data.*.pending_operation == @as(enum_unnamed_55, X11_PENDING_OP_NONE)) {
            if (force_exit or ((((window.*.x == (data.*.expected.x + data.*.border_left)) and (window.*.y == (data.*.expected.y + data.*.border_top))) and (window.*.w == data.*.expected.w)) and (window.*.h == data.*.expected.h))) {
                break;
            }
            force_exit = @"true" != 0;
        }
        if (SDL_GetTicksNS_REAL() >= timeout) {
            data.*.expected.x = window.*.x;
            data.*.expected.y = window.*.y;
            data.*.expected.w = window.*.w;
            data.*.expected.h = window.*.h;
            result = @"false" != 0;
            break;
        }
        SDL_Delay_REAL(10);
    }
    data.*.pending_operation = X11_PENDING_OP_NONE;
    if (!caught_x11_error) {
        X11_PumpEvents(_this);
    } else {
        result = @"false" != 0;
    }
    _ = X11_XSetErrorHandler.?(prev_handler);
    caught_x11_error = @"false" != 0;
    return result;
}
pub export fn X11_SetWindowIcon(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "X11_SetWindowIcon".*;
    };
    _ = &static_local___func__;
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_WM_ICON: Atom = data.*.videodata.*.atoms._NET_WM_ICON;
    _ = &_NET_WM_ICON;
    var prevHandler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = null;
    _ = &prevHandler;
    var result: bool = @"true" != 0;
    _ = &result;
    if (icon != null) {
        var x: c_int = undefined;
        _ = &x;
        var y: c_int = undefined;
        _ = &y;
        var propsize: c_int = undefined;
        _ = &propsize;
        var propdata: [*c]c_long = undefined;
        _ = &propdata;
        var src: [*c]Uint32 = undefined;
        _ = &src;
        var dst: [*c]c_long = undefined;
        _ = &dst;
        while (true) {
            while (!(icon.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "icon->format == SDL_PIXELFORMAT_ARGB8888",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_x11window.c", 1108);
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
        propsize = @as(c_int, 2) + (icon.*.w * icon.*.h);
        propdata = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, propsize))) *% @sizeOf(c_long))));
        if (!(propdata != null)) {
            return @"false" != 0;
        }
        _ = X11_XSync.?(display, False);
        prevHandler = X11_XSetErrorHandler.?(X11_CatchAnyError);
        propdata[@as(c_int, 0)] = icon.*.w;
        propdata[@as(c_int, 1)] = icon.*.h;
        dst = &propdata[@as(c_int, 2)];
        {
            y = 0;
            while (y < icon.*.h) : (y += 1) {
                src = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(icon.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * icon.*.pitch))))));
                {
                    x = 0;
                    while (x < icon.*.w) : (x += 1) {
                        (blk: {
                            const ref = &dst;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                }
            }
        }
        _ = X11_XChangeProperty.?(display, data.*.xwindow, _NET_WM_ICON, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), 32, PropModeReplace, @ptrCast(@alignCast(propdata)), propsize);
        SDL_free_REAL(@ptrCast(@alignCast(propdata)));
        if (caught_x11_error) {
            result = SDL_SetError_REAL("An error occurred while trying to set the window's icon");
        }
    }
    _ = X11_XFlush.?(display);
    if (prevHandler != null) {
        _ = X11_XSetErrorHandler.?(prevHandler);
        caught_x11_error = @"false" != 0;
    }
    return result;
}
pub export fn X11_UpdateWindowPosition(window: [*c]SDL_Window, use_current_position: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    const rel_x: c_int = if (use_current_position) window.*.x else window.*.pending.x;
    _ = &rel_x;
    const rel_y: c_int = if (use_current_position) window.*.y else window.*.pending.y;
    _ = &rel_y;
    SDL_RelativeToGlobalForWindow(window, rel_x - data.*.border_left, rel_y - data.*.border_top, &data.*.expected.x, &data.*.expected.y);
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        window.*.internal.*.pending_position = @"true" != 0;
    } else {
        data.*.pending_operation |= X11_PENDING_OP_MOVE;
        _ = X11_XMoveWindow.?(display, data.*.xwindow, data.*.expected.x, data.*.expected.y);
    }
}
pub export fn X11_SetWindowPosition(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, @bitCast(X11_PENDING_OP_FULLSCREEN | X11_PENDING_OP_MAXIMIZE))) != 0) {
        X11_FlushPendingEvents(_this, window);
    }
    if ((window.*.flags & @as(c_ulong, 128)) != 0) {
        if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_RESTORE)) != 0) {
            window.*.internal.*.pending_position = @"true" != 0;
        }
        return @"true" != 0;
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
            X11_ConstrainPopup(window, @"true" != 0);
        }
        X11_UpdateWindowPosition(window, @"false" != 0);
    } else {
        window.*.internal.*.fs_repositioned = @"true" != 0;
        _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_UPDATE, @"true" != 0);
    }
    return @"true" != 0;
}
pub export fn X11_SetWindowMinMax(window: [*c]SDL_Window, use_current: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var sizehints: [*c]XSizeHints = X11_XAllocSizeHints.?();
    _ = &sizehints;
    var hint_flags: c_long = 0;
    _ = &hint_flags;
    _ = X11_XGetWMNormalHints.?(display, data.*.xwindow, sizehints, &hint_flags);
    sizehints.*.flags &= ~(((@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)))) | (@as(c_long, 1) << @intCast(@as(c_long, 7))));
    if ((data.*.window.*.flags & @as(c_ulong, 32)) != 0) {
        if ((data.*.window.*.min_w != 0) or (data.*.window.*.min_h != 0)) {
            sizehints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 4));
            sizehints.*.min_width = data.*.window.*.min_w;
            sizehints.*.min_height = data.*.window.*.min_h;
        }
        if ((data.*.window.*.max_w != 0) or (data.*.window.*.max_h != 0)) {
            sizehints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 5));
            sizehints.*.max_width = data.*.window.*.max_w;
            sizehints.*.max_height = data.*.window.*.max_h;
        }
        if ((data.*.window.*.min_aspect > @as(f32, 0.0)) or (data.*.window.*.max_aspect > @as(f32, 0.0))) {
            sizehints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 7));
            SDL_CalculateFraction(data.*.window.*.min_aspect, &sizehints.*.min_aspect.x, &sizehints.*.min_aspect.y);
            SDL_CalculateFraction(data.*.window.*.max_aspect, &sizehints.*.max_aspect.x, &sizehints.*.max_aspect.y);
        }
    } else {
        sizehints.*.flags |= (@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)));
        if (use_current) {
            sizehints.*.min_width = blk: {
                const tmp = if (window.*.last_size_pending) window.*.pending.w else data.*.window.*.floating.w;
                sizehints.*.max_width = tmp;
                break :blk tmp;
            };
            sizehints.*.min_height = blk: {
                const tmp = if (window.*.last_size_pending) window.*.pending.h else data.*.window.*.floating.h;
                sizehints.*.max_height = tmp;
                break :blk tmp;
            };
        } else {
            sizehints.*.min_width = blk: {
                const tmp = if (window.*.last_size_pending) window.*.pending.w else data.*.window.*.windowed.w;
                sizehints.*.max_width = tmp;
                break :blk tmp;
            };
            sizehints.*.min_height = blk: {
                const tmp = if (window.*.last_size_pending) window.*.pending.h else data.*.window.*.windowed.h;
                sizehints.*.max_height = tmp;
                break :blk tmp;
            };
        }
    }
    X11_XSetWMNormalHints.?(display, data.*.xwindow, sizehints);
    _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
}
pub export fn X11_SetWindowMinimumSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_FULLSCREEN)) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        X11_SetWindowMinMax(window, @"true" != 0);
    }
}
pub export fn X11_SetWindowMaximumSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_FULLSCREEN)) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        X11_SetWindowMinMax(window, @"true" != 0);
    }
}
pub export fn X11_SetWindowAspectRatio(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_FULLSCREEN)) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        X11_SetWindowMinMax(window, @"true" != 0);
    }
}
pub export fn X11_SetWindowSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    if ((data.*.pending_operation & @as(enum_unnamed_55, @bitCast(X11_PENDING_OP_MAXIMIZE | X11_PENDING_OP_FULLSCREEN))) != 0) {
        X11_FlushPendingEvents(_this, window);
    }
    if ((window.*.flags & (@as(c_ulong, 128) | @as(c_ulong, 1))) != 0) {
        if ((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_RESTORE)) != 0) {
            data.*.pending_size = @"true" != 0;
        } else {
            window.*.last_size_pending = @"false" != 0;
        }
        return;
    }
    if (!((window.*.flags & @as(c_ulong, 32)) != 0)) {
        if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
            var sizehints: [*c]XSizeHints = X11_XAllocSizeHints.?();
            _ = &sizehints;
            var userhints: c_long = undefined;
            _ = &userhints;
            var dest_x: c_int = undefined;
            _ = &dest_x;
            var dest_y: c_int = undefined;
            _ = &dest_y;
            _ = X11_XGetWMNormalHints.?(display, data.*.xwindow, sizehints, &userhints);
            data.*.expected.w = blk: {
                const tmp = blk_1: {
                    const tmp_2 = window.*.pending.w;
                    sizehints.*.max_width = tmp_2;
                    break :blk_1 tmp_2;
                };
                sizehints.*.min_width = tmp;
                break :blk tmp;
            };
            data.*.expected.h = blk: {
                const tmp = blk_1: {
                    const tmp_2 = window.*.pending.h;
                    sizehints.*.max_height = tmp_2;
                    break :blk_1 tmp_2;
                };
                sizehints.*.min_height = tmp;
                break :blk tmp;
            };
            sizehints.*.flags |= (@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)));
            data.*.pending_operation |= X11_PENDING_OP_RESIZE;
            X11_XSetWMNormalHints.?(display, data.*.xwindow, sizehints);
            _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, window.*.pending.w)), @bitCast(@as(c_int, window.*.pending.h)));
            const x: c_int = if (window.*.last_position_pending) window.*.pending.x else window.*.x;
            _ = &x;
            const y: c_int = if (window.*.last_position_pending) window.*.pending.y else window.*.y;
            _ = &y;
            SDL_RelativeToGlobalForWindow(window, x - data.*.border_left, y - data.*.border_top, &dest_x, &dest_y);
            _ = X11_XMoveWindow.?(display, data.*.xwindow, dest_x, dest_y);
            _ = X11_XRaiseWindow.?(display, data.*.xwindow);
            _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
        }
    } else {
        data.*.expected.w = window.*.pending.w;
        data.*.expected.h = window.*.pending.h;
        data.*.pending_operation |= X11_PENDING_OP_RESIZE;
        _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, data.*.expected.w)), @bitCast(@as(c_int, data.*.expected.h)));
    }
    if ((window.*.flags & @as(c_ulong, 2048)) != 0) {
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, window.*.pending.w, window.*.pending.h);
    }
}
pub export fn X11_GetWindowBordersSize(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    left.* = data.*.border_left;
    right.* = data.*.border_right;
    top.* = data.*.border_top;
    bottom.* = data.*.border_bottom;
    return @"true" != 0;
}
pub export fn X11_SetWindowOpacity(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_WM_WINDOW_OPACITY: Atom = data.*.videodata.*.atoms._NET_WM_WINDOW_OPACITY;
    _ = &_NET_WM_WINDOW_OPACITY;
    if (opacity == @as(f32, 1.0)) {
        _ = X11_XDeleteProperty.?(display, data.*.xwindow, _NET_WM_WINDOW_OPACITY);
    } else {
        const FullyOpaque: Uint32 = 4294967295;
        _ = &FullyOpaque;
        const alpha: c_long = @intFromFloat(@as(f64, @floatCast(opacity)) * @as(f64, @floatFromInt(FullyOpaque)));
        _ = &alpha;
        _ = X11_XChangeProperty.?(display, data.*.xwindow, _NET_WM_WINDOW_OPACITY, @as(Atom, @bitCast(@as(c_long, @as(c_int, 6)))), 32, PropModeReplace, @ptrCast(@alignCast(&alpha)), 1);
    }
    return @"true" != 0;
}
pub export fn X11_SetWindowParent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var parent_data: [*c]SDL_WindowData = @ptrCast(@alignCast(if (parent != null) @as(?*anyopaque, @ptrCast(@alignCast(parent.*.internal))) else @as(?*anyopaque, null)));
    _ = &parent_data;
    var video_data: [*c]SDL_VideoData = _this.*.internal;
    _ = &video_data;
    var display: [*c]Display = video_data.*.display;
    _ = &display;
    if (parent_data != null) {
        _ = X11_XSetTransientForHint.?(display, data.*.xwindow, parent_data.*.xwindow);
    } else {
        _ = X11_XDeleteProperty.?(display, data.*.xwindow, video_data.*.atoms.WM_TRANSIENT_FOR);
    }
    return @"true" != 0;
}
pub export fn X11_SetWindowModal(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var video_data: [*c]SDL_VideoData = _this.*.internal;
    _ = &video_data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = video_data.*.display;
    _ = &display;
    var flags: Uint32 = @truncate(window.*.flags);
    _ = &flags;
    var _NET_WM_STATE: Atom = data.*.videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_MODAL: Atom = data.*.videodata.*.atoms._NET_WM_STATE_MODAL;
    _ = &_NET_WM_STATE_MODAL;
    if (modal) {
        {
            const ref = &flags;
            ref.* = @truncate(@as(c_ulong, ref.*) | @as(c_ulong, 4096));
        }
    } else {
        {
            const ref = &flags;
            ref.* = @truncate(@as(c_ulong, ref.*) & ~@as(c_ulong, 4096));
        }
        _ = X11_XDeleteProperty.?(display, data.*.xwindow, video_data.*.atoms.WM_TRANSIENT_FOR);
    }
    if (X11_IsWindowMapped(_this, window)) {
        var e: XEvent = undefined;
        _ = &e;
        _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
        e.xany.type = ClientMessage;
        e.xclient.message_type = _NET_WM_STATE;
        e.xclient.format = 32;
        e.xclient.window = data.*.xwindow;
        e.xclient.data.l[@as(c_int, 0)] = if (modal) _NET_WM_STATE_ADD else _NET_WM_STATE_REMOVE;
        e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(_NET_WM_STATE_MODAL)));
        e.xclient.data.l[@as(c_int, 3)] = 0;
        _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
    } else {
        X11_SetNetWMState(_this, data.*.xwindow, flags);
    }
    _ = X11_XFlush.?(display);
    return @"true" != 0;
}
pub export fn X11_SetWindowBordered(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) void {
    @setEvalBranchQuota(100000);
    const focused: bool = (window.*.flags & @as(c_ulong, 512)) != @as(SDL_WindowFlags, 0);
    _ = &focused;
    const visible: bool = !((window.*.flags & @as(c_ulong, 8)) != 0) and !window.*.is_hiding;
    _ = &visible;
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var event: XEvent = undefined;
    _ = &event;
    if ((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_FULLSCREEN)) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        SetWindowBordered(display, displaydata.*.screen, data.*.xwindow, bordered);
        _ = X11_XFlush.?(display);
        if (visible) {
            var attr: XWindowAttributes = undefined;
            _ = &attr;
            while (true) {
                _ = X11_XSync.?(display, False);
                _ = X11_XGetWindowAttributes.?(display, data.*.xwindow, &attr);
                if (!(attr.map_state != IsViewable)) break;
            }
            if (focused) {
                _ = X11_XSetInputFocus.?(display, data.*.xwindow, RevertToParent, CurrentTime);
            }
        }
        _ = X11_XSync.?(display, False);
        _ = X11_XCheckIfEvent.?(display, &event, &isUnmapNotify, @ptrCast(@alignCast(&data.*.xwindow)));
        _ = X11_XCheckIfEvent.?(display, &event, &isMapNotify, @ptrCast(@alignCast(&data.*.xwindow)));
        X11_GetBorderValues(data);
        _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, window.*.floating.w)), @bitCast(@as(c_int, window.*.floating.h)));
        _ = X11_XSync.?(display, False);
    } else {
        data.*.toggle_borders = @"true" != 0;
        data.*.fullscreen_borders_forced_on = @"false" != 0;
    }
}
pub export fn X11_SetWindowResizable(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if ((data.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_FULLSCREEN)) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        X11_SetWindowMinMax(window, @"true" != 0);
    }
}
pub export fn X11_SetWindowAlwaysOnTop(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, on_top: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_WM_STATE: Atom = data.*.videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_ABOVE: Atom = data.*.videodata.*.atoms._NET_WM_STATE_ABOVE;
    _ = &_NET_WM_STATE_ABOVE;
    if (X11_IsWindowMapped(_this, window)) {
        var e: XEvent = undefined;
        _ = &e;
        _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
        e.xany.type = ClientMessage;
        e.xclient.message_type = _NET_WM_STATE;
        e.xclient.format = 32;
        e.xclient.window = data.*.xwindow;
        e.xclient.data.l[@as(c_int, 0)] = if (on_top) _NET_WM_STATE_ADD else _NET_WM_STATE_REMOVE;
        e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(_NET_WM_STATE_ABOVE)));
        e.xclient.data.l[@as(c_int, 3)] = 0;
        _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
    } else {
        X11_SetNetWMState(_this, data.*.xwindow, window.*.flags);
    }
    _ = X11_XFlush.?(display);
}
pub export fn X11_ShowWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var bActivate: bool = SDL_GetHintBoolean_REAL("SDL_WINDOW_ACTIVATE_WHEN_SHOWN", @"true" != 0);
    _ = &bActivate;
    var set_position: bool = @"false" != 0;
    _ = &set_position;
    var event: XEvent = undefined;
    _ = &event;
    if (data.*.was_shown) {
        X11_PumpEvents(_this);
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        X11_ConstrainPopup(window, @"true" != 0);
        data.*.pending_position = @"true" != 0;
        set_position = @"true" != 0;
    }
    _ = &bActivate;
    if (!X11_IsWindowMapped(_this, window)) {
        _ = X11_XMapRaised.?(display, data.*.xwindow);
        if (!((window.*.flags & @as(c_ulong, 2048)) != 0) and X11_IsDisplayOk(display)) {
            _ = X11_XIfEvent.?(display, &event, &isMapNotify, @ptrCast(@alignCast(&data.*.xwindow)));
        }
        _ = X11_XFlush.?(display);
        set_position = data.*.pending_position or ((!((window.*.flags & @as(c_ulong, 16)) != 0) and !window.*.undefined_x) and !window.*.undefined_y);
    }
    if (!data.*.videodata.*.net_wm) {
        _ = X11_XSync.?(display, False);
        _ = X11_XSetInputFocus.?(display, data.*.xwindow, @truncate(None), CurrentTime);
        _ = X11_XFlush.?(display);
    }
    if (((window.*.flags & @as(c_ulong, 524288)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((window.*.flags & @as(c_ulong, 2147483648)) != 0))))) != 0)) {
        X11_SetKeyboardFocus(window, @"true" != 0);
    }
    if ((((data.*.border_left == @as(c_int, 0)) and (data.*.border_right == @as(c_int, 0))) and (data.*.border_top == @as(c_int, 0))) and (data.*.border_bottom == @as(c_int, 0))) {
        X11_GetBorderValues(data);
    }
    if (set_position) {
        const tx: c_int = (if (data.*.pending_position) window.*.pending.x else window.*.x) - (if (data.*.was_shown) @as(c_int, 0) else data.*.border_left);
        _ = &tx;
        const ty: c_int = (if (data.*.pending_position) window.*.pending.y else window.*.y) - (if (data.*.was_shown) @as(c_int, 0) else data.*.border_top);
        _ = &ty;
        var x: c_int = undefined;
        _ = &x;
        var y: c_int = undefined;
        _ = &y;
        SDL_RelativeToGlobalForWindow(window, tx, ty, &x, &y);
        data.*.pending_position = @"false" != 0;
        _ = X11_XMoveWindow.?(display, data.*.xwindow, x, y);
    }
    if (!((window.*.flags & @as(c_ulong, 32)) != 0) and X11_CheckCurrentDesktop("xmonad")) {
        _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, window.*.w)), @bitCast(@as(c_int, window.*.h)));
    }
    data.*.size_move_event_flags = X11_SIZE_MOVE_EVENTS_DISABLE;
    _ = X11_XSync.?(display, False);
    X11_PumpEvents(_this);
    data.*.size_move_event_flags = 0;
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_SHOWN, 0, 0);
    data.*.was_shown = @"true" != 0;
    if (data.*.last_xconfigure.type != 0) {
        var x: c_int = undefined;
        _ = &x;
        var y: c_int = undefined;
        _ = &y;
        SDL_GlobalToRelativeForWindow(data.*.window, data.*.last_xconfigure.x, data.*.last_xconfigure.y, &x, &y);
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, data.*.last_xconfigure.width, data.*.last_xconfigure.height);
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, x, y);
    }
}
pub export fn X11_HideWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var screen: c_int = if (displaydata != null) displaydata.*.screen else @as(c_int, 0);
    _ = &screen;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var event: XEvent = undefined;
    _ = &event;
    const is_mapped: bool = X11_IsWindowMapped(_this, window);
    _ = &is_mapped;
    _ = X11_XWithdrawWindow.?(display, data.*.xwindow, screen);
    if ((is_mapped and !((window.*.flags & @as(c_ulong, 2048)) != 0)) and X11_IsDisplayOk(display)) {
        _ = X11_XIfEvent.?(display, &event, &isUnmapNotify, @ptrCast(@alignCast(&data.*.xwindow)));
    }
    _ = X11_XFlush.?(display);
    if (((window.*.flags & @as(c_ulong, 524288)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((window.*.flags & @as(c_ulong, 2147483648)) != 0))))) != 0)) {
        var new_focus: [*c]SDL_Window = undefined;
        _ = &new_focus;
        const set_focus: bool = SDL_ShouldRelinquishPopupFocus(window, &new_focus);
        _ = &set_focus;
        X11_SetKeyboardFocus(new_focus, set_focus);
    }
    _ = X11_XSync.?(display, False);
    X11_PumpEvents(_this);
}
pub fn X11_SetWindowActive(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(window != null)) {
        return SDL_SetError_REAL("Invalid window");
    }
    if (!(window.*.internal != null)) {
        return SDL_SetError_REAL("Invalid window driver data");
    }
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_ACTIVE_WINDOW: Atom = data.*.videodata.*.atoms._NET_ACTIVE_WINDOW;
    _ = &_NET_ACTIVE_WINDOW;
    if (X11_IsWindowMapped(_this, window)) {
        var e: XEvent = undefined;
        _ = &e;
        _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
        e.xany.type = ClientMessage;
        e.xclient.message_type = _NET_ACTIVE_WINDOW;
        e.xclient.format = 32;
        e.xclient.window = data.*.xwindow;
        e.xclient.data.l[@as(c_int, 0)] = 1;
        e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(data.*.user_time)));
        e.xclient.data.l[@as(c_int, 2)] = 0;
        _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
        _ = X11_XFlush.?(display);
    }
    return @"true" != 0;
}
pub export fn X11_RaiseWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var bActivate: bool = SDL_GetHintBoolean_REAL("SDL_WINDOW_ACTIVATE_WHEN_RAISED", @"true" != 0);
    _ = &bActivate;
    _ = X11_XRaiseWindow.?(display, data.*.xwindow);
    if (bActivate) {
        _ = X11_SetWindowActive(_this, window);
    }
    _ = X11_XFlush.?(display);
}
pub fn X11_SetWindowMaximized(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, maximized: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(window != null)) {
        return SDL_SetError_REAL("Invalid window");
    }
    if (!(window.*.internal != null)) {
        return SDL_SetError_REAL("Invalid window driver data");
    }
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_WM_STATE: Atom = data.*.videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_MAXIMIZED_VERT: Atom = data.*.videodata.*.atoms._NET_WM_STATE_MAXIMIZED_VERT;
    _ = &_NET_WM_STATE_MAXIMIZED_VERT;
    var _NET_WM_STATE_MAXIMIZED_HORZ: Atom = data.*.videodata.*.atoms._NET_WM_STATE_MAXIMIZED_HORZ;
    _ = &_NET_WM_STATE_MAXIMIZED_HORZ;
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        return @"true" != 0;
    }
    if (X11_IsWindowMapped(_this, window)) {
        var e: XEvent = undefined;
        _ = &e;
        _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
        e.xany.type = ClientMessage;
        e.xclient.message_type = _NET_WM_STATE;
        e.xclient.format = 32;
        e.xclient.window = data.*.xwindow;
        e.xclient.data.l[@as(c_int, 0)] = if (maximized) _NET_WM_STATE_ADD else _NET_WM_STATE_REMOVE;
        e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(_NET_WM_STATE_MAXIMIZED_VERT)));
        e.xclient.data.l[@as(c_int, 2)] = @bitCast(@as(c_ulong, @truncate(_NET_WM_STATE_MAXIMIZED_HORZ)));
        e.xclient.data.l[@as(c_int, 3)] = 0;
        if (maximized) {
            var displayID: SDL_DisplayID = SDL_GetDisplayForWindow_REAL(window);
            _ = &displayID;
            var bounds: SDL_Rect = undefined;
            _ = &bounds;
            _ = memset(@ptrCast(@alignCast(&bounds)), 0, @sizeOf(@TypeOf(bounds)));
            _ = SDL_GetDisplayUsableBounds_REAL(displayID, &bounds);
            data.*.expected.x = bounds.x + data.*.border_left;
            data.*.expected.y = bounds.y + data.*.border_top;
            data.*.expected.w = bounds.w - (data.*.border_left + data.*.border_right);
            data.*.expected.h = bounds.h - (data.*.border_top + data.*.border_bottom);
        } else {
            data.*.expected.x = window.*.floating.x;
            data.*.expected.y = window.*.floating.y;
            data.*.expected.w = window.*.floating.w;
            data.*.expected.h = window.*.floating.h;
        }
        _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
    } else {
        X11_SetNetWMState(_this, data.*.xwindow, window.*.flags);
    }
    _ = X11_XFlush.?(display);
    return @"true" != 0;
}
pub export fn X11_MaximizeWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, @bitCast(X11_PENDING_OP_FULLSCREEN | X11_PENDING_OP_MINIMIZE))) != 0) {
        _ = SDL_SyncWindow_REAL(window);
    }
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        window.*.internal.*.window_was_maximized = @"true" != 0;
        return;
    }
    if (!((window.*.flags & @as(c_ulong, 64)) != 0)) {
        window.*.internal.*.pending_operation |= X11_PENDING_OP_MAXIMIZE;
        _ = X11_SetWindowMaximized(_this, window, @"true" != 0);
    }
}
pub export fn X11_MinimizeWindow(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    if ((@as(c_ulong, data.*.pending_operation) & @as(c_ulong, 1)) != 0) {
        _ = SDL_SyncWindow_REAL(window);
    }
    data.*.pending_operation |= X11_PENDING_OP_MINIMIZE;
    if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
        data.*.window_was_maximized = !!((window.*.flags & @as(c_ulong, 128)) != 0);
    }
    _ = X11_XIconifyWindow.?(display, data.*.xwindow, displaydata.*.screen);
    _ = X11_XFlush.?(display);
}
pub export fn X11_RestoreWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (!window.*.internal.*.was_shown) {
        return;
    }
    if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, @bitCast((X11_PENDING_OP_FULLSCREEN | X11_PENDING_OP_MAXIMIZE) | X11_PENDING_OP_MINIMIZE))) != 0) {
        _ = SDL_SyncWindow_REAL(window);
    }
    if (((window.*.flags & @as(c_ulong, 1)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((window.*.flags & @as(c_ulong, 64)) != 0))))) != 0)) {
        window.*.internal.*.window_was_maximized = @"false" != 0;
        return;
    }
    if (((window.*.flags & (@as(c_ulong, 64) | @as(c_ulong, 128))) != 0) or (@as(SDL_WindowFlags, window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_MINIMIZE)) != 0)) {
        window.*.internal.*.pending_operation |= X11_PENDING_OP_RESTORE;
    }
    const maximize: bool = !!((window.*.flags & @as(c_ulong, 64)) != 0) and window.*.internal.*.window_was_maximized;
    _ = &maximize;
    _ = X11_SetWindowMaximized(_this, window, maximize);
    X11_ShowWindow(_this, window);
    _ = X11_SetWindowActive(_this, window);
}
pub fn X11_SetWindowFullscreenViaWM(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) callconv(.c) SDL_FullscreenResult {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = _display.*.internal;
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var _NET_WM_STATE: Atom = data.*.videodata.*.atoms._NET_WM_STATE;
    _ = &_NET_WM_STATE;
    var _NET_WM_STATE_FULLSCREEN: Atom = data.*.videodata.*.atoms._NET_WM_STATE_FULLSCREEN;
    _ = &_NET_WM_STATE_FULLSCREEN;
    if (!data.*.was_shown and (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_LEAVE))) {
        return SDL_FULLSCREEN_SUCCEEDED;
    }
    if (X11_IsWindowMapped(_this, window)) {
        var e: XEvent = undefined;
        _ = &e;
        if ((data.*.pending_operation & @as(enum_unnamed_55, @bitCast((X11_PENDING_OP_FULLSCREEN | X11_PENDING_OP_MAXIMIZE) | X11_PENDING_OP_MOVE))) != 0) {
            _ = X11_SyncWindow(_this, window);
        }
        if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
            if (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_UPDATE)) {
                return SDL_FULLSCREEN_FAILED;
            } else if (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_LEAVE)) {
                return SDL_FULLSCREEN_SUCCEEDED;
            }
        }
        if ((fullscreen != 0) and (@as(SDL_FullscreenOp, @intCast(@intFromBool(!((window.*.flags & @as(c_ulong, 32)) != 0)))) != 0)) {
            var sizehints: [*c]XSizeHints = X11_XAllocSizeHints.?();
            _ = &sizehints;
            var flags: c_long = 0;
            _ = &flags;
            _ = X11_XGetWMNormalHints.?(display, data.*.xwindow, sizehints, &flags);
            sizehints.*.flags &= ~(((@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)))) | (@as(c_long, 1) << @intCast(@as(c_long, 7))));
            X11_XSetWMNormalHints.?(display, data.*.xwindow, sizehints);
            _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
        }
        _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
        e.xany.type = ClientMessage;
        e.xclient.message_type = _NET_WM_STATE;
        e.xclient.format = 32;
        e.xclient.window = data.*.xwindow;
        e.xclient.data.l[@as(c_int, 0)] = if (fullscreen != 0) _NET_WM_STATE_ADD else _NET_WM_STATE_REMOVE;
        e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(_NET_WM_STATE_FULLSCREEN)));
        e.xclient.data.l[@as(c_int, 3)] = 0;
        _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
        if (@intFromBool((window.*.flags & @as(c_ulong, 1)) != @as(SDL_WindowFlags, 0)) != @intFromBool(fullscreen != @as(SDL_FullscreenOp, 0))) {
            data.*.pending_operation |= X11_PENDING_OP_FULLSCREEN;
        }
        if (fullscreen != 0) {
            var current: SDL_DisplayID = SDL_GetDisplayForWindowPosition(window);
            _ = &current;
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&data.*.requested_fullscreen_mode).*)) == @sizeOf(@TypeOf((&window.*.current_fullscreen_mode).*)))) @compileError("static assertion failed \"sizeof (*(&data->requested_fullscreen_mode)) == sizeof (*( &window->current_fullscreen_mode))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&data.*.requested_fullscreen_mode)), @ptrCast(@alignCast(&window.*.current_fullscreen_mode)), @sizeOf(@TypeOf((&window.*.current_fullscreen_mode).*)));
            if (fullscreen != @as(SDL_FullscreenOp, @intCast(@intFromBool(!!((window.*.flags & @as(c_ulong, 1)) != 0))))) {
                data.*.window_was_maximized = !!((window.*.flags & @as(c_ulong, 128)) != 0);
            }
            data.*.expected.x = displaydata.*.x;
            data.*.expected.y = displaydata.*.y;
            data.*.expected.w = _display.*.current_mode.*.w;
            data.*.expected.h = _display.*.current_mode.*.h;
            if (!(current != 0) or (current != _display.*.id)) {
                _ = X11_XMoveWindow.?(display, data.*.xwindow, displaydata.*.x, displaydata.*.y);
                data.*.pending_operation |= X11_PENDING_OP_MOVE;
            }
        } else {
            _ = memset(@ptrCast(@alignCast(&data.*.requested_fullscreen_mode)), 0, @sizeOf(@TypeOf(data.*.requested_fullscreen_mode)));
            data.*.pending_position = data.*.fs_repositioned;
            data.*.fs_repositioned = @"false" != 0;
            _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
            e.xany.type = ClientMessage;
            e.xclient.message_type = _NET_WM_STATE;
            e.xclient.format = 32;
            e.xclient.window = data.*.xwindow;
            if (data.*.window_was_maximized) {
                e.xclient.data.l[@as(c_int, 0)] = _NET_WM_STATE_ADD;
            } else {
                e.xclient.data.l[@as(c_int, 0)] = _NET_WM_STATE_REMOVE;
            }
            e.xclient.data.l[@as(c_int, 1)] = @bitCast(@as(c_ulong, @truncate(data.*.videodata.*.atoms._NET_WM_STATE_MAXIMIZED_VERT)));
            e.xclient.data.l[@as(c_int, 2)] = @bitCast(@as(c_ulong, @truncate(data.*.videodata.*.atoms._NET_WM_STATE_MAXIMIZED_HORZ)));
            e.xclient.data.l[@as(c_int, 3)] = 0;
            _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root, 0, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), &e);
        }
    } else {
        var flags: SDL_WindowFlags = undefined;
        _ = &flags;
        flags = window.*.flags;
        if (fullscreen != 0) {
            flags |= 1;
        } else {
            flags &= ~@as(c_ulong, 1);
        }
        X11_SetNetWMState(_this, data.*.xwindow, flags);
    }
    if (data.*.visual.*.class == DirectColor) {
        if (fullscreen != 0) {
            _ = X11_XInstallColormap.?(display, data.*.colormap);
        } else {
            _ = X11_XUninstallColormap.?(display, data.*.colormap);
        }
    }
    return SDL_FULLSCREEN_PENDING;
}
pub fn X11_SetWindowFullscreenLegacy(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _display: [*c]SDL_VideoDisplay, fullscreen: bool) callconv(.c) SDL_FullscreenResult {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = _display.*.internal;
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    const screen: c_int = displaydata.*.screen;
    _ = &screen;
    if (!data.*.was_shown and (@as(c_int, @intFromBool(fullscreen)) == SDL_FULLSCREEN_OP_LEAVE)) {
        return SDL_FULLSCREEN_SUCCEEDED;
    }
    if ((data.*.pending_operation & @as(enum_unnamed_55, @bitCast(X11_PENDING_OP_RESIZE | X11_PENDING_OP_MOVE))) != 0) {
        _ = X11_SyncWindow(_this, window);
    }
    _ = SDL_SendWindowEvent(window, @bitCast(if (fullscreen) SDL_EVENT_WINDOW_ENTER_FULLSCREEN else SDL_EVENT_WINDOW_LEAVE_FULLSCREEN), 0, 0);
    if (fullscreen) {
        if (!((window.*.flags & @as(c_ulong, 32)) != 0)) {
            var sizehints: [*c]XSizeHints = X11_XAllocSizeHints.?();
            _ = &sizehints;
            var flags: c_long = 0;
            _ = &flags;
            _ = X11_XGetWMNormalHints.?(display, data.*.xwindow, sizehints, &flags);
            sizehints.*.flags &= ~(((@as(c_long, 1) << @intCast(@as(c_long, 4))) | (@as(c_long, 1) << @intCast(@as(c_long, 5)))) | (@as(c_long, 1) << @intCast(@as(c_long, 7))));
            X11_XSetWMNormalHints.?(display, data.*.xwindow, sizehints);
            _ = X11_XFree.?(@ptrCast(@alignCast(sizehints)));
        }
        SetWindowBordered(display, screen, data.*.xwindow, @"false" != 0);
        var rect: SDL_Rect = undefined;
        _ = &rect;
        _ = X11_GetDisplayBounds(_this, _display, &rect);
        data.*.pending_operation |= @bitCast(X11_PENDING_OP_MOVE | X11_PENDING_OP_RESIZE);
        data.*.expected.x = rect.x;
        data.*.expected.y = rect.y;
        data.*.expected.w = rect.w;
        data.*.expected.h = rect.h;
        _ = X11_XMoveWindow.?(display, data.*.xwindow, rect.x, rect.y);
        _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, rect.w)), @bitCast(@as(c_int, rect.h)));
        _ = X11_XRaiseWindow.?(display, data.*.xwindow);
    } else {
        data.*.pending_operation |= @bitCast(X11_PENDING_OP_MOVE | X11_PENDING_OP_RESIZE);
        data.*.expected.x = window.*.windowed.x;
        data.*.expected.y = window.*.windowed.y;
        data.*.expected.w = window.*.windowed.w;
        data.*.expected.h = window.*.windowed.h;
        _ = X11_XResizeWindow.?(display, data.*.xwindow, @bitCast(@as(c_int, window.*.windowed.w)), @bitCast(@as(c_int, window.*.windowed.h)));
        _ = X11_XMoveWindow.?(display, data.*.xwindow, window.*.windowed.x, window.*.windowed.y);
        SetWindowBordered(display, screen, data.*.xwindow, (window.*.flags & @as(c_ulong, 16)) == @as(SDL_WindowFlags, 0));
        X11_SetWindowMinMax(data.*.window, @"false" != 0);
    }
    _ = X11_XFlush.?(display);
    return SDL_FULLSCREEN_PENDING;
}
pub export fn X11_SetWindowFullscreen(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) SDL_FullscreenResult {
    @setEvalBranchQuota(100000);
    if (!(window != null)) {
        return @intFromBool(SDL_SetError_REAL("Invalid window"));
    }
    if (!(window.*.internal != null)) {
        return @intFromBool(SDL_SetError_REAL("Invalid window driver data"));
    }
    if (!(_display != null)) {
        return @intFromBool(SDL_SetError_REAL("Invalid display"));
    }
    if (!(_display.*.internal != null)) {
        return @intFromBool(SDL_SetError_REAL("Invalid display driver data"));
    }
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (data.*.net_wm) {
        return X11_SetWindowFullscreenViaWM(_this, window, _display, fullscreen);
    }
    return X11_SetWindowFullscreenLegacy(_this, window, _display, fullscreen != @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_LEAVE));
}
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
pub export fn X11_GetWindowICCProfile(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var attributes: XWindowAttributes = undefined;
    _ = &attributes;
    var icc_profile_atom: Atom = undefined;
    _ = &icc_profile_atom;
    var icc_atom_string: [26]u8 = undefined;
    _ = &icc_atom_string;
    var ret_icc_profile_data: ?*anyopaque = null;
    _ = &ret_icc_profile_data;
    var icc_profile_data: [*c]CARD8 = undefined;
    _ = &icc_profile_data;
    var real_format: c_int = undefined;
    _ = &real_format;
    var real_nitems: c_ulong = undefined;
    _ = &real_nitems;
    var atomProp: SDL_x11Prop = undefined;
    _ = &atomProp;
    _ = X11_XGetWindowAttributes.?(display, data.*.xwindow, &attributes);
    if (X11_XScreenNumberOfScreen.?(attributes.screen) > @as(c_int, 0)) {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&icc_atom_string)), @sizeOf(@TypeOf("_ICC_PROFILE_".*)) +% @as(c_ulong, 12), "%s%d", @as([*c]u8, @as([*c]u8, @constCast("_ICC_PROFILE_"))), X11_XScreenNumberOfScreen.?(attributes.screen));
    } else {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&icc_atom_string)), "_ICC_PROFILE", @sizeOf(@TypeOf("_ICC_PROFILE".*)));
    }
    _ = X11_XGetWindowAttributes.?(display, attributes.screen.*.root, &attributes);
    icc_profile_atom = X11_XInternAtom.?(display, @ptrCast(@alignCast(&icc_atom_string)), True);
    if (icc_profile_atom == @as(Atom, None)) {
        _ = SDL_SetError_REAL("Screen is not calibrated.");
        return null;
    }
    X11_ReadProperty(&atomProp, display, attributes.screen.*.root, icc_profile_atom);
    real_format = atomProp.format;
    real_nitems = @bitCast(@as(c_long, atomProp.count));
    icc_profile_data = atomProp.data;
    if (@as(c_long, real_format) == None) {
        _ = SDL_SetError_REAL("Screen is not calibrated.");
        return null;
    }
    ret_icc_profile_data = SDL_malloc_REAL(real_nitems);
    if (!(ret_icc_profile_data != null)) {
        return null;
    }
    _ = memcpy(ret_icc_profile_data, @ptrCast(@alignCast(icc_profile_data)), real_nitems);
    size.* = real_nitems;
    _ = X11_XFree.?(@ptrCast(@alignCast(icc_profile_data)));
    return ret_icc_profile_data;
}
pub export fn X11_SetWindowMouseGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = undefined;
    _ = &display;
    if (!(data != null)) {
        return SDL_SetError_REAL("Invalid window data");
    }
    data.*.mouse_grabbed = @"false" != 0;
    data.*.pending_grab = @"false" != 0;
    display = data.*.videodata.*.display;
    if (grabbed) {
        if ((window.*.flags & @as(c_ulong, 8)) != 0) {
            return @"true" != 0;
        }
        if ((@as(SDL_MouseButtonFlags, @bitCast(@as(c_int, @as(c_int, @intFromBool(data.*.xinput2_mouse_enabled))))) != 0) and (SDL_GetMouseState_REAL(null, null) != 0)) {
            data.*.pending_grab = @"true" != 0;
            return @"true" != 0;
        }
        if (!data.*.videodata.*.broken_pointer_grab) {
            const mask: c_uint = @bitCast(@as(c_int, @truncate((((@as(c_long, 1) << @intCast(@as(c_long, 2))) | (@as(c_long, 1) << @intCast(@as(c_long, 3)))) | (@as(c_long, 1) << @intCast(@as(c_long, 6)))) | (@as(c_long, 1) << @intCast(@as(c_long, 21))))));
            _ = &mask;
            var attempts: c_int = undefined;
            _ = &attempts;
            var result: c_int = 0;
            _ = &result;
            {
                attempts = 0;
                while (attempts < @as(c_int, 100)) : (attempts += 1) {
                    result = X11_XGrabPointer.?(display, data.*.xwindow, False, mask, GrabModeAsync, GrabModeAsync, data.*.xwindow, None, CurrentTime);
                    if (result == GrabSuccess) {
                        data.*.mouse_grabbed = @"true" != 0;
                        break;
                    }
                    SDL_Delay_REAL(50);
                }
            }
            if (result != GrabSuccess) {
                data.*.videodata.*.broken_pointer_grab = @"true" != 0;
            }
        }
        X11_Xinput2GrabTouch(_this, window);
        _ = X11_XRaiseWindow.?(display, data.*.xwindow);
    } else {
        _ = X11_XUngrabPointer.?(display, CurrentTime);
        X11_Xinput2UngrabTouch(_this, window);
    }
    _ = X11_XSync.?(display, False);
    if (!data.*.videodata.*.broken_pointer_grab) {
        return @"true" != 0;
    } else {
        return SDL_SetError_REAL("The X server refused to let us grab the mouse. You might experience input bugs.");
    }
}
pub export fn X11_SetWindowKeyboardGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = undefined;
    _ = &display;
    if (!(data != null)) {
        return SDL_SetError_REAL("Invalid window data");
    }
    display = data.*.videodata.*.display;
    if (grabbed) {
        if ((window.*.flags & @as(c_ulong, 8)) != 0) {
            return @"true" != 0;
        }
        if (_this.*.internal.*.is_xwayland) {
            var _XWAYLAND_MAY_GRAB_ATOM: Atom = X11_XInternAtom.?(display, "_XWAYLAND_MAY_GRAB_KEYBOARD", False);
            _ = &_XWAYLAND_MAY_GRAB_ATOM;
            if (_XWAYLAND_MAY_GRAB_ATOM != @as(Atom, None)) {
                var client_message: XClientMessageEvent = undefined;
                _ = &client_message;
                client_message.type = ClientMessage;
                client_message.window = data.*.xwindow;
                client_message.format = 32;
                client_message.message_type = _XWAYLAND_MAY_GRAB_ATOM;
                client_message.data.l[@as(c_int, 0)] = 1;
                client_message.data.l[@as(c_int, 1)] = CurrentTime;
                _ = X11_XSendEvent.?(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.default_screen)))]).*.root, False, (@as(c_long, 1) << @intCast(@as(c_long, 19))) | (@as(c_long, 1) << @intCast(@as(c_long, 20))), @ptrCast(@alignCast(&client_message)));
                _ = X11_XFlush.?(display);
            }
        }
        _ = X11_XGrabKeyboard.?(display, data.*.xwindow, True, GrabModeAsync, GrabModeAsync, CurrentTime);
    } else {
        _ = X11_XUngrabKeyboard.?(display, CurrentTime);
    }
    _ = X11_XSync.?(display, False);
    return @"true" != 0;
}
pub export fn X11_DestroyWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if (data != null) {
        var videodata: [*c]SDL_VideoData = data.*.videodata;
        _ = &videodata;
        var display: [*c]Display = videodata.*.display;
        _ = &display;
        var numwindows: c_int = videodata.*.numwindows;
        _ = &numwindows;
        var windowlist: [*c][*c]SDL_WindowData = videodata.*.windowlist;
        _ = &windowlist;
        var i: c_int = undefined;
        _ = &i;
        if (windowlist != null) {
            {
                i = 0;
                while (i < numwindows) : (i += 1) {
                    if ((windowlist[@bitCast(@as(isize, @intCast(i)))] != null) and (windowlist[@bitCast(@as(isize, @intCast(i)))].*.window == window)) {
                        windowlist[@bitCast(@as(isize, @intCast(i)))] = windowlist[@bitCast(@as(isize, @intCast(numwindows - @as(c_int, 1))))];
                        windowlist[@bitCast(@as(isize, @intCast(numwindows - @as(c_int, 1))))] = null;
                        videodata.*.numwindows -= 1;
                        break;
                    }
                }
            }
        }
        X11_DestroyInputContext(data);
        X11_TermResizeSync(window);
        if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
            _ = X11_XDestroyWindow.?(display, data.*.xwindow);
            _ = X11_XFlush.?(display);
        }
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        if (videodata.*.active_cursor_confined_window == window) {
            X11_DestroyPointerBarrier(_this, window);
        }
    }
    window.*.internal = null;
}
pub export fn X11_SetWindowHitTest(_: [*c]SDL_Window, _: bool) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub export fn X11_AcceptDragAndDrop(window: [*c]SDL_Window, accept: bool) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var XdndAware: Atom = data.*.videodata.*.atoms.XdndAware;
    _ = &XdndAware;
    if (accept) {
        var xdnd_version: Atom = 5;
        _ = &xdnd_version;
        _ = X11_XChangeProperty.?(display, data.*.xwindow, XdndAware, @as(Atom, @bitCast(@as(c_long, @as(c_int, 4)))), 32, PropModeReplace, @ptrCast(@alignCast(&xdnd_version)), 1);
    } else {
        _ = X11_XDeleteProperty.?(display, data.*.xwindow, XdndAware);
    }
}
pub export fn X11_FlashWindow(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var display: [*c]Display = undefined;
    _ = &display;
    var wmhints: [*c]XWMHints = undefined;
    _ = &wmhints;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = window.*.internal;
                display = data.*.videodata.*.display;
                wmhints = X11_XGetWMHints.?(display, data.*.xwindow);
                if (!(wmhints != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Couldn't get WM hints");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                wmhints.*.flags &= ~(@as(c_long, 1) << @intCast(@as(c_long, 8)));
                data.*.flashing_window = @"false" != 0;
                data.*.flash_cancel_time = 0;
                switch (operation) {
                    @as(SDL_FlashOperation, SDL_FLASH_CANCEL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_FlashOperation, SDL_FLASH_BRIEFLY) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_FlashOperation, SDL_FLASH_UNTIL_FOCUSED) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            4 => {
                X11_XSetWMHints.?(display, data.*.xwindow, wmhints);
                _ = X11_XFree.?(@ptrCast(@alignCast(wmhints)));
                return @"true" != 0;
            },
            5 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                if (!((window.*.flags & @as(c_ulong, 512)) != 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                wmhints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 8));
                data.*.flashing_window = @"true" != 0;
                data.*.flash_cancel_time = SDL_GetTicks_REAL() +% @as(Uint64, 1000);
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
                if (!((window.*.flags & @as(c_ulong, 512)) != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                wmhints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 8));
                data.*.flashing_window = @"true" != 0;
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
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_X11_SetWindowTitle(display: [*c]Display, xwindow: Window, arg_title: [*c]u8) bool {
    @setEvalBranchQuota(100000);
    var title = arg_title;
    _ = &title;
    var _NET_WM_NAME: Atom = X11_XInternAtom.?(display, "_NET_WM_NAME", False);
    _ = &_NET_WM_NAME;
    var titleprop: XTextProperty = undefined;
    _ = &titleprop;
    var conv: c_int = X11_XmbTextListToTextProperty.?(display, &title, 1, XTextStyle, &titleprop);
    _ = &conv;
    var status: c_int = undefined;
    _ = &status;
    if (X11_XSupportsLocale.?() != True) {
        return SDL_SetError_REAL("Current locale not supported by X server, cannot continue.");
    }
    if (conv == @as(c_int, 0)) {
        X11_XSetTextProperty.?(display, xwindow, &titleprop, @as(Atom, @bitCast(@as(c_long, @as(c_int, 39)))));
        _ = X11_XFree.?(@ptrCast(@alignCast(titleprop.value)));
    } else if (conv < @as(c_int, 0)) {
        return SDL_OutOfMemory_REAL();
    } else {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "%d characters were not convertible to the current locale!", conv);
        return @"true" != 0;
    }
    status = X11_Xutf8TextListToTextProperty.?(display, &title, 1, XUTF8StringStyle, &titleprop);
    if (status == Success) {
        X11_XSetTextProperty.?(display, xwindow, &titleprop, _NET_WM_NAME);
        _ = X11_XFree.?(@ptrCast(@alignCast(titleprop.value)));
    } else {
        return SDL_SetError_REAL("Failed to convert title to UTF8! Bad encoding, or bad Xorg encoding? Window title: «%s»", title);
    }
    _ = X11_XFlush.?(display);
    return @"true" != 0;
}
pub export fn X11_ShowWindowSystemMenu(window: [*c]SDL_Window, x: c_int, y: c_int) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var displaydata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &displaydata;
    var display: [*c]Display = data.*.videodata.*.display;
    _ = &display;
    var root: Window = (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(displaydata.*.screen)))]).*.root;
    _ = &root;
    var e: XClientMessageEvent = undefined;
    _ = &e;
    var childReturn: Window = undefined;
    _ = &childReturn;
    var wx: c_int = undefined;
    _ = &wx;
    var wy: c_int = undefined;
    _ = &wy;
    _ = memset(@ptrCast(@alignCast(&e)), 0, @sizeOf(@TypeOf(e)));
    _ = X11_XTranslateCoordinates.?(display, data.*.xwindow, root, x, y, &wx, &wy, &childReturn);
    e.type = ClientMessage;
    e.window = data.*.xwindow;
    e.message_type = X11_XInternAtom.?(display, "_GTK_SHOW_WINDOW_MENU", 0);
    e.data.l[@as(c_int, 0)] = 0;
    e.data.l[@as(c_int, 1)] = wx;
    e.data.l[@as(c_int, 2)] = wy;
    e.format = 32;
    _ = X11_XSendEvent.?(display, root, False, (@as(c_long, 1) << @intCast(@as(c_long, 20))) | (@as(c_long, 1) << @intCast(@as(c_long, 19))), @ptrCast(@alignCast(&e)));
    _ = X11_XFlush.?(display);
}
pub export fn X11_SyncWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if (((window.*.flags & @as(c_ulong, 2048)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool((data.*.pending_operation & @as(enum_unnamed_55, @bitCast(~(X11_PENDING_OP_RESIZE | X11_PENDING_OP_MOVE)))) == @as(enum_unnamed_55, X11_PENDING_OP_NONE))))) != 0)) {
        X11_ExternalResizeMoveSync(window);
        return @"true" != 0;
    }
    const current_time: Uint64 = SDL_GetTicksNS_REAL();
    _ = &current_time;
    var timeout: Uint64 = 0;
    _ = &timeout;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < _this.*.num_displays) : (i += 1) {
            if ((_this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(current_time < _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns)))) != 0)) {
                timeout = if ((_this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns -% current_time) > timeout) _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.mode_switch_deadline_ns -% current_time else timeout;
            }
        }
    }
    timeout +%= if ((window.*.internal.*.pending_operation & @as(enum_unnamed_55, X11_PENDING_OP_MAXIMIZE)) != 0) @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1000)))) *% @as(Uint64, SDL_NS_PER_MS) else @as(Uint64, @bitCast(@as(c_long, @as(c_int, 100)))) *% @as(Uint64, SDL_NS_PER_MS);
    return X11_SyncWindowTimeout(_this, window, timeout);
}
pub export fn X11_SetWindowFocusable(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) bool {
    @setEvalBranchQuota(100000);
    if (!((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
        var data: [*c]SDL_WindowData = window.*.internal;
        _ = &data;
        var display: [*c]Display = data.*.videodata.*.display;
        _ = &display;
        var wmhints: [*c]XWMHints = undefined;
        _ = &wmhints;
        wmhints = X11_XGetWMHints.?(display, data.*.xwindow);
        if (!(wmhints != null)) {
            return SDL_SetError_REAL("Couldn't get WM hints");
        }
        wmhints.*.input = if (focusable) True else False;
        wmhints.*.flags |= @as(c_long, 1) << @intCast(@as(c_long, 0));
        X11_XSetWMHints.?(display, data.*.xwindow, wmhints);
        _ = X11_XFree.?(@ptrCast(@alignCast(wmhints)));
    } else if ((window.*.flags & @as(c_ulong, 524288)) != 0) {
        if (!((window.*.flags & @as(c_ulong, 8)) != 0)) {
            if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!focusable)))) != 0) and ((window.*.flags & @as(c_ulong, 512)) != 0)) {
                var new_focus: [*c]SDL_Window = undefined;
                _ = &new_focus;
                const set_focus: bool = SDL_ShouldRelinquishPopupFocus(window, &new_focus);
                _ = &set_focus;
                X11_SetKeyboardFocus(new_focus, set_focus);
            } else if (focusable) {
                if (SDL_ShouldFocusPopup(window)) {
                    X11_SetKeyboardFocus(window, @"true" != 0);
                }
            }
        }
        return @"true" != 0;
    }
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const None = @as(c_long, 0);
pub const AnyPropertyType = @as(c_long, 0);
pub const CurrentTime = @as(c_long, 0);
pub const UnmapNotify = @as(c_int, 18);
pub const MapNotify = @as(c_int, 19);
pub const ClientMessage = @as(c_int, 33);
pub const GrabModeAsync = @as(c_int, 1);
pub const GrabSuccess = @as(c_int, 0);
pub const RevertToParent = @as(c_int, 2);
pub const Success = @as(c_int, 0);
pub const InputOutput = @as(c_int, 1);
pub const NotUseful = @as(c_int, 0);
pub const IsUnmapped = @as(c_int, 0);
pub const IsViewable = @as(c_int, 2);
pub const PropModeReplace = @as(c_int, 0);
pub const AllocNone = @as(c_int, 0);
pub const AllocAll = @as(c_int, 1);
pub const DirectColor = @as(c_int, 5);
pub const Bool = c_int;
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub const VisualIDMask = @as(c_int, 0x1);
pub const ShapeSet = @as(c_int, 0);
pub const ShapeInput = @as(c_int, 2);
pub const _NET_WM_STATE_REMOVE = @as(c_long, 0);
pub const _NET_WM_STATE_ADD = @as(c_long, 1);
pub const shminfo = struct_shminfo;
