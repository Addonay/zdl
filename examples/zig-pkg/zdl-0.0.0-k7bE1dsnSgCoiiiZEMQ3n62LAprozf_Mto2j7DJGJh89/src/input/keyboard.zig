//! Physical key positions, layout-dependent keycodes, modifier state, key names
//! and per-layout scancode/keycode maps.
//! Altered native port of SDL_scancode.h, SDL_keycode.h and SDL_keymap.c.
//!
//! There is no current/global keymap, global name table or keyboard startup:
//! callers pass an optional `*const Keymap` and backend `ScancodeNames`. A null
//! keymap uses SDL's built-in US layout, as SDL does without a backend keymap.
//! Key names written into caller buffers replace SDL's persistent string cache.
const std = @import("std");
const builtin = @import("builtin");
const casefold = @import("../core/casefold.zig");

/// Keyboard modifier keys and lock states. Bit positions equal SDL_Keymod for
/// interchange with serialized or OS-reported masks.
pub const Modifiers = packed struct(u16) {
    left_shift: bool = false,
    right_shift: bool = false,
    level5: bool = false,
    _unused: u3 = 0,
    left_ctrl: bool = false,
    right_ctrl: bool = false,
    left_alt: bool = false,
    right_alt: bool = false,
    left_gui: bool = false,
    right_gui: bool = false,
    num: bool = false,
    caps: bool = false,
    /// AltGr / ISO level 3 shift.
    mode: bool = false,
    scroll: bool = false,

    pub const none: Modifiers = .{};
    pub const shift_keys: Modifiers = .{ .left_shift = true, .right_shift = true };
    pub const ctrl_keys: Modifiers = .{ .left_ctrl = true, .right_ctrl = true };
    pub const alt_keys: Modifiers = .{ .left_alt = true, .right_alt = true };
    pub const gui_keys: Modifiers = .{ .left_gui = true, .right_gui = true };

    pub fn bits(self: Modifiers) u16 {
        return @backingInt(self);
    }

    /// Reserved bits 3-5 are discarded.
    pub fn from_bits(value: u16) Modifiers {
        var result: Modifiers = @fromBackingInt(value);
        result._unused = 0;
        return result;
    }

    pub fn shift(self: Modifiers) bool {
        return self.left_shift or self.right_shift;
    }
    pub fn ctrl(self: Modifiers) bool {
        return self.left_ctrl or self.right_ctrl;
    }
    pub fn alt(self: Modifiers) bool {
        return self.left_alt or self.right_alt;
    }
    pub fn gui(self: Modifiers) bool {
        return self.left_gui or self.right_gui;
    }

    pub fn either(self: Modifiers, other: Modifiers) Modifiers {
        return from_bits(self.bits() | other.bits());
    }
    pub fn both(self: Modifiers, other: Modifiers) Modifiers {
        return from_bits(self.bits() & other.bits());
    }
    pub fn without(self: Modifiers, other: Modifiers) Modifiers {
        return from_bits(self.bits() & ~other.bits());
    }
    pub fn any(self: Modifiers) bool {
        return self.bits() != 0;
    }

    /// Only Shift, Caps, Alt, Mode and Level 5 select keymap levels. Either
    /// side of Shift/Alt selects both, so one table entry serves both keys.
    pub fn for_keymap(self: Modifiers) Modifiers {
        var result: Modifiers = .{
            .caps = self.caps,
            .mode = self.mode,
            .level5 = self.level5,
        };
        if (self.shift()) result = result.either(shift_keys);
        if (self.alt()) result = result.either(alt_keys);
        return result;
    }
};

/// A scancode reached with a modifier combination.
pub const Chord = struct {
    scancode: Scancode,
    modifiers: Modifiers = .none,
};

/// Backend-specific scancode display names, consulted before the defaults.
/// This replaces SDL_SetScancodeName's process-global mutation; backends
/// publish constant overrides instead (for example "Menu" on Linux).
pub const ScancodeNames = struct {
    overrides: []const Override = &.{},

    pub const Override = struct { scancode: Scancode, name: []const u8 };

    pub fn name(self: ScancodeNames, scancode: Scancode) []const u8 {
        for (self.overrides) |entry| if (entry.scancode == scancode) return entry.name;
        return scancode.name();
    }

    /// Unicode case-insensitive, as SDL_strcasecmp. Overrides take precedence;
    /// unlike SDL's single mutable table, an overridden default name remains
    /// accepted as well.
    pub fn scancode_from_name(self: ScancodeNames, text: []const u8) ?Scancode {
        if (text.len == 0) return null;
        for (self.overrides) |entry| if (names_equal(entry.name, text)) return entry.scancode;
        return Scancode.from_name(text);
    }
};

/// Context for name lookups that depend on the active layout and backend.
pub const NameContext = struct {
    keymap: ?*const Keymap = null,
    names: ScancodeNames = .{},
};

// Number row and punctuation from SDL_SCANCODE_1 through SDL_SCANCODE_SLASH on
// the default US layout, unshifted and shifted. NONUSHASH produces '#' both ways.
const normal_default_symbols = [_]Keycode{
    .@"1",         .@"2",      .@"3",   .@"4",      .@"5",       .@"6",  .@"7",  .@"8",   .@"9",
    .@"0",         .@"return", .escape, .backspace, .tab,        .space, .minus, .equals, .leftbracket,
    .rightbracket, .backslash, .hash,   .semicolon, .apostrophe, .grave, .comma, .period, .slash,
};
const shifted_default_symbols = [_]Keycode{
    .exclaim,    .at,        .hash,   .dollar,    .percent,       .caret, .ampersand,  .asterisk, .leftparen,
    .rightparen, .@"return", .escape, .backspace, .tab,           .space, .underscore, .plus,     .leftbrace,
    .rightbrace, .pipe,      .hash,   .colon,     .dblapostrophe, .tilde, .less,       .greater,  .question,
};
const extended_default_symbols = [_]struct { keycode: Keycode, scancode: Scancode }{
    .{ .keycode = .left_tab, .scancode = .tab },
    .{ .keycode = .multi_key_compose, .scancode = .application }, // Sun keyboards
    .{ .keycode = .lmeta, .scancode = .lgui },
    .{ .keycode = .rmeta, .scancode = .rgui },
    .{ .keycode = .rhyper, .scancode = .application },
};

