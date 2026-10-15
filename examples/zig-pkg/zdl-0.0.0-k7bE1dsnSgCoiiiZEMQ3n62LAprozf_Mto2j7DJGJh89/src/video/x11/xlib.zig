//! Private Xlib binding: C record layouts, protocol constants and the dynamically
//! loaded function table for libX11.so.6. Only the window, event, property,
//! keyboard, selection, cursor and image entry points used by `window.zig`,
//! `keyboard.zig` and `clipboard.zig` are declared. Public API is idiomatic Zig;
//! nothing in this file is exported.
//!
//! Record layouts are LP64 (Linux x86-64/aarch64). Each XEvent variant begins
//! with the common XAnyEvent header (type at 0, serial at 8, send_event at 16,
//! display at 24, window at 32). Offsets below follow Xlib.h and Xutil.h; the
//! comptime block at the end asserts the sizes this code depends on.
//!
//! Xlib keeps process-wide state. Its default error handler terminates the
//! program, so Library users register each display (`register_display`), which
//! installs a non-terminating handler while any display is open. The handler receives no user data, so the pending
//! error of each open display is kept in a small process-wide slot table here:
//! the only process state this binding adds, and the reason it exists.
//!
//! Optional libraries (libXext for MIT-SHM, libXrandr for displays) are loaded
//! separately and reported as absent when the system does not provide them.
const std = @import("std");
const builtin = @import("builtin");

pub const Display = opaque {};
pub const Drawable = c_ulong;
pub const Window = c_ulong;
pub const Pixmap = c_ulong;
pub const Cursor = c_ulong;
pub const Atom = c_ulong;
pub const Time = c_ulong;
pub const KeySym = c_ulong;
/// Xlib declares KeyCode as unsigned char (X.h); events widen it to unsigned int.
pub const KeyCode = u8;
pub const Status = c_int;
pub const Bool = c_int;

pub const Gc = opaque {};
pub const Visual = extern struct {
    extension: ?*anyopaque,
    id: c_ulong,
    class: c_int,
    red_mask: c_ulong,
    green_mask: c_ulong,
    blue_mask: c_ulong,
    bits_per_rgb: c_int,
    map_entries: c_int,
};

// Event type codes (X.h).
pub const key_press = 2;
pub const key_release = 3;
pub const button_press = 4;
pub const button_release = 5;
pub const motion_notify = 6;
pub const enter_notify = 7;
pub const leave_notify = 8;
pub const focus_in = 9;
pub const focus_out = 10;
pub const expose = 12;
pub const destroy_notify = 17;
pub const unmap_notify = 18;
pub const map_notify = 19;
pub const configure_notify = 22;
pub const property_notify = 28;
pub const selection_clear = 29;
pub const selection_request = 30;
pub const selection_notify = 31;
pub const client_message = 33;
pub const mapping_notify = 34;
/// GenericEvent (X.h): XInput2 and other extensions deliver their events with this type.
pub const generic_event = 35;

// Event mask bits for XSelectInput / XSendEvent (X.h).
pub const key_press_mask: c_long = 1 << 0;
pub const key_release_mask: c_long = 1 << 1;
pub const button_press_mask: c_long = 1 << 2;
pub const button_release_mask: c_long = 1 << 3;
pub const enter_window_mask: c_long = 1 << 4;
pub const leave_window_mask: c_long = 1 << 5;
pub const pointer_motion_mask: c_long = 1 << 6;
pub const exposure_mask: c_long = 1 << 15;
pub const structure_notify_mask: c_long = 1 << 17;
pub const substructure_notify_mask: c_long = 1 << 19;
pub const substructure_redirect_mask: c_long = 1 << 20;
pub const focus_change_mask: c_long = 1 << 21;
pub const property_change_mask: c_long = 1 << 22;

// Modifier state bits (X.h): ShiftMask ... Mod5Mask.
pub const shift_mask: c_uint = 1 << 0;
pub const lock_mask: c_uint = 1 << 1;
pub const control_mask: c_uint = 1 << 2;
pub const mod1_mask: c_uint = 1 << 3;
pub const mod2_mask: c_uint = 1 << 4;
pub const mod3_mask: c_uint = 1 << 5;
pub const mod4_mask: c_uint = 1 << 6;
pub const mod5_mask: c_uint = 1 << 7;

pub const current_time: Time = 0;
pub const none: c_ulong = 0;
pub const any_property_type: Atom = 0;
pub const revert_to_parent: c_int = 2;
pub const property_new_value: c_int = 0;
pub const property_delete: c_int = 1;
pub const prop_mode_replace: c_int = 0;
pub const prop_mode_append: c_int = 2;
pub const input_output: c_uint = 1;
pub const mapping_keyboard: c_int = 1;
pub const mapping_modifier: c_int = 0;
pub const normal_state: c_long = 1;
pub const iconic_state: c_long = 3;
pub const client_message_format: c_int = 32;

// Predefined atoms (Xatom.h).
pub const xa_atom: Atom = 4;
pub const xa_integer: Atom = 19;
pub const xa_cardinal: Atom = 6;
pub const xa_string: Atom = 31;
pub const xa_window: Atom = 33;

// Size hint flags (Xutil.h).
pub const p_position: c_long = 1 << 2;
pub const p_size: c_long = 1 << 3;
pub const p_min_size: c_long = 1 << 4;
pub const p_max_size: c_long = 1 << 5;

// Motif window hints (Xm/MwmUtil.h) used for decorations.
pub const mwm_hints_decorations: c_long = 1 << 1;

// Cursor font shapes (cursorfont.h).
pub const cursor_xc_arrow: c_uint = 68;
pub const cursor_xc_hand2: c_uint = 60;
pub const cursor_xc_xterm: c_uint = 152;
pub const cursor_xc_crosshair: c_uint = 34;
pub const cursor_xc_watch: c_uint = 150;
pub const cursor_xc_fleur: c_uint = 52;
pub const cursor_xc_sb_h_double_arrow: c_uint = 108;
pub const cursor_xc_sb_v_double_arrow: c_uint = 116;
pub const cursor_xc_question_arrow: c_uint = 92;
pub const cursor_xc_hand2_pointer: c_uint = 60;
pub const cursor_xc_pirate: c_uint = 88;
pub const cursor_xc_tcross: c_uint = 130;
pub const cursor_xc_top_left_corner: c_uint = 134;
pub const cursor_xc_top_right_corner: c_uint = 136;
pub const cursor_xc_top_side: c_uint = 138;
pub const cursor_xc_right_side: c_uint = 96;
pub const cursor_xc_bottom_right_corner: c_uint = 14;
pub const cursor_xc_bottom_side: c_uint = 16;
pub const cursor_xc_bottom_left_corner: c_uint = 12;
pub const cursor_xc_left_side: c_uint = 70;

pub const XSizeHints = extern struct {
    flags: c_long,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    min_width: c_int,
    min_height: c_int,
    max_width: c_int,
    max_height: c_int,
    width_inc: c_int,
    height_inc: c_int,
    min_aspect_x: c_int,
    min_aspect_y: c_int,
    max_aspect_x: c_int,
    max_aspect_y: c_int,
    base_width: c_int,
    base_height: c_int,
    win_gravity: c_int,
};

pub const XClassHint = extern struct {
    res_name: ?[*:0]u8,
    res_class: ?[*:0]u8,
};

/// XSetWindowAttributes (Xlib.h), LP64 layout: the fields this backend sets are
/// override_redirect (offset 88) and event_mask (offset 72). Value masks select them.
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
    save_under: Bool = 0,
    event_mask: c_long = 0,
    do_not_propagate_mask: c_long = 0,
    override_redirect: Bool = 0,
    colormap: Colormap = 0,
    cursor: Cursor = 0,
};
/// CWOverrideRedirect (X.h): value-mask bit for XSetWindowAttributes.override_redirect.
pub const cw_override_redirect: c_ulong = 1 << 9;

pub const XColor = extern struct {
    pixel: c_ulong,
    red: u16,
    green: u16,
    blue: u16,
    flags: u8,
    pad: u8,
};

pub const XModifierKeymap = extern struct {
    max_keypermod: c_int,
    modifiermap: [*]KeyCode,
};

