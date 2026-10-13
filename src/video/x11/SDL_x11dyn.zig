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
pub const __time_t = c_long;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_ClearError_REAL() bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
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
pub const XID = c_ulong;
pub const Atom = c_ulong;
pub const VisualID = c_ulong;
pub const Time = c_ulong;
pub const Window = XID;
pub const Drawable = XID;
pub const Font = XID;
pub const Pixmap = XID;
pub const Cursor = XID;
pub const Colormap = XID;
pub const GContext = XID;
pub const KeySym = XID;
pub const KeyCode = u8;
pub const XPointer = [*c]u8;
pub const struct__XExtData = extern struct {
    number: c_int = 0,
    next: [*c]struct__XExtData = null,
    free_private: ?*const fn (extension: [*c]struct__XExtData) callconv(.c) c_int = null,
    private_data: XPointer = null,
};
pub const XExtData = struct__XExtData;
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
pub const struct__XGC = extern struct {
    ext_data: [*c]XExtData = null,
    gid: GContext = 0,
    rects: c_int = 0,
    dashes: c_int = 0,
    dirty: c_ulong = 0,
    values: XGCValues = @import("std").mem.zeroes(XGCValues),
};
pub const GC = [*c]struct__XGC;
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
const struct_unnamed_15 = extern struct {
    type: BYTE = 0,
    detail: BYTE = 0,
    sequenceNumber: CARD16 = 0,
};
pub const CARD32 = c_uint;
pub const INT16 = c_short;
pub const KeyButMask = CARD16;
pub const BOOL = CARD8;
const struct_unnamed_16 = extern struct {
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
const struct_unnamed_17 = extern struct {
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
const struct_unnamed_18 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    mode: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_19 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    x: CARD16 = 0,
    y: CARD16 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
    count: CARD16 = 0,
    pad2: CARD16 = 0,
};
const struct_unnamed_20 = extern struct {
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
const struct_unnamed_21 = extern struct {
    pad00: CARD32 = 0,
    drawable: CARD32 = 0,
    minorEvent: CARD16 = 0,
    majorEvent: BYTE = 0,
    bpad: BYTE = 0,
};
const struct_unnamed_22 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    state: CARD8 = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_23 = extern struct {
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
const struct_unnamed_24 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
};
const struct_unnamed_25 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    fromConfigure: BOOL = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_26 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    override: BOOL = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_27 = extern struct {
    pad00: CARD32 = 0,
    parent: CARD32 = 0,
    window: CARD32 = 0,
};
const struct_unnamed_28 = extern struct {
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
const struct_unnamed_29 = extern struct {
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
const struct_unnamed_30 = extern struct {
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
const struct_unnamed_31 = extern struct {
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
const struct_unnamed_32 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    width: CARD16 = 0,
    height: CARD16 = 0,
};
const struct_unnamed_33 = extern struct {
    pad00: CARD32 = 0,
    event: CARD32 = 0,
    window: CARD32 = 0,
    parent: CARD32 = 0,
    place: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
    pad3: BYTE = 0,
};
const struct_unnamed_34 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    atom: CARD32 = 0,
    time: CARD32 = 0,
    state: BYTE = 0,
    pad1: BYTE = 0,
    pad2: CARD16 = 0,
};
const struct_unnamed_35 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    window: CARD32 = 0,
    atom: CARD32 = 0,
};
const struct_unnamed_36 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    owner: CARD32 = 0,
    requestor: CARD32 = 0,
    selection: CARD32 = 0,
    target: CARD32 = 0,
    property: CARD32 = 0,
};
const struct_unnamed_37 = extern struct {
    pad00: CARD32 = 0,
    time: CARD32 = 0,
    requestor: CARD32 = 0,
    selection: CARD32 = 0,
    target: CARD32 = 0,
    property: CARD32 = 0,
};
const struct_unnamed_38 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    colormap: CARD32 = 0,
    new: BOOL = 0,
    state: BYTE = 0,
    pad1: BYTE = 0,
    pad2: BYTE = 0,
};
const struct_unnamed_39 = extern struct {
    pad00: CARD32 = 0,
    request: CARD8 = 0,
    firstKeyCode: CARD8 = 0,
    count: CARD8 = 0,
    pad1: BYTE = 0,
};
pub const INT32 = c_int;
const struct_unnamed_42 = extern struct {
    type: CARD32 = 0,
    longs0: INT32 = 0,
    longs1: INT32 = 0,
    longs2: INT32 = 0,
    longs3: INT32 = 0,
    longs4: INT32 = 0,
};
const struct_unnamed_43 = extern struct {
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
const struct_unnamed_44 = extern struct {
    type: CARD32 = 0,
    bytes: [20]INT8 = @import("std").mem.zeroes([20]INT8),
};
const union_unnamed_41 = extern union {
    l: struct_unnamed_42,
    s: struct_unnamed_43,
    b: struct_unnamed_44,
};
const struct_unnamed_40 = extern struct {
    pad00: CARD32 = 0,
    window: CARD32 = 0,
    u: union_unnamed_41 = @import("std").mem.zeroes(union_unnamed_41),
};
const union_unnamed_14 = extern union {
    u: struct_unnamed_15,
    keyButtonPointer: struct_unnamed_16,
    enterLeave: struct_unnamed_17,
    focus: struct_unnamed_18,
    expose: struct_unnamed_19,
    graphicsExposure: struct_unnamed_20,
    noExposure: struct_unnamed_21,
    visibility: struct_unnamed_22,
    createNotify: struct_unnamed_23,
    destroyNotify: struct_unnamed_24,
    unmapNotify: struct_unnamed_25,
    mapNotify: struct_unnamed_26,
    mapRequest: struct_unnamed_27,
    reparent: struct_unnamed_28,
    configureNotify: struct_unnamed_29,
    configureRequest: struct_unnamed_30,
    gravity: struct_unnamed_31,
    resizeRequest: struct_unnamed_32,
    circulate: struct_unnamed_33,
    property: struct_unnamed_34,
    selectionClear: struct_unnamed_35,
    selectionRequest: struct_unnamed_36,
    selectionNotify: struct_unnamed_37,
    colormap: struct_unnamed_38,
    mappingNotify: struct_unnamed_39,
    clientMessage: struct_unnamed_40,
};
pub const struct__xEvent = extern struct {
    u: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
};
pub const xEvent = struct__xEvent;
pub const struct__XLockInfo_45 = opaque {};
pub const struct__XInternalAsync = extern struct {
    next: [*c]struct__XInternalAsync = null,
    handler: ?*const fn ([*c]Display, [*c]xReply, [*c]u8, c_int, XPointer) callconv(.c) c_int = null,
    data: XPointer = null,
};
pub const struct__XLockPtrs = extern struct {
    lock_display: ?*const fn (dpy: [*c]Display) callconv(.c) void = null,
    unlock_display: ?*const fn (dpy: [*c]Display) callconv(.c) void = null,
};
pub const struct__XKeytrans_46 = opaque {};
pub const struct__XDisplayAtoms_47 = opaque {};
pub const struct__XContextDB_48 = opaque {};
const struct_unnamed_49 = extern struct {
    defaultCCCs: XPointer = null,
    clientCmaps: XPointer = null,
    perVisualIntensityMaps: XPointer = null,
};
pub const struct__XIMFilter_50 = opaque {};
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
pub const struct__XkbInfoRec_51 = opaque {};
pub const struct__XtransConnInfo_52 = opaque {};
pub const struct__X11XCBPrivate_53 = opaque {};
pub const struct__XErrorThreadInfo_54 = opaque {};
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
    lock: ?*struct__XLockInfo_45 = null,
    async_handlers: [*c]struct__XInternalAsync = null,
    bigreq_size: c_ulong = 0,
    lock_fns: [*c]struct__XLockPtrs = null,
    idlist_alloc: ?*const fn ([*c]Display, [*c]XID, c_int) callconv(.c) void = null,
    key_bindings: ?*struct__XKeytrans_46 = null,
    cursor_font: Font = 0,
    atoms: ?*struct__XDisplayAtoms_47 = null,
    mode_switch: c_uint = 0,
    num_lock: c_uint = 0,
    context_db: ?*struct__XContextDB_48 = null,
    error_vec: [*c]?*const fn ([*c]Display, [*c]XErrorEvent, [*c]xError) callconv(.c) c_int = null,
    cms: struct_unnamed_49 = @import("std").mem.zeroes(struct_unnamed_49),
    im_filters: ?*struct__XIMFilter_50 = null,
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
    xkb_info: ?*struct__XkbInfoRec_51 = null,
    trans_conn: ?*struct__XtransConnInfo_52 = null,
    xcb: ?*struct__X11XCBPrivate_53 = null,
    next_cookie: c_uint = 0,
    generic_event_vec: [128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]xEvent) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]xEvent) callconv(.c) c_int),
    generic_event_copy_vec: [128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]XGenericEventCookie) callconv(.c) c_int = @import("std").mem.zeroes([128]?*const fn ([*c]Display, [*c]XGenericEventCookie, [*c]XGenericEventCookie) callconv(.c) c_int),
    cookiejar: ?*anyopaque = null,
    error_threads: ?*struct__XErrorThreadInfo_54 = null,
    exit_handler: XIOErrorExitHandler = null,
    exit_handler_data: ?*anyopaque = null,
    in_ifevent: CARD32 = 0,
    ifevent_thread: xthread_t = 0,
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
pub const struct_funcs_55 = extern struct {
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
    f: struct_funcs_55 = @import("std").mem.zeroes(struct_funcs_55),
};
pub const XImage = struct__XImage;
pub const XColor = extern struct {
    pixel: c_ulong = 0,
    red: c_ushort = 0,
    green: c_ushort = 0,
    blue: c_ushort = 0,
    flags: u8 = 0,
    pad: u8 = 0,
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
const union_unnamed_57 = extern union {
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
    data: union_unnamed_57 = @import("std").mem.zeroes(union_unnamed_57),
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
pub const struct__XIM = opaque {
};
pub const XIM = ?*struct__XIM;
pub const struct__XIC = opaque {
};
pub const XIC = ?*struct__XIC;
pub const XIDProc = ?*const fn ([*c]Display, XPointer, XPointer) callconv(.c) void;
pub const XVaNestedList = ?*anyopaque;
pub const XErrorHandler = ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int;
pub const XIOErrorHandler = ?*const fn ([*c]Display) callconv(.c) c_int;
const struct_unnamed_61 = extern struct {
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
    min_aspect: struct_unnamed_61 = @import("std").mem.zeroes(struct_unnamed_61),
    max_aspect: struct_unnamed_61 = @import("std").mem.zeroes(struct_unnamed_61),
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
pub const XICCEncodingStyle = c_uint;
pub const XClassHint = extern struct {
    res_name: [*c]u8 = null,
    res_class: [*c]u8 = null,
};
pub const struct__XComposeStatus = extern struct {
    compose_ptr: XPointer = null,
    chars_matched: c_int = 0,
};
pub const XComposeStatus = struct__XComposeStatus;
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
pub const XrmValue = extern struct {
    size: c_uint = 0,
    addr: XPointer = null,
};
pub const XrmDatabase = ?*struct__XrmHashBucketRec;
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
pub const XkbStatePtr = [*c]struct__XkbStateRec;
pub const struct__XkbMods = extern struct {
    mask: u8 = 0,
    real_mods: u8 = 0,
    vmods: c_ushort = 0,
};
pub const XkbModsRec = struct__XkbMods;
pub const XkbModsPtr = [*c]struct__XkbMods;
pub const struct__XkbKTMapEntry = extern struct {
    active: c_int = 0,
    level: u8 = 0,
    mods: XkbModsRec = @import("std").mem.zeroes(XkbModsRec),
};
pub const XkbKTMapEntryPtr = [*c]struct__XkbKTMapEntry;
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
pub const struct__XkbBehavior = extern struct {
    type: u8 = 0,
    data: u8 = 0,
};
pub const XkbBehavior = struct__XkbBehavior;
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
pub const ShmSeg = c_ulong;
pub const XShmSegmentInfo = extern struct {
    shmseg: ShmSeg = 0,
    shmid: c_int = 0,
    shmaddr: [*c]u8 = null,
    readOnly: c_int = 0,
};
pub const XcursorUInt = u32;
pub const XcursorDim = XcursorUInt;
pub const XcursorPixel = XcursorUInt;
pub const struct__XcursorImage = extern struct {
    version: XcursorUInt = 0,
    size: XcursorDim = 0,
    width: XcursorDim = 0,
    height: XcursorDim = 0,
    xhot: XcursorDim = 0,
    yhot: XcursorDim = 0,
    delay: XcursorUInt = 0,
    pixels: [*c]XcursorPixel = null,
};
pub const XcursorImage = struct__XcursorImage;
pub const struct__XcursorImages = extern struct {
    nimage: c_int = 0,
    images: [*c][*c]XcursorImage = null,
    name: [*c]u8 = null,
};
pub const XcursorImages = struct__XcursorImages;
pub const XdbeVisualInfo = extern struct {
    visual: VisualID = 0,
    depth: c_int = 0,
    perflevel: c_int = 0,
};
pub const XdbeScreenVisualInfo = extern struct {
    count: c_int = 0,
    visinfo: [*c]XdbeVisualInfo = null,
};
pub const XdbeBackBuffer = Drawable;
pub const XdbeSwapAction = u8;
pub const XdbeSwapInfo = extern struct {
    swap_window: Window = 0,
    swap_action: XdbeSwapAction = 0,
};
pub const XdbeBackBufferAttributes = extern struct {
    window: Window = 0,
};
pub const PointerBarrier = XID;
pub const XIEventMask = extern struct {
    deviceid: c_int = 0,
    mask_len: c_int = 0,
    mask: [*c]u8 = null,
};
pub const XIAnyClassInfo = extern struct {
    type: c_int = 0,
    sourceid: c_int = 0,
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
pub const BarrierEventID = c_uint;
pub const XSyncCounter = XID;
pub const struct__XSyncValue = extern struct {
    hi: c_int = 0,
    lo: c_uint = 0,
};
pub const XSyncValue = struct__XSyncValue;
pub const Rotation = c_ushort;
pub const SizeID = c_ushort;
pub const SubpixelOrder = c_ushort;
pub const Connection = c_ushort;
pub const pointer = ?*anyopaque;
pub const XFixed = c_int;
pub const struct__XTransform = extern struct {
    matrix: [3][3]XFixed = @import("std").mem.zeroes([3][3]XFixed),
};
pub const XTransform = struct__XTransform;
pub const RROutput = XID;
pub const RRCrtc = XID;
pub const RRMode = XID;
pub const XRRScreenSize = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    mwidth: c_int = 0,
    mheight: c_int = 0,
};
pub const struct__XRRScreenConfiguration = opaque {
};
pub const XRRScreenConfiguration = struct__XRRScreenConfiguration;
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
pub const XRRPropertyInfo = extern struct {
    pending: c_int = 0,
    range: c_int = 0,
    immutable: c_int = 0,
    num_values: c_int = 0,
    values: [*c]c_long = null,
};
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
pub const SDL_X11_XESetWireToEventRetType = ?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int;
pub const SDL_X11_XSynchronizeRetType = ?*const fn ([*c]Display) callconv(.c) c_int;
pub const SDL_X11_XESetEventToWireRetType = ?*const fn ([*c]Display, [*c]XEvent, [*c]xEvent) callconv(.c) c_int;
pub export fn SDL_X11_LoadSymbols() bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if ((blk: {
        const ref = &x11_load_refcount;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }) == @as(c_int, 0)) {
        var i: c_int = undefined;
        _ = &i;
        var thismod: [*c]c_int = null;
        _ = &thismod;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(x11libs)) / @sizeOf(@TypeOf(x11libs[@as(c_int, 0)])))) : (i += 1) {
                if (x11libs[@bitCast(@as(isize, @intCast(i)))].libname != null) {
                    x11libs[@bitCast(@as(isize, @intCast(i)))].lib = SDL_LoadObject_REAL(x11libs[@bitCast(@as(isize, @intCast(i)))].libname);
                }
            }
        }
        SDL_X11_HAVE_BASEXLIB = 1;
        SDL_X11_HAVE_XFIXES = 1;
        SDL_X11_HAVE_XSYNC = 1;
        SDL_X11_HAVE_XTEST = 1;
        SDL_X11_HAVE_UTF8 = 1;
        SDL_X11_HAVE_SHM = 1;
        SDL_X11_HAVE_IO_32BIT = 1;
        SDL_X11_HAVE_XCURSOR = 1;
        SDL_X11_HAVE_XDBE = 1;
        SDL_X11_HAVE_XINPUT2 = 1;
        SDL_X11_HAVE_XRANDR = 1;
        SDL_X11_HAVE_XSS = 1;
        SDL_X11_HAVE_XSHAPE = 1;
        thismod = &SDL_X11_HAVE_BASEXLIB;
        X11_XAllocSizeHints = @ptrCast(@alignCast(X11_GetSym("XAllocSizeHints", thismod)));
        X11_XAllocWMHints = @ptrCast(@alignCast(X11_GetSym("XAllocWMHints", thismod)));
        X11_XAllocClassHint = @ptrCast(@alignCast(X11_GetSym("XAllocClassHint", thismod)));
        X11_XChangePointerControl = @ptrCast(@alignCast(X11_GetSym("XChangePointerControl", thismod)));
        X11_XChangeProperty = @ptrCast(@alignCast(X11_GetSym("XChangeProperty", thismod)));
        X11_XCheckIfEvent = @ptrCast(@alignCast(X11_GetSym("XCheckIfEvent", thismod)));
        X11_XClearWindow = @ptrCast(@alignCast(X11_GetSym("XClearWindow", thismod)));
        X11_XCloseDisplay = @ptrCast(@alignCast(X11_GetSym("XCloseDisplay", thismod)));
        X11_XConvertSelection = @ptrCast(@alignCast(X11_GetSym("XConvertSelection", thismod)));
        X11_XCreateBitmapFromData = @ptrCast(@alignCast(X11_GetSym("XCreateBitmapFromData", thismod)));
        X11_XCreateColormap = @ptrCast(@alignCast(X11_GetSym("XCreateColormap", thismod)));
        X11_XCreatePixmapCursor = @ptrCast(@alignCast(X11_GetSym("XCreatePixmapCursor", thismod)));
        X11_XCreatePixmap = @ptrCast(@alignCast(X11_GetSym("XCreatePixmap", thismod)));
        X11_XCreateFontCursor = @ptrCast(@alignCast(X11_GetSym("XCreateFontCursor", thismod)));
        X11_XCreateFontSet = @ptrCast(@alignCast(X11_GetSym("XCreateFontSet", thismod)));
        X11_XCreateGC = @ptrCast(@alignCast(X11_GetSym("XCreateGC", thismod)));
        X11_XSetFont = @ptrCast(@alignCast(X11_GetSym("XSetFont", thismod)));
        X11_XAllocColor = @ptrCast(@alignCast(X11_GetSym("XAllocColor", thismod)));
        X11_XCreateImage = @ptrCast(@alignCast(X11_GetSym("XCreateImage", thismod)));
        X11_XCreateWindow = @ptrCast(@alignCast(X11_GetSym("XCreateWindow", thismod)));
        X11_XCopyArea = @ptrCast(@alignCast(X11_GetSym("XCopyArea", thismod)));
        X11_XDefineCursor = @ptrCast(@alignCast(X11_GetSym("XDefineCursor", thismod)));
        X11_XDeleteProperty = @ptrCast(@alignCast(X11_GetSym("XDeleteProperty", thismod)));
        X11_XDestroyWindow = @ptrCast(@alignCast(X11_GetSym("XDestroyWindow", thismod)));
        X11_XDisplayKeycodes = @ptrCast(@alignCast(X11_GetSym("XDisplayKeycodes", thismod)));
        X11_XDrawRectangle = @ptrCast(@alignCast(X11_GetSym("XDrawRectangle", thismod)));
        X11_XFontsOfFontSet = @ptrCast(@alignCast(X11_GetSym("XFontsOfFontSet", thismod)));
        X11_XFillArc = @ptrCast(@alignCast(X11_GetSym("XFillArc", thismod)));
        X11_XDisplayName = @ptrCast(@alignCast(X11_GetSym("XDisplayName", thismod)));
        X11_XDrawString = @ptrCast(@alignCast(X11_GetSym("XDrawString", thismod)));
        X11_XEventsQueued = @ptrCast(@alignCast(X11_GetSym("XEventsQueued", thismod)));
        X11_XFillRectangle = @ptrCast(@alignCast(X11_GetSym("XFillRectangle", thismod)));
        X11_XFilterEvent = @ptrCast(@alignCast(X11_GetSym("XFilterEvent", thismod)));
        X11_XFlush = @ptrCast(@alignCast(X11_GetSym("XFlush", thismod)));
        X11_XFree = @ptrCast(@alignCast(X11_GetSym("XFree", thismod)));
        X11_XFreeCursor = @ptrCast(@alignCast(X11_GetSym("XFreeCursor", thismod)));
        X11_XFreeFontSet = @ptrCast(@alignCast(X11_GetSym("XFreeFontSet", thismod)));
        X11_XFreeGC = @ptrCast(@alignCast(X11_GetSym("XFreeGC", thismod)));
        X11_XFreeFont = @ptrCast(@alignCast(X11_GetSym("XFreeFont", thismod)));
        X11_XFreeModifiermap = @ptrCast(@alignCast(X11_GetSym("XFreeModifiermap", thismod)));
        X11_XFreePixmap = @ptrCast(@alignCast(X11_GetSym("XFreePixmap", thismod)));
        X11_XFreeColormap = @ptrCast(@alignCast(X11_GetSym("XFreeColormap", thismod)));
        X11_XFreeStringList = @ptrCast(@alignCast(X11_GetSym("XFreeStringList", thismod)));
        X11_XGetAtomName = @ptrCast(@alignCast(X11_GetSym("XGetAtomName", thismod)));
        X11_XGetInputFocus = @ptrCast(@alignCast(X11_GetSym("XGetInputFocus", thismod)));
        X11_XGetKeyboardMapping = @ptrCast(@alignCast(X11_GetSym("XGetKeyboardMapping", thismod)));
        X11_XGetErrorDatabaseText = @ptrCast(@alignCast(X11_GetSym("XGetErrorDatabaseText", thismod)));
        X11_XGetModifierMapping = @ptrCast(@alignCast(X11_GetSym("XGetModifierMapping", thismod)));
        X11_XGetPointerControl = @ptrCast(@alignCast(X11_GetSym("XGetPointerControl", thismod)));
        X11_XGetSelectionOwner = @ptrCast(@alignCast(X11_GetSym("XGetSelectionOwner", thismod)));
        X11_XGetVisualInfo = @ptrCast(@alignCast(X11_GetSym("XGetVisualInfo", thismod)));
        X11_XGetWindowAttributes = @ptrCast(@alignCast(X11_GetSym("XGetWindowAttributes", thismod)));
        X11_XGetWindowProperty = @ptrCast(@alignCast(X11_GetSym("XGetWindowProperty", thismod)));
        X11_XGetWMHints = @ptrCast(@alignCast(X11_GetSym("XGetWMHints", thismod)));
        X11_XGetWMNormalHints = @ptrCast(@alignCast(X11_GetSym("XGetWMNormalHints", thismod)));
        X11_XIfEvent = @ptrCast(@alignCast(X11_GetSym("XIfEvent", thismod)));
        X11_XGrabKeyboard = @ptrCast(@alignCast(X11_GetSym("XGrabKeyboard", thismod)));
        X11_XGrabPointer = @ptrCast(@alignCast(X11_GetSym("XGrabPointer", thismod)));
        X11_XGrabServer = @ptrCast(@alignCast(X11_GetSym("XGrabServer", thismod)));
        X11_XIconifyWindow = @ptrCast(@alignCast(X11_GetSym("XIconifyWindow", thismod)));
        X11_XKeysymToKeycode = @ptrCast(@alignCast(X11_GetSym("XKeysymToKeycode", thismod)));
        X11_XKeysymToString = @ptrCast(@alignCast(X11_GetSym("XKeysymToString", thismod)));
        X11_XInstallColormap = @ptrCast(@alignCast(X11_GetSym("XInstallColormap", thismod)));
        X11_XInternAtom = @ptrCast(@alignCast(X11_GetSym("XInternAtom", thismod)));
        X11_XListPixmapFormats = @ptrCast(@alignCast(X11_GetSym("XListPixmapFormats", thismod)));
        X11_XLoadQueryFont = @ptrCast(@alignCast(X11_GetSym("XLoadQueryFont", thismod)));
        X11_XLookupKeysym = @ptrCast(@alignCast(X11_GetSym("XLookupKeysym", thismod)));
        X11_XLookupString = @ptrCast(@alignCast(X11_GetSym("XLookupString", thismod)));
        X11_XMapRaised = @ptrCast(@alignCast(X11_GetSym("XMapRaised", thismod)));
        X11_XMatchVisualInfo = @ptrCast(@alignCast(X11_GetSym("XMatchVisualInfo", thismod)));
        X11_XMissingExtension = @ptrCast(@alignCast(X11_GetSym("XMissingExtension", thismod)));
        X11_XMoveWindow = @ptrCast(@alignCast(X11_GetSym("XMoveWindow", thismod)));
        X11_XOpenDisplay = @ptrCast(@alignCast(X11_GetSym("XOpenDisplay", thismod)));
        X11_XInitThreads = @ptrCast(@alignCast(X11_GetSym("XInitThreads", thismod)));
        X11_XPeekEvent = @ptrCast(@alignCast(X11_GetSym("XPeekEvent", thismod)));
        X11_XPending = @ptrCast(@alignCast(X11_GetSym("XPending", thismod)));
        X11_XGetImage = @ptrCast(@alignCast(X11_GetSym("XGetImage", thismod)));
        X11_XPutImage = @ptrCast(@alignCast(X11_GetSym("XPutImage", thismod)));
        X11_XQueryKeymap = @ptrCast(@alignCast(X11_GetSym("XQueryKeymap", thismod)));
        X11_XQueryPointer = @ptrCast(@alignCast(X11_GetSym("XQueryPointer", thismod)));
        X11_XRaiseWindow = @ptrCast(@alignCast(X11_GetSym("XRaiseWindow", thismod)));
        X11_XReparentWindow = @ptrCast(@alignCast(X11_GetSym("XReparentWindow", thismod)));
        X11_XResetScreenSaver = @ptrCast(@alignCast(X11_GetSym("XResetScreenSaver", thismod)));
        X11_XResizeWindow = @ptrCast(@alignCast(X11_GetSym("XResizeWindow", thismod)));
        X11_XScreenNumberOfScreen = @ptrCast(@alignCast(X11_GetSym("XScreenNumberOfScreen", thismod)));
        X11_XSelectInput = @ptrCast(@alignCast(X11_GetSym("XSelectInput", thismod)));
        X11_XSendEvent = @ptrCast(@alignCast(X11_GetSym("XSendEvent", thismod)));
        X11_XSetErrorHandler = @ptrCast(@alignCast(X11_GetSym("XSetErrorHandler", thismod)));
        X11_XSetForeground = @ptrCast(@alignCast(X11_GetSym("XSetForeground", thismod)));
        X11_XSetIOErrorHandler = @ptrCast(@alignCast(X11_GetSym("XSetIOErrorHandler", thismod)));
        X11_XSetInputFocus = @ptrCast(@alignCast(X11_GetSym("XSetInputFocus", thismod)));
        X11_XSetSelectionOwner = @ptrCast(@alignCast(X11_GetSym("XSetSelectionOwner", thismod)));
        X11_XSetTransientForHint = @ptrCast(@alignCast(X11_GetSym("XSetTransientForHint", thismod)));
        X11_XSetTextProperty = @ptrCast(@alignCast(X11_GetSym("XSetTextProperty", thismod)));
        X11_XSetWindowBackground = @ptrCast(@alignCast(X11_GetSym("XSetWindowBackground", thismod)));
        X11_XSetWMHints = @ptrCast(@alignCast(X11_GetSym("XSetWMHints", thismod)));
        X11_XSetWMNormalHints = @ptrCast(@alignCast(X11_GetSym("XSetWMNormalHints", thismod)));
        X11_XSetWMProperties = @ptrCast(@alignCast(X11_GetSym("XSetWMProperties", thismod)));
        X11_XSetWMProtocols = @ptrCast(@alignCast(X11_GetSym("XSetWMProtocols", thismod)));
        X11_XStoreColors = @ptrCast(@alignCast(X11_GetSym("XStoreColors", thismod)));
        X11_XStoreName = @ptrCast(@alignCast(X11_GetSym("XStoreName", thismod)));
        X11_XStringListToTextProperty = @ptrCast(@alignCast(X11_GetSym("XStringListToTextProperty", thismod)));
        X11_XSync = @ptrCast(@alignCast(X11_GetSym("XSync", thismod)));
        X11_XTextExtents = @ptrCast(@alignCast(X11_GetSym("XTextExtents", thismod)));
        X11_XTranslateCoordinates = @ptrCast(@alignCast(X11_GetSym("XTranslateCoordinates", thismod)));
        X11_XUndefineCursor = @ptrCast(@alignCast(X11_GetSym("XUndefineCursor", thismod)));
        X11_XUngrabKeyboard = @ptrCast(@alignCast(X11_GetSym("XUngrabKeyboard", thismod)));
        X11_XUngrabPointer = @ptrCast(@alignCast(X11_GetSym("XUngrabPointer", thismod)));
        X11_XUngrabServer = @ptrCast(@alignCast(X11_GetSym("XUngrabServer", thismod)));
        X11_XUninstallColormap = @ptrCast(@alignCast(X11_GetSym("XUninstallColormap", thismod)));
        X11_XUnloadFont = @ptrCast(@alignCast(X11_GetSym("XUnloadFont", thismod)));
        X11_XWarpPointer = @ptrCast(@alignCast(X11_GetSym("XWarpPointer", thismod)));
        X11_XWindowEvent = @ptrCast(@alignCast(X11_GetSym("XWindowEvent", thismod)));
        X11_XWithdrawWindow = @ptrCast(@alignCast(X11_GetSym("XWithdrawWindow", thismod)));
        X11_XVisualIDFromVisual = @ptrCast(@alignCast(X11_GetSym("XVisualIDFromVisual", thismod)));
        X11_XGetDefault = @ptrCast(@alignCast(X11_GetSym("XGetDefault", thismod)));
        X11_XQueryExtension = @ptrCast(@alignCast(X11_GetSym("XQueryExtension", thismod)));
        X11_XDisplayString = @ptrCast(@alignCast(X11_GetSym("XDisplayString", thismod)));
        X11_XGetErrorText = @ptrCast(@alignCast(X11_GetSym("XGetErrorText", thismod)));
        X11__XEatData = @ptrCast(@alignCast(X11_GetSym("_XEatData", thismod)));
        X11__XFlush = @ptrCast(@alignCast(X11_GetSym("_XFlush", thismod)));
        X11__XFlushGCCache = @ptrCast(@alignCast(X11_GetSym("_XFlushGCCache", thismod)));
        X11__XRead = @ptrCast(@alignCast(X11_GetSym("_XRead", thismod)));
        X11__XReadPad = @ptrCast(@alignCast(X11_GetSym("_XReadPad", thismod)));
        X11__XSend = @ptrCast(@alignCast(X11_GetSym("_XSend", thismod)));
        X11__XReply = @ptrCast(@alignCast(X11_GetSym("_XReply", thismod)));
        X11__XSetLastRequestRead = @ptrCast(@alignCast(X11_GetSym("_XSetLastRequestRead", thismod)));
        X11_XSynchronize = @ptrCast(@alignCast(X11_GetSym("XSynchronize", thismod)));
        X11_XESetWireToEvent = @ptrCast(@alignCast(X11_GetSym("XESetWireToEvent", thismod)));
        X11_XESetEventToWire = @ptrCast(@alignCast(X11_GetSym("XESetEventToWire", thismod)));
        X11_XRefreshKeyboardMapping = @ptrCast(@alignCast(X11_GetSym("XRefreshKeyboardMapping", thismod)));
        X11_XQueryTree = @ptrCast(@alignCast(X11_GetSym("XQueryTree", thismod)));
        X11_XSupportsLocale = @ptrCast(@alignCast(X11_GetSym("XSupportsLocale", thismod)));
        X11_XmbTextListToTextProperty = @ptrCast(@alignCast(X11_GetSym("XmbTextListToTextProperty", thismod)));
        X11_XCreateRegion = @ptrCast(@alignCast(X11_GetSym("XCreateRegion", thismod)));
        X11_XUnionRectWithRegion = @ptrCast(@alignCast(X11_GetSym("XUnionRectWithRegion", thismod)));
        X11_XDestroyRegion = @ptrCast(@alignCast(X11_GetSym("XDestroyRegion", thismod)));
        X11_XrmInitialize = @ptrCast(@alignCast(X11_GetSym("XrmInitialize", thismod)));
        X11_XResourceManagerString = @ptrCast(@alignCast(X11_GetSym("XResourceManagerString", thismod)));
        X11_XrmGetStringDatabase = @ptrCast(@alignCast(X11_GetSym("XrmGetStringDatabase", thismod)));
        X11_XrmDestroyDatabase = @ptrCast(@alignCast(X11_GetSym("XrmDestroyDatabase", thismod)));
        X11_XrmGetResource = @ptrCast(@alignCast(X11_GetSym("XrmGetResource", thismod)));
        X11_XGetPointerMapping = @ptrCast(@alignCast(X11_GetSym("XGetPointerMapping", thismod)));
        thismod = &SDL_X11_HAVE_XFIXES;
        X11_XFixesCreatePointerBarrier = @ptrCast(@alignCast(X11_GetSym("XFixesCreatePointerBarrier", thismod)));
        X11_XFixesDestroyPointerBarrier = @ptrCast(@alignCast(X11_GetSym("XFixesDestroyPointerBarrier", thismod)));
        X11_XIBarrierReleasePointer = @ptrCast(@alignCast(X11_GetSym("XIBarrierReleasePointer", thismod)));
        X11_XFixesQueryVersion = @ptrCast(@alignCast(X11_GetSym("XFixesQueryVersion", thismod)));
        X11_XFixesSelectSelectionInput = @ptrCast(@alignCast(X11_GetSym("XFixesSelectSelectionInput", thismod)));
        thismod = &SDL_X11_HAVE_XSYNC;
        X11_XSyncQueryExtension = @ptrCast(@alignCast(X11_GetSym("XSyncQueryExtension", thismod)));
        X11_XSyncInitialize = @ptrCast(@alignCast(X11_GetSym("XSyncInitialize", thismod)));
        X11_XSyncCreateCounter = @ptrCast(@alignCast(X11_GetSym("XSyncCreateCounter", thismod)));
        X11_XSyncDestroyCounter = @ptrCast(@alignCast(X11_GetSym("XSyncDestroyCounter", thismod)));
        X11_XSyncSetCounter = @ptrCast(@alignCast(X11_GetSym("XSyncSetCounter", thismod)));
        thismod = &SDL_X11_HAVE_XTEST;
        X11_XTestQueryExtension = @ptrCast(@alignCast(X11_GetSym("XTestQueryExtension", thismod)));
        X11_XTestFakeMotionEvent = @ptrCast(@alignCast(X11_GetSym("XTestFakeMotionEvent", thismod)));
        X11_XGetEventData = @ptrCast(@alignCast(X11_GetSym("XGetEventData", thismod)));
        X11_XFreeEventData = @ptrCast(@alignCast(X11_GetSym("XFreeEventData", thismod)));
        X11_XkbQueryExtension = @ptrCast(@alignCast(X11_GetSym("XkbQueryExtension", thismod)));
        X11_XkbKeycodeToKeysym = @ptrCast(@alignCast(X11_GetSym("XkbKeycodeToKeysym", thismod)));
        X11_XkbSelectEvents = @ptrCast(@alignCast(X11_GetSym("XkbSelectEvents", thismod)));
        X11_XkbSelectEventDetails = @ptrCast(@alignCast(X11_GetSym("XkbSelectEventDetails", thismod)));
        X11_XkbGetNames = @ptrCast(@alignCast(X11_GetSym("XkbGetNames", thismod)));
        X11_XkbGetState = @ptrCast(@alignCast(X11_GetSym("XkbGetState", thismod)));
        X11_XkbGetUpdatedMap = @ptrCast(@alignCast(X11_GetSym("XkbGetUpdatedMap", thismod)));
        X11_XkbGetMap = @ptrCast(@alignCast(X11_GetSym("XkbGetMap", thismod)));
        X11_XkbFreeClientMap = @ptrCast(@alignCast(X11_GetSym("XkbFreeClientMap", thismod)));
        X11_XkbFreeKeyboard = @ptrCast(@alignCast(X11_GetSym("XkbFreeKeyboard", thismod)));
        X11_XkbRefreshKeyboardMapping = @ptrCast(@alignCast(X11_GetSym("XkbRefreshKeyboardMapping", thismod)));
        X11_XkbSetDetectableAutoRepeat = @ptrCast(@alignCast(X11_GetSym("XkbSetDetectableAutoRepeat", thismod)));
        thismod = &SDL_X11_HAVE_UTF8;
        X11_Xutf8TextListToTextProperty = @ptrCast(@alignCast(X11_GetSym("Xutf8TextListToTextProperty", thismod)));
        X11_Xutf8LookupString = @ptrCast(@alignCast(X11_GetSym("Xutf8LookupString", thismod)));
        X11_XCreateIC = @ptrCast(@alignCast(X11_GetSym("XCreateIC", thismod)));
        X11_XDestroyIC = @ptrCast(@alignCast(X11_GetSym("XDestroyIC", thismod)));
        X11_XGetICValues = @ptrCast(@alignCast(X11_GetSym("XGetICValues", thismod)));
        X11_XSetICValues = @ptrCast(@alignCast(X11_GetSym("XSetICValues", thismod)));
        X11_XVaCreateNestedList = @ptrCast(@alignCast(X11_GetSym("XVaCreateNestedList", thismod)));
        X11_XSetICFocus = @ptrCast(@alignCast(X11_GetSym("XSetICFocus", thismod)));
        X11_XUnsetICFocus = @ptrCast(@alignCast(X11_GetSym("XUnsetICFocus", thismod)));
        X11_XOpenIM = @ptrCast(@alignCast(X11_GetSym("XOpenIM", thismod)));
        X11_XCloseIM = @ptrCast(@alignCast(X11_GetSym("XCloseIM", thismod)));
        X11_XSetIMValues = @ptrCast(@alignCast(X11_GetSym("XSetIMValues", thismod)));
        X11_XRegisterIMInstantiateCallback = @ptrCast(@alignCast(X11_GetSym("XRegisterIMInstantiateCallback", thismod)));
        X11_XUnregisterIMInstantiateCallback = @ptrCast(@alignCast(X11_GetSym("XUnregisterIMInstantiateCallback", thismod)));
        X11_Xutf8DrawString = @ptrCast(@alignCast(X11_GetSym("Xutf8DrawString", thismod)));
        X11_Xutf8TextExtents = @ptrCast(@alignCast(X11_GetSym("Xutf8TextExtents", thismod)));
        X11_XSetLocaleModifiers = @ptrCast(@alignCast(X11_GetSym("XSetLocaleModifiers", thismod)));
        X11_Xutf8ResetIC = @ptrCast(@alignCast(X11_GetSym("Xutf8ResetIC", thismod)));
        X11_XExtentsOfFontSet = @ptrCast(@alignCast(X11_GetSym("XExtentsOfFontSet", thismod)));
        X11_XContextDependentDrawing = @ptrCast(@alignCast(X11_GetSym("XContextDependentDrawing", thismod)));
        thismod = &SDL_X11_HAVE_SHM;
        X11_XShmAttach = @ptrCast(@alignCast(X11_GetSym("XShmAttach", thismod)));
        X11_XShmDetach = @ptrCast(@alignCast(X11_GetSym("XShmDetach", thismod)));
        X11_XShmPutImage = @ptrCast(@alignCast(X11_GetSym("XShmPutImage", thismod)));
        X11_XShmGetImage = @ptrCast(@alignCast(X11_GetSym("XShmGetImage", thismod)));
        X11_XShmCreateImage = @ptrCast(@alignCast(X11_GetSym("XShmCreateImage", thismod)));
        X11_XShmCreatePixmap = @ptrCast(@alignCast(X11_GetSym("XShmCreatePixmap", thismod)));
        X11_XShmQueryExtension = @ptrCast(@alignCast(X11_GetSym("XShmQueryExtension", thismod)));
        X11_XShmQueryVersion = @ptrCast(@alignCast(X11_GetSym("XShmQueryVersion", thismod)));
        X11_XShmPixmapFormat = @ptrCast(@alignCast(X11_GetSym("XShmPixmapFormat", thismod)));
        thismod = &SDL_X11_HAVE_IO_32BIT;
        X11__XData32 = @ptrCast(@alignCast(X11_GetSym("_XData32", thismod)));
        X11__XRead32 = @ptrCast(@alignCast(X11_GetSym("_XRead32", thismod)));
        thismod = &SDL_X11_HAVE_XCURSOR;
        X11_XcursorImageCreate = @ptrCast(@alignCast(X11_GetSym("XcursorImageCreate", thismod)));
        X11_XcursorImagesCreate = @ptrCast(@alignCast(X11_GetSym("XcursorImagesCreate", thismod)));
        X11_XcursorImageDestroy = @ptrCast(@alignCast(X11_GetSym("XcursorImageDestroy", thismod)));
        X11_XcursorImagesDestroy = @ptrCast(@alignCast(X11_GetSym("XcursorImagesDestroy", thismod)));
        X11_XcursorImageLoadCursor = @ptrCast(@alignCast(X11_GetSym("XcursorImageLoadCursor", thismod)));
        X11_XcursorImagesLoadCursor = @ptrCast(@alignCast(X11_GetSym("XcursorImagesLoadCursor", thismod)));
        X11_XcursorLibraryLoadCursor = @ptrCast(@alignCast(X11_GetSym("XcursorLibraryLoadCursor", thismod)));
        thismod = &SDL_X11_HAVE_XDBE;
        X11_XdbeQueryExtension = @ptrCast(@alignCast(X11_GetSym("XdbeQueryExtension", thismod)));
        X11_XdbeAllocateBackBufferName = @ptrCast(@alignCast(X11_GetSym("XdbeAllocateBackBufferName", thismod)));
        X11_XdbeDeallocateBackBufferName = @ptrCast(@alignCast(X11_GetSym("XdbeDeallocateBackBufferName", thismod)));
        X11_XdbeSwapBuffers = @ptrCast(@alignCast(X11_GetSym("XdbeSwapBuffers", thismod)));
        X11_XdbeBeginIdiom = @ptrCast(@alignCast(X11_GetSym("XdbeBeginIdiom", thismod)));
        X11_XdbeEndIdiom = @ptrCast(@alignCast(X11_GetSym("XdbeEndIdiom", thismod)));
        X11_XdbeGetVisualInfo = @ptrCast(@alignCast(X11_GetSym("XdbeGetVisualInfo", thismod)));
        X11_XdbeFreeVisualInfo = @ptrCast(@alignCast(X11_GetSym("XdbeFreeVisualInfo", thismod)));
        X11_XdbeGetBackBufferAttributes = @ptrCast(@alignCast(X11_GetSym("XdbeGetBackBufferAttributes", thismod)));
        thismod = &SDL_X11_HAVE_XINPUT2;
        X11_XIQueryDevice = @ptrCast(@alignCast(X11_GetSym("XIQueryDevice", thismod)));
        X11_XIFreeDeviceInfo = @ptrCast(@alignCast(X11_GetSym("XIFreeDeviceInfo", thismod)));
        X11_XISelectEvents = @ptrCast(@alignCast(X11_GetSym("XISelectEvents", thismod)));
        X11_XIGrabTouchBegin = @ptrCast(@alignCast(X11_GetSym("XIGrabTouchBegin", thismod)));
        X11_XIUngrabTouchBegin = @ptrCast(@alignCast(X11_GetSym("XIUngrabTouchBegin", thismod)));
        X11_XIQueryVersion = @ptrCast(@alignCast(X11_GetSym("XIQueryVersion", thismod)));
        X11_XIGetSelectedEvents = @ptrCast(@alignCast(X11_GetSym("XIGetSelectedEvents", thismod)));
        X11_XIGetClientPointer = @ptrCast(@alignCast(X11_GetSym("XIGetClientPointer", thismod)));
        X11_XIWarpPointer = @ptrCast(@alignCast(X11_GetSym("XIWarpPointer", thismod)));
        X11_XIGetProperty = @ptrCast(@alignCast(X11_GetSym("XIGetProperty", thismod)));
        thismod = &SDL_X11_HAVE_XRANDR;
        X11_XRRQueryVersion = @ptrCast(@alignCast(X11_GetSym("XRRQueryVersion", thismod)));
        X11_XRRQueryExtension = @ptrCast(@alignCast(X11_GetSym("XRRQueryExtension", thismod)));
        X11_XRRGetScreenInfo = @ptrCast(@alignCast(X11_GetSym("XRRGetScreenInfo", thismod)));
        X11_XRRConfigCurrentConfiguration = @ptrCast(@alignCast(X11_GetSym("XRRConfigCurrentConfiguration", thismod)));
        X11_XRRConfigCurrentRate = @ptrCast(@alignCast(X11_GetSym("XRRConfigCurrentRate", thismod)));
        X11_XRRConfigRates = @ptrCast(@alignCast(X11_GetSym("XRRConfigRates", thismod)));
        X11_XRRConfigSizes = @ptrCast(@alignCast(X11_GetSym("XRRConfigSizes", thismod)));
        X11_XRRSetScreenConfigAndRate = @ptrCast(@alignCast(X11_GetSym("XRRSetScreenConfigAndRate", thismod)));
        X11_XRRFreeScreenConfigInfo = @ptrCast(@alignCast(X11_GetSym("XRRFreeScreenConfigInfo", thismod)));
        X11_XRRSetScreenSize = @ptrCast(@alignCast(X11_GetSym("XRRSetScreenSize", thismod)));
        X11_XRRGetScreenSizeRange = @ptrCast(@alignCast(X11_GetSym("XRRGetScreenSizeRange", thismod)));
        X11_XRRGetScreenResources = @ptrCast(@alignCast(X11_GetSym("XRRGetScreenResources", thismod)));
        X11_XRRGetScreenResourcesCurrent = @ptrCast(@alignCast(X11_GetSym("XRRGetScreenResourcesCurrent", thismod)));
        X11_XRRFreeScreenResources = @ptrCast(@alignCast(X11_GetSym("XRRFreeScreenResources", thismod)));
        X11_XRRGetOutputInfo = @ptrCast(@alignCast(X11_GetSym("XRRGetOutputInfo", thismod)));
        X11_XRRFreeOutputInfo = @ptrCast(@alignCast(X11_GetSym("XRRFreeOutputInfo", thismod)));
        X11_XRRGetCrtcInfo = @ptrCast(@alignCast(X11_GetSym("XRRGetCrtcInfo", thismod)));
        X11_XRRFreeCrtcInfo = @ptrCast(@alignCast(X11_GetSym("XRRFreeCrtcInfo", thismod)));
        X11_XRRSetCrtcConfig = @ptrCast(@alignCast(X11_GetSym("XRRSetCrtcConfig", thismod)));
        X11_XRRListOutputProperties = @ptrCast(@alignCast(X11_GetSym("XRRListOutputProperties", thismod)));
        X11_XRRQueryOutputProperty = @ptrCast(@alignCast(X11_GetSym("XRRQueryOutputProperty", thismod)));
        X11_XRRGetOutputProperty = @ptrCast(@alignCast(X11_GetSym("XRRGetOutputProperty", thismod)));
        X11_XRRGetOutputPrimary = @ptrCast(@alignCast(X11_GetSym("XRRGetOutputPrimary", thismod)));
        X11_XRRSelectInput = @ptrCast(@alignCast(X11_GetSym("XRRSelectInput", thismod)));
        X11_XRRGetCrtcTransform = @ptrCast(@alignCast(X11_GetSym("XRRGetCrtcTransform", thismod)));
        thismod = &SDL_X11_HAVE_XSS;
        X11_XScreenSaverQueryExtension = @ptrCast(@alignCast(X11_GetSym("XScreenSaverQueryExtension", thismod)));
        X11_XScreenSaverQueryVersion = @ptrCast(@alignCast(X11_GetSym("XScreenSaverQueryVersion", thismod)));
        X11_XScreenSaverSuspend = @ptrCast(@alignCast(X11_GetSym("XScreenSaverSuspend", thismod)));
        thismod = &SDL_X11_HAVE_XSHAPE;
        X11_XShapeCombineMask = @ptrCast(@alignCast(X11_GetSym("XShapeCombineMask", thismod)));
        X11_XShapeCombineRegion = @ptrCast(@alignCast(X11_GetSym("XShapeCombineRegion", thismod)));
        X11_XCreateIC = @ptrCast(@alignCast(X11_GetSym("XCreateIC", &SDL_X11_HAVE_UTF8)));
        X11_XGetICValues = @ptrCast(@alignCast(X11_GetSym("XGetICValues", &SDL_X11_HAVE_UTF8)));
        X11_XSetICValues = @ptrCast(@alignCast(X11_GetSym("XSetICValues", &SDL_X11_HAVE_UTF8)));
        X11_XVaCreateNestedList = @ptrCast(@alignCast(X11_GetSym("XVaCreateNestedList", &SDL_X11_HAVE_UTF8)));
        if (SDL_X11_HAVE_BASEXLIB != 0) {
            _ = SDL_ClearError_REAL();
        } else {
            SDL_X11_UnloadSymbols();
            result = @"false" != 0;
        }
    }
    return result;
}