/// Scancodes whose default keycode is the scancode with Keycode.scancode_mask.
/// Upstream lists these in one switch; it is exactly the set of named masked
/// keycodes, so it is derived from the enum rather than repeated.
const masked_default_scancodes = blk: {
    @setEvalBranchQuota(10_000);
    var set: std.bit_set.Static(512) = .empty;
    for (std.meta.tags(Keycode)) |key| {
        const raw = @backingInt(key);
        if (raw & Keycode.scancode_mask != 0) set.set(raw & ~Keycode.scancode_mask);
    }
    break :blk set;
};

/// SDL's built-in US layout. Letters honor Shift and Caps Lock (on Apple
/// targets Caps Lock always selects capitals); Mode yields no printable key.
pub fn default_keycode(scancode: Scancode, modifiers: Modifiers) Keycode {
    const raw = @backingInt(scancode);
    if (raw < @backingInt(Scancode.a)) return .unknown;
    if (raw < @backingInt(Scancode.@"1")) {
        var shifted = modifiers.shift();
        if (modifiers.caps) shifted = if (builtin.target.os.tag.isDarwin()) true else !shifted;
        if (modifiers.mode) return .unknown;
        const base: u32 = if (shifted) 'A' else 'a';
        return @fromBackingInt(@intCast(base + raw - @backingInt(Scancode.a)));
    }
    if (raw < @backingInt(Scancode.capslock)) {
        if (modifiers.mode) return .unknown;
        const index = raw - @backingInt(Scancode.@"1");
        return if (modifiers.shift()) shifted_default_symbols[index] else normal_default_symbols[index];
    }
    if (scancode == .delete) return .delete;
    return if (masked_default_scancodes.isSet(raw)) Keycode.from_scancode(scancode) else .unknown;
}

/// Inverse of default_keycode, preferring the unshifted chord. Unknown keys
/// produce Scancode.unknown with no modifiers.
pub fn default_chord(key: Keycode) Chord {
    const raw = @backingInt(key);
    if (key == .unknown) return .{ .scancode = .unknown };
    if (raw & Keycode.extended_mask != 0) {
        for (extended_default_symbols) |entry| if (entry.keycode == key) return .{ .scancode = entry.scancode };
        return .{ .scancode = .unknown };
    }
    if (raw & Keycode.scancode_mask != 0) {
        const value = raw & ~Keycode.scancode_mask;
        return .{ .scancode = if (value < 512) @fromBackingInt(@intCast(value)) else .unknown };
    }
    if (raw >= 'a' and raw <= 'z') return .{ .scancode = @fromBackingInt(@intCast(@backingInt(Scancode.a) + raw - 'a')) };
    if (raw >= 'A' and raw <= 'Z') return .{
        .scancode = @fromBackingInt(@intCast(@backingInt(Scancode.a) + raw - 'A')),
        .modifiers = Modifiers.shift_keys,
    };
    for (normal_default_symbols, 0..) |symbol, index| {
        if (symbol == key) return .{ .scancode = @fromBackingInt(@intCast(@backingInt(Scancode.@"1") + index)) };
    }
    for (shifted_default_symbols, 0..) |symbol, index| {
        if (symbol == key) return .{
            .scancode = @fromBackingInt(@intCast(@backingInt(Scancode.@"1") + index)),
            .modifiers = Modifiers.shift_keys,
        };
    }
    if (key == .delete) return .{ .scancode = .delete };
    return .{ .scancode = .unknown };
}

/// Layout traits upstream derives once per keymap to adjust key events.
pub const Layout = struct {
    /// Every number-row key produces a symbol unshifted and a digit shifted.
    french_numbers: bool,
    /// A through D produce Latin-1 codepoints.
    latin_letters: bool,
    /// A through D produce Thai codepoints (U+0E00-U+0E7F).
    thai: bool,
};