/// XGCValues. Only graphics_exposures is set by this backend (GCGraphicsExposures).
pub const XGCValues = extern struct {
    function: c_int,
    plane_mask: c_ulong,
    foreground: c_ulong,
    background: c_ulong,
    line_width: c_int,
    line_style: c_int,
    cap_style: c_int,
    join_style: c_int,
    fill_style: c_int,
    fill_rule: c_int,
    arc_mode: c_int,
    tile: Pixmap,
    stipple: Pixmap,
    ts_x_origin: c_int,
    ts_y_origin: c_int,
    font: c_ulong,
    subwindow_mode: c_int,
    graphics_exposures: c_int,
    clip_x_origin: c_int,
    clip_y_origin: c_int,
    clip_mask: Pixmap,
    dash_offset: c_int,
    dashes: u8,
};
pub const gc_graphics_exposures: c_ulong = 1 << 16;

/// XImage with the function table Xlib's XDestroyImage calls through.
pub const Image = extern struct {
    width: c_int,
    height: c_int,
    xoffset: c_int,
    format: c_int,
    data: ?[*]u8,
    byte_order: c_int,
    bitmap_unit: c_int,
    bitmap_bit_order: c_int,
    bitmap_pad: c_int,
    depth: c_int,
    bytes_per_line: c_int,
    bits_per_pixel: c_int,
    red_mask: c_ulong,
    green_mask: c_ulong,
    blue_mask: c_ulong,
    object_data: ?*anyopaque,
    functions: extern struct {
        create: *const anyopaque,
        destroy: *const fn (*Image) callconv(.c) c_int,
        get: *const anyopaque,
        put: *const anyopaque,
        sub: *const anyopaque,
        add: *const anyopaque,
    },
};

// XEvent variants. Offsets: header 0-39 (XAnyEvent); variant fields follow.
pub const AnyEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    window: Window,
};

/// XKeyEvent and XButtonEvent share this layout (button uses the keycode slot).
pub const KeyEvent = extern struct {
    header: AnyEvent,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    state: c_uint,
    keycode: c_uint,
    same_screen: Bool,
};

pub const MotionEvent = extern struct {
    header: AnyEvent,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    state: c_uint,
    is_hint: u8,
    same_screen: Bool,
};

/// XCrossingEvent (EnterNotify/LeaveNotify).
pub const CrossingEvent = extern struct {
    header: AnyEvent,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    mode: c_int,
    detail: c_int,
    same_screen: Bool,
    focus: Bool,
    state: c_uint,
};

/// XFocusChangeEvent (FocusIn/FocusOut): event window at 32, mode at 40, detail at 44.
pub const FocusEvent = extern struct {
    header: AnyEvent,
    mode: c_int,
    detail: c_int,
};

pub const ExposeEvent = extern struct {
    header: AnyEvent,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    count: c_int,
};

/// XConfigureEvent: `event` at 32, `window` at 40, x/y/width/height at 48-60.
pub const ConfigureEvent = extern struct {
    header: AnyEvent,
    window: Window,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    above: Window,
    override_redirect: Bool,
};

pub const MapEvent = extern struct {
    header: AnyEvent,
    window: Window,
    override_redirect: Bool,
};

pub const UnmapEvent = extern struct {
    header: AnyEvent,
    window: Window,
    from_configure: Bool,
};

pub const DestroyEvent = extern struct {
    header: AnyEvent,
    window: Window,
};

pub const PropertyEvent = extern struct {
    header: AnyEvent,
    atom: Atom,
    time: Time,
    state: c_int,
};

pub const SelectionClearEvent = extern struct {
    header: AnyEvent,
    selection: Atom,
    time: Time,
};

/// XSelectionRequestEvent: the owner is the header window at offset 32.
pub const SelectionRequestEvent = extern struct {
    header: AnyEvent,
    requestor: Window,
    selection: Atom,
    target: Atom,
    property: Atom,
    time: Time,
};

/// XSelectionEvent: the requestor window is the header window at offset 32.
pub const SelectionEvent = extern struct {
    header: AnyEvent,
    selection: Atom,
    target: Atom,
    property: Atom,
    time: Time,
};

pub const ClientMessageEvent = extern struct {
    header: AnyEvent,
    message_type: Atom,
    format: c_int,
    data: extern union { bytes: [20]u8, shorts: [10]c_short, longs: [5]c_long },
};

pub const MappingEvent = extern struct {
    header: AnyEvent,
    request: c_int,
    first_keycode: c_int,
    count: c_int,
};

/// XEvent: a 192-byte union of the variants above. Read `kind` first.
pub const Event = extern union {
    kind: c_int,
    any: AnyEvent,
    key: KeyEvent,
    motion: MotionEvent,
    crossing: CrossingEvent,
    focus: FocusEvent,
    expose: ExposeEvent,
    configure: ConfigureEvent,
    map: MapEvent,
    unmap: UnmapEvent,
    destroy: DestroyEvent,
    property: PropertyEvent,
    selection_clear: SelectionClearEvent,
    selection_request: SelectionRequestEvent,
    selection: SelectionEvent,
    client: ClientMessageEvent,
    mapping: MappingEvent,
    xkb_state: XkbStateEvent,
    /// GenericEvent cookie; XInput2 events arrive as this and carry their data
    /// only between XGetEventData and XFreeEventData. Their records are therefore
    /// not variants here: XIDeviceEvent is 200 bytes and would not fit this union.
    generic: GenericEventCookie,
    xi_raw: XIRawEvent,
    padding: [24]c_long,
};

/// XErrorEvent as passed to the error handler (Xlib.h): display at 8, resource
/// id at 16, serial at 24, then error, request and minor codes at 32-34.
pub const ErrorEvent = extern struct {
    kind: c_int,
    display: ?*Display,
    resource_id: c_ulong,
    serial: c_ulong,
    error_code: u8,
    request_code: u8,
    minor_code: u8,
};

/// Xlib's error handler signature (XSetErrorHandler).
pub const ErrorHandler = *const fn (?*Display, *ErrorEvent) callconv(.c) c_int;

/// XkbStateNotify as delivered by libX11 (XKBlib.h): the common header covers
/// the first 40 bytes, xkb_type at 40, device at 44, changed at 48, group at 52.
pub const XkbStateEvent = extern struct {
    header: AnyEvent,
    xkb_type: c_int,
    device: c_int,
    changed: c_uint,
    group: c_int,
};

/// Leading part of XkbDescRec (XKBstr.h). `ctrls` points at XkbControlsRec,
/// whose num_groups byte is at offset 1.
pub const XkbDesc = extern struct {
    dpy: ?*anyopaque,
    flags: u16,
    device_spec: u16,
    min_key_code: u8,
    max_key_code: u8,
    ctrls: ?*const XkbControls,
    server: ?*const XkbServerMap,
    map: ?*const XkbClientMap,
    indicators: ?*anyopaque,
    names: ?*const XkbNames,
    compat: ?*anyopaque,
    geom: ?*anyopaque,
};

/// XkbModsRec: real modifier mask, virtual modifier bits and their combined
/// effective mask (the `mask` field once the server map resolves virtual mods).
pub const XkbMods = extern struct { mask: u8, real_mods: u8, vmods: u16 };

/// XkbKTMapEntryRec: the modifier combination `mods` selects `level`.
pub const XkbKeyTypeEntry = extern struct {
    active: Bool,
    level: u8,
    mods: XkbMods,
};

/// XkbKeyTypeRec (XKBstr.h): how modifiers choose a shift level of a key.
pub const XkbKeyType = extern struct {
    mods: XkbMods,
    num_levels: u8,
    map_count: u8,
    map: ?[*]const XkbKeyTypeEntry,
    preserve: ?*anyopaque,
    name: Atom,
    level_names: ?*anyopaque,
};

/// XkbSymMapRec: key types per group, group wrapping info and symbol offset.
pub const XkbSymMap = extern struct {
    kt_index: [4]u8,
    group_info: u8,
    width: u8,
    offset: u16,
};

/// XkbClientMapRec: key types and the per-key symbol map.
pub const XkbClientMap = extern struct {
    size_types: u8,
    num_types: u8,
    types: ?[*]const XkbKeyType,
    size_syms: u16,
    num_syms: u16,
    syms: ?[*]const KeySym,
    key_sym_map: ?[*]const XkbSymMap,
    modmap: ?[*]const u8,
};

/// XkbServerMapRec up to the virtual modifier bindings (`vmods[i]` is the real
/// modifier mask virtual modifier i is bound to).
pub const XkbServerMap = extern struct {
    num_acts: u16,
    size_acts: u16,
    acts: ?*anyopaque,
    behaviors: ?*anyopaque,
    key_acts: ?*anyopaque,
    explicit: ?*anyopaque,
    vmods: [16]u8,
};