pub export fn SDL_X11_UnloadSymbols() void {
    @setEvalBranchQuota(100000);
    if (x11_load_refcount > @as(c_int, 0)) {
        if ((blk: {
            const ref = &x11_load_refcount;
            ref.* -= 1;
            break :blk ref.*;
        }) == @as(c_int, 0)) {
            var i: c_int = undefined;
            _ = &i;
            SDL_X11_HAVE_BASEXLIB = 0;
            X11_XAllocSizeHints = null;
            X11_XAllocWMHints = null;
            X11_XAllocClassHint = null;
            X11_XChangePointerControl = null;
            X11_XChangeProperty = null;
            X11_XCheckIfEvent = null;
            X11_XClearWindow = null;
            X11_XCloseDisplay = null;
            X11_XConvertSelection = null;
            X11_XCreateBitmapFromData = null;
            X11_XCreateColormap = null;
            X11_XCreatePixmapCursor = null;
            X11_XCreatePixmap = null;
            X11_XCreateFontCursor = null;
            X11_XCreateFontSet = null;
            X11_XCreateGC = null;
            X11_XSetFont = null;
            X11_XAllocColor = null;
            X11_XCreateImage = null;
            X11_XCreateWindow = null;
            X11_XCopyArea = null;
            X11_XDefineCursor = null;
            X11_XDeleteProperty = null;
            X11_XDestroyWindow = null;
            X11_XDisplayKeycodes = null;
            X11_XDrawRectangle = null;
            X11_XFontsOfFontSet = null;
            X11_XFillArc = null;
            X11_XDisplayName = null;
            X11_XDrawString = null;
            X11_XEventsQueued = null;
            X11_XFillRectangle = null;
            X11_XFilterEvent = null;
            X11_XFlush = null;
            X11_XFree = null;
            X11_XFreeCursor = null;
            X11_XFreeFontSet = null;
            X11_XFreeGC = null;
            X11_XFreeFont = null;
            X11_XFreeModifiermap = null;
            X11_XFreePixmap = null;
            X11_XFreeColormap = null;
            X11_XFreeStringList = null;
            X11_XGetAtomName = null;
            X11_XGetInputFocus = null;
            X11_XGetKeyboardMapping = null;
            X11_XGetErrorDatabaseText = null;
            X11_XGetModifierMapping = null;
            X11_XGetPointerControl = null;
            X11_XGetSelectionOwner = null;
            X11_XGetVisualInfo = null;
            X11_XGetWindowAttributes = null;
            X11_XGetWindowProperty = null;
            X11_XGetWMHints = null;
            X11_XGetWMNormalHints = null;
            X11_XIfEvent = null;
            X11_XGrabKeyboard = null;
            X11_XGrabPointer = null;
            X11_XGrabServer = null;
            X11_XIconifyWindow = null;
            X11_XKeysymToKeycode = null;
            X11_XKeysymToString = null;
            X11_XInstallColormap = null;
            X11_XInternAtom = null;
            X11_XListPixmapFormats = null;
            X11_XLoadQueryFont = null;
            X11_XLookupKeysym = null;
            X11_XLookupString = null;
            X11_XMapRaised = null;
            X11_XMatchVisualInfo = null;
            X11_XMissingExtension = null;
            X11_XMoveWindow = null;
            X11_XOpenDisplay = null;
            X11_XInitThreads = null;
            X11_XPeekEvent = null;
            X11_XPending = null;
            X11_XGetImage = null;
            X11_XPutImage = null;
            X11_XQueryKeymap = null;
            X11_XQueryPointer = null;
            X11_XRaiseWindow = null;
            X11_XReparentWindow = null;
            X11_XResetScreenSaver = null;
            X11_XResizeWindow = null;
            X11_XScreenNumberOfScreen = null;
            X11_XSelectInput = null;
            X11_XSendEvent = null;
            X11_XSetErrorHandler = null;
            X11_XSetForeground = null;
            X11_XSetIOErrorHandler = null;
            X11_XSetInputFocus = null;
            X11_XSetSelectionOwner = null;
            X11_XSetTransientForHint = null;
            X11_XSetTextProperty = null;
            X11_XSetWindowBackground = null;
            X11_XSetWMHints = null;
            X11_XSetWMNormalHints = null;
            X11_XSetWMProperties = null;
            X11_XSetWMProtocols = null;
            X11_XStoreColors = null;
            X11_XStoreName = null;
            X11_XStringListToTextProperty = null;
            X11_XSync = null;
            X11_XTextExtents = null;
            X11_XTranslateCoordinates = null;
            X11_XUndefineCursor = null;
            X11_XUngrabKeyboard = null;
            X11_XUngrabPointer = null;
            X11_XUngrabServer = null;
            X11_XUninstallColormap = null;
            X11_XUnloadFont = null;
            X11_XWarpPointer = null;
            X11_XWindowEvent = null;
            X11_XWithdrawWindow = null;
            X11_XVisualIDFromVisual = null;
            X11_XGetDefault = null;
            X11_XQueryExtension = null;
            X11_XDisplayString = null;
            X11_XGetErrorText = null;
            X11__XEatData = null;
            X11__XFlush = null;
            X11__XFlushGCCache = null;
            X11__XRead = null;
            X11__XReadPad = null;
            X11__XSend = null;
            X11__XReply = null;
            X11__XSetLastRequestRead = null;
            X11_XSynchronize = null;
            X11_XESetWireToEvent = null;
            X11_XESetEventToWire = null;
            X11_XRefreshKeyboardMapping = null;
            X11_XQueryTree = null;
            X11_XSupportsLocale = null;
            X11_XmbTextListToTextProperty = null;
            X11_XCreateRegion = null;
            X11_XUnionRectWithRegion = null;
            X11_XDestroyRegion = null;
            X11_XrmInitialize = null;
            X11_XResourceManagerString = null;
            X11_XrmGetStringDatabase = null;
            X11_XrmDestroyDatabase = null;
            X11_XrmGetResource = null;
            X11_XGetPointerMapping = null;
            SDL_X11_HAVE_XFIXES = 0;
            X11_XFixesCreatePointerBarrier = null;
            X11_XFixesDestroyPointerBarrier = null;
            X11_XIBarrierReleasePointer = null;
            X11_XFixesQueryVersion = null;
            X11_XFixesSelectSelectionInput = null;
            SDL_X11_HAVE_XSYNC = 0;
            X11_XSyncQueryExtension = null;
            X11_XSyncInitialize = null;
            X11_XSyncCreateCounter = null;
            X11_XSyncDestroyCounter = null;
            X11_XSyncSetCounter = null;
            SDL_X11_HAVE_XTEST = 0;
            X11_XTestQueryExtension = null;
            X11_XTestFakeMotionEvent = null;
            X11_XGetEventData = null;
            X11_XFreeEventData = null;
            X11_XkbQueryExtension = null;
            X11_XkbKeycodeToKeysym = null;
            X11_XkbSelectEvents = null;
            X11_XkbSelectEventDetails = null;
            X11_XkbGetNames = null;
            X11_XkbGetState = null;
            X11_XkbGetUpdatedMap = null;
            X11_XkbGetMap = null;
            X11_XkbFreeClientMap = null;
            X11_XkbFreeKeyboard = null;
            X11_XkbRefreshKeyboardMapping = null;
            X11_XkbSetDetectableAutoRepeat = null;
            SDL_X11_HAVE_UTF8 = 0;
            X11_Xutf8TextListToTextProperty = null;
            X11_Xutf8LookupString = null;
            X11_XCreateIC = null;
            X11_XDestroyIC = null;
            X11_XGetICValues = null;
            X11_XSetICValues = null;
            X11_XVaCreateNestedList = null;
            X11_XSetICFocus = null;
            X11_XUnsetICFocus = null;
            X11_XOpenIM = null;
            X11_XCloseIM = null;
            X11_XSetIMValues = null;
            X11_XRegisterIMInstantiateCallback = null;
            X11_XUnregisterIMInstantiateCallback = null;
            X11_Xutf8DrawString = null;
            X11_Xutf8TextExtents = null;
            X11_XSetLocaleModifiers = null;
            X11_Xutf8ResetIC = null;
            X11_XExtentsOfFontSet = null;
            X11_XContextDependentDrawing = null;
            SDL_X11_HAVE_SHM = 0;
            X11_XShmAttach = null;
            X11_XShmDetach = null;
            X11_XShmPutImage = null;
            X11_XShmGetImage = null;
            X11_XShmCreateImage = null;
            X11_XShmCreatePixmap = null;
            X11_XShmQueryExtension = null;
            X11_XShmQueryVersion = null;
            X11_XShmPixmapFormat = null;
            SDL_X11_HAVE_IO_32BIT = 0;
            X11__XData32 = null;
            X11__XRead32 = null;
            SDL_X11_HAVE_XCURSOR = 0;
            X11_XcursorImageCreate = null;
            X11_XcursorImagesCreate = null;
            X11_XcursorImageDestroy = null;
            X11_XcursorImagesDestroy = null;
            X11_XcursorImageLoadCursor = null;
            X11_XcursorImagesLoadCursor = null;
            X11_XcursorLibraryLoadCursor = null;
            SDL_X11_HAVE_XDBE = 0;
            X11_XdbeQueryExtension = null;
            X11_XdbeAllocateBackBufferName = null;
            X11_XdbeDeallocateBackBufferName = null;
            X11_XdbeSwapBuffers = null;
            X11_XdbeBeginIdiom = null;
            X11_XdbeEndIdiom = null;
            X11_XdbeGetVisualInfo = null;
            X11_XdbeFreeVisualInfo = null;
            X11_XdbeGetBackBufferAttributes = null;
            SDL_X11_HAVE_XINPUT2 = 0;
            X11_XIQueryDevice = null;
            X11_XIFreeDeviceInfo = null;
            X11_XISelectEvents = null;
            X11_XIGrabTouchBegin = null;
            X11_XIUngrabTouchBegin = null;
            X11_XIQueryVersion = null;
            X11_XIGetSelectedEvents = null;
            X11_XIGetClientPointer = null;
            X11_XIWarpPointer = null;
            X11_XIGetProperty = null;
            SDL_X11_HAVE_XRANDR = 0;
            X11_XRRQueryVersion = null;
            X11_XRRQueryExtension = null;
            X11_XRRGetScreenInfo = null;
            X11_XRRConfigCurrentConfiguration = null;
            X11_XRRConfigCurrentRate = null;
            X11_XRRConfigRates = null;
            X11_XRRConfigSizes = null;
            X11_XRRSetScreenConfigAndRate = null;
            X11_XRRFreeScreenConfigInfo = null;
            X11_XRRSetScreenSize = null;
            X11_XRRGetScreenSizeRange = null;
            X11_XRRGetScreenResources = null;
            X11_XRRGetScreenResourcesCurrent = null;
            X11_XRRFreeScreenResources = null;
            X11_XRRGetOutputInfo = null;
            X11_XRRFreeOutputInfo = null;
            X11_XRRGetCrtcInfo = null;
            X11_XRRFreeCrtcInfo = null;
            X11_XRRSetCrtcConfig = null;
            X11_XRRListOutputProperties = null;
            X11_XRRQueryOutputProperty = null;
            X11_XRRGetOutputProperty = null;
            X11_XRRGetOutputPrimary = null;
            X11_XRRSelectInput = null;
            X11_XRRGetCrtcTransform = null;
            SDL_X11_HAVE_XSS = 0;
            X11_XScreenSaverQueryExtension = null;
            X11_XScreenSaverQueryVersion = null;
            X11_XScreenSaverSuspend = null;
            SDL_X11_HAVE_XSHAPE = 0;
            X11_XShapeCombineMask = null;
            X11_XShapeCombineRegion = null;
            X11_XCreateIC = null;
            X11_XGetICValues = null;
            X11_XSetICValues = null;
            X11_XVaCreateNestedList = null;
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(x11libs)) / @sizeOf(@TypeOf(x11libs[@as(c_int, 0)])))) : (i += 1) {
                    if (x11libs[@bitCast(@as(isize, @intCast(i)))].lib != null) {
                        SDL_UnloadObject_REAL(x11libs[@bitCast(@as(isize, @intCast(i)))].lib);
                        x11libs[@bitCast(@as(isize, @intCast(i)))].lib = null;
                    }
                }
            }
        }
    }
}
pub const SDL_DYNX11FN_XAllocSizeHints = ?*const fn () callconv(.c) [*c]XSizeHints;
pub export var X11_XAllocSizeHints: SDL_DYNX11FN_XAllocSizeHints = null;
pub const SDL_DYNX11FN_XAllocWMHints = ?*const fn () callconv(.c) [*c]XWMHints;
pub export var X11_XAllocWMHints: SDL_DYNX11FN_XAllocWMHints = null;
pub const SDL_DYNX11FN_XAllocClassHint = ?*const fn () callconv(.c) [*c]XClassHint;
pub export var X11_XAllocClassHint: SDL_DYNX11FN_XAllocClassHint = null;
pub const SDL_DYNX11FN_XChangePointerControl = ?*const fn (a: [*c]Display, b: c_int, c: c_int, d: c_int, e: c_int, f: c_int) callconv(.c) c_int;
pub export var X11_XChangePointerControl: SDL_DYNX11FN_XChangePointerControl = null;
pub const SDL_DYNX11FN_XChangeProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: Atom, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) c_int;
pub export var X11_XChangeProperty: SDL_DYNX11FN_XChangeProperty = null;
pub const SDL_DYNX11FN_XCheckIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub export var X11_XCheckIfEvent: SDL_DYNX11FN_XCheckIfEvent = null;
pub const SDL_DYNX11FN_XClearWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub export var X11_XClearWindow: SDL_DYNX11FN_XClearWindow = null;
pub const SDL_DYNX11FN_XCloseDisplay = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XCloseDisplay: SDL_DYNX11FN_XCloseDisplay = null;
pub const SDL_DYNX11FN_XConvertSelection = ?*const fn (a: [*c]Display, b: Atom, c: Atom, d: Atom, e: Window, f: Time) callconv(.c) c_int;
pub export var X11_XConvertSelection: SDL_DYNX11FN_XConvertSelection = null;
pub const SDL_DYNX11FN_XCreateBitmapFromData = ?*const fn (dpy: [*c]Display, d: Drawable, data: [*c]const u8, width: c_uint, height: c_uint) callconv(.c) Pixmap;
pub export var X11_XCreateBitmapFromData: SDL_DYNX11FN_XCreateBitmapFromData = null;
pub const SDL_DYNX11FN_XCreateColormap = ?*const fn (a: [*c]Display, b: Window, c: [*c]Visual, d: c_int) callconv(.c) Colormap;
pub export var X11_XCreateColormap: SDL_DYNX11FN_XCreateColormap = null;
pub const SDL_DYNX11FN_XCreatePixmapCursor = ?*const fn (a: [*c]Display, b: Pixmap, c: Pixmap, d: [*c]XColor, e: [*c]XColor, f: c_uint, g: c_uint) callconv(.c) Cursor;
pub export var X11_XCreatePixmapCursor: SDL_DYNX11FN_XCreatePixmapCursor = null;
pub const SDL_DYNX11FN_XCreatePixmap = ?*const fn (a: [*c]Display, b: Drawable, d: c_uint, e: c_uint, f: c_uint) callconv(.c) Cursor;
pub export var X11_XCreatePixmap: SDL_DYNX11FN_XCreatePixmap = null;
pub const SDL_DYNX11FN_XCreateFontCursor = ?*const fn (a: [*c]Display, b: c_uint) callconv(.c) Cursor;
pub export var X11_XCreateFontCursor: SDL_DYNX11FN_XCreateFontCursor = null;
pub const SDL_DYNX11FN_XCreateFontSet = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c][*c][*c]u8, d: [*c]c_int, e: [*c][*c]u8) callconv(.c) XFontSet;
pub export var X11_XCreateFontSet: SDL_DYNX11FN_XCreateFontSet = null;
pub const SDL_DYNX11FN_XCreateGC = ?*const fn (a: [*c]Display, b: Drawable, c: c_ulong, d: [*c]XGCValues) callconv(.c) GC;
pub export var X11_XCreateGC: SDL_DYNX11FN_XCreateGC = null;
pub const SDL_DYNX11FN_XSetFont = ?*const fn (a: [*c]Display, b: GC, c: Font) callconv(.c) void;
pub export var X11_XSetFont: SDL_DYNX11FN_XSetFont = null;
pub const SDL_DYNX11FN_XAllocColor = ?*const fn (a: [*c]Display, b: Colormap, c: [*c]XColor) callconv(.c) c_int;
pub export var X11_XAllocColor: SDL_DYNX11FN_XAllocColor = null;
pub const SDL_DYNX11FN_XCreateImage = ?*const fn (a: [*c]Display, b: [*c]Visual, c: c_uint, d: c_int, e: c_int, f: [*c]u8, g: c_uint, h: c_uint, i: c_int, j: c_int) callconv(.c) [*c]XImage;
pub export var X11_XCreateImage: SDL_DYNX11FN_XCreateImage = null;
pub const SDL_DYNX11FN_XCreateWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_uint, h: c_int, i: c_uint, j: [*c]Visual, k: c_ulong, l: [*c]XSetWindowAttributes) callconv(.c) Window;
pub export var X11_XCreateWindow: SDL_DYNX11FN_XCreateWindow = null;
pub const SDL_DYNX11FN_XCopyArea = ?*const fn (a: [*c]Display, b: Drawable, c: Drawable, d: GC, e: c_int, f: c_int, g: c_uint, h: c_uint, i: c_int, j: c_int) callconv(.c) void;
pub export var X11_XCopyArea: SDL_DYNX11FN_XCopyArea = null;
pub const SDL_DYNX11FN_XDefineCursor = ?*const fn (a: [*c]Display, b: Window, c: Cursor) callconv(.c) c_int;
pub export var X11_XDefineCursor: SDL_DYNX11FN_XDefineCursor = null;
pub const SDL_DYNX11FN_XDeleteProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom) callconv(.c) c_int;
pub export var X11_XDeleteProperty: SDL_DYNX11FN_XDeleteProperty = null;
pub const SDL_DYNX11FN_XDestroyWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub export var X11_XDestroyWindow: SDL_DYNX11FN_XDestroyWindow = null;
pub const SDL_DYNX11FN_XDisplayKeycodes = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XDisplayKeycodes: SDL_DYNX11FN_XDisplayKeycodes = null;
pub const SDL_DYNX11FN_XDrawRectangle = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: c_uint, g: c_uint) callconv(.c) c_int;
pub export var X11_XDrawRectangle: SDL_DYNX11FN_XDrawRectangle = null;
pub const SDL_DYNX11FN_XFontsOfFontSet = ?*const fn (a: XFontSet, b: [*c][*c][*c]XFontStruct, c: [*c][*c][*c]u8) callconv(.c) c_int;
pub export var X11_XFontsOfFontSet: SDL_DYNX11FN_XFontsOfFontSet = null;
pub const SDL_DYNX11FN_XFillArc = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: c_uint, g: c_uint, h: c_int, i: c_int) callconv(.c) c_int;
pub export var X11_XFillArc: SDL_DYNX11FN_XFillArc = null;
pub const SDL_DYNX11FN_XDisplayName = ?*const fn (a: [*c]const u8) callconv(.c) [*c]u8;
pub export var X11_XDisplayName: SDL_DYNX11FN_XDisplayName = null;
pub const SDL_DYNX11FN_XDrawString = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: [*c]const u8, g: c_int) callconv(.c) c_int;
pub export var X11_XDrawString: SDL_DYNX11FN_XDrawString = null;
pub const SDL_DYNX11FN_XEventsQueued = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub export var X11_XEventsQueued: SDL_DYNX11FN_XEventsQueued = null;
pub const SDL_DYNX11FN_XFillRectangle = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: c_int, e: c_int, f: c_uint, g: c_uint) callconv(.c) c_int;
pub export var X11_XFillRectangle: SDL_DYNX11FN_XFillRectangle = null;
pub const SDL_DYNX11FN_XFilterEvent = ?*const fn (event: [*c]XEvent, w: Window) callconv(.c) c_int;
pub export var X11_XFilterEvent: SDL_DYNX11FN_XFilterEvent = null;
pub const SDL_DYNX11FN_XFlush = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XFlush: SDL_DYNX11FN_XFlush = null;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub export var X11_XFree: SDL_DYNX11FN_XFree = null;
pub const SDL_DYNX11FN_XFreeCursor = ?*const fn (a: [*c]Display, b: Cursor) callconv(.c) c_int;
pub export var X11_XFreeCursor: SDL_DYNX11FN_XFreeCursor = null;
pub const SDL_DYNX11FN_XFreeFontSet = ?*const fn (a: [*c]Display, b: XFontSet) callconv(.c) void;
pub export var X11_XFreeFontSet: SDL_DYNX11FN_XFreeFontSet = null;
pub const SDL_DYNX11FN_XFreeGC = ?*const fn (a: [*c]Display, b: GC) callconv(.c) c_int;
pub export var X11_XFreeGC: SDL_DYNX11FN_XFreeGC = null;
pub const SDL_DYNX11FN_XFreeFont = ?*const fn (a: [*c]Display, b: [*c]XFontStruct) callconv(.c) c_int;
pub export var X11_XFreeFont: SDL_DYNX11FN_XFreeFont = null;
pub const SDL_DYNX11FN_XFreeModifiermap = ?*const fn (a: [*c]XModifierKeymap) callconv(.c) c_int;
pub export var X11_XFreeModifiermap: SDL_DYNX11FN_XFreeModifiermap = null;
pub const SDL_DYNX11FN_XFreePixmap = ?*const fn (a: [*c]Display, b: Pixmap) callconv(.c) c_int;
pub export var X11_XFreePixmap: SDL_DYNX11FN_XFreePixmap = null;
pub const SDL_DYNX11FN_XFreeColormap = ?*const fn (a: [*c]Display, b: Colormap) callconv(.c) c_int;
pub export var X11_XFreeColormap: SDL_DYNX11FN_XFreeColormap = null;
pub const SDL_DYNX11FN_XFreeStringList = ?*const fn (a: [*c][*c]u8) callconv(.c) void;
pub export var X11_XFreeStringList: SDL_DYNX11FN_XFreeStringList = null;
pub const SDL_DYNX11FN_XGetAtomName = ?*const fn (a: [*c]Display, b: Atom) callconv(.c) [*c]u8;
pub export var X11_XGetAtomName: SDL_DYNX11FN_XGetAtomName = null;
pub const SDL_DYNX11FN_XGetInputFocus = ?*const fn (a: [*c]Display, b: [*c]Window, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XGetInputFocus: SDL_DYNX11FN_XGetInputFocus = null;
pub const SDL_DYNX11FN_XGetKeyboardMapping = ?*const fn (a: [*c]Display, b: KeyCode, c: c_int, d: [*c]c_int) callconv(.c) [*c]KeySym;
pub export var X11_XGetKeyboardMapping: SDL_DYNX11FN_XGetKeyboardMapping = null;
pub const SDL_DYNX11FN_XGetErrorDatabaseText = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c]const u8, d: [*c]const u8, e: [*c]u8, f: c_int) callconv(.c) c_int;
pub export var X11_XGetErrorDatabaseText: SDL_DYNX11FN_XGetErrorDatabaseText = null;
pub const SDL_DYNX11FN_XGetModifierMapping = ?*const fn (a: [*c]Display) callconv(.c) [*c]XModifierKeymap;
pub export var X11_XGetModifierMapping: SDL_DYNX11FN_XGetModifierMapping = null;
pub const SDL_DYNX11FN_XGetPointerControl = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int, d: [*c]c_int) callconv(.c) c_int;
pub export var X11_XGetPointerControl: SDL_DYNX11FN_XGetPointerControl = null;
pub const SDL_DYNX11FN_XGetSelectionOwner = ?*const fn (a: [*c]Display, b: Atom) callconv(.c) Window;
pub export var X11_XGetSelectionOwner: SDL_DYNX11FN_XGetSelectionOwner = null;
pub const SDL_DYNX11FN_XGetVisualInfo = ?*const fn (a: [*c]Display, b: c_long, c: [*c]XVisualInfo, d: [*c]c_int) callconv(.c) [*c]XVisualInfo;
pub export var X11_XGetVisualInfo: SDL_DYNX11FN_XGetVisualInfo = null;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub export var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes = null;
pub const SDL_DYNX11FN_XGetWindowProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub export var X11_XGetWindowProperty: SDL_DYNX11FN_XGetWindowProperty = null;
pub const SDL_DYNX11FN_XGetWMHints = ?*const fn (a: [*c]Display, b: Window) callconv(.c) [*c]XWMHints;
pub export var X11_XGetWMHints: SDL_DYNX11FN_XGetWMHints = null;
pub const SDL_DYNX11FN_XGetWMNormalHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XSizeHints, d: [*c]c_long) callconv(.c) c_int;
pub export var X11_XGetWMNormalHints: SDL_DYNX11FN_XGetWMNormalHints = null;
pub const SDL_DYNX11FN_XIfEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent, c: ?*const fn ([*c]Display, [*c]XEvent, XPointer) callconv(.c) c_int, d: XPointer) callconv(.c) c_int;
pub export var X11_XIfEvent: SDL_DYNX11FN_XIfEvent = null;
pub const SDL_DYNX11FN_XGrabKeyboard = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: Time) callconv(.c) c_int;
pub export var X11_XGrabKeyboard: SDL_DYNX11FN_XGrabKeyboard = null;
pub const SDL_DYNX11FN_XGrabPointer = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_uint, e: c_int, f: c_int, g: Window, h: Cursor, i: Time) callconv(.c) c_int;
pub export var X11_XGrabPointer: SDL_DYNX11FN_XGrabPointer = null;
pub const SDL_DYNX11FN_XGrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XGrabServer: SDL_DYNX11FN_XGrabServer = null;
pub const SDL_DYNX11FN_XIconifyWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int) callconv(.c) c_int;
pub export var X11_XIconifyWindow: SDL_DYNX11FN_XIconifyWindow = null;
pub const SDL_DYNX11FN_XKeysymToKeycode = ?*const fn (a: [*c]Display, b: KeySym) callconv(.c) KeyCode;
pub export var X11_XKeysymToKeycode: SDL_DYNX11FN_XKeysymToKeycode = null;
pub const SDL_DYNX11FN_XKeysymToString = ?*const fn (a: KeySym) callconv(.c) [*c]u8;
pub export var X11_XKeysymToString: SDL_DYNX11FN_XKeysymToString = null;
pub const SDL_DYNX11FN_XInstallColormap = ?*const fn (a: [*c]Display, b: Colormap) callconv(.c) c_int;
pub export var X11_XInstallColormap: SDL_DYNX11FN_XInstallColormap = null;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub export var X11_XInternAtom: SDL_DYNX11FN_XInternAtom = null;
pub const SDL_DYNX11FN_XListPixmapFormats = ?*const fn (a: [*c]Display, b: [*c]c_int) callconv(.c) [*c]XPixmapFormatValues;
pub export var X11_XListPixmapFormats: SDL_DYNX11FN_XListPixmapFormats = null;
pub const SDL_DYNX11FN_XLoadQueryFont = ?*const fn (a: [*c]Display, b: [*c]const u8) callconv(.c) [*c]XFontStruct;
pub export var X11_XLoadQueryFont: SDL_DYNX11FN_XLoadQueryFont = null;
pub const SDL_DYNX11FN_XLookupKeysym = ?*const fn (a: [*c]XKeyEvent, b: c_int) callconv(.c) KeySym;
pub export var X11_XLookupKeysym: SDL_DYNX11FN_XLookupKeysym = null;
pub const SDL_DYNX11FN_XLookupString = ?*const fn (a: [*c]XKeyEvent, b: [*c]u8, c: c_int, d: [*c]KeySym, e: [*c]XComposeStatus) callconv(.c) c_int;
pub export var X11_XLookupString: SDL_DYNX11FN_XLookupString = null;
pub const SDL_DYNX11FN_XMapRaised = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub export var X11_XMapRaised: SDL_DYNX11FN_XMapRaised = null;
pub const SDL_DYNX11FN_XMatchVisualInfo = ?*const fn (a: [*c]Display, b: c_int, c: c_int, d: c_int, e: [*c]XVisualInfo) callconv(.c) c_int;
pub export var X11_XMatchVisualInfo: SDL_DYNX11FN_XMatchVisualInfo = null;
pub const SDL_DYNX11FN_XMissingExtension = ?*const fn (a: [*c]Display, b: [*c]const u8) callconv(.c) c_int;
pub export var X11_XMissingExtension: SDL_DYNX11FN_XMissingExtension = null;
pub const SDL_DYNX11FN_XMoveWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int) callconv(.c) c_int;
pub export var X11_XMoveWindow: SDL_DYNX11FN_XMoveWindow = null;
pub const SDL_DYNX11FN_XOpenDisplay = ?*const fn (a: [*c]const u8) callconv(.c) [*c]Display;
pub export var X11_XOpenDisplay: SDL_DYNX11FN_XOpenDisplay = null;
pub const SDL_DYNX11FN_XInitThreads = ?*const fn () callconv(.c) c_int;
pub export var X11_XInitThreads: SDL_DYNX11FN_XInitThreads = null;
pub const SDL_DYNX11FN_XPeekEvent = ?*const fn (a: [*c]Display, b: [*c]XEvent) callconv(.c) c_int;
pub export var X11_XPeekEvent: SDL_DYNX11FN_XPeekEvent = null;
pub const SDL_DYNX11FN_XPending = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XPending: SDL_DYNX11FN_XPending = null;
pub const SDL_DYNX11FN_XGetImage = ?*const fn (a: [*c]Display, b: Drawable, c: c_int, d: c_int, e: c_uint, f: c_uint, g: c_ulong, h: c_int) callconv(.c) [*c]XImage;
pub export var X11_XGetImage: SDL_DYNX11FN_XGetImage = null;
pub const SDL_DYNX11FN_XPutImage = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: [*c]XImage, e: c_int, f: c_int, g: c_int, h: c_int, i: c_uint, j: c_uint) callconv(.c) c_int;
pub export var X11_XPutImage: SDL_DYNX11FN_XPutImage = null;
pub const SDL_DYNX11FN_XQueryKeymap = ?*const fn (a: [*c]Display, b: [*c]u8) callconv(.c) c_int;
pub export var X11_XQueryKeymap: SDL_DYNX11FN_XQueryKeymap = null;
pub const SDL_DYNX11FN_XQueryPointer = ?*const fn (a: [*c]Display, b: Window, c: [*c]Window, d: [*c]Window, e: [*c]c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]c_int, i: [*c]c_uint) callconv(.c) c_int;
pub export var X11_XQueryPointer: SDL_DYNX11FN_XQueryPointer = null;
pub const SDL_DYNX11FN_XRaiseWindow = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub export var X11_XRaiseWindow: SDL_DYNX11FN_XRaiseWindow = null;
pub const SDL_DYNX11FN_XReparentWindow = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int) callconv(.c) c_int;
pub export var X11_XReparentWindow: SDL_DYNX11FN_XReparentWindow = null;
pub const SDL_DYNX11FN_XResetScreenSaver = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XResetScreenSaver: SDL_DYNX11FN_XResetScreenSaver = null;
pub const SDL_DYNX11FN_XResizeWindow = ?*const fn (a: [*c]Display, b: Window, c: c_uint, d: c_uint) callconv(.c) c_int;
pub export var X11_XResizeWindow: SDL_DYNX11FN_XResizeWindow = null;
pub const SDL_DYNX11FN_XScreenNumberOfScreen = ?*const fn (a: [*c]Screen) callconv(.c) c_int;
pub export var X11_XScreenNumberOfScreen: SDL_DYNX11FN_XScreenNumberOfScreen = null;
pub const SDL_DYNX11FN_XSelectInput = ?*const fn (a: [*c]Display, b: Window, c: c_long) callconv(.c) c_int;
pub export var X11_XSelectInput: SDL_DYNX11FN_XSelectInput = null;
pub const SDL_DYNX11FN_XSendEvent = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_long, e: [*c]XEvent) callconv(.c) c_int;
pub export var X11_XSendEvent: SDL_DYNX11FN_XSendEvent = null;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub export var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler = null;
pub const SDL_DYNX11FN_XSetForeground = ?*const fn (a: [*c]Display, b: GC, c: c_ulong) callconv(.c) c_int;
pub export var X11_XSetForeground: SDL_DYNX11FN_XSetForeground = null;
pub const SDL_DYNX11FN_XSetIOErrorHandler = ?*const fn (a: XIOErrorHandler) callconv(.c) XIOErrorHandler;
pub export var X11_XSetIOErrorHandler: SDL_DYNX11FN_XSetIOErrorHandler = null;
pub const SDL_DYNX11FN_XSetInputFocus = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: Time) callconv(.c) c_int;
pub export var X11_XSetInputFocus: SDL_DYNX11FN_XSetInputFocus = null;
pub const SDL_DYNX11FN_XSetSelectionOwner = ?*const fn (a: [*c]Display, b: Atom, c: Window, d: Time) callconv(.c) c_int;
pub export var X11_XSetSelectionOwner: SDL_DYNX11FN_XSetSelectionOwner = null;
pub const SDL_DYNX11FN_XSetTransientForHint = ?*const fn (a: [*c]Display, b: Window, c: Window) callconv(.c) c_int;
pub export var X11_XSetTransientForHint: SDL_DYNX11FN_XSetTransientForHint = null;
pub const SDL_DYNX11FN_XSetTextProperty = ?*const fn (a: [*c]Display, b: Window, c: [*c]XTextProperty, d: Atom) callconv(.c) void;
pub export var X11_XSetTextProperty: SDL_DYNX11FN_XSetTextProperty = null;
pub const SDL_DYNX11FN_XSetWindowBackground = ?*const fn (a: [*c]Display, b: Window, c: c_ulong) callconv(.c) c_int;
pub export var X11_XSetWindowBackground: SDL_DYNX11FN_XSetWindowBackground = null;
pub const SDL_DYNX11FN_XSetWMHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWMHints) callconv(.c) void;
pub export var X11_XSetWMHints: SDL_DYNX11FN_XSetWMHints = null;
pub const SDL_DYNX11FN_XSetWMNormalHints = ?*const fn (a: [*c]Display, b: Window, c: [*c]XSizeHints) callconv(.c) void;
pub export var X11_XSetWMNormalHints: SDL_DYNX11FN_XSetWMNormalHints = null;
pub const SDL_DYNX11FN_XSetWMProperties = ?*const fn (a: [*c]Display, b: Window, c: [*c]XTextProperty, d: [*c]XTextProperty, e: [*c][*c]u8, f: c_int, g: [*c]XSizeHints, h: [*c]XWMHints, i: [*c]XClassHint) callconv(.c) void;
pub export var X11_XSetWMProperties: SDL_DYNX11FN_XSetWMProperties = null;
pub const SDL_DYNX11FN_XSetWMProtocols = ?*const fn (a: [*c]Display, b: Window, c: [*c]Atom, d: c_int) callconv(.c) c_int;
pub export var X11_XSetWMProtocols: SDL_DYNX11FN_XSetWMProtocols = null;
pub const SDL_DYNX11FN_XStoreColors = ?*const fn (a: [*c]Display, b: Colormap, c: [*c]XColor, d: c_int) callconv(.c) c_int;
pub export var X11_XStoreColors: SDL_DYNX11FN_XStoreColors = null;
pub const SDL_DYNX11FN_XStoreName = ?*const fn (a: [*c]Display, b: Window, c: [*c]const u8) callconv(.c) c_int;
pub export var X11_XStoreName: SDL_DYNX11FN_XStoreName = null;
pub const SDL_DYNX11FN_XStringListToTextProperty = ?*const fn (a: [*c][*c]u8, b: c_int, c: [*c]XTextProperty) callconv(.c) c_int;
pub export var X11_XStringListToTextProperty: SDL_DYNX11FN_XStringListToTextProperty = null;
pub const SDL_DYNX11FN_XSync = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) c_int;
pub export var X11_XSync: SDL_DYNX11FN_XSync = null;
pub const SDL_DYNX11FN_XTextExtents = ?*const fn (a: [*c]XFontStruct, b: [*c]const u8, c: c_int, d: [*c]c_int, e: [*c]c_int, f: [*c]c_int, g: [*c]XCharStruct) callconv(.c) c_int;
pub export var X11_XTextExtents: SDL_DYNX11FN_XTextExtents = null;
pub const SDL_DYNX11FN_XTranslateCoordinates = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: [*c]c_int, g: [*c]c_int, h: [*c]Window) callconv(.c) c_int;
pub export var X11_XTranslateCoordinates: SDL_DYNX11FN_XTranslateCoordinates = null;
pub const SDL_DYNX11FN_XUndefineCursor = ?*const fn (a: [*c]Display, b: Window) callconv(.c) c_int;
pub export var X11_XUndefineCursor: SDL_DYNX11FN_XUndefineCursor = null;
pub const SDL_DYNX11FN_XUngrabKeyboard = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub export var X11_XUngrabKeyboard: SDL_DYNX11FN_XUngrabKeyboard = null;
pub const SDL_DYNX11FN_XUngrabPointer = ?*const fn (a: [*c]Display, b: Time) callconv(.c) c_int;
pub export var X11_XUngrabPointer: SDL_DYNX11FN_XUngrabPointer = null;
pub const SDL_DYNX11FN_XUngrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XUngrabServer: SDL_DYNX11FN_XUngrabServer = null;
pub const SDL_DYNX11FN_XUninstallColormap = ?*const fn (a: [*c]Display, b: Colormap) callconv(.c) c_int;
pub export var X11_XUninstallColormap: SDL_DYNX11FN_XUninstallColormap = null;
pub const SDL_DYNX11FN_XUnloadFont = ?*const fn (a: [*c]Display, b: Font) callconv(.c) c_int;
pub export var X11_XUnloadFont: SDL_DYNX11FN_XUnloadFont = null;
pub const SDL_DYNX11FN_XWarpPointer = ?*const fn (a: [*c]Display, b: Window, c: Window, d: c_int, e: c_int, f: c_uint, g: c_uint, h: c_int, i: c_int) callconv(.c) c_int;
pub export var X11_XWarpPointer: SDL_DYNX11FN_XWarpPointer = null;
pub const SDL_DYNX11FN_XWindowEvent = ?*const fn (a: [*c]Display, b: Window, c: c_long, d: [*c]XEvent) callconv(.c) c_int;
pub export var X11_XWindowEvent: SDL_DYNX11FN_XWindowEvent = null;
pub const SDL_DYNX11FN_XWithdrawWindow = ?*const fn (a: [*c]Display, b: Window, c: c_int) callconv(.c) c_int;
pub export var X11_XWithdrawWindow: SDL_DYNX11FN_XWithdrawWindow = null;
pub const SDL_DYNX11FN_XVisualIDFromVisual = ?*const fn (a: [*c]Visual) callconv(.c) VisualID;
pub export var X11_XVisualIDFromVisual: SDL_DYNX11FN_XVisualIDFromVisual = null;
pub const SDL_DYNX11FN_XGetDefault = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c]const u8) callconv(.c) [*c]u8;
pub export var X11_XGetDefault: SDL_DYNX11FN_XGetDefault = null;
pub const SDL_DYNX11FN_XQueryExtension = ?*const fn (a: [*c]Display, b: [*c]const u8, c: [*c]c_int, d: [*c]c_int, e: [*c]c_int) callconv(.c) c_int;
pub export var X11_XQueryExtension: SDL_DYNX11FN_XQueryExtension = null;
pub const SDL_DYNX11FN_XDisplayString = ?*const fn (a: [*c]Display) callconv(.c) [*c]u8;
pub export var X11_XDisplayString: SDL_DYNX11FN_XDisplayString = null;
pub const SDL_DYNX11FN_XGetErrorText = ?*const fn (a: [*c]Display, b: c_int, c: [*c]u8, d: c_int) callconv(.c) c_int;
pub export var X11_XGetErrorText: SDL_DYNX11FN_XGetErrorText = null;
pub const SDL_DYNX11FN__XEatData = ?*const fn (a: [*c]Display, b: c_ulong) callconv(.c) void;
pub export var X11__XEatData: SDL_DYNX11FN__XEatData = null;
pub const SDL_DYNX11FN__XFlush = ?*const fn (a: [*c]Display) callconv(.c) void;
pub export var X11__XFlush: SDL_DYNX11FN__XFlush = null;
pub const SDL_DYNX11FN__XFlushGCCache = ?*const fn (a: [*c]Display, b: GC) callconv(.c) void;
pub export var X11__XFlushGCCache: SDL_DYNX11FN__XFlushGCCache = null;
pub const SDL_DYNX11FN__XRead = ?*const fn (a: [*c]Display, b: [*c]u8, c: c_long) callconv(.c) c_int;
pub export var X11__XRead: SDL_DYNX11FN__XRead = null;
pub const SDL_DYNX11FN__XReadPad = ?*const fn (a: [*c]Display, b: [*c]u8, c: c_long) callconv(.c) void;
pub export var X11__XReadPad: SDL_DYNX11FN__XReadPad = null;
pub const SDL_DYNX11FN__XSend = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_long) callconv(.c) void;
pub export var X11__XSend: SDL_DYNX11FN__XSend = null;
pub const SDL_DYNX11FN__XReply = ?*const fn (a: [*c]Display, b: [*c]xReply, c: c_int, d: c_int) callconv(.c) c_int;
pub export var X11__XReply: SDL_DYNX11FN__XReply = null;
pub const SDL_DYNX11FN__XSetLastRequestRead = ?*const fn (a: [*c]Display, b: [*c]xGenericReply) callconv(.c) c_ulong;
pub export var X11__XSetLastRequestRead: SDL_DYNX11FN__XSetLastRequestRead = null;
pub const SDL_DYNX11FN_XSynchronize = ?*const fn (a: [*c]Display, b: c_int) callconv(.c) SDL_X11_XSynchronizeRetType;
pub export var X11_XSynchronize: SDL_DYNX11FN_XSynchronize = null;
pub const SDL_DYNX11FN_XESetWireToEvent = ?*const fn (a: [*c]Display, b: c_int, c: SDL_X11_XESetWireToEventRetType) callconv(.c) SDL_X11_XESetWireToEventRetType;
pub export var X11_XESetWireToEvent: SDL_DYNX11FN_XESetWireToEvent = null;
pub const SDL_DYNX11FN_XESetEventToWire = ?*const fn (a: [*c]Display, b: c_int, c: SDL_X11_XESetEventToWireRetType) callconv(.c) SDL_X11_XESetEventToWireRetType;
pub export var X11_XESetEventToWire: SDL_DYNX11FN_XESetEventToWire = null;
pub const SDL_DYNX11FN_XRefreshKeyboardMapping = ?*const fn (a: [*c]XMappingEvent) callconv(.c) void;
pub export var X11_XRefreshKeyboardMapping: SDL_DYNX11FN_XRefreshKeyboardMapping = null;
pub const SDL_DYNX11FN_XQueryTree = ?*const fn (a: [*c]Display, b: Window, c: [*c]Window, d: [*c]Window, e: [*c][*c]Window, f: [*c]c_uint) callconv(.c) c_int;
pub export var X11_XQueryTree: SDL_DYNX11FN_XQueryTree = null;
pub const SDL_DYNX11FN_XSupportsLocale = ?*const fn () callconv(.c) c_int;
pub export var X11_XSupportsLocale: SDL_DYNX11FN_XSupportsLocale = null;
pub const SDL_DYNX11FN_XmbTextListToTextProperty = ?*const fn (a: [*c]Display, b: [*c][*c]u8, c: c_int, d: XICCEncodingStyle, e: [*c]XTextProperty) callconv(.c) c_int;
pub export var X11_XmbTextListToTextProperty: SDL_DYNX11FN_XmbTextListToTextProperty = null;
pub const SDL_DYNX11FN_XCreateRegion = ?*const fn () callconv(.c) Region;
pub export var X11_XCreateRegion: SDL_DYNX11FN_XCreateRegion = null;
pub const SDL_DYNX11FN_XUnionRectWithRegion = ?*const fn (a: [*c]XRectangle, b: Region, c: Region) callconv(.c) c_int;
pub export var X11_XUnionRectWithRegion: SDL_DYNX11FN_XUnionRectWithRegion = null;
pub const SDL_DYNX11FN_XDestroyRegion = ?*const fn (Region) callconv(.c) void;
pub export var X11_XDestroyRegion: SDL_DYNX11FN_XDestroyRegion = null;
pub const SDL_DYNX11FN_XrmInitialize = ?*const fn () callconv(.c) void;
pub export var X11_XrmInitialize: SDL_DYNX11FN_XrmInitialize = null;
pub const SDL_DYNX11FN_XResourceManagerString = ?*const fn (display: [*c]Display) callconv(.c) [*c]u8;
pub export var X11_XResourceManagerString: SDL_DYNX11FN_XResourceManagerString = null;
pub const SDL_DYNX11FN_XrmGetStringDatabase = ?*const fn (data: [*c]u8) callconv(.c) XrmDatabase;
pub export var X11_XrmGetStringDatabase: SDL_DYNX11FN_XrmGetStringDatabase = null;
pub const SDL_DYNX11FN_XrmDestroyDatabase = ?*const fn (db: XrmDatabase) callconv(.c) void;
pub export var X11_XrmDestroyDatabase: SDL_DYNX11FN_XrmDestroyDatabase = null;
pub const SDL_DYNX11FN_XrmGetResource = ?*const fn (db: XrmDatabase, str_name: [*c]u8, str_class: [*c]u8, str_type_return: [*c][*c]u8, [*c]XrmValue) callconv(.c) c_int;
pub export var X11_XrmGetResource: SDL_DYNX11FN_XrmGetResource = null;
pub const SDL_DYNX11FN_XGetPointerMapping = ?*const fn (a: [*c]Display, b: [*c]u8, c: c_uint) callconv(.c) c_int;
pub export var X11_XGetPointerMapping: SDL_DYNX11FN_XGetPointerMapping = null;
pub const SDL_DYNX11FN_XFixesCreatePointerBarrier = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: c_int, g: c_int, h: c_int, i: [*c]c_int) callconv(.c) PointerBarrier;
pub export var X11_XFixesCreatePointerBarrier: SDL_DYNX11FN_XFixesCreatePointerBarrier = null;
pub const SDL_DYNX11FN_XFixesDestroyPointerBarrier = ?*const fn (a: [*c]Display, b: PointerBarrier) callconv(.c) void;
pub export var X11_XFixesDestroyPointerBarrier: SDL_DYNX11FN_XFixesDestroyPointerBarrier = null;
pub const SDL_DYNX11FN_XIBarrierReleasePointer = ?*const fn (a: [*c]Display, b: c_int, c: PointerBarrier, d: BarrierEventID) callconv(.c) c_int;
pub export var X11_XIBarrierReleasePointer: SDL_DYNX11FN_XIBarrierReleasePointer = null;
pub const SDL_DYNX11FN_XFixesQueryVersion = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XFixesQueryVersion: SDL_DYNX11FN_XFixesQueryVersion = null;
pub const SDL_DYNX11FN_XFixesSelectSelectionInput = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_ulong) callconv(.c) c_int;
pub export var X11_XFixesSelectSelectionInput: SDL_DYNX11FN_XFixesSelectSelectionInput = null;
pub const SDL_DYNX11FN_XSyncQueryExtension = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XSyncQueryExtension: SDL_DYNX11FN_XSyncQueryExtension = null;
pub const SDL_DYNX11FN_XSyncInitialize = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XSyncInitialize: SDL_DYNX11FN_XSyncInitialize = null;
pub const SDL_DYNX11FN_XSyncCreateCounter = ?*const fn (a: [*c]Display, b: XSyncValue) callconv(.c) XSyncCounter;
pub export var X11_XSyncCreateCounter: SDL_DYNX11FN_XSyncCreateCounter = null;
pub const SDL_DYNX11FN_XSyncDestroyCounter = ?*const fn (a: [*c]Display, b: XSyncCounter) callconv(.c) c_int;
pub export var X11_XSyncDestroyCounter: SDL_DYNX11FN_XSyncDestroyCounter = null;
pub const SDL_DYNX11FN_XSyncSetCounter = ?*const fn (a: [*c]Display, b: XSyncCounter, c: XSyncValue) callconv(.c) c_int;
pub export var X11_XSyncSetCounter: SDL_DYNX11FN_XSyncSetCounter = null;
pub const SDL_DYNX11FN_XGetEventData = ?*const fn (a: [*c]Display, b: [*c]XGenericEventCookie) callconv(.c) c_int;
pub export var X11_XGetEventData: SDL_DYNX11FN_XGetEventData = null;
pub const SDL_DYNX11FN_XFreeEventData = ?*const fn (a: [*c]Display, b: [*c]XGenericEventCookie) callconv(.c) void;
pub export var X11_XFreeEventData: SDL_DYNX11FN_XFreeEventData = null;
pub const SDL_DYNX11FN_XkbQueryExtension = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int, d: [*c]c_int, e: [*c]c_int, f: [*c]c_int) callconv(.c) c_int;
pub export var X11_XkbQueryExtension: SDL_DYNX11FN_XkbQueryExtension = null;
pub const SDL_DYNX11FN_XkbKeycodeToKeysym = ?*const fn (a: [*c]Display, b: KeyCode, c: c_uint, d: c_uint) callconv(.c) KeySym;
pub export var X11_XkbKeycodeToKeysym: SDL_DYNX11FN_XkbKeycodeToKeysym = null;
pub const SDL_DYNX11FN_XkbSelectEvents = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint, d: c_ulong) callconv(.c) c_int;
pub export var X11_XkbSelectEvents: SDL_DYNX11FN_XkbSelectEvents = null;
pub const SDL_DYNX11FN_XkbSelectEventDetails = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint, d: c_ulong, e: c_ulong) callconv(.c) c_int;
pub export var X11_XkbSelectEventDetails: SDL_DYNX11FN_XkbSelectEventDetails = null;
pub const SDL_DYNX11FN_XkbGetNames = ?*const fn (a: [*c]Display, b: c_uint, c: XkbDescPtr) callconv(.c) c_int;
pub export var X11_XkbGetNames: SDL_DYNX11FN_XkbGetNames = null;
pub const SDL_DYNX11FN_XkbGetState = ?*const fn (a: [*c]Display, b: c_uint, c: XkbStatePtr) callconv(.c) c_int;
pub export var X11_XkbGetState: SDL_DYNX11FN_XkbGetState = null;
pub const SDL_DYNX11FN_XkbGetUpdatedMap = ?*const fn (a: [*c]Display, b: c_uint, c: XkbDescPtr) callconv(.c) c_int;
pub export var X11_XkbGetUpdatedMap: SDL_DYNX11FN_XkbGetUpdatedMap = null;
pub const SDL_DYNX11FN_XkbGetMap = ?*const fn (a: [*c]Display, b: c_uint, c: c_uint) callconv(.c) XkbDescPtr;
pub export var X11_XkbGetMap: SDL_DYNX11FN_XkbGetMap = null;
pub const SDL_DYNX11FN_XkbFreeClientMap = ?*const fn (a: XkbDescPtr, b: c_uint, c: c_int) callconv(.c) void;
pub export var X11_XkbFreeClientMap: SDL_DYNX11FN_XkbFreeClientMap = null;
pub const SDL_DYNX11FN_XkbFreeKeyboard = ?*const fn (a: XkbDescPtr, b: c_uint, c: c_int) callconv(.c) void;
pub export var X11_XkbFreeKeyboard: SDL_DYNX11FN_XkbFreeKeyboard = null;
pub const SDL_DYNX11FN_XkbRefreshKeyboardMapping = ?*const fn (a: [*c]XkbMapNotifyEvent) callconv(.c) c_int;
pub export var X11_XkbRefreshKeyboardMapping: SDL_DYNX11FN_XkbRefreshKeyboardMapping = null;
pub const SDL_DYNX11FN_XkbSetDetectableAutoRepeat = ?*const fn (a: [*c]Display, b: c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XkbSetDetectableAutoRepeat: SDL_DYNX11FN_XkbSetDetectableAutoRepeat = null;
pub const SDL_DYNX11FN_Xutf8TextListToTextProperty = ?*const fn (a: [*c]Display, b: [*c][*c]u8, c: c_int, d: XICCEncodingStyle, e: [*c]XTextProperty) callconv(.c) c_int;
pub export var X11_Xutf8TextListToTextProperty: SDL_DYNX11FN_Xutf8TextListToTextProperty = null;
pub const SDL_DYNX11FN_Xutf8LookupString = ?*const fn (a: XIC, b: [*c]XKeyPressedEvent, c: [*c]u8, d: c_int, e: [*c]KeySym, f: [*c]c_int) callconv(.c) c_int;
pub export var X11_Xutf8LookupString: SDL_DYNX11FN_Xutf8LookupString = null;
pub const SDL_DYNX11FN_XCreateIC = ?*const fn (XIM, ...) callconv(.c) XIC;
pub export var X11_XCreateIC: SDL_DYNX11FN_XCreateIC = null;
pub const SDL_DYNX11FN_XDestroyIC = ?*const fn (a: XIC) callconv(.c) void;
pub export var X11_XDestroyIC: SDL_DYNX11FN_XDestroyIC = null;
pub const SDL_DYNX11FN_XGetICValues = ?*const fn (XIC, ...) callconv(.c) [*c]u8;
pub export var X11_XGetICValues: SDL_DYNX11FN_XGetICValues = null;
pub const SDL_DYNX11FN_XSetICValues = ?*const fn (XIC, ...) callconv(.c) [*c]u8;
pub export var X11_XSetICValues: SDL_DYNX11FN_XSetICValues = null;
pub const SDL_DYNX11FN_XVaCreateNestedList = ?*const fn (c_int, ...) callconv(.c) XVaNestedList;
pub export var X11_XVaCreateNestedList: SDL_DYNX11FN_XVaCreateNestedList = null;
pub const SDL_DYNX11FN_XSetICFocus = ?*const fn (a: XIC) callconv(.c) void;
pub export var X11_XSetICFocus: SDL_DYNX11FN_XSetICFocus = null;
pub const SDL_DYNX11FN_XUnsetICFocus = ?*const fn (a: XIC) callconv(.c) void;
pub export var X11_XUnsetICFocus: SDL_DYNX11FN_XUnsetICFocus = null;
pub const SDL_DYNX11FN_XOpenIM = ?*const fn (a: [*c]Display, b: ?*struct__XrmHashBucketRec, c: [*c]u8, d: [*c]u8) callconv(.c) XIM;
pub export var X11_XOpenIM: SDL_DYNX11FN_XOpenIM = null;
pub const SDL_DYNX11FN_XCloseIM = ?*const fn (a: XIM) callconv(.c) c_int;
pub export var X11_XCloseIM: SDL_DYNX11FN_XCloseIM = null;
pub const SDL_DYNX11FN_XSetIMValues = ?*const fn (XIM, ...) callconv(.c) [*c]u8;
pub export var X11_XSetIMValues: SDL_DYNX11FN_XSetIMValues = null;
pub const SDL_DYNX11FN_XRegisterIMInstantiateCallback = ?*const fn ([*c]Display, ?*struct__XrmHashBucketRec, [*c]u8, [*c]u8, XIDProc, XPointer) callconv(.c) c_int;
pub export var X11_XRegisterIMInstantiateCallback: SDL_DYNX11FN_XRegisterIMInstantiateCallback = null;
pub const SDL_DYNX11FN_XUnregisterIMInstantiateCallback = ?*const fn ([*c]Display, ?*struct__XrmHashBucketRec, [*c]u8, [*c]u8, XIDProc, XPointer) callconv(.c) c_int;
pub export var X11_XUnregisterIMInstantiateCallback: SDL_DYNX11FN_XUnregisterIMInstantiateCallback = null;
pub const SDL_DYNX11FN_Xutf8DrawString = ?*const fn (a: [*c]Display, b: Drawable, c: XFontSet, d: GC, e: c_int, f: c_int, g: [*c]const u8, h: c_int) callconv(.c) void;
pub export var X11_Xutf8DrawString: SDL_DYNX11FN_Xutf8DrawString = null;
pub const SDL_DYNX11FN_Xutf8TextExtents = ?*const fn (a: XFontSet, b: [*c]const u8, c: c_int, d: [*c]XRectangle, e: [*c]XRectangle) callconv(.c) c_int;
pub export var X11_Xutf8TextExtents: SDL_DYNX11FN_Xutf8TextExtents = null;
pub const SDL_DYNX11FN_XSetLocaleModifiers = ?*const fn (a: [*c]const u8) callconv(.c) [*c]u8;
pub export var X11_XSetLocaleModifiers: SDL_DYNX11FN_XSetLocaleModifiers = null;
pub const SDL_DYNX11FN_Xutf8ResetIC = ?*const fn (a: XIC) callconv(.c) [*c]u8;
pub export var X11_Xutf8ResetIC: SDL_DYNX11FN_Xutf8ResetIC = null;
pub const SDL_DYNX11FN_XExtentsOfFontSet = ?*const fn (a: XFontSet) callconv(.c) [*c]XFontSetExtents;
pub export var X11_XExtentsOfFontSet: SDL_DYNX11FN_XExtentsOfFontSet = null;
pub const SDL_DYNX11FN_XContextDependentDrawing = ?*const fn (a: XFontSet) callconv(.c) c_int;
pub export var X11_XContextDependentDrawing: SDL_DYNX11FN_XContextDependentDrawing = null;
pub const SDL_DYNX11FN_XShmAttach = ?*const fn (a: [*c]Display, b: [*c]XShmSegmentInfo) callconv(.c) c_int;
pub export var X11_XShmAttach: SDL_DYNX11FN_XShmAttach = null;
pub const SDL_DYNX11FN_XShmDetach = ?*const fn (a: [*c]Display, b: [*c]XShmSegmentInfo) callconv(.c) c_int;
pub export var X11_XShmDetach: SDL_DYNX11FN_XShmDetach = null;
pub const SDL_DYNX11FN_XShmPutImage = ?*const fn (a: [*c]Display, b: Drawable, c: GC, d: [*c]XImage, e: c_int, f: c_int, g: c_int, h: c_int, i: c_uint, j: c_uint, k: c_int) callconv(.c) c_int;
pub export var X11_XShmPutImage: SDL_DYNX11FN_XShmPutImage = null;
pub const SDL_DYNX11FN_XShmGetImage = ?*const fn (a: [*c]Display, b: Drawable, c: [*c]XImage, d: c_int, e: c_int, f: c_ulong) callconv(.c) c_int;
pub export var X11_XShmGetImage: SDL_DYNX11FN_XShmGetImage = null;
pub const SDL_DYNX11FN_XShmCreateImage = ?*const fn (a: [*c]Display, b: [*c]Visual, c: c_uint, d: c_int, e: [*c]u8, f: [*c]XShmSegmentInfo, g: c_uint, h: c_uint) callconv(.c) [*c]XImage;
pub export var X11_XShmCreateImage: SDL_DYNX11FN_XShmCreateImage = null;
pub const SDL_DYNX11FN_XShmCreatePixmap = ?*const fn (a: [*c]Display, b: Drawable, c: [*c]u8, d: [*c]XShmSegmentInfo, e: c_uint, f: c_uint, g: c_uint) callconv(.c) Pixmap;
pub export var X11_XShmCreatePixmap: SDL_DYNX11FN_XShmCreatePixmap = null;
pub const SDL_DYNX11FN_XShmQueryExtension = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XShmQueryExtension: SDL_DYNX11FN_XShmQueryExtension = null;
pub const SDL_DYNX11FN_XShmQueryVersion = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int, d: [*c]c_int) callconv(.c) c_int;
pub export var X11_XShmQueryVersion: SDL_DYNX11FN_XShmQueryVersion = null;
pub const SDL_DYNX11FN_XShmPixmapFormat = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub export var X11_XShmPixmapFormat: SDL_DYNX11FN_XShmPixmapFormat = null;
pub const SDL_DYNX11FN__XData32 = ?*const fn (dpy: [*c]Display, data: [*c]const c_long, len: c_uint) callconv(.c) c_int;
pub export var X11__XData32: SDL_DYNX11FN__XData32 = null;
pub const SDL_DYNX11FN__XRead32 = ?*const fn (dpy: [*c]Display, data: [*c]c_long, len: c_long) callconv(.c) void;
pub export var X11__XRead32: SDL_DYNX11FN__XRead32 = null;
pub const SDL_DYNX11FN_XcursorImageCreate = ?*const fn (a: c_int, b: c_int) callconv(.c) [*c]XcursorImage;
pub export var X11_XcursorImageCreate: SDL_DYNX11FN_XcursorImageCreate = null;
pub const SDL_DYNX11FN_XcursorImagesCreate = ?*const fn (a: c_int) callconv(.c) [*c]XcursorImages;
pub export var X11_XcursorImagesCreate: SDL_DYNX11FN_XcursorImagesCreate = null;
pub const SDL_DYNX11FN_XcursorImageDestroy = ?*const fn (a: [*c]XcursorImage) callconv(.c) void;
pub export var X11_XcursorImageDestroy: SDL_DYNX11FN_XcursorImageDestroy = null;
pub const SDL_DYNX11FN_XcursorImagesDestroy = ?*const fn (a: [*c]XcursorImages) callconv(.c) void;
pub export var X11_XcursorImagesDestroy: SDL_DYNX11FN_XcursorImagesDestroy = null;
pub const SDL_DYNX11FN_XcursorImageLoadCursor = ?*const fn (a: [*c]Display, b: [*c]const XcursorImage) callconv(.c) Cursor;
pub export var X11_XcursorImageLoadCursor: SDL_DYNX11FN_XcursorImageLoadCursor = null;
pub const SDL_DYNX11FN_XcursorImagesLoadCursor = ?*const fn (a: [*c]Display, b: [*c]const XcursorImages) callconv(.c) Cursor;
pub export var X11_XcursorImagesLoadCursor: SDL_DYNX11FN_XcursorImagesLoadCursor = null;
pub const SDL_DYNX11FN_XcursorLibraryLoadCursor = ?*const fn (a: [*c]Display, b: [*c]const u8) callconv(.c) Cursor;
pub export var X11_XcursorLibraryLoadCursor: SDL_DYNX11FN_XcursorLibraryLoadCursor = null;
pub const SDL_DYNX11FN_XdbeQueryExtension = ?*const fn (dpy: [*c]Display, major_version_return: [*c]c_int, minor_version_return: [*c]c_int) callconv(.c) c_int;
pub export var X11_XdbeQueryExtension: SDL_DYNX11FN_XdbeQueryExtension = null;
pub const SDL_DYNX11FN_XdbeAllocateBackBufferName = ?*const fn (dpy: [*c]Display, window: Window, swap_action: XdbeSwapAction) callconv(.c) XdbeBackBuffer;
pub export var X11_XdbeAllocateBackBufferName: SDL_DYNX11FN_XdbeAllocateBackBufferName = null;
pub const SDL_DYNX11FN_XdbeDeallocateBackBufferName = ?*const fn (dpy: [*c]Display, buffer: XdbeBackBuffer) callconv(.c) c_int;
pub export var X11_XdbeDeallocateBackBufferName: SDL_DYNX11FN_XdbeDeallocateBackBufferName = null;
pub const SDL_DYNX11FN_XdbeSwapBuffers = ?*const fn (dpy: [*c]Display, swap_info: [*c]XdbeSwapInfo, num_windows: c_int) callconv(.c) c_int;
pub export var X11_XdbeSwapBuffers: SDL_DYNX11FN_XdbeSwapBuffers = null;
pub const SDL_DYNX11FN_XdbeBeginIdiom = ?*const fn (dpy: [*c]Display) callconv(.c) c_int;
pub export var X11_XdbeBeginIdiom: SDL_DYNX11FN_XdbeBeginIdiom = null;
pub const SDL_DYNX11FN_XdbeEndIdiom = ?*const fn (dpy: [*c]Display) callconv(.c) c_int;
pub export var X11_XdbeEndIdiom: SDL_DYNX11FN_XdbeEndIdiom = null;
pub const SDL_DYNX11FN_XdbeGetVisualInfo = ?*const fn (dpy: [*c]Display, screen_specifiers: [*c]Drawable, num_screens: [*c]c_int) callconv(.c) [*c]XdbeScreenVisualInfo;
pub export var X11_XdbeGetVisualInfo: SDL_DYNX11FN_XdbeGetVisualInfo = null;
pub const SDL_DYNX11FN_XdbeFreeVisualInfo = ?*const fn (visual_info: [*c]XdbeScreenVisualInfo) callconv(.c) void;
pub export var X11_XdbeFreeVisualInfo: SDL_DYNX11FN_XdbeFreeVisualInfo = null;
pub const SDL_DYNX11FN_XdbeGetBackBufferAttributes = ?*const fn (dpy: [*c]Display, buffer: XdbeBackBuffer) callconv(.c) [*c]XdbeBackBufferAttributes;
pub export var X11_XdbeGetBackBufferAttributes: SDL_DYNX11FN_XdbeGetBackBufferAttributes = null;
pub const SDL_DYNX11FN_XIQueryDevice = ?*const fn (a: [*c]Display, b: c_int, c: [*c]c_int) callconv(.c) [*c]XIDeviceInfo;
pub export var X11_XIQueryDevice: SDL_DYNX11FN_XIQueryDevice = null;
pub const SDL_DYNX11FN_XIFreeDeviceInfo = ?*const fn (a: [*c]XIDeviceInfo) callconv(.c) void;
pub export var X11_XIFreeDeviceInfo: SDL_DYNX11FN_XIFreeDeviceInfo = null;
pub const SDL_DYNX11FN_XISelectEvents = ?*const fn (a: [*c]Display, b: Window, c: [*c]XIEventMask, d: c_int) callconv(.c) c_int;
pub export var X11_XISelectEvents: SDL_DYNX11FN_XISelectEvents = null;
pub const SDL_DYNX11FN_XIGrabTouchBegin = ?*const fn (a: [*c]Display, b: c_int, c: Window, d: c_int, e: [*c]XIEventMask, f: c_int, g: [*c]XIGrabModifiers) callconv(.c) c_int;
pub export var X11_XIGrabTouchBegin: SDL_DYNX11FN_XIGrabTouchBegin = null;
pub const SDL_DYNX11FN_XIUngrabTouchBegin = ?*const fn (a: [*c]Display, b: c_int, c: Window, d: c_int, e: [*c]XIGrabModifiers) callconv(.c) c_int;
pub export var X11_XIUngrabTouchBegin: SDL_DYNX11FN_XIUngrabTouchBegin = null;
pub const SDL_DYNX11FN_XIQueryVersion = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XIQueryVersion: SDL_DYNX11FN_XIQueryVersion = null;
pub const SDL_DYNX11FN_XIGetSelectedEvents = ?*const fn (a: [*c]Display, b: Window, c: [*c]c_int) callconv(.c) [*c]XIEventMask;
pub export var X11_XIGetSelectedEvents: SDL_DYNX11FN_XIGetSelectedEvents = null;
pub const SDL_DYNX11FN_XIGetClientPointer = ?*const fn (a: [*c]Display, b: Window, c: [*c]c_int) callconv(.c) c_int;
pub export var X11_XIGetClientPointer: SDL_DYNX11FN_XIGetClientPointer = null;
pub const SDL_DYNX11FN_XIWarpPointer = ?*const fn (a: [*c]Display, b: c_int, c: Window, d: Window, e: f64, f: f64, g: c_int, h: c_int, i: f64, j: f64) callconv(.c) c_int;
pub export var X11_XIWarpPointer: SDL_DYNX11FN_XIWarpPointer = null;
pub const SDL_DYNX11FN_XIGetProperty = ?*const fn (a: [*c]Display, b: c_int, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub export var X11_XIGetProperty: SDL_DYNX11FN_XIGetProperty = null;
pub const SDL_DYNX11FN_XRRQueryVersion = ?*const fn (dpy: [*c]Display, major_versionp: [*c]c_int, minor_versionp: [*c]c_int) callconv(.c) c_int;
pub export var X11_XRRQueryVersion: SDL_DYNX11FN_XRRQueryVersion = null;
pub const SDL_DYNX11FN_XRRQueryExtension = ?*const fn (dpy: [*c]Display, event_base_return: [*c]c_int, error_base_return: [*c]c_int) callconv(.c) c_int;
pub export var X11_XRRQueryExtension: SDL_DYNX11FN_XRRQueryExtension = null;
pub const SDL_DYNX11FN_XRRGetScreenInfo = ?*const fn (dpy: [*c]Display, draw: Drawable) callconv(.c) ?*XRRScreenConfiguration;
pub export var X11_XRRGetScreenInfo: SDL_DYNX11FN_XRRGetScreenInfo = null;
pub const SDL_DYNX11FN_XRRConfigCurrentConfiguration = ?*const fn (config: ?*XRRScreenConfiguration, rotation: [*c]Rotation) callconv(.c) SizeID;
pub export var X11_XRRConfigCurrentConfiguration: SDL_DYNX11FN_XRRConfigCurrentConfiguration = null;
pub const SDL_DYNX11FN_XRRConfigCurrentRate = ?*const fn (config: ?*XRRScreenConfiguration) callconv(.c) c_short;
pub export var X11_XRRConfigCurrentRate: SDL_DYNX11FN_XRRConfigCurrentRate = null;
pub const SDL_DYNX11FN_XRRConfigRates = ?*const fn (config: ?*XRRScreenConfiguration, sizeID: c_int, nrates: [*c]c_int) callconv(.c) [*c]c_short;
pub export var X11_XRRConfigRates: SDL_DYNX11FN_XRRConfigRates = null;
pub const SDL_DYNX11FN_XRRConfigSizes = ?*const fn (config: ?*XRRScreenConfiguration, nsizes: [*c]c_int) callconv(.c) [*c]XRRScreenSize;
pub export var X11_XRRConfigSizes: SDL_DYNX11FN_XRRConfigSizes = null;
pub const SDL_DYNX11FN_XRRSetScreenConfigAndRate = ?*const fn (dpy: [*c]Display, config: ?*XRRScreenConfiguration, draw: Drawable, size_index: c_int, rotation: Rotation, rate: c_short, timestamp: Time) callconv(.c) c_int;
pub export var X11_XRRSetScreenConfigAndRate: SDL_DYNX11FN_XRRSetScreenConfigAndRate = null;
pub const SDL_DYNX11FN_XRRFreeScreenConfigInfo = ?*const fn (config: ?*XRRScreenConfiguration) callconv(.c) void;
pub export var X11_XRRFreeScreenConfigInfo: SDL_DYNX11FN_XRRFreeScreenConfigInfo = null;
pub const SDL_DYNX11FN_XRRSetScreenSize = ?*const fn (dpy: [*c]Display, window: Window, width: c_int, height: c_int, mmWidth: c_int, mmHeight: c_int) callconv(.c) void;
pub export var X11_XRRSetScreenSize: SDL_DYNX11FN_XRRSetScreenSize = null;
pub const SDL_DYNX11FN_XRRGetScreenSizeRange = ?*const fn (dpy: [*c]Display, window: Window, minWidth: [*c]c_int, minHeight: [*c]c_int, maxWidth: [*c]c_int, maxHeight: [*c]c_int) callconv(.c) c_int;
pub export var X11_XRRGetScreenSizeRange: SDL_DYNX11FN_XRRGetScreenSizeRange = null;
pub const SDL_DYNX11FN_XRRGetScreenResources = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) [*c]XRRScreenResources;
pub export var X11_XRRGetScreenResources: SDL_DYNX11FN_XRRGetScreenResources = null;
pub const SDL_DYNX11FN_XRRGetScreenResourcesCurrent = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) [*c]XRRScreenResources;
pub export var X11_XRRGetScreenResourcesCurrent: SDL_DYNX11FN_XRRGetScreenResourcesCurrent = null;
pub const SDL_DYNX11FN_XRRFreeScreenResources = ?*const fn (resources: [*c]XRRScreenResources) callconv(.c) void;
pub export var X11_XRRFreeScreenResources: SDL_DYNX11FN_XRRFreeScreenResources = null;
pub const SDL_DYNX11FN_XRRGetOutputInfo = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, output: RROutput) callconv(.c) [*c]XRROutputInfo;
pub export var X11_XRRGetOutputInfo: SDL_DYNX11FN_XRRGetOutputInfo = null;
pub const SDL_DYNX11FN_XRRFreeOutputInfo = ?*const fn (outputInfo: [*c]XRROutputInfo) callconv(.c) void;
pub export var X11_XRRFreeOutputInfo: SDL_DYNX11FN_XRRFreeOutputInfo = null;
pub const SDL_DYNX11FN_XRRGetCrtcInfo = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, crtc: RRCrtc) callconv(.c) [*c]XRRCrtcInfo;
pub export var X11_XRRGetCrtcInfo: SDL_DYNX11FN_XRRGetCrtcInfo = null;
pub const SDL_DYNX11FN_XRRFreeCrtcInfo = ?*const fn (crtcInfo: [*c]XRRCrtcInfo) callconv(.c) void;
pub export var X11_XRRFreeCrtcInfo: SDL_DYNX11FN_XRRFreeCrtcInfo = null;
pub const SDL_DYNX11FN_XRRSetCrtcConfig = ?*const fn (dpy: [*c]Display, resources: [*c]XRRScreenResources, crtc: RRCrtc, timestamp: Time, x: c_int, y: c_int, mode: RRMode, rotation: Rotation, outputs: [*c]RROutput, noutputs: c_int) callconv(.c) c_int;
pub export var X11_XRRSetCrtcConfig: SDL_DYNX11FN_XRRSetCrtcConfig = null;
pub const SDL_DYNX11FN_XRRListOutputProperties = ?*const fn (dpy: [*c]Display, output: RROutput, nprop: [*c]c_int) callconv(.c) [*c]Atom;
pub export var X11_XRRListOutputProperties: SDL_DYNX11FN_XRRListOutputProperties = null;
pub const SDL_DYNX11FN_XRRQueryOutputProperty = ?*const fn (dpy: [*c]Display, output: RROutput, property: Atom) callconv(.c) [*c]XRRPropertyInfo;
pub export var X11_XRRQueryOutputProperty: SDL_DYNX11FN_XRRQueryOutputProperty = null;
pub const SDL_DYNX11FN_XRRGetOutputProperty = ?*const fn (dpy: [*c]Display, output: RROutput, property: Atom, offset: c_long, length: c_long, _delete: c_int, pending: c_int, req_type: Atom, actual_type: [*c]Atom, actual_format: [*c]c_int, nitems: [*c]c_ulong, bytes_after: [*c]c_ulong, prop: [*c][*c]u8) callconv(.c) c_int;
pub export var X11_XRRGetOutputProperty: SDL_DYNX11FN_XRRGetOutputProperty = null;
pub const SDL_DYNX11FN_XRRGetOutputPrimary = ?*const fn (dpy: [*c]Display, window: Window) callconv(.c) RROutput;
pub export var X11_XRRGetOutputPrimary: SDL_DYNX11FN_XRRGetOutputPrimary = null;
pub const SDL_DYNX11FN_XRRSelectInput = ?*const fn (dpy: [*c]Display, window: Window, mask: c_int) callconv(.c) void;
pub export var X11_XRRSelectInput: SDL_DYNX11FN_XRRSelectInput = null;
pub const SDL_DYNX11FN_XRRGetCrtcTransform = ?*const fn (dpy: [*c]Display, crtc: RRCrtc, attributes: [*c][*c]XRRCrtcTransformAttributes) callconv(.c) c_int;
pub export var X11_XRRGetCrtcTransform: SDL_DYNX11FN_XRRGetCrtcTransform = null;
pub const SDL_DYNX11FN_XShapeCombineMask = ?*const fn (dpy: [*c]Display, dest: Window, dest_kind: c_int, x_off: c_int, y_off: c_int, src: Pixmap, op: c_int) callconv(.c) void;
pub export var X11_XShapeCombineMask: SDL_DYNX11FN_XShapeCombineMask = null;
pub const SDL_DYNX11FN_XShapeCombineRegion = ?*const fn (a: [*c]Display, b: Window, c: c_int, d: c_int, e: c_int, f: Region, g: c_int) callconv(.c) void;
pub export var X11_XShapeCombineRegion: SDL_DYNX11FN_XShapeCombineRegion = null;
pub export var SDL_X11_HAVE_BASEXLIB: c_int = 0;
pub export var SDL_X11_HAVE_XFIXES: c_int = 0;
pub export var SDL_X11_HAVE_XSYNC: c_int = 0;
pub export var SDL_X11_HAVE_UTF8: c_int = 0;
pub export var SDL_X11_HAVE_SHM: c_int = 0;
pub export var SDL_X11_HAVE_IO_32BIT: c_int = 0;
pub export var SDL_X11_HAVE_XCURSOR: c_int = 0;
pub export var SDL_X11_HAVE_XDBE: c_int = 0;
pub export var SDL_X11_HAVE_XINPUT2: c_int = 0;
pub export var SDL_X11_HAVE_XRANDR: c_int = 0;
pub export var SDL_X11_HAVE_XSHAPE: c_int = 0;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_DYNX11FN_XTestQueryExtension = ?*const fn (a: [*c]Display, b: [*c]c_int, c: [*c]c_int) callconv(.c) c_int;
pub const SDL_DYNX11FN_XTestFakeMotionEvent = ?*const fn (a: [*c]Display, b: c_int, c: c_int, d: c_int, e: c_ulong) callconv(.c) c_int;
pub const SDL_DYNX11FN_XScreenSaverQueryExtension = ?*const fn (dpy: [*c]Display, event_base: [*c]c_int, error_base: [*c]c_int) callconv(.c) c_int;
pub const SDL_DYNX11FN_XScreenSaverQueryVersion = ?*const fn (dpy: [*c]Display, major_versionp: [*c]c_int, minor_versionp: [*c]c_int) callconv(.c) c_int;
pub const SDL_DYNX11FN_XScreenSaverSuspend = ?*const fn (dpy: [*c]Display, @"suspend": c_int) callconv(.c) void;
pub const x11dynlib = extern struct {
    lib: ?*SDL_SharedObject = null,
    libname: [*c]const u8 = null,
};
pub var x11libs: [8]x11dynlib = [8]x11dynlib{
    x11dynlib{
        .lib = null,
        .libname = "libX11.so.6",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXext.so.6",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXcursor.so.1",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXi.so.6",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXfixes.so.3",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXrandr.so.2",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXss.so.1",
    },
    x11dynlib{
        .lib = null,
        .libname = "libXtst.so.6",
    },
};
pub fn X11_GetSym(fnname: [*c]const u8, pHasModule: [*c]c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var @"fn": ?*anyopaque = null;
    _ = &@"fn";
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(x11libs)) / @sizeOf(@TypeOf(x11libs[@as(c_int, 0)])))) : (i += 1) {
            if (x11libs[@bitCast(@as(isize, @intCast(i)))].lib != null) {
                @"fn" = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(x11libs[@bitCast(@as(isize, @intCast(i)))].lib, fnname))));
                if (@"fn" != null) {
                    break;
                }
            }
        }
    }
    if (!(@"fn" != null)) {
        pHasModule.* = 0;
    }
    return @"fn";
}
pub export var X11_XTestQueryExtension: SDL_DYNX11FN_XTestQueryExtension = null;
pub export var X11_XTestFakeMotionEvent: SDL_DYNX11FN_XTestFakeMotionEvent = null;
pub export var X11_XScreenSaverQueryExtension: SDL_DYNX11FN_XScreenSaverQueryExtension = null;
pub export var X11_XScreenSaverQueryVersion: SDL_DYNX11FN_XScreenSaverQueryVersion = null;
pub export var X11_XScreenSaverSuspend: SDL_DYNX11FN_XScreenSaverSuspend = null;
pub export var SDL_X11_HAVE_XTEST: c_int = 0;
pub export var SDL_X11_HAVE_XSS: c_int = 0;
pub var x11_load_refcount: c_int = 0;