/// Backend-populated scancode/keycode associations for one keyboard layout.
///
/// Owns two hash maps allocated from `allocator`. Not synchronized: the owner
/// serializes mutation with lookups. Upstream's auto-release flag belonged to
/// global keyboard ownership and has no meaning without a global keymap.
pub const Keymap = struct {
    allocator: std.mem.Allocator,
    /// Key: normalized modifier bits << 16 | scancode.
    to_keycode: std.AutoHashMapUnmanaged(u32, Keycode) = .empty,
    /// Simplest chord known to produce each keycode.
    to_chord: std.AutoHashMapUnmanaged(Keycode, Chord) = .empty,
    next_reserved: ?Scancode = null,

    pub fn init(allocator: std.mem.Allocator) Keymap {
        return .{ .allocator = allocator };
    }

    pub fn deinit(self: *Keymap) void {
        self.to_keycode.deinit(self.allocator);
        self.to_chord.deinit(self.allocator);
        self.* = undefined;
    }

    fn entry_key(scancode: Scancode, modifiers: Modifiers) u32 {
        return @as(u32, modifiers.bits()) << 16 | @backingInt(scancode);
    }

    /// Records that a scancode with these modifiers produces a keycode. A
    /// replaced entry's previous reverse association is retained, as upstream.
    /// On allocation failure neither direction changes.
    pub fn set(self: *Keymap, scancode: Scancode, modifiers: Modifiers, key: Keycode) std.mem.Allocator.Error!void {
        const normalized = modifiers.for_keymap();
        const forward_key = entry_key(scancode, normalized);
        if (self.to_keycode.get(forward_key)) |existing| if (existing == key) return;
        try self.to_keycode.ensureUnusedCapacity(self.allocator, 1);
        try self.to_chord.ensureUnusedCapacity(self.allocator, 1);
        self.to_keycode.putAssumeCapacity(forward_key, key);
        // Keep the simplest combination: lower SDL modifier bits win ties.
        if (self.to_chord.get(key)) |existing| {
            if (existing.modifiers.bits() <= normalized.bits()) return;
        }
        self.to_chord.putAssumeCapacity(key, .{ .scancode = scancode, .modifiers = normalized });
    }

    fn find(self: *const Keymap, scancode: Scancode, modifiers: Modifiers) ?Keycode {
        return self.to_keycode.get(entry_key(scancode, modifiers));
    }

    /// Keycode for a scancode and modifier state. Missing levels fall back
    /// from Level 5, through Level 3+Shift, Level 3 and Shift, to unshifted,
    /// first with Caps Lock and then without; finally to the default layout.
    pub fn keycode(self: *const Keymap, scancode: Scancode, modifiers: Modifiers) Keycode {
        const normalized = modifiers.for_keymap();
        if (self.find(scancode, normalized)) |key| return key;
        if (normalized.any()) {
            var caps: Modifiers = .{ .caps = normalized.caps };
            const passes: u2 = if (normalized.caps) 2 else 1;
            for (0..passes) |_| {
                const level3_shift = Modifiers.shift_keys.either(.{ .mode = true });
                const levels = [_]struct { required: Modifiers, state: Modifiers }{
                    .{ .required = .{ .level5 = true }, .state = .{ .level5 = true } },
                    .{ .required = level3_shift, .state = level3_shift },
                    .{ .required = .{ .mode = true }, .state = .{ .mode = true } },
                    .{ .required = Modifiers.shift_keys, .state = Modifiers.shift_keys },
                };
                for (levels) |level| {
                    // Level 5 and Mode need one bit; Shift alone needs either
                    // normalized Shift bit, which are always set together.
                    const present = if (level.required.bits() == level3_shift.bits())
                        normalized.both(level3_shift).bits() == level3_shift.bits()
                    else
                        normalized.both(level.required).any();
                    if (!present) continue;
                    const state = level.state.either(caps);
                    if (state.bits() != normalized.bits()) if (self.find(scancode, state)) |key| return key;
                }
                if (self.find(scancode, caps)) |key| return key;
                caps = .none;
            }
        }
        return default_keycode(scancode, modifiers);
    }

    /// Simplest recorded chord producing a keycode, or the default layout's.
    pub fn chord(self: *const Keymap, key: Keycode) Chord {
        return self.to_chord.get(key) orelse default_chord(key);
    }

    /// Allocates scancodes 400-499 round-robin for keys a backend cannot place
    /// in the standard set. After 499 allocation wraps to 400; callers that
    /// need more than 100 distinct dynamic keys must handle the reuse.
    pub fn next_reserved_scancode(self: *Keymap) Scancode {
        const first = @backingInt(Scancode.first_reserved);
        const value = if (self.next_reserved) |next| @backingInt(next) else first;
        const scancode: u9 = if (value < first + Scancode.reserved_count) value else first;
        self.next_reserved = @fromBackingInt(@intCast(scancode + 1));
        return @fromBackingInt(@intCast(scancode));
    }

    /// Classifies the layout from its number row and A-D keys.
    pub fn layout(self: *const Keymap) Layout {
        var result: Layout = .{ .french_numbers = true, .latin_letters = false, .thai = false };
        for (@backingInt(Scancode.@"1")..@backingInt(Scancode.@"0") + 1) |raw| {
            const scancode: Scancode = @fromBackingInt(@intCast(raw));
            if (is_digit(self.keycode(scancode, .none)) or !is_digit(self.keycode(scancode, Modifiers.shift_keys))) {
                result.french_numbers = false;
                break;
            }
        }
        for (@backingInt(Scancode.a)..@backingInt(Scancode.d) + 1) |raw| {
            const key = @backingInt(self.keycode(@fromBackingInt(@intCast(raw)), .none));
            if (key <= 0xFF) {
                result.latin_letters = true;
                break;
            }
            if (key >= 0x0E00 and key <= 0x0E7F) {
                result.thai = true;
                break;
            }
        }
        return result;
    }
};

fn is_digit(key: Keycode) bool {
    const raw = @backingInt(key);
    return raw >= '0' and raw <= '9';
}

fn keymap_keycode(keymap: ?*const Keymap, scancode: Scancode, modifiers: Modifiers) Keycode {
    return if (keymap) |map| map.keycode(scancode, modifiers) else default_keycode(scancode, modifiers);
}

fn keymap_chord(keymap: ?*const Keymap, key: Keycode) Chord {
    return if (keymap) |map| map.chord(key) else default_chord(key);
}

const extended_key_names = [_][]const u8{
    "LeftTab",    "Level5Shift", "MultiKeyCompose", "Left Meta",
    "Right Meta", "Left Hyper",  "Right Hyper",
};

// Generated from upstream SDL_scancode.h, SDL_keycode.h and SDL_keymap.c by a
// tools/gen/keys.py; regenerate rather than edit entries by hand.