/// XkbNamesRec up to the virtual modifier names (atoms indexed like `vmods`).
pub const XkbNames = extern struct {
    keycodes: Atom,
    geometry: Atom,
    symbols: Atom,
    types: Atom,
    compat: Atom,
    vmods: [16]Atom,
};

pub const XkbVirtualModNamesMask: c_uint = 1 << 7;
/// XkbAllClientInfoMask | XkbVirtualModsMask, as SDL requests after a map change.
pub const XkbClientInfoAndVirtualMods: c_uint = 0x17;

/// First bytes of XkbControlsRec.
pub const XkbControls = extern struct {
    mk_dflt_btn: u8,
    num_groups: u8,
    groups_wrap: u8,
};

pub const XkbUseCoreKbd: c_uint = 0x0100;
pub const XkbAllComponentsMask: c_uint = 0x7f;
pub const XkbNewKeyboardNotifyMask: c_long = 1 << 0;
pub const XkbMapNotifyMask: c_long = 1 << 1;
pub const XkbStateNotifyMask: c_long = 1 << 2;
pub const xkb_new_keyboard_notify: c_int = 0;
pub const xkb_map_notify: c_int = 1;
pub const xkb_state_notify: c_int = 2;

/// Input method and context handles. Both are opaque to this backend.
pub const XIM = opaque {};
pub const XIC = opaque {};
pub const XVaNestedList = ?*anyopaque;

/// XPoint, used for the input-method spot location.
pub const XPoint = extern struct { x: i16, y: i16 };

/// XIMCallback (Xlib.h): a callback and the client data passed back to it.
pub const XIMCallback = extern struct {
    client_data: ?*anyopaque,
    callback: ?*const anyopaque,
};

/// XIMText (Xlib.h), LP64: `length` counts bytes (or wide characters when
/// `encoding_is_wchar` is set), `string` points at the replacement text.
pub const XIMText = extern struct {
    length: c_ushort,
    feedback: ?*anyopaque,
    encoding_is_wchar: Bool,
    string: ?[*]u8,
};

/// XIMPreeditDrawCallbackStruct: the characters from `chg_first` for `chg_length`
/// are replaced by `text`; `caret` is the new cursor position. Positions count characters.
pub const XIMPreeditDrawCallbackStruct = extern struct {
    caret: c_int,
    chg_first: c_int,
    chg_length: c_int,
    text: ?*const XIMText,
};

/// XIMPreeditCaretCallbackStruct: the cursor moved to `position` (in characters).
pub const XIMPreeditCaretCallbackStruct = extern struct {
    position: c_int,
    direction: c_int,
    style: c_int,
};

/// Largest composition string kept per input context, in bytes.
pub const preedit_capacity = 512;

/// Composition (preedit) state of one input context. The XIM callbacks write it
/// while the input method runs inside XFilterEvent or Xutf8LookupString; the
/// owner reads it with `take` afterwards. Callbacks reach it through the client
/// data pointer, so the Preedit must stay at one address while its context lives
/// (text_input.zig heap-allocates it).
///
/// Positions are character indices, as Xlib reports them. Wide-character
/// replacements (encoding_is_wchar) are ignored because the locale is UTF-8 in
/// practice; the caret still updates. Composition text beyond `preedit_capacity`
/// is cut at a character boundary.
pub const Preedit = struct {
    text: [preedit_capacity]u8 = undefined,
    length: usize = 0,
    caret: i32 = 0,
    /// Set by any callback; `take` clears it.
    dirty: bool = false,

    /// A snapshot of the composition after a callback: the text and caret.
    pub const Snapshot = struct { text: []const u8, caret: i32 };

    /// PreeditStart: the input method began a composition (-1 means no length limit).
    pub fn start(self: *Preedit) c_int {
        self.length = 0;
        self.caret = 0;
        self.dirty = true;
        return -1;
    }

    /// PreeditDone: the composition ended. The text is empty.
    pub fn done(self: *Preedit) void {
        self.length = 0;
        self.caret = 0;
        self.dirty = true;
    }

    /// PreeditDraw: splices the replacement text over the changed range.
    pub fn draw(self: *Preedit, change: XIMPreeditDrawCallbackStruct) void {
        const current = self.text[0..self.length];
        const first = char_offset(current, change.chg_first);
        const last = char_offset(current, change.chg_first +| @max(change.chg_length, 0));
        var replacement: []const u8 = "";
        if (change.text) |text| {
            if (text.string) |bytes| {
                if (text.encoding_is_wchar == 0) replacement = bytes[0..text.length];
            }
        }
        var out: [preedit_capacity]u8 = undefined;
        var used: usize = 0;
        append_clipped(&out, &used, current[0..first]);
        append_clipped(&out, &used, replacement);
        append_clipped(&out, &used, current[last..]);
        @memcpy(self.text[0..used], out[0..used]);
        self.length = used;
        self.caret = change.caret;
        self.dirty = true;
    }

    /// PreeditCaret: only the cursor moved.
    pub fn move_caret(self: *Preedit, position: c_int) void {
        self.caret = position;
        self.dirty = true;
    }

    /// Returns the composition if a callback changed it since the last call.
    pub fn take(self: *Preedit) ?Snapshot {
        if (!self.dirty) return null;
        self.dirty = false;
        return .{ .text = self.text[0..self.length], .caret = self.caret };
    }
};

/// Byte offset of character `index` in UTF-8 `text`; the length when past the end.
fn char_offset(text: []const u8, index: c_int) usize {
    if (index <= 0) return 0;
    var seen: c_int = 0;
    for (text, 0..) |byte, offset| {
        if (byte & 0xC0 == 0x80) continue;
        if (seen == index) return offset;
        seen += 1;
    }
    return text.len;
}

/// Appends as much of `piece` as fits, never ending inside a UTF-8 sequence.
fn append_clipped(out: []u8, used: *usize, piece: []const u8) void {
    const room = out.len - used.*;
    var take_len = @min(room, piece.len);
    if (take_len < piece.len) {
        while (take_len > 0 and piece[take_len] & 0xC0 == 0x80) take_len -= 1;
    }
    @memcpy(out[used.*..][0..take_len], piece[0..take_len]);
    used.* += take_len;
}

/// Callbacks handed to the input method. Each one takes the Preedit as client data.
fn preedit_start(context: ?*XIC, client_data: ?*anyopaque, call_data: ?*anyopaque) callconv(.c) c_int {
    _ = context;
    _ = call_data;
    const preedit: *Preedit = @ptrCast(@alignCast(client_data orelse return -1));
    return preedit.start();
}

fn preedit_done(context: ?*XIC, client_data: ?*anyopaque, call_data: ?*anyopaque) callconv(.c) void {
    _ = context;
    _ = call_data;
    const preedit: *Preedit = @ptrCast(@alignCast(client_data orelse return));
    preedit.done();
}

fn preedit_draw(context: ?*XIC, client_data: ?*anyopaque, call_data: ?*anyopaque) callconv(.c) void {
    _ = context;
    const preedit: *Preedit = @ptrCast(@alignCast(client_data orelse return));
    const change: *const XIMPreeditDrawCallbackStruct = @ptrCast(@alignCast(call_data orelse return));
    preedit.draw(change.*);
}

fn preedit_caret(context: ?*XIC, client_data: ?*anyopaque, call_data: ?*anyopaque) callconv(.c) void {
    _ = context;
    const preedit: *Preedit = @ptrCast(@alignCast(client_data orelse return));
    const change: *const XIMPreeditCaretCallbackStruct = @ptrCast(@alignCast(call_data orelse return));
    preedit.move_caret(change.position);
}

/// The four preedit callbacks for one context, ready for XVaCreateNestedList.
pub const PreeditCallbacks = struct {
    start: XIMCallback,
    done: XIMCallback,
    draw: XIMCallback,
    caret: XIMCallback,

    /// Callbacks whose client data is `preedit`, which must outlive the context.
    pub fn for_preedit(preedit: *Preedit) PreeditCallbacks {
        const data: ?*anyopaque = preedit;
        return .{
            .start = .{ .client_data = data, .callback = @ptrCast(&preedit_start) },
            .done = .{ .client_data = data, .callback = @ptrCast(&preedit_done) },
            .draw = .{ .client_data = data, .callback = @ptrCast(&preedit_draw) },
            .caret = .{ .client_data = data, .callback = @ptrCast(&preedit_caret) },
        };
    }
};

pub const Colormap = c_ulong;
pub const Font = c_ulong;
pub const FontSet = opaque {};

