// /*
//  * Copyright © 2001, 2007 Red Hat, Inc.
//  * Copyright 2024 Igalia S.L.
//  *
//  * Permission to use, copy, modify, distribute, and sell this software and its
//  * documentation for any purpose is hereby granted without fee, provided that
//  * the above copyright notice appear in all copies and that both that
//  * copyright notice and this permission notice appear in supporting
//  * documentation, and that the name of Red Hat not be used in advertising or
//  * publicity pertaining to distribution of the software without specific,
//  * written prior permission.  Red Hat makes no representations about the
//  * suitability of this software for any purpose.  It is provided "as is"
//  * without express or implied warranty.
//  *
//  * RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
//  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL RED HAT
//  * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
//  * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
//  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//  *
//  * Author:  Owen Taylor, Red Hat, Inc.
//  */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __time_t = c_long;
pub const time_t = __time_t;
pub const pthread_t = c_ulong;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern var stderr: ?*FILE;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn malloc(__size: usize) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub const XID = c_ulong;
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
pub const struct__XSettingsColor = extern struct {
    red: c_ushort = 0,
    green: c_ushort = 0,
    blue: c_ushort = 0,
    alpha: c_ushort = 0,
};
pub const XSettingsColor = struct__XSettingsColor;
const union_unnamed_50 = extern union {
    v_int: c_int,
    v_string: [*c]u8,
    v_color: XSettingsColor,
};
pub const struct__XSettingsSetting = extern struct {
    name: [*c]u8 = null,
    type: XSettingsType = @import("std").mem.zeroes(XSettingsType),
    data: union_unnamed_50 = @import("std").mem.zeroes(union_unnamed_50),
    last_change_serial: c_ulong = 0,
};
pub const XSettingsSetting = struct__XSettingsSetting;
pub const XSettingsNotifyFunc = ?*const fn (name: [*c]const u8, action: XSettingsAction, setting: [*c]XSettingsSetting, cb_data: ?*anyopaque) callconv(.c) void;
pub const XSettingsWatchFunc = ?*const fn (window: Window, is_start: c_int, mask: c_long, cb_data: ?*anyopaque) callconv(.c) c_int;
pub const XSettingsGrabFunc = ?*const fn (display: [*c]Display) callconv(.c) void;
pub const Atom = c_ulong;
pub const struct__XSettingsList = extern struct {
    setting: [*c]XSettingsSetting = null,
    next: [*c]XSettingsList = null,
};
pub const XSettingsList = struct__XSettingsList;
pub const struct__XSettingsClient = extern struct {
    display: [*c]Display = null,
    screen: c_int = 0,
    notify: XSettingsNotifyFunc = null,
    watch: XSettingsWatchFunc = null,
    cb_data: ?*anyopaque = null,
    grab: XSettingsGrabFunc = null,
    ungrab: XSettingsGrabFunc = null,
    manager_window: Window = 0,
    manager_atom: Atom = 0,
    selection_atom: Atom = 0,
    xsettings_atom: Atom = 0,
    settings: [*c]XSettingsList = null,
};
pub const XSettingsClient = struct__XSettingsClient;
pub const KeyCode = u8;
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
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int = 0,
    modifiermap: [*c]KeyCode = null,
};
pub const struct__XPrivate = opaque {};
const struct_unnamed_69 = extern struct {
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
pub const _XPrivDisplay = [*c]struct_unnamed_69;
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
const union_unnamed_70 = extern union {
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
    data: union_unnamed_70 = @import("std").mem.zeroes(union_unnamed_70),
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
pub const pointer = ?*anyopaque;
pub const SDL_DYNX11FN_XFlush = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XFlush: SDL_DYNX11FN_XFlush;
pub const SDL_DYNX11FN_XFree = ?*const fn (a: ?*anyopaque) callconv(.c) c_int;
pub extern var X11_XFree: SDL_DYNX11FN_XFree;
pub const SDL_DYNX11FN_XGetSelectionOwner = ?*const fn (a: [*c]Display, b: Atom) callconv(.c) Window;
pub extern var X11_XGetSelectionOwner: SDL_DYNX11FN_XGetSelectionOwner;
pub const SDL_DYNX11FN_XGetWindowAttributes = ?*const fn (a: [*c]Display, b: Window, c: [*c]XWindowAttributes) callconv(.c) c_int;
pub extern var X11_XGetWindowAttributes: SDL_DYNX11FN_XGetWindowAttributes;
pub const SDL_DYNX11FN_XGetWindowProperty = ?*const fn (a: [*c]Display, b: Window, c: Atom, d: c_long, e: c_long, f: c_int, g: Atom, h: [*c]Atom, i: [*c]c_int, j: [*c]c_ulong, k: [*c]c_ulong, l: [*c][*c]u8) callconv(.c) c_int;
pub extern var X11_XGetWindowProperty: SDL_DYNX11FN_XGetWindowProperty;
pub const SDL_DYNX11FN_XGrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XGrabServer: SDL_DYNX11FN_XGrabServer;
pub const SDL_DYNX11FN_XInternAtom = ?*const fn (a: [*c]Display, b: [*c]const u8, c: c_int) callconv(.c) Atom;
pub extern var X11_XInternAtom: SDL_DYNX11FN_XInternAtom;
pub const SDL_DYNX11FN_XSelectInput = ?*const fn (a: [*c]Display, b: Window, c: c_long) callconv(.c) c_int;
pub extern var X11_XSelectInput: SDL_DYNX11FN_XSelectInput;
pub const SDL_DYNX11FN_XSetErrorHandler = ?*const fn (a: XErrorHandler) callconv(.c) XErrorHandler;
pub extern var X11_XSetErrorHandler: SDL_DYNX11FN_XSetErrorHandler;
pub const SDL_DYNX11FN_XUngrabServer = ?*const fn (a: [*c]Display) callconv(.c) c_int;
pub extern var X11_XUngrabServer: SDL_DYNX11FN_XUngrabServer;
pub const struct__XSettingsBuffer = extern struct {
    byte_order: u8 = 0,
    len: usize = 0,
    data: [*c]u8 = null,
    pos: [*c]u8 = null,
};
pub const XSettingsBuffer = struct__XSettingsBuffer;
pub const XSETTINGS_TYPE_INT: c_int = 0;
pub const XSETTINGS_TYPE_STRING: c_int = 1;
pub const XSETTINGS_TYPE_COLOR: c_int = 2;
pub const XSettingsType = c_uint;
pub const XSETTINGS_SUCCESS: c_int = 0;
pub const XSETTINGS_NO_MEM: c_int = 1;
pub const XSETTINGS_ACCESS: c_int = 2;
pub const XSETTINGS_FAILED: c_int = 3;
pub const XSETTINGS_NO_ENTRY: c_int = 4;
pub const XSETTINGS_DUPLICATE_ENTRY: c_int = 5;
pub const XSettingsResult = c_uint;
pub const XSETTINGS_ACTION_NEW: c_int = 0;
pub const XSETTINGS_ACTION_CHANGED: c_int = 1;
pub const XSETTINGS_ACTION_DELETED: c_int = 2;
pub const XSettingsAction = c_uint;
pub fn notify_changes(client: [*c]XSettingsClient, old_list: [*c]XSettingsList) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var old_iter: [*c]XSettingsList = old_list;
    _ = &old_iter;
    var new_iter: [*c]XSettingsList = client.*.settings;
    _ = &new_iter;
    if (!(client.*.notify != null)) return;
    while ((old_iter != null) or (new_iter != null)) {
        var cmp: c_int = undefined;
        _ = &cmp;
        if ((old_iter != null) and (new_iter != null)) {
            cmp = strcmp(old_iter.*.setting.*.name, new_iter.*.setting.*.name);
        } else if (old_iter != null) {
            cmp = -@as(c_int, 1);
        } else {
            cmp = 1;
        }
        if (cmp < @as(c_int, 0)) {
            client.*.notify.?(old_iter.*.setting.*.name, XSETTINGS_ACTION_DELETED, null, client.*.cb_data);
        } else if (cmp == @as(c_int, 0)) {
            if (!(xsettings_setting_equal(old_iter.*.setting, new_iter.*.setting) != 0)) {
                client.*.notify.?(old_iter.*.setting.*.name, XSETTINGS_ACTION_CHANGED, new_iter.*.setting, client.*.cb_data);
            }
        } else {
            client.*.notify.?(new_iter.*.setting.*.name, XSETTINGS_ACTION_NEW, new_iter.*.setting, client.*.cb_data);
        }
        if (old_iter != null) {
            old_iter = old_iter.*.next;
        }
        if (new_iter != null) {
            new_iter = new_iter.*.next;
        }
    }
}
pub fn ignore_errors(_: [*c]Display, _: [*c]XErrorEvent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return True;
}
pub var local_byte_order: u8 = '\x00';
pub fn fetch_card16(buffer: [*c]XSettingsBuffer, result: [*c]CARD16) callconv(.c) XSettingsResult {
    @setEvalBranchQuota(100000);
    var x: CARD16 = undefined;
    _ = &x;
    if (@divExact(@as(c_long, @bitCast(@intFromPtr(buffer.*.data + buffer.*.len) -% @intFromPtr(buffer.*.pos))), @sizeOf(u8)) < @as(c_long, 2)) return XSETTINGS_ACCESS;
    x = @as([*c]CARD16, @ptrCast(@alignCast(buffer.*.pos))).*;
    buffer.*.pos += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    if (@as(c_int, buffer.*.byte_order) == @as(c_int, local_byte_order)) {
        result.* = x;
    } else {
        result.* = @bitCast(@as(c_short, @truncate((@as(c_int, x) << @intCast(@as(c_int, 8))) | (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
    }
    return XSETTINGS_SUCCESS;
}
pub fn fetch_ushort(buffer: [*c]XSettingsBuffer, result: [*c]c_ushort) callconv(.c) XSettingsResult {
    @setEvalBranchQuota(100000);
    var x: CARD16 = undefined;
    _ = &x;
    var r: XSettingsResult = undefined;
    _ = &r;
    r = fetch_card16(buffer, &x);
    if (r == @as(XSettingsResult, XSETTINGS_SUCCESS)) {
        result.* = x;
    }
    return r;
}
pub fn fetch_card32(buffer: [*c]XSettingsBuffer, result: [*c]CARD32) callconv(.c) XSettingsResult {
    @setEvalBranchQuota(100000);
    var x: CARD32 = undefined;
    _ = &x;
    if (@divExact(@as(c_long, @bitCast(@intFromPtr(buffer.*.data + buffer.*.len) -% @intFromPtr(buffer.*.pos))), @sizeOf(u8)) < @as(c_long, 4)) return XSETTINGS_ACCESS;
    x = @as([*c]CARD32, @ptrCast(@alignCast(buffer.*.pos))).*;
    buffer.*.pos += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    if (@as(c_int, buffer.*.byte_order) == @as(c_int, local_byte_order)) {
        result.* = x;
    } else {
        result.* = (((x << @intCast(@as(CARD32, 24))) | ((x & @as(CARD32, 65280)) << @intCast(@as(CARD32, 8)))) | ((x & @as(CARD32, 16711680)) >> @intCast(@as(CARD32, 8)))) | (x >> @intCast(@as(CARD32, 24)));
    }
    return XSETTINGS_SUCCESS;
}
pub fn fetch_card8(buffer: [*c]XSettingsBuffer, result: [*c]CARD8) callconv(.c) XSettingsResult {
    @setEvalBranchQuota(100000);
    if (@divExact(@as(c_long, @bitCast(@intFromPtr(buffer.*.data + buffer.*.len) -% @intFromPtr(buffer.*.pos))), @sizeOf(u8)) < @as(c_long, 1)) return XSETTINGS_ACCESS;
    result.* = buffer.*.pos.*;
    buffer.*.pos += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    return XSETTINGS_SUCCESS;
}
pub fn parse_settings(data: [*c]u8, len: usize) callconv(.c) [*c]XSettingsList {
    @setEvalBranchQuota(100000);
    var buffer: XSettingsBuffer = undefined;
    _ = &buffer;
    var result: XSettingsResult = undefined;
    _ = &result;
    var settings: [*c]XSettingsList = undefined;
    _ = &settings;
    var serial: CARD32 = undefined;
    _ = &serial;
    var n_entries: CARD32 = undefined;
    _ = &n_entries;
    var i: CARD32 = undefined;
    _ = &i;
    var setting: [*c]XSettingsSetting = undefined;
    _ = &setting;
    var buffer_byte_order: u8 = undefined;
    _ = &buffer_byte_order;
    var @"type": CARD8 = undefined;
    _ = &@"type";
    var name_len: CARD16 = undefined;
    _ = &name_len;
    var v_int: CARD32 = undefined;
    _ = &v_int;
    var pad_len: usize = undefined;
    _ = &pad_len;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = XSETTINGS_SUCCESS;
                settings = null;
                setting = null;
                buffer_byte_order = '\x00';
                local_byte_order = xsettings_byte_order();
                buffer.pos = blk: {
                    const tmp = data;
                    buffer.data = tmp;
                    break :blk tmp;
                };
                buffer.len = len;
                buffer.byte_order = '\x00';
                result = fetch_card8(&buffer, @ptrCast(@alignCast(&buffer_byte_order)));
                if ((@as(c_int, buffer_byte_order) != MSBFirst) and (@as(c_int, buffer_byte_order) != LSBFirst)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            2 => {
                _ = fprintf(stderr, "Invalid byte order in XSETTINGS property\n");
                result = XSETTINGS_FAILED;
                {
                    sdl_pc = 1;
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
                buffer.byte_order = buffer_byte_order;
                buffer.pos += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                result = fetch_card32(&buffer, &serial);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                result = fetch_card32(&buffer, &n_entries);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                i = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (i < n_entries) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                result = fetch_card8(&buffer, &@"type");
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i +%= 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
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
                buffer.pos += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                result = fetch_card16(&buffer, &name_len);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                pad_len = @bitCast(@as(c_long, ((@as(c_int, name_len) + @as(c_int, 4)) - @as(c_int, 1)) & ~(@as(c_int, 4) - @as(c_int, 1))));
                if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr((&buffer).*.data + (&buffer).*.len) -% @intFromPtr((&buffer).*.pos))), @sizeOf(u8))))) < pad_len) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                result = XSETTINGS_ACCESS;
                {
                    sdl_pc = 1;
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
                setting = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(setting.*)))));
                if (!(setting != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                result = XSETTINGS_NO_MEM;
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
                setting.*.type = XSETTINGS_TYPE_INT;
                setting.*.name = @ptrCast(@alignCast(malloc(@bitCast(@as(c_long, @as(c_int, name_len) + @as(c_int, 1))))));
                if (!(setting.*.name != null)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                result = XSETTINGS_NO_MEM;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                _ = memcpy(@ptrCast(@alignCast(setting.*.name)), @ptrCast(@alignCast(buffer.pos)), name_len);
                setting.*.name[name_len] = '\x00';
                buffer.pos += pad_len;
                result = fetch_card32(&buffer, &v_int);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                setting.*.last_change_serial = v_int;
                switch (@as(c_int, @"type")) {
                    XSETTINGS_TYPE_INT => {
                        sdl_pc = 34;
                        continue;
                    },
                    XSETTINGS_TYPE_STRING => {
                        sdl_pc = 38;
                        continue;
                    },
                    XSETTINGS_TYPE_COLOR => {
                        sdl_pc = 48;
                        continue;
                    },
                    else => {
                        sdl_pc = 61;
                        continue;
                    },
                }
            },
            33 => {
                setting.*.type = @"type";
                result = xsettings_list_insert(&settings, setting);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            34 => {
                result = fetch_card32(&buffer, &v_int);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
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
                setting.*.data.v_int = @bitCast(@as(c_uint, @truncate(v_int)));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                result = fetch_card32(&buffer, &v_int);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
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
                pad_len = ((v_int +% @as(CARD32, 4)) -% @as(CARD32, 1)) & @as(CARD32, @bitCast(@as(c_int, ~(@as(c_int, 4) - @as(c_int, 1)))));
                if (((v_int +% @as(CARD32, 1)) == @as(CARD32, 0)) or (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr((&buffer).*.data + (&buffer).*.len) -% @intFromPtr((&buffer).*.pos))), @sizeOf(u8))))) < pad_len)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                result = XSETTINGS_ACCESS;
                {
                    sdl_pc = 1;
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
                setting.*.data.v_string = @ptrCast(@alignCast(malloc(v_int +% @as(CARD32, 1))));
                if (!(setting.*.data.v_string != null)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                result = XSETTINGS_NO_MEM;
                {
                    sdl_pc = 1;
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
                _ = memcpy(@ptrCast(@alignCast(setting.*.data.v_string)), @ptrCast(@alignCast(buffer.pos)), v_int);
                setting.*.data.v_string[v_int] = '\x00';
                buffer.pos += pad_len;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            48 => {
                result = fetch_ushort(&buffer, &setting.*.data.v_color.red);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 1;
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
                result = fetch_ushort(&buffer, &setting.*.data.v_color.green);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 1;
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
                result = fetch_ushort(&buffer, &setting.*.data.v_color.blue);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
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
                result = fetch_ushort(&buffer, &setting.*.data.v_color.alpha);
                if (result != @as(XSettingsResult, XSETTINGS_SUCCESS)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 1;
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
                setting = null;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            65 => {
                switch (result) {
                    @as(XSettingsResult, XSETTINGS_NO_MEM) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(XSettingsResult, XSETTINGS_ACCESS) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(XSettingsResult, XSETTINGS_DUPLICATE_ENTRY) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(XSettingsResult, XSETTINGS_FAILED) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(XSettingsResult, XSETTINGS_SUCCESS) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(XSettingsResult, XSETTINGS_NO_ENTRY) => {
                        sdl_pc = 74;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
                        continue;
                    },
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                return settings;
            },
            68 => {
                if (setting != null) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            69 => {
                _ = fprintf(stderr, "Out of memory reading XSETTINGS property\n");
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            70 => {
                _ = fprintf(stderr, "Invalid XSETTINGS property (read off end)\n");
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                _ = fprintf(stderr, "Duplicate XSETTINGS entry for '%s'\n", setting.*.name);
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
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            75 => {
                xsettings_setting_free(setting);
                {
                    sdl_pc = 77;
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
                xsettings_list_free(settings);
                settings = null;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn read_settings(client: [*c]XSettingsClient) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type": Atom = undefined;
    _ = &@"type";
    var format: c_int = undefined;
    _ = &format;
    var n_items: c_ulong = undefined;
    _ = &n_items;
    var bytes_after: c_ulong = undefined;
    _ = &bytes_after;
    var data: [*c]u8 = undefined;
    _ = &data;
    var result: c_int = undefined;
    _ = &result;
    var old_handler: ?*const fn ([*c]Display, [*c]XErrorEvent) callconv(.c) c_int = undefined;
    _ = &old_handler;
    var old_list: [*c]XSettingsList = client.*.settings;
    _ = &old_list;
    client.*.settings = null;
    if (client.*.manager_window != 0) {
        old_handler = X11_XSetErrorHandler.?(ignore_errors);
        result = X11_XGetWindowProperty.?(client.*.display, client.*.manager_window, client.*.xsettings_atom, 0, __LONG_MAX__, False, client.*.xsettings_atom, &@"type", &format, &n_items, &bytes_after, &data);
        _ = X11_XSetErrorHandler.?(old_handler);
        if ((result == Success) and (@"type" != @as(Atom, None))) {
            if (@"type" != client.*.xsettings_atom) {
                _ = fprintf(stderr, "Invalid type for XSETTINGS property");
            } else if (format != @as(c_int, 8)) {
                _ = fprintf(stderr, "Invalid format for XSETTINGS property %d", format);
            } else {
                client.*.settings = parse_settings(data, n_items);
            }
            _ = X11_XFree.?(@ptrCast(@alignCast(data)));
        }
    }
    notify_changes(client, old_list);
    xsettings_list_free(old_list);
}
pub fn add_events(display: [*c]Display, window: Window, mask: c_long) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var attr: XWindowAttributes = undefined;
    _ = &attr;
    _ = X11_XGetWindowAttributes.?(display, window, &attr);
    _ = X11_XSelectInput.?(display, window, attr.your_event_mask | mask);
}
pub fn check_manager_window(client: [*c]XSettingsClient) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((client.*.manager_window != 0) and (client.*.watch != null)) {
        _ = client.*.watch.?(client.*.manager_window, False, 0, client.*.cb_data);
    }
    if (client.*.grab != null) {
        client.*.grab.?(client.*.display);
    } else {
        _ = X11_XGrabServer.?(client.*.display);
    }
    client.*.manager_window = X11_XGetSelectionOwner.?(client.*.display, client.*.selection_atom);
    if (client.*.manager_window != 0) {
        _ = X11_XSelectInput.?(client.*.display, client.*.manager_window, (@as(c_long, 1) << @intCast(@as(c_long, 22))) | (@as(c_long, 1) << @intCast(@as(c_long, 17))));
    }
    if (client.*.ungrab != null) {
        client.*.ungrab.?(client.*.display);
    } else {
        _ = X11_XUngrabServer.?(client.*.display);
    }
    _ = X11_XFlush.?(client.*.display);
    if ((client.*.manager_window != 0) and (client.*.watch != null)) {
        if (!(client.*.watch.?(client.*.manager_window, True, (@as(c_long, 1) << @intCast(@as(c_long, 22))) | (@as(c_long, 1) << @intCast(@as(c_long, 17))), client.*.cb_data) != 0)) {
            client.*.manager_window = None;
            return;
        }
    }
    read_settings(client);
}
pub export fn xsettings_client_new(display: [*c]Display, screen: c_int, notify: XSettingsNotifyFunc, watch: XSettingsWatchFunc, cb_data: ?*anyopaque) [*c]XSettingsClient {
    @setEvalBranchQuota(100000);
    return xsettings_client_new_with_grab_funcs(display, screen, notify, watch, cb_data, null, null);
}
pub export fn xsettings_client_new_with_grab_funcs(display: [*c]Display, screen: c_int, notify: XSettingsNotifyFunc, watch: XSettingsWatchFunc, cb_data: ?*anyopaque, grab: XSettingsGrabFunc, ungrab: XSettingsGrabFunc) [*c]XSettingsClient {
    @setEvalBranchQuota(100000);
    var client: [*c]XSettingsClient = undefined;
    _ = &client;
    var buffer: [256]u8 = undefined;
    _ = &buffer;
    var atom_names: [3][*c]u8 = undefined;
    _ = &atom_names;
    var atoms: [3]Atom = undefined;
    _ = &atoms;
    client = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(client.*)))));
    if (!(client != null)) return null;
    client.*.display = display;
    client.*.screen = screen;
    client.*.notify = notify;
    client.*.watch = watch;
    client.*.cb_data = cb_data;
    client.*.grab = grab;
    client.*.ungrab = ungrab;
    client.*.manager_window = None;
    client.*.settings = null;
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&buffer)), @sizeOf(@TypeOf(buffer)), "_XSETTINGS_S%d", screen);
    atom_names[@as(c_int, 0)] = @ptrCast(@alignCast(&buffer));
    atom_names[@as(c_int, 1)] = @as([*c]u8, @as([*c]u8, @constCast("_XSETTINGS_SETTINGS")));
    atom_names[@as(c_int, 2)] = @as([*c]u8, @as([*c]u8, @constCast("MANAGER")));
    atoms[@as(c_int, 0)] = X11_XInternAtom.?(display, atom_names[@as(c_int, 0)], False);
    atoms[@as(c_int, 1)] = X11_XInternAtom.?(display, atom_names[@as(c_int, 1)], False);
    atoms[@as(c_int, 2)] = X11_XInternAtom.?(display, atom_names[@as(c_int, 2)], False);
    client.*.selection_atom = atoms[@as(c_int, 0)];
    client.*.xsettings_atom = atoms[@as(c_int, 1)];
    client.*.manager_atom = atoms[@as(c_int, 2)];
    add_events(display, (&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, @as(c_long, 1) << @intCast(@as(c_long, 17)));
    if (client.*.watch != null) {
        _ = client.*.watch.?((&@as(_XPrivDisplay, @ptrCast(@alignCast(display))).*.screens[@bitCast(@as(isize, @intCast(screen)))]).*.root, True, @as(c_long, 1) << @intCast(@as(c_long, 17)), client.*.cb_data);
    }
    check_manager_window(client);
    return client;
}
pub export fn xsettings_client_set_grab_func(client: [*c]XSettingsClient, grab: XSettingsGrabFunc) void {
    @setEvalBranchQuota(100000);
    client.*.grab = grab;
}
pub export fn xsettings_client_set_ungrab_func(client: [*c]XSettingsClient, ungrab: XSettingsGrabFunc) void {
    @setEvalBranchQuota(100000);
    client.*.ungrab = ungrab;
}
pub export fn xsettings_client_destroy(client: [*c]XSettingsClient) void {
    @setEvalBranchQuota(100000);
    if (client.*.watch != null) {
        _ = client.*.watch.?((&@as(_XPrivDisplay, @ptrCast(@alignCast(client.*.display))).*.screens[@bitCast(@as(isize, @intCast(client.*.screen)))]).*.root, False, 0, client.*.cb_data);
    }
    if ((client.*.manager_window != 0) and (client.*.watch != null)) {
        _ = client.*.watch.?(client.*.manager_window, False, 0, client.*.cb_data);
    }
    xsettings_list_free(client.*.settings);
    free(@ptrCast(@alignCast(client)));
}
pub export fn xsettings_client_get_setting(client: [*c]XSettingsClient, name: [*c]const u8, setting: [*c][*c]XSettingsSetting) XSettingsResult {
    @setEvalBranchQuota(100000);
    var search: [*c]XSettingsSetting = xsettings_list_lookup(client.*.settings, name);
    _ = &search;
    if (search != null) {
        setting.* = xsettings_setting_copy(search);
        return @bitCast(if (setting.* != null) XSETTINGS_SUCCESS else XSETTINGS_NO_MEM);
    } else return XSETTINGS_NO_ENTRY;
}
pub export fn xsettings_client_process_event(client: [*c]XSettingsClient, xev: [*c]const XEvent) c_int {
    @setEvalBranchQuota(100000);
    if (xev.*.xany.window == (&@as(_XPrivDisplay, @ptrCast(@alignCast(client.*.display))).*.screens[@bitCast(@as(isize, @intCast(client.*.screen)))]).*.root) {
        if (((xev.*.xany.type == ClientMessage) and (xev.*.xclient.message_type == client.*.manager_atom)) and (@as(Atom, @bitCast(@as(c_long, xev.*.xclient.data.l[@as(c_int, 1)]))) == client.*.selection_atom)) {
            check_manager_window(client);
            return True;
        }
    } else if (xev.*.xany.window == client.*.manager_window) {
        if (xev.*.xany.type == DestroyNotify) {
            check_manager_window(client);
            return False;
        } else if (xev.*.xany.type == PropertyNotify) {
            read_settings(client);
            return True;
        }
    }
    return False;
}
pub export fn xsettings_setting_copy(setting: [*c]XSettingsSetting) [*c]XSettingsSetting {
    @setEvalBranchQuota(100000);
    var result: [*c]XSettingsSetting = undefined;
    _ = &result;
    var str_len: usize = undefined;
    _ = &str_len;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(result.*)))));
                if (!(result != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                free(@ptrCast(@alignCast(result.*.name)));
                free(@ptrCast(@alignCast(result)));
                return null;
            },
            2 => {
                return null;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                str_len = strlen(setting.*.name);
                result.*.name = @ptrCast(@alignCast(malloc(str_len +% @as(usize, 1))));
                if (!(result.*.name != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                _ = memcpy(@ptrCast(@alignCast(result.*.name)), @ptrCast(@alignCast(setting.*.name)), str_len +% @as(usize, 1));
                result.*.type = setting.*.type;
                switch (setting.*.type) {
                    @as(XSettingsType, XSETTINGS_TYPE_INT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(XSettingsType, XSETTINGS_TYPE_COLOR) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(XSettingsType, XSETTINGS_TYPE_STRING) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            8 => {
                result.*.last_change_serial = setting.*.last_change_serial;
                return result;
            },
            9 => {
                result.*.data.v_int = setting.*.data.v_int;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            10 => {
                result.*.data.v_color = setting.*.data.v_color;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                str_len = strlen(setting.*.data.v_string);
                result.*.data.v_string = @ptrCast(@alignCast(malloc(str_len +% @as(usize, 1))));
                if (!(result.*.data.v_string != null)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
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
                _ = memcpy(@ptrCast(@alignCast(result.*.data.v_string)), @ptrCast(@alignCast(setting.*.data.v_string)), str_len +% @as(usize, 1));
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn xsettings_list_copy(list: [*c]XSettingsList) [*c]XSettingsList {
    @setEvalBranchQuota(100000);
    var new: [*c]XSettingsList = undefined;
    _ = &new;
    var old_iter: [*c]XSettingsList = undefined;
    _ = &old_iter;
    var new_iter: [*c]XSettingsList = undefined;
    _ = &new_iter;
    var new_node: [*c]XSettingsList = undefined;
    _ = &new_node;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                new = null;
                old_iter = list;
                new_iter = null;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                xsettings_list_free(new);
                return null;
            },
            2 => {
                if (old_iter != null) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                new_node = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(new_node.*)))));
                if (!(new_node != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                return new;
            },
            5 => {
                {
                    sdl_pc = 1;
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
                new_node.*.setting = xsettings_setting_copy(old_iter.*.setting);
                if (!(new_node.*.setting != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                free(@ptrCast(@alignCast(new_node)));
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
                if (new_iter != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                new_iter.*.next = new_node;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                new = new_node;
                new.*.next = null;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                new_iter = new_node;
                old_iter = old_iter.*.next;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn xsettings_setting_equal(setting_a: [*c]XSettingsSetting, setting_b: [*c]XSettingsSetting) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (setting_a.*.type != setting_b.*.type) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (strcmp(setting_a.*.name, setting_b.*.name) != @as(c_int, 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (setting_a.*.type) {
                    @as(XSettingsType, XSETTINGS_TYPE_INT) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(XSettingsType, XSETTINGS_TYPE_COLOR) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(XSettingsType, XSETTINGS_TYPE_STRING) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            7 => {
                return 0;
            },
            8 => {
                return @intFromBool(setting_a.*.data.v_int == setting_b.*.data.v_int);
            },
            9 => {
                return @intFromBool((((@as(c_int, setting_a.*.data.v_color.red) == @as(c_int, setting_b.*.data.v_color.red)) and (@as(c_int, setting_a.*.data.v_color.green) == @as(c_int, setting_b.*.data.v_color.green))) and (@as(c_int, setting_a.*.data.v_color.blue) == @as(c_int, setting_b.*.data.v_color.blue))) and (@as(c_int, setting_a.*.data.v_color.alpha) == @as(c_int, setting_b.*.data.v_color.alpha)));
            },
            10 => {
                return @intFromBool(strcmp(setting_a.*.data.v_string, setting_b.*.data.v_string) == @as(c_int, 0));
            },
            else => unreachable,
        }
    }
}
pub export fn xsettings_setting_free(setting: [*c]XSettingsSetting) void {
    @setEvalBranchQuota(100000);
    if (setting.*.type == @as(XSettingsType, XSETTINGS_TYPE_STRING)) {
        free(@ptrCast(@alignCast(setting.*.data.v_string)));
    }
    free(@ptrCast(@alignCast(setting.*.name)));
    free(@ptrCast(@alignCast(setting)));
}
pub export fn xsettings_list_free(arg_list: [*c]XSettingsList) void {
    @setEvalBranchQuota(100000);
    var list = arg_list;
    _ = &list;
    while (list != null) {
        var next: [*c]XSettingsList = list.*.next;
        _ = &next;
        xsettings_setting_free(list.*.setting);
        free(@ptrCast(@alignCast(list)));
        list = next;
    }
}
pub export fn xsettings_list_insert(list: [*c][*c]XSettingsList, setting: [*c]XSettingsSetting) XSettingsResult {
    @setEvalBranchQuota(100000);
    var node: [*c]XSettingsList = undefined;
    _ = &node;
    var iter: [*c]XSettingsList = undefined;
    _ = &iter;
    var last: [*c]XSettingsList = null;
    _ = &last;
    node = @ptrCast(@alignCast(malloc(@sizeOf(@TypeOf(node.*)))));
    if (!(node != null)) return XSETTINGS_NO_MEM;
    node.*.setting = setting;
    iter = list.*;
    while (iter != null) {
        var cmp: c_int = strcmp(setting.*.name, iter.*.setting.*.name);
        _ = &cmp;
        if (cmp < @as(c_int, 0)) break else if (cmp == @as(c_int, 0)) {
            free(@ptrCast(@alignCast(node)));
            return XSETTINGS_DUPLICATE_ENTRY;
        }
        last = iter;
        iter = iter.*.next;
    }
    if (last != null) {
        last.*.next = node;
    } else {
        list.* = node;
    }
    node.*.next = iter;
    return XSETTINGS_SUCCESS;
}
pub export fn xsettings_list_delete(list: [*c][*c]XSettingsList, name: [*c]const u8) XSettingsResult {
    @setEvalBranchQuota(100000);
    var iter: [*c]XSettingsList = undefined;
    _ = &iter;
    var last: [*c]XSettingsList = null;
    _ = &last;
    iter = list.*;
    while (iter != null) {
        if (strcmp(name, iter.*.setting.*.name) == @as(c_int, 0)) {
            if (last != null) {
                last.*.next = iter.*.next;
            } else {
                list.* = iter.*.next;
            }
            xsettings_setting_free(iter.*.setting);
            free(@ptrCast(@alignCast(iter)));
            return XSETTINGS_SUCCESS;
        }
        last = iter;
        iter = iter.*.next;
    }
    return XSETTINGS_FAILED;
}
pub export fn xsettings_list_lookup(list: [*c]XSettingsList, name: [*c]const u8) [*c]XSettingsSetting {
    @setEvalBranchQuota(100000);
    var iter: [*c]XSettingsList = undefined;
    _ = &iter;
    iter = list;
    while (iter != null) {
        if (strcmp(name, iter.*.setting.*.name) == @as(c_int, 0)) return iter.*.setting;
        iter = iter.*.next;
    }
    return null;
}
pub export fn xsettings_byte_order() u8 {
    @setEvalBranchQuota(100000);
    var myint: CARD32 = 16909060;
    _ = &myint;
    return @bitCast(@as(i8, @truncate(if (@as(c_int, @as([*c]u8, @ptrCast(@alignCast(&myint))).*) == @as(c_int, 1)) MSBFirst else LSBFirst)));
}

pub const __LONG_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const None = @as(c_long, 0);
pub const DestroyNotify = @as(c_int, 17);
pub const PropertyNotify = @as(c_int, 28);
pub const ClientMessage = @as(c_int, 33);
pub const Success = @as(c_int, 0);
pub const LSBFirst = @as(c_int, 0);
pub const MSBFirst = @as(c_int, 1);
pub const True = @as(c_int, 1);
pub const False = @as(c_int, 0);
pub inline fn XSETTINGS_PAD(n: anytype, m: anytype) @TypeOf(((n + m) - @as(c_int, 1)) & ~(m - @as(c_int, 1))) {
    @setEvalBranchQuota(100000);
    _ = &n;
    _ = &m;
    return ((n + m) - @as(c_int, 1)) & ~(m - @as(c_int, 1));
}
pub inline fn BYTES_LEFT(buffer: anytype) @TypeOf((buffer.*.data + buffer.*.len) - buffer.*.pos) {
    @setEvalBranchQuota(100000);
    _ = &buffer;
    return (buffer.*.data + buffer.*.len) - buffer.*.pos;
}