/// USB HID usage-page-7 key positions, independent of the active layout.
/// Values 400-499 are allocated dynamically by Keymap for keys without a
/// standard position; any value below 512 is representable.
pub const Scancode = enum(u9) {
    unknown = 0,
    a = 4,
    b = 5,
    c = 6,
    d = 7,
    e = 8,
    f = 9,
    g = 10,
    h = 11,
    i = 12,
    j = 13,
    k = 14,
    l = 15,
    m = 16,
    n = 17,
    o = 18,
    p = 19,
    q = 20,
    r = 21,
    s = 22,
    t = 23,
    u = 24,
    v = 25,
    w = 26,
    x = 27,
    y = 28,
    z = 29,
    @"1" = 30,
    @"2" = 31,
    @"3" = 32,
    @"4" = 33,
    @"5" = 34,
    @"6" = 35,
    @"7" = 36,
    @"8" = 37,
    @"9" = 38,
    @"0" = 39,
    @"return" = 40,
    escape = 41,
    backspace = 42,
    tab = 43,
    space = 44,
    minus = 45,
    equals = 46,
    leftbracket = 47,
    rightbracket = 48,
    backslash = 49,
    nonushash = 50,
    semicolon = 51,
    apostrophe = 52,
    grave = 53,
    comma = 54,
    period = 55,
    slash = 56,
    capslock = 57,
    f1 = 58,
    f2 = 59,
    f3 = 60,
    f4 = 61,
    f5 = 62,
    f6 = 63,
    f7 = 64,
    f8 = 65,
    f9 = 66,
    f10 = 67,
    f11 = 68,
    f12 = 69,
    printscreen = 70,
    scrolllock = 71,
    pause = 72,
    insert = 73,
    home = 74,
    pageup = 75,
    delete = 76,
    end = 77,
    pagedown = 78,
    right = 79,
    left = 80,
    down = 81,
    up = 82,
    numlockclear = 83,
    kp_divide = 84,
    kp_multiply = 85,
    kp_minus = 86,
    kp_plus = 87,
    kp_enter = 88,
    kp_1 = 89,
    kp_2 = 90,
    kp_3 = 91,
    kp_4 = 92,
    kp_5 = 93,
    kp_6 = 94,
    kp_7 = 95,
    kp_8 = 96,
    kp_9 = 97,
    kp_0 = 98,
    kp_period = 99,
    nonusbackslash = 100,
    application = 101,
    power = 102,
    kp_equals = 103,
    f13 = 104,
    f14 = 105,
    f15 = 106,
    f16 = 107,
    f17 = 108,
    f18 = 109,
    f19 = 110,
    f20 = 111,
    f21 = 112,
    f22 = 113,
    f23 = 114,
    f24 = 115,
    execute = 116,
    help = 117,
    menu = 118,
    select = 119,
    stop = 120,
    again = 121,
    undo = 122,
    cut = 123,
    copy = 124,
    paste = 125,
    find = 126,
    mute = 127,
    volumeup = 128,
    volumedown = 129,
    kp_comma = 133,
    kp_equalsas400 = 134,
    international1 = 135,
    international2 = 136,
    international3 = 137,
    international4 = 138,
    international5 = 139,
    international6 = 140,
    international7 = 141,
    international8 = 142,
    international9 = 143,
    lang1 = 144,
    lang2 = 145,
    lang3 = 146,
    lang4 = 147,
    lang5 = 148,
    lang6 = 149,
    lang7 = 150,
    lang8 = 151,
    lang9 = 152,
    alterase = 153,
    sysreq = 154,
    cancel = 155,
    clear = 156,
    prior = 157,
    return2 = 158,
    separator = 159,
    out = 160,
    oper = 161,
    clearagain = 162,
    crsel = 163,
    exsel = 164,
    front = 165,
    kp_00 = 176,
    kp_000 = 177,
    thousandsseparator = 178,
    decimalseparator = 179,
    currencyunit = 180,
    currencysubunit = 181,
    kp_leftparen = 182,
    kp_rightparen = 183,
    kp_leftbrace = 184,
    kp_rightbrace = 185,
    kp_tab = 186,
    kp_backspace = 187,
    kp_a = 188,
    kp_b = 189,
    kp_c = 190,
    kp_d = 191,
    kp_e = 192,
    kp_f = 193,
    kp_xor = 194,
    kp_power = 195,
    kp_percent = 196,
    kp_less = 197,
    kp_greater = 198,
    kp_ampersand = 199,
    kp_dblampersand = 200,
    kp_verticalbar = 201,
    kp_dblverticalbar = 202,
    kp_colon = 203,
    kp_hash = 204,
    kp_space = 205,
    kp_at = 206,
    kp_exclam = 207,
    kp_memstore = 208,
    kp_memrecall = 209,
    kp_memclear = 210,
    kp_memadd = 211,
    kp_memsubtract = 212,
    kp_memmultiply = 213,
    kp_memdivide = 214,
    kp_plusminus = 215,
    kp_clear = 216,
    kp_clearentry = 217,
    kp_binary = 218,
    kp_octal = 219,
    kp_decimal = 220,
    kp_hexadecimal = 221,
    lctrl = 224,
    lshift = 225,
    lalt = 226,
    lgui = 227,
    rctrl = 228,
    rshift = 229,
    ralt = 230,
    rgui = 231,
    mode = 257,
    sleep = 258,
    wake = 259,
    channel_increment = 260,
    channel_decrement = 261,
    media_play = 262,
    media_pause = 263,
    media_record = 264,
    media_fast_forward = 265,
    media_rewind = 266,
    media_next_track = 267,
    media_previous_track = 268,
    media_stop = 269,
    media_eject = 270,
    media_play_pause = 271,
    media_select = 272,
    ac_new = 273,
    ac_open = 274,
    ac_close = 275,
    ac_exit = 276,
    ac_save = 277,
    ac_print = 278,
    ac_properties = 279,
    ac_search = 280,
    ac_home = 281,
    ac_back = 282,
    ac_forward = 283,
    ac_stop = 284,
    ac_refresh = 285,
    ac_bookmarks = 286,
    softleft = 287,
    softright = 288,
    call = 289,
    endcall = 290,
    _,

    pub const first_reserved: Scancode = @fromBackingInt(@intCast(400));
    pub const reserved_count = 100;

    /// Default English name, or empty when SDL defines none. Backends may
    /// present a few keys differently; see their name functions.
    pub fn name(self: Scancode) []const u8 {
        const index = @backingInt(self);
        return if (index < scancode_names.len) scancode_names[index] else "";
    }

    /// Unicode case-insensitive inverse of name. Empty and unknown names are null.
    pub fn from_name(text: []const u8) ?Scancode {
        if (text.len == 0) return null;
        for (scancode_names, 0..) |candidate, index| {
            if (candidate.len != 0 and names_equal(candidate, text)) return @fromBackingInt(@intCast(index));
        }
        return null;
    }
};