/// XWindowAttributes (Xutil.h), 136 bytes LP64. `map_state` is at offset 92.
pub const XWindowAttributes = extern struct {
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    depth: c_int,
    visual: ?*Visual,
    root: Window,
    class: c_int,
    bit_gravity: c_int,
    win_gravity: c_int,
    backing_store: c_int,
    backing_planes: c_ulong,
    backing_pixel: c_ulong,
    save_under: Bool,
    colormap: Colormap,
    map_installed: Bool,
    map_state: c_int,
    all_event_masks: c_long,
    your_event_mask: c_long,
    do_not_propagate_mask: c_long,
    override_redirect: Bool,
    screen: ?*anyopaque,
};

pub const map_state_unmapped: c_int = 0;
pub const map_state_viewable: c_int = 2;

/// XWMHints (Xutil.h). Only `flags` and the urgency bit are used by this backend.
pub const XWMHints = extern struct {
    flags: c_long,
    input: Bool,
    initial_state: c_int,
    icon_pixmap: Pixmap,
    icon_window: Window,
    icon_x: c_int,
    icon_y: c_int,
    icon_mask: Pixmap,
    window_group: c_ulong,
};
pub const urgency_hint: c_long = 1 << 8;

pub const grab_success: c_int = 0;
pub const grab_mode_async: c_int = 1;

/// XCharStruct (Xutil.h): per-character metrics; `width` is the advance.
pub const XCharStruct = extern struct {
    lbearing: c_short,
    rbearing: c_short,
    width: c_short,
    ascent: c_short,
    descent: c_short,
    attributes: c_ushort,
};

/// Leading part of XFontStruct (Xlib.h). Only `fid` is read; the layout is
/// complete so the size matches Xlib's (96 bytes LP64).
pub const XFontStruct = extern struct {
    ext_data: ?*anyopaque,
    fid: Font,
    direction: c_uint,
    min_char_or_byte2: c_uint,
    max_char_or_byte2: c_uint,
    min_byte1: c_uint,
    max_byte1: c_uint,
    all_chars_exist: Bool,
    default_char: c_uint,
    n_properties: c_int,
    properties: ?*anyopaque,
    min_bounds: XCharStruct,
    max_bounds: XCharStruct,
    per_char: ?*anyopaque,
    ascent: c_int,
    descent: c_int,
};

/// XRectangle (X.h): 16-bit origin and extent.
pub const XRectangle = extern struct { x: c_short, y: c_short, width: c_ushort, height: c_ushort };

/// XFontSetExtents (Xlib.h): the largest ink and logical extents of a font set.
pub const FontSetExtents = extern struct {
    max_ink_extent: XRectangle,
    max_logical_extent: XRectangle,
};

/// XGenericEventCookie (XGenericEvent.h). Read `data` only after XGetEventData.
/// The cookie carries the XI2 extension opcode (`extension`) and event type.
pub const GenericEventCookie = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    cookie: c_uint,
    data: ?*anyopaque,
};

/// DoRed, DoGreen and DoBlue (X.h): which XColor channels an allocation sets.
pub const visual_true_color: c_int = 4;
pub const visual_direct_color: c_int = 5;
pub const color_do_red: u8 = 1 << 0;
pub const color_do_green: u8 = 1 << 1;
pub const color_do_blue: u8 = 1 << 2;

/// XIButtonState and XIValuatorState: a bit mask over button/valuator numbers
/// plus, for valuators, one value per set bit in ascending bit order.
pub const XIButtonState = extern struct { mask_len: c_int, mask: ?[*]u8 };
pub const XIValuatorState = extern struct { mask_len: c_int, mask: ?[*]u8, values: ?[*]f64 };
pub const XIModifierState = extern struct { base: c_int, latched: c_int, locked: c_int, effective: c_int };
/// XInput2.h: `typedef XIModifierState XIGroupState;`, four native ints.
pub const XIGroupState = XIModifierState;

/// XIDeviceEvent (XI2.h): key, button, motion and touch events. Offsets: extension
/// 32, evtype 36, time 40, deviceid 48, sourceid 52, detail 56, root 64, event 72,
/// child 80, coordinates as doubles 88-120, flags 120, buttons 128, valuators 144,
/// modifiers 168, group 184 (200 bytes total). A touch event carries its touch
/// id in `detail`.
pub const XIDeviceEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    deviceid: c_int,
    sourceid: c_int,
    detail: c_int,
    root: Window,
    event: Window,
    child: Window,
    root_x: f64,
    root_y: f64,
    event_x: f64,
    event_y: f64,
    flags: c_int,
    buttons: XIButtonState,
    valuators: XIValuatorState,
    mods: XIModifierState,
    group: XIGroupState,
};

/// XIRawEvent (XI2.h): unaccelerated valuator data. `raw_values` holds one
/// double per set bit of `valuators.mask`.
pub const XIRawEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    deviceid: c_int,
    sourceid: c_int,
    detail: c_int,
    flags: c_int,
    valuators: XIValuatorState,
    raw_values: ?[*]f64,
};

/// XIHierarchyInfo and XIHierarchyEvent (XI2.h): devices added, removed, enabled
/// or disabled. `info` points at `num_info` records.
pub const XIHierarchyInfo = extern struct {
    deviceid: c_int,
    attachment: c_int,
    use: c_int,
    enabled: Bool,
    flags: c_int,
};
pub const XIHierarchyEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    flags: c_int,
    num_info: c_int,
    info: ?[*]const XIHierarchyInfo,
};

/// XIPropertyEvent (XI2.h): a device property was created, modified or deleted.
pub const XIPropertyEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    deviceid: c_int,
    property: Atom,
    what: c_int,
};

/// Leading part of XIDeviceChangedEvent: the device whose classes changed.
pub const XIDeviceChangedEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    deviceid: c_int,
    sourceid: c_int,
};

/// XIGesturePinchEvent (XI2.h, protocol 2.4). `scale` is relative to the start of
/// the gesture; deltas are in pixels. Field order follows the header: the deltas,
/// scale and angle come before flags and modifiers. LP64 offsets: scale 152,
/// delta_angle 160, flags 168, mods 172, group 188; size 208.
pub const XIGesturePinchEvent = extern struct {
    kind: c_int,
    serial: c_ulong,
    send_event: Bool,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    time: Time,
    deviceid: c_int,
    sourceid: c_int,
    detail: c_int,
    root: Window,
    event: Window,
    child: Window,
    root_x: f64,
    root_y: f64,
    event_x: f64,
    event_y: f64,
    delta_x: f64,
    delta_y: f64,
    delta_unaccel_x: f64,
    delta_unaccel_y: f64,
    scale: f64,
    delta_angle: f64,
    flags: c_int,
    mods: XIModifierState,
    group: XIGroupState,
};

/// XIGrabModifiers: one modifier combination of a passive grab and its result.
pub const XIGrabModifiers = extern struct { modifiers: c_int, status: c_int };

/// XIButtonClassInfo (XI2.h): how many buttons a device reports.
pub const XIButtonClassInfo = extern struct {
    type: c_int,
    sourceid: c_int,
    num_buttons: c_int,
    labels: ?*anyopaque,
    state: XIButtonState,
};

/// XIEventMask (XI2.h): `mask_len` bytes of event-type bits for one device.
pub const XIEventMask = extern struct { deviceid: c_int, mask_len: c_int, mask: [*]u8 };

/// XIAnyClassInfo header shared by every device class record.
pub const XIAnyClassInfo = extern struct { type: c_int, sourceid: c_int };

/// XIValuatorClassInfo (XI2.h): one axis of a device, with its label atom.
pub const XIValuatorClassInfo = extern struct {
    type: c_int,
    sourceid: c_int,
    number: c_int,
    label: Atom,
    min: f64,
    max: f64,
    value: f64,
    resolution: c_int,
    mode: c_int,
};

/// XIScrollClassInfo (XI2.h): a scroll valuator. `increment` is the valuator
/// change that corresponds to one scroll step.
pub const XIScrollClassInfo = extern struct {
    type: c_int,
    sourceid: c_int,
    number: c_int,
    scroll_type: c_int,
    increment: f64,
    flags: c_int,
};

/// XIDeviceInfo (XI2.h): one input device with its class list.
pub const XIDeviceInfo = extern struct {
    deviceid: c_int,
    name: ?[*:0]u8,
    use: c_int,
    attachment: c_int,
    enabled: Bool,
    num_classes: c_int,
    classes: ?[*]?*XIAnyClassInfo,
};