const scancode_names = [_][]const u8{
    "", // 0
    "", // 1
    "", // 2
    "", // 3
    "A", // 4
    "B", // 5
    "C", // 6
    "D", // 7
    "E", // 8
    "F", // 9
    "G", // 10
    "H", // 11
    "I", // 12
    "J", // 13
    "K", // 14
    "L", // 15
    "M", // 16
    "N", // 17
    "O", // 18
    "P", // 19
    "Q", // 20
    "R", // 21
    "S", // 22
    "T", // 23
    "U", // 24
    "V", // 25
    "W", // 26
    "X", // 27
    "Y", // 28
    "Z", // 29
    "1", // 30
    "2", // 31
    "3", // 32
    "4", // 33
    "5", // 34
    "6", // 35
    "7", // 36
    "8", // 37
    "9", // 38
    "0", // 39
    "Return", // 40
    "Escape", // 41
    "Backspace", // 42
    "Tab", // 43
    "Space", // 44
    "-", // 45
    "=", // 46
    "[", // 47
    "]", // 48
    "\\", // 49
    "#", // 50
    ";", // 51
    "'", // 52
    "`", // 53
    ",", // 54
    ".", // 55
    "/", // 56
    "CapsLock", // 57
    "F1", // 58
    "F2", // 59
    "F3", // 60
    "F4", // 61
    "F5", // 62
    "F6", // 63
    "F7", // 64
    "F8", // 65
    "F9", // 66
    "F10", // 67
    "F11", // 68
    "F12", // 69
    "PrintScreen", // 70
    "ScrollLock", // 71
    "Pause", // 72
    "Insert", // 73
    "Home", // 74
    "PageUp", // 75
    "Delete", // 76
    "End", // 77
    "PageDown", // 78
    "Right", // 79
    "Left", // 80
    "Down", // 81
    "Up", // 82
    "Numlock", // 83
    "Keypad /", // 84
    "Keypad *", // 85
    "Keypad -", // 86
    "Keypad +", // 87
    "Keypad Enter", // 88
    "Keypad 1", // 89
    "Keypad 2", // 90
    "Keypad 3", // 91
    "Keypad 4", // 92
    "Keypad 5", // 93
    "Keypad 6", // 94
    "Keypad 7", // 95
    "Keypad 8", // 96
    "Keypad 9", // 97
    "Keypad 0", // 98
    "Keypad .", // 99
    "NonUSBackslash", // 100
    "Application", // 101
    "Power", // 102
    "Keypad =", // 103
    "F13", // 104
    "F14", // 105
    "F15", // 106
    "F16", // 107
    "F17", // 108
    "F18", // 109
    "F19", // 110
    "F20", // 111
    "F21", // 112
    "F22", // 113
    "F23", // 114
    "F24", // 115
    "Execute", // 116
    "Help", // 117
    "Menu", // 118
    "Select", // 119
    "Stop", // 120
    "Again", // 121
    "Undo", // 122
    "Cut", // 123
    "Copy", // 124
    "Paste", // 125
    "Find", // 126
    "Mute", // 127
    "VolumeUp", // 128
    "VolumeDown", // 129
    "", // 130
    "", // 131
    "", // 132
    "Keypad ,", // 133
    "Keypad = (AS400)", // 134
    "International 1", // 135
    "International 2", // 136
    "International 3", // 137
    "International 4", // 138
    "International 5", // 139
    "International 6", // 140
    "International 7", // 141
    "International 8", // 142
    "International 9", // 143
    "Language 1", // 144
    "Language 2", // 145
    "Language 3", // 146
    "Language 4", // 147
    "Language 5", // 148
    "Language 6", // 149
    "Language 7", // 150
    "Language 8", // 151
    "Language 9", // 152
    "AltErase", // 153
    "SysReq", // 154
    "Cancel", // 155
    "Clear", // 156
    "Prior", // 157
    "Return", // 158
    "Separator", // 159
    "Out", // 160
    "Oper", // 161
    "Clear / Again", // 162
    "CrSel", // 163
    "ExSel", // 164
    "Front", // 165
    "", // 166
    "", // 167
    "", // 168
    "", // 169
    "", // 170
    "", // 171
    "", // 172
    "", // 173
    "", // 174
    "", // 175
    "Keypad 00", // 176
    "Keypad 000", // 177
    "ThousandsSeparator", // 178
    "DecimalSeparator", // 179
    "CurrencyUnit", // 180
    "CurrencySubUnit", // 181
    "Keypad (", // 182
    "Keypad )", // 183
    "Keypad {", // 184
    "Keypad }", // 185
    "Keypad Tab", // 186
    "Keypad Backspace", // 187
    "Keypad A", // 188
    "Keypad B", // 189
    "Keypad C", // 190
    "Keypad D", // 191
    "Keypad E", // 192
    "Keypad F", // 193
    "Keypad XOR", // 194
    "Keypad ^", // 195
    "Keypad %", // 196
    "Keypad <", // 197
    "Keypad >", // 198
    "Keypad &", // 199
    "Keypad &&", // 200
    "Keypad |", // 201
    "Keypad ||", // 202
    "Keypad :", // 203
    "Keypad #", // 204
    "Keypad Space", // 205
    "Keypad @", // 206
    "Keypad !", // 207
    "Keypad MemStore", // 208
    "Keypad MemRecall", // 209
    "Keypad MemClear", // 210
    "Keypad MemAdd", // 211
    "Keypad MemSubtract", // 212
    "Keypad MemMultiply", // 213
    "Keypad MemDivide", // 214
    "Keypad +/-", // 215
    "Keypad Clear", // 216
    "Keypad ClearEntry", // 217
    "Keypad Binary", // 218
    "Keypad Octal", // 219
    "Keypad Decimal", // 220
    "Keypad Hexadecimal", // 221
    "", // 222
    "", // 223
    "Left Ctrl", // 224
    "Left Shift", // 225
    "Left Alt", // 226
    "Left GUI", // 227
    "Right Ctrl", // 228
    "Right Shift", // 229
    "Right Alt", // 230
    "Right GUI", // 231
    "", // 232
    "", // 233
    "", // 234
    "", // 235
    "", // 236
    "", // 237
    "", // 238
    "", // 239
    "", // 240
    "", // 241
    "", // 242
    "", // 243
    "", // 244
    "", // 245
    "", // 246
    "", // 247
    "", // 248
    "", // 249
    "", // 250
    "", // 251
    "", // 252
    "", // 253
    "", // 254
    "", // 255
    "", // 256
    "ModeSwitch", // 257
    "Sleep", // 258
    "Wake", // 259
    "ChannelUp", // 260
    "ChannelDown", // 261
    "MediaPlay", // 262
    "MediaPause", // 263
    "MediaRecord", // 264
    "MediaFastForward", // 265
    "MediaRewind", // 266
    "MediaTrackNext", // 267
    "MediaTrackPrevious", // 268
    "MediaStop", // 269
    "Eject", // 270
    "MediaPlayPause", // 271
    "MediaSelect", // 272
    "AC New", // 273
    "AC Open", // 274
    "AC Close", // 275
    "AC Exit", // 276
    "AC Save", // 277
    "AC Print", // 278
    "AC Properties", // 279
    "AC Search", // 280
    "AC Home", // 281
    "AC Back", // 282
    "AC Forward", // 283
    "AC Stop", // 284
    "AC Refresh", // 285
    "AC Bookmarks", // 286
    "SoftLeft", // 287
    "SoftRight", // 288
    "Call", // 289
    "EndCall", // 290
};

/// Layout-dependent key meaning. Printable keys are their unshifted Unicode
/// codepoint; other keys are their scancode with `scancode_mask`, or one of
/// the extended keys with `extended_mask`. Unlisted codepoints are valid.
pub const Keycode = enum(u32) {
    unknown = 0x00000000,
    @"return" = 0x0000000D,
    escape = 0x0000001B,
    backspace = 0x00000008,
    tab = 0x00000009,
    space = 0x00000020,
    exclaim = 0x00000021,
    dblapostrophe = 0x00000022,
    hash = 0x00000023,
    dollar = 0x00000024,
    percent = 0x00000025,
    ampersand = 0x00000026,
    apostrophe = 0x00000027,
    leftparen = 0x00000028,
    rightparen = 0x00000029,
    asterisk = 0x0000002A,
    plus = 0x0000002B,
    comma = 0x0000002C,
    minus = 0x0000002D,
    period = 0x0000002E,
    slash = 0x0000002F,
    @"0" = 0x00000030,
    @"1" = 0x00000031,
    @"2" = 0x00000032,
    @"3" = 0x00000033,
    @"4" = 0x00000034,
    @"5" = 0x00000035,
    @"6" = 0x00000036,
    @"7" = 0x00000037,
    @"8" = 0x00000038,
    @"9" = 0x00000039,
    colon = 0x0000003A,
    semicolon = 0x0000003B,
    less = 0x0000003C,
    equals = 0x0000003D,
    greater = 0x0000003E,
    question = 0x0000003F,
    at = 0x00000040,
    leftbracket = 0x0000005B,
    backslash = 0x0000005C,
    rightbracket = 0x0000005D,
    caret = 0x0000005E,
    underscore = 0x0000005F,
    grave = 0x00000060,
    a = 0x00000061,
    b = 0x00000062,
    c = 0x00000063,
    d = 0x00000064,
    e = 0x00000065,
    f = 0x00000066,
    g = 0x00000067,
    h = 0x00000068,
    i = 0x00000069,
    j = 0x0000006A,
    k = 0x0000006B,
    l = 0x0000006C,
    m = 0x0000006D,
    n = 0x0000006E,
    o = 0x0000006F,
    p = 0x00000070,
    q = 0x00000071,
    r = 0x00000072,
    s = 0x00000073,
    t = 0x00000074,
    u = 0x00000075,
    v = 0x00000076,
    w = 0x00000077,
    x = 0x00000078,
    y = 0x00000079,
    z = 0x0000007A,
    leftbrace = 0x0000007B,
    pipe = 0x0000007C,
    rightbrace = 0x0000007D,
    tilde = 0x0000007E,
    delete = 0x0000007F,
    plusminus = 0x000000B1,
    capslock = 0x40000039,
    f1 = 0x4000003A,
    f2 = 0x4000003B,
    f3 = 0x4000003C,
    f4 = 0x4000003D,
    f5 = 0x4000003E,
    f6 = 0x4000003F,
    f7 = 0x40000040,
    f8 = 0x40000041,
    f9 = 0x40000042,
    f10 = 0x40000043,
    f11 = 0x40000044,
    f12 = 0x40000045,
    printscreen = 0x40000046,
    scrolllock = 0x40000047,
    pause = 0x40000048,
    insert = 0x40000049,
    home = 0x4000004A,
    pageup = 0x4000004B,
    end = 0x4000004D,
    pagedown = 0x4000004E,
    right = 0x4000004F,
    left = 0x40000050,
    down = 0x40000051,
    up = 0x40000052,
    numlockclear = 0x40000053,
    kp_divide = 0x40000054,
    kp_multiply = 0x40000055,
    kp_minus = 0x40000056,
    kp_plus = 0x40000057,
    kp_enter = 0x40000058,
    kp_1 = 0x40000059,
    kp_2 = 0x4000005A,
    kp_3 = 0x4000005B,
    kp_4 = 0x4000005C,
    kp_5 = 0x4000005D,
    kp_6 = 0x4000005E,
    kp_7 = 0x4000005F,
    kp_8 = 0x40000060,
    kp_9 = 0x40000061,
    kp_0 = 0x40000062,
    kp_period = 0x40000063,
    application = 0x40000065,
    power = 0x40000066,
    kp_equals = 0x40000067,
    f13 = 0x40000068,
    f14 = 0x40000069,
    f15 = 0x4000006A,
    f16 = 0x4000006B,
    f17 = 0x4000006C,
    f18 = 0x4000006D,
    f19 = 0x4000006E,
    f20 = 0x4000006F,
    f21 = 0x40000070,
    f22 = 0x40000071,
    f23 = 0x40000072,
    f24 = 0x40000073,
    execute = 0x40000074,
    help = 0x40000075,
    menu = 0x40000076,
    select = 0x40000077,
    stop = 0x40000078,
    again = 0x40000079,
    undo = 0x4000007A,
    cut = 0x4000007B,
    copy = 0x4000007C,
    paste = 0x4000007D,
    find = 0x4000007E,
    mute = 0x4000007F,
    volumeup = 0x40000080,
    volumedown = 0x40000081,
    kp_comma = 0x40000085,
    kp_equalsas400 = 0x40000086,
    alterase = 0x40000099,
    sysreq = 0x4000009A,
    cancel = 0x4000009B,
    clear = 0x4000009C,
    prior = 0x4000009D,
    return2 = 0x4000009E,
    separator = 0x4000009F,
    out = 0x400000A0,
    oper = 0x400000A1,
    clearagain = 0x400000A2,
    crsel = 0x400000A3,
    exsel = 0x400000A4,
    front = 0x400000A5,
    kp_00 = 0x400000B0,
    kp_000 = 0x400000B1,
    thousandsseparator = 0x400000B2,
    decimalseparator = 0x400000B3,
    currencyunit = 0x400000B4,
    currencysubunit = 0x400000B5,
    kp_leftparen = 0x400000B6,
    kp_rightparen = 0x400000B7,
    kp_leftbrace = 0x400000B8,
    kp_rightbrace = 0x400000B9,
    kp_tab = 0x400000BA,
    kp_backspace = 0x400000BB,
    kp_a = 0x400000BC,
    kp_b = 0x400000BD,
    kp_c = 0x400000BE,
    kp_d = 0x400000BF,
    kp_e = 0x400000C0,
    kp_f = 0x400000C1,
    kp_xor = 0x400000C2,
    kp_power = 0x400000C3,
    kp_percent = 0x400000C4,
    kp_less = 0x400000C5,
    kp_greater = 0x400000C6,
    kp_ampersand = 0x400000C7,
    kp_dblampersand = 0x400000C8,
    kp_verticalbar = 0x400000C9,
    kp_dblverticalbar = 0x400000CA,
    kp_colon = 0x400000CB,
    kp_hash = 0x400000CC,
    kp_space = 0x400000CD,
    kp_at = 0x400000CE,
    kp_exclam = 0x400000CF,
    kp_memstore = 0x400000D0,
    kp_memrecall = 0x400000D1,
    kp_memclear = 0x400000D2,
    kp_memadd = 0x400000D3,
    kp_memsubtract = 0x400000D4,
    kp_memmultiply = 0x400000D5,
    kp_memdivide = 0x400000D6,
    kp_plusminus = 0x400000D7,
    kp_clear = 0x400000D8,
    kp_clearentry = 0x400000D9,
    kp_binary = 0x400000DA,
    kp_octal = 0x400000DB,
    kp_decimal = 0x400000DC,
    kp_hexadecimal = 0x400000DD,
    lctrl = 0x400000E0,
    lshift = 0x400000E1,
    lalt = 0x400000E2,
    lgui = 0x400000E3,
    rctrl = 0x400000E4,
    rshift = 0x400000E5,
    ralt = 0x400000E6,
    rgui = 0x400000E7,
    mode = 0x40000101,
    sleep = 0x40000102,
    wake = 0x40000103,
    channel_increment = 0x40000104,
    channel_decrement = 0x40000105,
    media_play = 0x40000106,
    media_pause = 0x40000107,
    media_record = 0x40000108,
    media_fast_forward = 0x40000109,
    media_rewind = 0x4000010A,
    media_next_track = 0x4000010B,
    media_previous_track = 0x4000010C,
    media_stop = 0x4000010D,
    media_eject = 0x4000010E,
    media_play_pause = 0x4000010F,
    media_select = 0x40000110,
    ac_new = 0x40000111,
    ac_open = 0x40000112,
    ac_close = 0x40000113,
    ac_exit = 0x40000114,
    ac_save = 0x40000115,
    ac_print = 0x40000116,
    ac_properties = 0x40000117,
    ac_search = 0x40000118,
    ac_home = 0x40000119,
    ac_back = 0x4000011A,
    ac_forward = 0x4000011B,
    ac_stop = 0x4000011C,
    ac_refresh = 0x4000011D,
    ac_bookmarks = 0x4000011E,
    softleft = 0x4000011F,
    softright = 0x40000120,
    call = 0x40000121,
    endcall = 0x40000122,
    left_tab = 0x20000001,
    level5_shift = 0x20000002,
    multi_key_compose = 0x20000003,
    lmeta = 0x20000004,
    rmeta = 0x20000005,
    lhyper = 0x20000006,
    rhyper = 0x20000007,
    _,

    pub const extended_mask: u32 = 1 << 29;
    pub const scancode_mask: u32 = 1 << 30;

    // Remaining Keycode methods are declared in keyboard.zig.

    pub fn from_scancode(scancode: Scancode) Keycode {
        return @fromBackingInt(@intCast(@as(u32, @backingInt(scancode)) | scancode_mask));
    }

    /// The scancode carried by a non-printable keycode, if this is one.
    pub fn masked_scancode(self: Keycode) ?Scancode {
        const raw = @backingInt(self);
        if (raw & scancode_mask == 0) return null;
        const value = raw & ~scancode_mask;
        return if (value < 512) @fromBackingInt(@intCast(value)) else null;
    }

    /// The Unicode codepoint of a printable keycode. Unknown, masked,
    /// extended, surrogate and out-of-range values are null.
    pub fn codepoint(self: Keycode) ?u21 {
        const raw = @backingInt(self);
        if (raw == 0 or raw > 0x10FFFF or (raw >= 0xD800 and raw <= 0xDFFF)) return null;
        return @intCast(raw);
    }

    /// Human-readable key name. Printable keys are named by the symbol printed
    /// on the key: a lowercase letter becomes its capital when the layout's
    /// Shift level produces exactly its single-codepoint case pair. Latin-1
    /// punctuation 0x80-0xBF, U+00D7 and U+00F7 are never capitalized.
    ///
    /// The result borrows either static data, `context.names` overrides or
    /// `buffer`. Upstream instead interned each generated string forever.
    pub fn name(self: Keycode, context: NameContext, buffer: *[4]u8) []const u8 {
        const raw = @backingInt(self);
        if (raw & scancode_mask != 0) {
            const scancode = self.masked_scancode() orelse return "";
            return context.names.name(scancode);
        }
        if (raw & extended_mask != 0) {
            const index = raw & ~extended_mask;
            return if (index > 0 and index <= extended_key_names.len) extended_key_names[index - 1] else "";
        }
        switch (self) {
            .@"return" => return context.names.name(.@"return"),
            .escape => return context.names.name(.escape),
            .backspace => return context.names.name(.backspace),
            .tab => return context.names.name(.tab),
            .space => return context.names.name(.space),
            .delete => return context.names.name(.delete),
            else => {},
        }
        var key = self;
        if ((raw >= 'a' and raw <= 'z') or (raw > 0xBF and raw != 0xD7 and raw != 0xF7)) {
            const found = keymap_chord(context.keymap, key);
            if (found.scancode != .unknown and !found.modifiers.shift() and !found.modifiers.level5) {
                const capital = keymap_keycode(context.keymap, found.scancode, Modifiers.shift_keys.either(.{ .mode = found.modifiers.mode }));
                if (capital != key) if (capital.codepoint()) |point| {
                    const folded = casefold.fold(point);
                    if (folded.len == 1 and folded.buffer[0] == raw) key = capital;
                };
            }
        }
        const point = key.codepoint() orelse return "";
        const length = std.unicode.utf8Encode(point, buffer) catch return "";
        return buffer[0..length];
    }

    /// Parses a key name. A single UTF-8 character names its keycode; if the
    /// layout reaches it with Shift or Caps Lock, the unshifted keycode is
    /// returned instead (so "A" names `a`). Otherwise extended and scancode
    /// names are matched case-insensitively. Unmatched names are `unknown`.
    /// Malformed UTF-8 never names a character, unlike upstream's unchecked
    /// byte decoding.
    pub fn from_name(text: []const u8, context: NameContext) Keycode {
        if (text.len == 0) return .unknown;
        const single: ?u21 = blk: {
            const length = std.unicode.utf8ByteSequenceLength(text[0]) catch break :blk null;
            if (length != text.len) break :blk null;
            break :blk std.unicode.utf8Decode(text) catch null;
        };
        if (single) |point| if (point != 0) {
            const key: Keycode = @fromBackingInt(@intCast(point));
            const found = keymap_chord(context.keymap, key);
            if (found.scancode != .unknown and (found.modifiers.shift() or found.modifiers.caps))
                return keymap_keycode(context.keymap, found.scancode, .none);
            return key;
        };
        for (extended_key_names, 1..) |candidate, index| {
            if (names_equal(candidate, text)) return @fromBackingInt(@intCast(@as(u32, @intCast(index)) | extended_mask));
        }
        const scancode = context.names.scancode_from_name(text) orelse return .unknown;
        return keymap_keycode(context.keymap, scancode, .none);
    }

    /// Maps keypad keycodes to their main-keyboard equivalents. With Num Lock
    /// off, keypad digits and period become navigation keys.
    pub fn without_numpad(self: Keycode, num_lock: bool) Keycode {
        return switch (self) {
            .kp_divide => .slash,
            .kp_multiply => .asterisk,
            .kp_minus => .minus,
            .kp_plus => .plus,
            .kp_enter => .@"return",
            .kp_1 => if (num_lock) .@"1" else .end,
            .kp_2 => if (num_lock) .@"2" else .down,
            .kp_3 => if (num_lock) .@"3" else .pagedown,
            .kp_4 => if (num_lock) .@"4" else .left,
            .kp_5 => if (num_lock) .@"5" else .clear,
            .kp_6 => if (num_lock) .@"6" else .right,
            .kp_7 => if (num_lock) .@"7" else .home,
            .kp_8 => if (num_lock) .@"8" else .up,
            .kp_9 => if (num_lock) .@"9" else .pageup,
            .kp_0 => if (num_lock) .@"0" else .insert,
            .kp_period => if (num_lock) .period else .delete,
            .kp_equals, .kp_equalsas400 => .equals,
            .kp_comma => .comma,
            .kp_leftparen => .leftparen,
            .kp_rightparen => .rightparen,
            .kp_leftbrace => .leftbrace,
            .kp_rightbrace => .rightbrace,
            .kp_tab => .tab,
            .kp_backspace => .backspace,
            .kp_a => .a,
            .kp_b => .b,
            .kp_c => .c,
            .kp_d => .d,
            .kp_e => .e,
            .kp_f => .f,
            .kp_percent => .percent,
            .kp_less => .less,
            .kp_greater => .greater,
            .kp_ampersand => .ampersand,
            .kp_colon => .colon,
            .kp_hash => .hash,
            .kp_space => .space,
            .kp_at => .at,
            .kp_exclam => .exclaim,
            .kp_plusminus => .plusminus,
            else => self,
        };
    }
};