pub const xi_class_button: c_int = 1;
pub const xi_class_valuator: c_int = 2;
pub const xi_all_devices: c_int = 0;
pub const xi_slave_pointer: c_int = 3;
pub const xi_floating_slave: c_int = 5;
pub const xi_device_changed: c_int = 1;
pub const xi_button_press: c_int = 4;
pub const xi_button_release: c_int = 5;
pub const xi_hierarchy_changed: c_int = 11;
pub const xi_property_event: c_int = 12;
pub const xi_gesture_pinch_begin: c_int = 27;
pub const xi_gesture_pinch_update: c_int = 28;
pub const xi_gesture_pinch_end: c_int = 29;
/// XIHierarchyInfo flags.
pub const xi_slave_added: c_int = 1 << 2;
pub const xi_slave_removed: c_int = 1 << 3;
pub const xi_device_enabled: c_int = 1 << 6;
pub const xi_device_disabled: c_int = 1 << 7;
/// XIPropertyEvent.what: the property's value changed.
pub const xi_property_modified: c_int = 2;
/// XIGestureEnd flag: the gesture was cancelled instead of completed.
pub const xi_gesture_cancelled: c_int = 1 << 0;
/// XIAnyModifier for passive grabs.
pub const xi_any_modifier: c_int = @bitCast(@as(c_uint, 1) << 31);
pub const xi_class_scroll: c_int = 3;
pub const xi_scroll_type_vertical: c_int = 1;
pub const xi_scroll_type_horizontal: c_int = 2;
pub const xi_all_master_devices: c_int = 1;
pub const xi_pointer_emulated: c_int = 1 << 16;
pub const xi_motion: c_int = 6;
pub const xi_raw_motion: c_int = 17;
pub const xi_touch_begin: c_int = 18;
pub const xi_touch_update: c_int = 19;
pub const xi_touch_end: c_int = 20;

pub const xim_preedit_nothing: c_ulong = 0x0008;
pub const xim_status_nothing: c_ulong = 0x0400;
/// XIMPreeditCallbacks (Xlib.h): the input method reports composition through callbacks.
pub const xim_preedit_callbacks: c_ulong = 0x0002;
pub const xn_input_style = "inputStyle";
pub const xn_client_window = "clientWindow";
pub const xn_focus_window = "focusWindow";
pub const xn_preedit_attributes = "preeditAttributes";
pub const xn_preedit_start_callback = "preeditStartCallback";
pub const xn_preedit_done_callback = "preeditDoneCallback";
pub const xn_preedit_draw_callback = "preeditDrawCallback";
pub const xn_preedit_caret_callback = "preeditCaretCallback";
pub const xn_spot_location = "spotLocation";
pub const lookup_chars: c_int = 2;
pub const lookup_keysym: c_int = 3;
pub const lookup_both: c_int = 4;

/// Shared-memory segment descriptor for MIT-SHM (XShm.h), LP64 layout.
pub const XShmSegmentInfo = extern struct {
    shmseg: c_ulong,
    shmid: c_int,
    shmaddr: ?*anyopaque,
    read_only: Bool,
};

pub const RROutput = c_ulong;
pub const RRCrtc = c_ulong;
pub const RRMode = c_ulong;
pub const Rotation = u16;
pub const rr_notify_base_offset: c_int = 1;
pub const rr_screen_change_notify_mask: c_int = 1 << 0;
pub const rr_output_change_notify_mask: c_int = 1 << 1;
pub const rr_crtc_change_notify_mask: c_int = 1 << 2;
pub const rr_screen_change_notify: c_int = 0;
pub const rr_connected: u16 = 0;

/// XRRScreenResources (Xrandr.h): timestamps, CRTC, output and mode lists.
pub const XRRScreenResources = extern struct {
    timestamp: c_ulong,
    config_timestamp: c_ulong,
    ncrtc: c_int,
    crtcs: ?[*]RRCrtc,
    noutput: c_int,
    outputs: ?[*]RROutput,
    nmode: c_int,
    modes: ?[*]XRRModeInfo,
};

/// XRRModeInfo: id 0, width 8, height 12, dot clock 16, sync/total fields
/// 24-52, name pointer 56, name length 64, mode flags 72 (80 bytes total).
pub const XRRModeInfo = extern struct {
    id: RRMode,
    width: c_uint,
    height: c_uint,
    dot_clock: c_ulong,
    h_sync_start: c_uint,
    h_sync_end: c_uint,
    h_total: c_uint,
    h_skew: c_uint,
    v_sync_start: c_uint,
    v_sync_end: c_uint,
    v_total: c_uint,
    name: ?[*]u8,
    name_length: c_uint,
    mode_flags: c_ulong,
};

/// XRROutputInfo: crtc 8, name 16, connection 48, CRTC list 56, mode list 88.
pub const XRROutputInfo = extern struct {
    timestamp: c_ulong,
    crtc: RRCrtc,
    name: ?[*]u8,
    name_len: c_int,
    mm_width: c_ulong,
    mm_height: c_ulong,
    connection: u16,
    subpixel_order: u16,
    ncrtc: c_int,
    crtcs: ?[*]RRCrtc,
    nclone: c_int,
    clones: ?[*]RROutput,
    nmode: c_int,
    npreferred: c_int,
    modes: ?[*]RRMode,
};

/// XRRCrtcInfo: position 8-12, size 16-20, mode 24, rotation 32, outputs 40,
/// possible outputs 56.
pub const XRRCrtcInfo = extern struct {
    timestamp: c_ulong,
    x: c_int,
    y: c_int,
    width: c_uint,
    height: c_uint,
    mode: RRMode,
    rotation: Rotation,
    noutput: c_int,
    outputs: ?[*]RROutput,
    rotations: Rotation,
    npossible: c_int,
    possible: ?[*]RROutput,
};

/// The libX11 entry points, loaded by name. Field names match the exported
/// symbols, so the loader finds each with @field. A missing symbol fails Library.open.
pub const Functions = struct {
    XOpenDisplay: *const fn (?[*:0]const u8) callconv(.c) ?*Display,
    XCloseDisplay: *const fn (*Display) callconv(.c) c_int,
    XDefaultScreen: *const fn (*Display) callconv(.c) c_int,
    XDisplayWidth: *const fn (*Display, c_int) callconv(.c) c_int,
    XDisplayHeight: *const fn (*Display, c_int) callconv(.c) c_int,
    XRootWindow: *const fn (*Display, c_int) callconv(.c) Window,
    XDefaultVisual: *const fn (*Display, c_int) callconv(.c) *Visual,
    XDefaultDepth: *const fn (*Display, c_int) callconv(.c) c_int,
    XConnectionNumber: *const fn (*Display) callconv(.c) c_int,
    XFlush: *const fn (*Display) callconv(.c) c_int,
    XSync: *const fn (*Display, Bool) callconv(.c) c_int,
    XPending: *const fn (*Display) callconv(.c) c_int,
    XNextEvent: *const fn (*Display, *Event) callconv(.c) c_int,
    XPeekEvent: *const fn (*Display, *Event) callconv(.c) c_int,
    XSendEvent: *const fn (*Display, Window, Bool, c_long, *Event) callconv(.c) Status,
    XSetErrorHandler: *const fn (?ErrorHandler) callconv(.c) ?ErrorHandler,
    XGetErrorText: *const fn (*Display, c_int, [*]u8, c_int) callconv(.c) c_int,
    XRefreshKeyboardMapping: *const fn (*MappingEvent) callconv(.c) c_int,
    XLookupKeysym: *const fn (*KeyEvent, c_int) callconv(.c) KeySym,
    XCreateSimpleWindow: *const fn (*Display, Window, c_int, c_int, c_uint, c_uint, c_uint, c_ulong, c_ulong) callconv(.c) Window,
    XDestroyWindow: *const fn (*Display, Window) callconv(.c) c_int,
    XMapWindow: *const fn (*Display, Window) callconv(.c) c_int,
    XUnmapWindow: *const fn (*Display, Window) callconv(.c) c_int,
    XRaiseWindow: *const fn (*Display, Window) callconv(.c) c_int,
    XIconifyWindow: *const fn (*Display, Window, c_int) callconv(.c) Status,
    XResizeWindow: *const fn (*Display, Window, c_uint, c_uint) callconv(.c) c_int,
    XMoveWindow: *const fn (*Display, Window, c_int, c_int) callconv(.c) c_int,
    XSelectInput: *const fn (*Display, Window, c_long) callconv(.c) c_int,
    XSetWMNormalHints: *const fn (*Display, Window, *XSizeHints) callconv(.c) void,
    XSetClassHint: *const fn (*Display, Window, *XClassHint) callconv(.c) c_int,
    XSetWMProtocols: *const fn (*Display, Window, [*]Atom, c_int) callconv(.c) Status,
    XSetInputFocus: *const fn (*Display, Window, c_int, Time) callconv(.c) c_int,
    XInternAtom: *const fn (*Display, [*:0]const u8, Bool) callconv(.c) Atom,
    XGetAtomName: *const fn (*Display, Atom) callconv(.c) ?[*:0]u8,
    XChangeProperty: *const fn (*Display, Window, Atom, Atom, c_int, c_int, [*]const u8, c_int) callconv(.c) c_int,
    XDeleteProperty: *const fn (*Display, Window, Atom) callconv(.c) c_int,
    XGetWindowProperty: *const fn (*Display, Window, Atom, c_long, c_long, Bool, Atom, *Atom, *c_int, *c_ulong, *c_ulong, *?[*]u8) callconv(.c) c_int,
    XSetSelectionOwner: *const fn (*Display, Atom, Window, Time) callconv(.c) c_int,
    XGetSelectionOwner: *const fn (*Display, Atom) callconv(.c) Window,
    XConvertSelection: *const fn (*Display, Atom, Atom, Atom, Window, Time) callconv(.c) c_int,
    XQueryPointer: *const fn (*Display, Window, *Window, *Window, *c_int, *c_int, *c_int, *c_int, *c_uint) callconv(.c) Bool,
    XQueryKeymap: *const fn (*Display, *[32]u8) callconv(.c) c_int,
    XDisplayKeycodes: *const fn (*Display, *c_int, *c_int) callconv(.c) c_int,
    XGetKeyboardMapping: *const fn (*Display, KeyCode, c_int, *c_int) callconv(.c) ?[*]KeySym,
    XKeysymToKeycode: *const fn (*Display, KeySym) callconv(.c) KeyCode,
    XGetModifierMapping: *const fn (*Display) callconv(.c) ?*XModifierKeymap,
    XFreeModifiermap: *const fn (*XModifierKeymap) callconv(.c) c_int,
    XCreateGC: *const fn (*Display, Drawable, c_ulong, ?*XGCValues) callconv(.c) ?*Gc,
    XFreeGC: *const fn (*Display, *Gc) callconv(.c) c_int,
    XCreateImage: *const fn (*Display, *Visual, c_uint, c_int, c_int, ?[*]u8, c_uint, c_uint, c_int, c_int) callconv(.c) ?*Image,
    XPutImage: *const fn (*Display, Drawable, *Gc, *Image, c_int, c_int, c_int, c_int, c_uint, c_uint) callconv(.c) c_int,
    XCreatePixmap: *const fn (*Display, Drawable, c_uint, c_uint, c_uint) callconv(.c) Pixmap,
    XFreePixmap: *const fn (*Display, Pixmap) callconv(.c) c_int,
    XCreateBitmapFromData: *const fn (*Display, Drawable, [*]const u8, c_uint, c_uint) callconv(.c) Pixmap,
    XCreatePixmapCursor: *const fn (*Display, Pixmap, Pixmap, *XColor, *XColor, c_uint, c_uint) callconv(.c) Cursor,
    XCreateFontCursor: *const fn (*Display, c_uint) callconv(.c) Cursor,
    XFreeCursor: *const fn (*Display, Cursor) callconv(.c) c_int,
    XDefineCursor: *const fn (*Display, Window, Cursor) callconv(.c) c_int,
    XChangeWindowAttributes: *const fn (*Display, Window, c_ulong, *XSetWindowAttributes) callconv(.c) c_int,
    XFree: *const fn (?*anyopaque) callconv(.c) c_int,
    // XKB (XKBlib.h). Group state and per-group keysyms come from here.
    XkbQueryExtension: *const fn (*Display, *c_int, *c_int, *c_int, *c_int, *c_int) callconv(.c) Bool,
    XkbSelectEvents: *const fn (*Display, c_uint, c_ulong, c_ulong) callconv(.c) Bool,
    XkbGetKeyboard: *const fn (*Display, c_uint, c_uint) callconv(.c) ?*XkbDesc,
    XkbFreeKeyboard: *const fn (*XkbDesc, c_uint, Bool) callconv(.c) void,
    XkbKeycodeToKeysym: *const fn (*Display, KeyCode, c_int, c_int) callconv(.c) KeySym,
    XkbGetNames: *const fn (*Display, c_uint, *XkbDesc) callconv(.c) Status,
    XkbGetUpdatedMap: *const fn (*Display, c_uint, *XkbDesc) callconv(.c) Status,
    XkbGetState: *const fn (*Display, c_uint, *[32]u8) callconv(.c) Status,
    // Input methods (Xlib.h, Xutil.h). XCreateIC, XSetICValues and
    // XVaCreateNestedList are C variadic; their argument lists are passed as
    // (name, value) pairs ending in a null pointer.
    XSetLocaleModifiers: *const fn ([*:0]const u8) callconv(.c) ?[*:0]u8,
    XOpenIM: *const fn (*Display, ?*anyopaque, ?[*:0]u8, ?[*:0]u8) callconv(.c) ?*XIM,
    XCloseIM: *const fn (*XIM) callconv(.c) Status,
    XCreateIC: *const fn (*XIM, ...) callconv(.c) ?*XIC,
    XDestroyIC: *const fn (*XIC) callconv(.c) void,
    XSetICValues: *const fn (*XIC, ...) callconv(.c) ?[*:0]u8,
    XSetICFocus: *const fn (*XIC) callconv(.c) void,
    XUnsetICFocus: *const fn (*XIC) callconv(.c) void,
    XVaCreateNestedList: *const fn (c_int, ...) callconv(.c) XVaNestedList,
    XFilterEvent: *const fn (*Event, Window) callconv(.c) Bool,
    Xutf8LookupString: *const fn (*XIC, *KeyEvent, [*]u8, c_int, ?*KeySym, ?*Status) callconv(.c) c_int,
    // Extensions to the core protocol used by window state, grabs and XInput2.
    XQueryExtension: *const fn (*Display, [*:0]const u8, *c_int, *c_int, *c_int) callconv(.c) Bool,
    XGetEventData: *const fn (*Display, *GenericEventCookie) callconv(.c) Bool,
    XFreeEventData: *const fn (*Display, *GenericEventCookie) callconv(.c) void,
    XTranslateCoordinates: *const fn (*Display, Window, Window, c_int, c_int, *c_int, *c_int, *Window) callconv(.c) Bool,
    XWarpPointer: *const fn (*Display, Window, Window, c_int, c_int, c_uint, c_uint, c_int, c_int) callconv(.c) c_int,
    XGrabPointer: *const fn (*Display, Window, Bool, c_uint, c_int, c_int, Window, Cursor, Time) callconv(.c) c_int,
    XUngrabPointer: *const fn (*Display, Time) callconv(.c) c_int,
    XGrabKeyboard: *const fn (*Display, Window, Bool, c_int, c_int, Time) callconv(.c) c_int,
    XUngrabKeyboard: *const fn (*Display, Time) callconv(.c) c_int,
    XGetWindowAttributes: *const fn (*Display, Window, *XWindowAttributes) callconv(.c) Status,
    XGetWMHints: *const fn (*Display, Window) callconv(.c) ?*XWMHints,
    XSetWMHints: *const fn (*Display, Window, *XWMHints) callconv(.c) c_int,
    XSetTransientForHint: *const fn (*Display, Window, Window) callconv(.c) c_int,
    XMapRaised: *const fn (*Display, Window) callconv(.c) c_int,
    // Drawing with core fonts and colors (message boxes).
    XDefaultColormap: *const fn (*Display, c_int) callconv(.c) Colormap,
    XFreeColors: *const fn (*Display, Colormap, [*]c_ulong, c_int, c_ulong) callconv(.c) c_int,
    XAllocColor: *const fn (*Display, Colormap, *XColor) callconv(.c) Status,
    XLoadQueryFont: *const fn (*Display, [*:0]const u8) callconv(.c) ?*XFontStruct,
    XFreeFont: *const fn (*Display, *XFontStruct) callconv(.c) c_int,
    XTextExtents: *const fn (*XFontStruct, [*]const u8, c_int, *c_int, *c_int, *c_int, *XCharStruct) callconv(.c) c_int,
    XSetFont: *const fn (*Display, *Gc, Font) callconv(.c) c_int,
    XSetForeground: *const fn (*Display, *Gc, c_ulong) callconv(.c) c_int,
    XFillRectangle: *const fn (*Display, Drawable, *Gc, c_int, c_int, c_uint, c_uint) callconv(.c) c_int,
    XDrawRectangle: *const fn (*Display, Drawable, *Gc, c_int, c_int, c_uint, c_uint) callconv(.c) c_int,
    XDrawLine: *const fn (*Display, Drawable, *Gc, c_int, c_int, c_int, c_int) callconv(.c) c_int,
    XFillArc: *const fn (*Display, Drawable, *Gc, c_int, c_int, c_uint, c_uint, c_int, c_int) callconv(.c) c_int,
    XDrawString: *const fn (*Display, Drawable, *Gc, c_int, c_int, [*]const u8, c_int) callconv(.c) c_int,
    XCreateFontSet: *const fn (*Display, [*:0]const u8, *?[*]?[*:0]u8, *c_int, *?[*:0]u8) callconv(.c) ?*FontSet,
    XFreeFontSet: *const fn (*Display, *FontSet) callconv(.c) void,
    XFreeStringList: *const fn ([*]?[*:0]u8) callconv(.c) void,
    XExtentsOfFontSet: *const fn (*FontSet) callconv(.c) ?*const FontSetExtents,
    Xutf8DrawString: *const fn (*Display, Drawable, *FontSet, *Gc, c_int, c_int, [*]const u8, c_int) callconv(.c) void,
    Xutf8TextEscapement: *const fn (*FontSet, [*]const u8, c_int) callconv(.c) c_int,
    Xutf8TextExtents: *const fn (*FontSet, [*]const u8, c_int, *XRectangle, *XRectangle) callconv(.c) c_int,
};