fn names_equal(a: []const u8, b: []const u8) bool {
    return casefold.eql(a, b) catch false;
}

/// Keycode policy for key events, replacing SDL_HINT_KEYCODE_OPTIONS. The
/// defaults equal upstream's default hint value.
pub const EventOptions = struct {
    /// Report keypad keys as their main-keyboard equivalents.
    hide_numpad: bool = false,
    /// On layouts with symbols on the unshifted number row, report digits.
    french_numbers: bool = true,
    /// On layouts whose letters are not Latin, use the default QWERTY keymap.
    latin_letters: bool = true,
};

/// The keymap that key events and key names should consult. Thai layouts are
/// QWERTY plus Thai characters, and non-Latin layouts may opt into QWERTY, so
/// both resolve to null (the default layout). Pass the result as
/// NameContext.keymap to name keys consistently with events.
pub fn effective_keymap(keymap: ?*const Keymap, layout: Layout, options: EventOptions) ?*const Keymap {
    const map = keymap orelse return null;
    if (layout.thai) return null;
    if (options.latin_letters and !layout.latin_letters) return null;
    return map;
}

/// Keycode reported in a key event. Modifiers are deliberately not applied
/// (events report the unshifted key); only Num Lock affects hidden numpad keys.
/// `layout` is the classification of `keymap` (Layout of the default keymap
/// when null). Compute it once per keymap change with Keymap.layout.
pub fn event_keycode(keymap: ?*const Keymap, layout: Layout, scancode: Scancode, modifiers: Modifiers, options: EventOptions) Keycode {
    const map = effective_keymap(keymap, layout, options);
    var state: Modifiers = .none;
    const raw = @backingInt(scancode);
    if (map != null and options.french_numbers and layout.french_numbers and raw >= @backingInt(Scancode.@"1") and raw <= @backingInt(Scancode.@"0"))
        state = Modifiers.shift_keys;
    const key = keymap_keycode(map, scancode, state);
    return if (options.hide_numpad) key.without_numpad(modifiers.num) else key;
}

/// Classification of the built-in layout, for callers without a keymap.
pub const default_layout: Layout = .{ .french_numbers = false, .latin_letters = true, .thai = false };