/// MIT-SHM entry points (libXext.so.6). Optional: absent libraries disable
/// shared-memory presentation without failing Library.open.
pub const Xext = struct {
    XShmQueryExtension: *const fn (*Display) callconv(.c) Bool,
    XShmGetEventBase: *const fn (*Display) callconv(.c) c_int,
    XShmCreateImage: *const fn (*Display, *Visual, c_uint, c_int, ?*anyopaque, *XShmSegmentInfo, c_uint, c_uint) callconv(.c) ?*Image,
    XShmAttach: *const fn (*Display, *XShmSegmentInfo) callconv(.c) Status,
    XShmDetach: *const fn (*Display, *XShmSegmentInfo) callconv(.c) Status,
    XShmPutImage: *const fn (*Display, Drawable, *Gc, *Image, c_int, c_int, c_int, c_int, c_uint, c_uint, Bool) callconv(.c) Status,
};

/// XShape entry points (libXext.so.6, XShape.h). Optional, like Xext: without
/// them `Window.set_shape` reports ShapeUnavailable.
pub const Xshape = struct {
    XShapeQueryExtension: *const fn (*Display, *c_int, *c_int) callconv(.c) Bool,
    XShapeCombineMask: *const fn (*Display, Window, c_int, c_int, c_int, Pixmap, c_int) callconv(.c) void,
};
/// Shape kinds and operations (XShape.h). Input shapes are what SDL applies.
pub const shape_bounding: c_int = 0;
pub const shape_input: c_int = 2;
pub const shape_set: c_int = 0;

/// RandR entry points (libXrandr.so.2). Optional, like Xext.
pub const Xrandr = struct {
    XRRQueryExtension: *const fn (*Display, *c_int, *c_int) callconv(.c) Bool,
    XRRQueryVersion: *const fn (*Display, *c_int, *c_int) callconv(.c) Status,
    XRRSelectInput: *const fn (*Display, Window, c_int) callconv(.c) void,
    XRRGetScreenResourcesCurrent: *const fn (*Display, Window) callconv(.c) ?*XRRScreenResources,
    XRRFreeScreenResources: *const fn (*XRRScreenResources) callconv(.c) void,
    XRRGetOutputInfo: *const fn (*Display, *XRRScreenResources, RROutput) callconv(.c) ?*XRROutputInfo,
    XRRFreeOutputInfo: *const fn (*XRROutputInfo) callconv(.c) void,
    XRRGetCrtcInfo: *const fn (*Display, *XRRScreenResources, RRCrtc) callconv(.c) ?*XRRCrtcInfo,
    XRRFreeCrtcInfo: *const fn (*XRRCrtcInfo) callconv(.c) void,
    XRRGetOutputPrimary: *const fn (*Display, Window) callconv(.c) RROutput,
    XRRSetCrtcConfig: *const fn (*Display, *XRRScreenResources, RRCrtc, c_ulong, c_int, c_int, RRMode, Rotation, [*]const RROutput, c_int) callconv(.c) Status,
    XRRSetScreenSize: *const fn (*Display, Window, c_int, c_int, c_int, c_int) callconv(.c) void,
};

/// XInput2 entry points (libXi.so.6). Optional: without libXi the XInput2
/// features report XInputUnavailable and everything else keeps working.
pub const Xi = struct {
    XIQueryVersion: *const fn (*Display, *c_int, *c_int) callconv(.c) Status,
    XISelectEvents: *const fn (*Display, Window, [*]XIEventMask, c_int) callconv(.c) Status,
    XIQueryDevice: *const fn (*Display, c_int, *c_int) callconv(.c) ?[*]XIDeviceInfo,
    XIFreeDeviceInfo: *const fn ([*]XIDeviceInfo) callconv(.c) void,
    XIGetProperty: *const fn (*Display, c_int, Atom, c_long, c_long, Bool, Atom, *Atom, *c_int, *c_ulong, *c_ulong, *?[*]u8) callconv(.c) Status,
    XIGrabTouchBegin: *const fn (*Display, c_int, Window, Bool, *XIEventMask, c_int, [*]XIGrabModifiers) callconv(.c) c_int,
    XIUngrabTouchBegin: *const fn (*Display, c_int, Window, c_int, [*]XIGrabModifiers) callconv(.c) c_int,
};

/// Themed cursor loading (libXcursor.so.1). Optional, like Xi.
pub const Xcursor = struct {
    XcursorLibraryLoadCursor: *const fn (*Display, [*:0]const u8) callconv(.c) Cursor,
};

/// Process-wide error slots (see module comment). Xlib calls the handler on the
/// thread that issued the failing request; the lock only guards concurrent
/// connections on different threads.
const ErrorSlot = struct {
    display: ?*Display = null,
    pending: ?ErrorEvent = null,
};
var error_slots: [16]ErrorSlot = @splat(.{});
var error_lock: std.atomic.Value(bool) = .init(false);
var previous_error_handler: ?ErrorHandler = null;
var error_handler_refs: usize = 0;

fn lock_errors() void {
    while (error_lock.cmpxchgWeak(false, true, .acquire, .monotonic) != null) std.atomic.spinLoopHint();
}

fn unlock_errors() void {
    error_lock.store(false, .release);
}

/// The Xlib error handler. Records the error for the display and returns, so
/// Xlib continues instead of terminating the process.
fn record_error(display: ?*Display, event: *ErrorEvent) callconv(.c) c_int {
    lock_errors();
    defer unlock_errors();
    for (&error_slots) |*slot| {
        if (slot.display == display) {
            slot.pending = event.*;
            break;
        }
    }
    return 0;
}

/// Registers a display with the error table and installs the handler when the
/// first display registers. Returns false when the table is full.
pub fn register_display(api: *const Functions, display: *Display) bool {
    lock_errors();
    defer unlock_errors();
    for (&error_slots) |*slot| {
        if (slot.display == null) {
            slot.* = .{ .display = display };
            break;
        } else continue;
    } else return false;
    if (error_handler_refs == 0) previous_error_handler = api.XSetErrorHandler(record_error);
    error_handler_refs += 1;
    return true;
}

/// Removes a display from the table and restores Xlib's handler when none remain.
pub fn unregister_display(api: *const Functions, display: *Display) void {
    lock_errors();
    defer unlock_errors();
    for (&error_slots) |*slot| {
        if (slot.display == display) {
            slot.* = .{};
            error_handler_refs -= 1;
            break;
        }
    }
    if (error_handler_refs == 0) _ = api.XSetErrorHandler(previous_error_handler);
}

/// Returns and clears the pending error recorded for `display`, if any.
pub fn take_error(display: *Display) ?ErrorEvent {
    lock_errors();
    defer unlock_errors();
    for (&error_slots) |*slot| {
        if (slot.display == display) {
            const pending = slot.pending;
            slot.pending = null;
            return pending;
        }
    }
    return null;
}

/// Owns the dynamically loaded libX11 handle and its resolved function table,
/// plus the optional libXext and libXrandr tables when present. Connections
/// borrow `functions` through their Library pointer, so a Library must not move
/// while connections exist. The allocator serves every keymap, clipboard
/// buffer and input-method table created on connections opened from this library.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,
    allocator: std.mem.Allocator,
    xext_handle: ?std.DynLib = null,
    xext: ?Xext = null,
    xrandr_handle: ?std.DynLib = null,
    xi_handle: ?std.DynLib = null,
    xi: ?Xi = null,
    xcursor_handle: ?std.DynLib = null,
    xcursor: ?Xcursor = null,
    xrandr: ?Xrandr = null,
    xshape_handle: ?std.DynLib = null,
    xshape: ?Xshape = null,

    /// Loads libX11.so.6 and resolves every entry in Functions, then tries
    /// libXext.so.6 and libXrandr.so.2. Requires the application to link libc,
    /// since the system dynamic loader is used.
    pub fn open(allocator: std.mem.Allocator) error{ MissingSymbol, LibraryUnavailable }!Library {
        if (builtin.target.os.tag != .linux) @compileError("this X11 backend targets Linux");
        if (!builtin.link_libc) @compileError("X11 loading requires application root_module.link_libc = true");
        var handle = std.DynLib.open("libX11.so.6") catch return error.LibraryUnavailable;
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |name, FieldType| {
            @field(functions, name) = handle.lookup(FieldType, name) orelse return error.MissingSymbol;
        }
        var result: Library = .{ .handle = handle, .functions = functions, .allocator = allocator };
        if (std.DynLib.open("libXext.so.6")) |extension_handle| {
            var mutable = extension_handle;
            if (load_table(Xext, &mutable)) |table| {
                result.xext = table;
                result.xext_handle = mutable;
            } else mutable.close();
        } else |_| {}
        if (std.DynLib.open("libXrandr.so.2")) |randr_handle| {
            var mutable = randr_handle;
            if (load_table(Xrandr, &mutable)) |table| {
                result.xrandr = table;
                result.xrandr_handle = mutable;
            } else mutable.close();
        } else |_| {}
        if (std.DynLib.open("libXi.so.6")) |input_handle| {
            var mutable = input_handle;
            if (load_table(Xi, &mutable)) |table| {
                result.xi = table;
                result.xi_handle = mutable;
            } else mutable.close();
        } else |_| {}
        if (std.DynLib.open("libXext.so.6")) |shape_handle| {
            var mutable = shape_handle;
            if (load_table(Xshape, &mutable)) |table| {
                result.xshape = table;
                result.xshape_handle = mutable;
            } else mutable.close();
        } else |_| {}
        if (std.DynLib.open("libXcursor.so.1")) |cursor_handle| {
            var mutable = cursor_handle;
            if (load_table(Xcursor, &mutable)) |table| {
                result.xcursor = table;
                result.xcursor_handle = mutable;
            } else mutable.close();
        } else |_| {}
        return result;
    }

    fn load_table(comptime Table: type, handle: *std.DynLib) ?Table {
        var table: Table = undefined;
        const info = @typeInfo(Table).@"struct";
        inline for (info.field_names, info.field_types) |name, FieldType| {
            @field(table, name) = handle.lookup(FieldType, name) orelse return null;
        }
        return table;
    }

    /// Unloads the libraries. Every connection and object borrowing them must be closed first.
    pub fn deinit(self: *Library) void {
        if (self.xcursor_handle) |*cursor| cursor.close();
        if (self.xshape_handle) |*shape| shape.close();
        if (self.xi_handle) |*input| input.close();
        if (self.xrandr_handle) |*randr| randr.close();
        if (self.xext_handle) |*extension| extension.close();
        self.handle.close();
        self.* = undefined;
    }
};

// Layouts this backend relies on. Xlib's Image and XEvent are fixed by the C ABI.
comptime {
    if (@sizeOf(usize) == 8) {
        std.debug.assert(@sizeOf(AnyEvent) == 40);
        std.debug.assert(@sizeOf(KeyEvent) == 96);
        std.debug.assert(@sizeOf(MotionEvent) == 96);
        std.debug.assert(@sizeOf(ConfigureEvent) == 88);
        std.debug.assert(@sizeOf(ClientMessageEvent) == 96);
        std.debug.assert(@sizeOf(Event) == 192);
        std.debug.assert(@sizeOf(ErrorEvent) == 40);
        std.debug.assert(@offsetOf(ErrorEvent, "error_code") == 32);
        std.debug.assert(@offsetOf(XkbStateEvent, "group") == 52);
        std.debug.assert(@sizeOf(Visual) == 56);
        std.debug.assert(@sizeOf(Image) == 136);
        std.debug.assert(@offsetOf(Image, "functions") == 88);
        std.debug.assert(@sizeOf(XSizeHints) == 80);
        std.debug.assert(@sizeOf(XGCValues) == 128);
        std.debug.assert(@offsetOf(XkbDesc, "ctrls") == 16);
        std.debug.assert(@offsetOf(XkbDesc, "map") == 32);
        std.debug.assert(@offsetOf(XkbDesc, "names") == 48);
        std.debug.assert(@sizeOf(XkbKeyTypeEntry) == 12);
        std.debug.assert(@sizeOf(XkbKeyType) == 40);
        std.debug.assert(@offsetOf(XkbKeyType, "map") == 8);
        std.debug.assert(@sizeOf(XkbSymMap) == 8);
        std.debug.assert(@offsetOf(XkbClientMap, "types") == 8);
        std.debug.assert(@offsetOf(XkbClientMap, "key_sym_map") == 32);
        std.debug.assert(@offsetOf(XkbServerMap, "vmods") == 40);
        std.debug.assert(@offsetOf(XkbNames, "vmods") == 40);
        std.debug.assert(@sizeOf(XShmSegmentInfo) == 32);
        std.debug.assert(@sizeOf(XRRScreenResources) == 64);
        std.debug.assert(@sizeOf(XRRModeInfo) == 80);
        std.debug.assert(@offsetOf(XRRModeInfo, "mode_flags") == 72);
        std.debug.assert(@sizeOf(XRROutputInfo) == 96);
        std.debug.assert(@offsetOf(XRROutputInfo, "modes") == 88);
        std.debug.assert(@sizeOf(XRRCrtcInfo) == 64);
        std.debug.assert(@offsetOf(XRRCrtcInfo, "possible") == 56);
        std.debug.assert(@sizeOf(XWindowAttributes) == 136);
        std.debug.assert(@offsetOf(XWindowAttributes, "map_state") == 92);
        std.debug.assert(@sizeOf(XWMHints) == 56);
        std.debug.assert(@sizeOf(XFontStruct) == 96);
        std.debug.assert(@sizeOf(XIDeviceEvent) == 200);
        std.debug.assert(@offsetOf(XIDeviceEvent, "mods") == 168);
        std.debug.assert(@offsetOf(XIDeviceEvent, "group") == 184);
        std.debug.assert(@sizeOf(Event) == 192);
        std.debug.assert(@offsetOf(XIDeviceEvent, "deviceid") == 48);
        std.debug.assert(@offsetOf(XIDeviceEvent, "root_x") == 88);
        std.debug.assert(@offsetOf(XIDeviceEvent, "flags") == 120);
        std.debug.assert(@sizeOf(XIRawEvent) == 96);
        std.debug.assert(@offsetOf(XIRawEvent, "raw_values") == 88);
        std.debug.assert(@sizeOf(GenericEventCookie) == 56);
        std.debug.assert(@offsetOf(GenericEventCookie, "cookie") == 40);
        std.debug.assert(@offsetOf(GenericEventCookie, "data") == 48);
        std.debug.assert(@sizeOf(XIScrollClassInfo) == 32);
        std.debug.assert(@offsetOf(XIHierarchyEvent, "info") == 56);
        std.debug.assert(@offsetOf(XIPropertyEvent, "property") == 56);
        std.debug.assert(@offsetOf(XIGesturePinchEvent, "scale") == 152);
        std.debug.assert(@offsetOf(XIGesturePinchEvent, "delta_angle") == 160);
        std.debug.assert(@offsetOf(XIGesturePinchEvent, "flags") == 168);
        std.debug.assert(@offsetOf(XIGesturePinchEvent, "mods") == 172);
        std.debug.assert(@offsetOf(XIGesturePinchEvent, "group") == 188);
        std.debug.assert(@sizeOf(XIGesturePinchEvent) == 208);
        std.debug.assert(@sizeOf(XIGroupState) == 16);
        std.debug.assert(@sizeOf(XIButtonClassInfo) == 40);
        std.debug.assert(@sizeOf(XIDeviceInfo) == 40);
    }
}
