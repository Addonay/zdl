//! Pressed-key, modifier-lock and key-source tracking for one logical keyboard.
//! Altered native port of the key-state parts of SDL_keyboard.c
//! (SDL_SendKeyboardKeyInternal, SDL_SendKeyboardUnicodeKey,
//! SDL_SendKeyboardKeyAndKeycode, SDL_ReleaseAutoReleaseKeys, SDL_ResetKeyboard,
//! SDL_GetKeyboardState, SDL_SetModState).
//!
//! There is no global keyboard, event queue, clock or window: each input call
//! returns the transition SDL would have posted (or null where SDL drops it) and
//! the caller turns it into an event. Time values use the shared monotonic
//! nanosecond domain and are supplied by the caller.
//! Upstream's re-entrant release loops become explicit iterators.
const std = @import("std");
const timestamp = @import("../events/timestamp.zig");
const keyboard = @import("keyboard.zig");
const Scancode = keyboard.Scancode;
const Keycode = keyboard.Keycode;
const Modifiers = keyboard.Modifiers;

/// Where a key press came from. A key held by several sources is released
/// once, by whichever source releases it first, as upstream.
pub const Source = enum { hardware, virtual, autorelease };

const Sources = packed struct(u3) {
    hardware: bool = false,
    virtual: bool = false,
    autorelease: bool = false,

    fn of(source: Source) Sources {
        return switch (source) {
            .hardware => .{ .hardware = true },
            .virtual => .{ .virtual = true },
            .autorelease => .{ .autorelease = true },
        };
    }
    fn contains(self: Sources, other: Sources) bool {
        return @backingInt(self) & @backingInt(other) != 0;
    }
    fn either(self: Sources, other: Sources) Sources {
        return @fromBackingInt(@backingInt(self) | @backingInt(other));
    }
};

/// Window state that affects Alt+Tab handling for a grabbed fullscreen window.
pub const Focus = struct {
    keyboard_grabbed: bool = false,
    fullscreen: bool = false,
};

/// One physical or synthesized key change.
pub const KeyInput = struct {
    scancode: Scancode,
    down: bool,
    /// Platform key code, reported unchanged. With an unknown scancode a
    /// nonzero raw code still produces a transition, as upstream.
    raw: u16 = 0,
    source: Source = .hardware,
    /// Leave modifier state untouched (backends that track it themselves).
    ignore_modifiers: bool = false,
    /// Caller clock in nanoseconds, used for hardware-activity tracking.
    now_ns: timestamp.Timestamp = 0,
    focus: ?Focus = null,
};

/// The key event SDL would post for an accepted input.
pub const KeyTransition = struct {
    scancode: Scancode,
    keycode: Keycode,
    /// Modifier state after this transition was applied.
    modifiers: Modifiers,
    raw: u16,
    down: bool,
    repeat: bool,
    /// Alt+Tab pressed while the focused window holds a keyboard grab in
    /// fullscreen: upstream minimizes that window so the user can escape.
    escape_grab: bool = false,
};

/// Options replacing hints consulted by upstream keyboard handling.
pub const Options = struct {
    event: keyboard.EventOptions = .{},
    /// SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED.
    allow_alt_tab_while_grabbed: bool = true,
    /// Hardware keyboards count as active this long after their last key.
    hardware_active_ns: u64 = 250 * std.time.ns_per_ms,
};

/// Keyboard state machine. Borrows an optional keymap that must outlive it
/// (or be replaced with set_keymap before it is freed). Not synchronized.
pub const KeyboardState = struct {
    keymap: ?*keyboard.Keymap = null,
    layout: keyboard.Layout = keyboard.default_layout,
    options: Options = .{},
    pressed: std.bit_set.Static(512) = .empty,
    sources: [512]Sources = @splat(.{}),
    modifiers: Modifiers = .none,
    hardware_until_ns: ?u64 = null,
    autorelease_pending: bool = false,

    /// Changes the active layout and re-derives its classification. Upstream
    /// also posted a keymap-changed event; callers emit that themselves.
    pub fn set_keymap(self: *KeyboardState, keymap: ?*keyboard.Keymap) void {
        self.keymap = keymap;
        self.layout = if (keymap) |map| map.layout() else keyboard.default_layout;
    }

    /// Keymap that key names should use, consistent with reported keycodes.
    pub fn name_keymap(self: *const KeyboardState) ?*const keyboard.Keymap {
        return keyboard.effective_keymap(self.keymap, self.layout, self.options.event);
    }

    pub fn is_pressed(self: *const KeyboardState, scancode: Scancode) bool {
        return self.pressed.isSet(@backingInt(scancode));
    }

    /// Replaces modifier state without generating transitions.
    pub fn set_modifiers(self: *KeyboardState, modifiers: Modifiers) void {
        self.modifiers = modifiers;
    }

    /// Sets or clears modifiers without generating transitions.
    pub fn toggle_modifiers(self: *KeyboardState, modifiers: Modifiers, on: bool) void {
        self.modifiers = if (on) self.modifiers.either(modifiers) else self.modifiers.without(modifiers);
    }

    /// True while a hardware key was seen within Options.hardware_active_ns.
    pub fn hardware_active(self: *const KeyboardState, now_ns: timestamp.Timestamp) bool {
        const until = self.hardware_until_ns orelse return false;
        return now_ns < until;
    }

    fn event_keycode(self: *const KeyboardState, scancode: Scancode) Keycode {
        const map: ?*const keyboard.Keymap = self.keymap;
        return keyboard.event_keycode(map, self.layout, scancode, self.modifiers, self.options.event);
    }

    /// Applies one key change. Returns null when upstream would drop it: a
    /// release of an unpressed key, a second source pressing a held key, or an
    /// unknown scancode with no raw code.
    pub fn key(self: *KeyboardState, input: KeyInput) ?KeyTransition {
        var repeat = false;
        var keycode: Keycode = .unknown;
        const source = Sources.of(input.source);
        const index = @backingInt(input.scancode);
        if (input.scancode != .unknown) {
            if (input.down) {
                if (self.pressed.isSet(index)) {
                    if (!self.sources[index].contains(source)) {
                        self.sources[index] = self.sources[index].either(source);
                        return null;
                    }
                    repeat = true;
                }
                self.sources[index] = self.sources[index].either(source);
            } else {
                if (!self.pressed.isSet(index)) return null;
                self.sources[index] = .{};
            }
            self.pressed.setValue(index, input.down);
            keycode = self.event_keycode(input.scancode);
        } else if (input.raw == 0) {
            return null;
        }

        switch (input.source) {
            .hardware => self.hardware_until_ns = input.now_ns +| self.options.hardware_active_ns,
            .autorelease => self.autorelease_pending = true,
            .virtual => {},
        }

        if (!input.ignore_modifiers and !repeat) {
            const modifier: Modifiers = switch (keycode) {
                .lctrl => .{ .left_ctrl = true },
                .rctrl => .{ .right_ctrl = true },
                .lshift => .{ .left_shift = true },
                .rshift => .{ .right_shift = true },
                .lalt => .{ .left_alt = true },
                .ralt => .{ .right_alt = true },
                .lgui => .{ .left_gui = true },
                .rgui => .{ .right_gui = true },
                .mode => .{ .mode = true },
                else => .none,
            };
            if (input.down) {
                switch (keycode) {
                    .numlockclear => self.modifiers.num = !self.modifiers.num,
                    .capslock => self.modifiers.caps = !self.modifiers.caps,
                    .scrolllock => self.modifiers.scroll = !self.modifiers.scroll,
                    else => self.modifiers = self.modifiers.either(modifier),
                }
            } else {
                self.modifiers = self.modifiers.without(modifier);
            }
        }

        var transition: KeyTransition = .{
            .scancode = input.scancode,
            .keycode = keycode,
            .modifiers = self.modifiers,
            .raw = input.raw,
            .down = input.down,
            .repeat = repeat,
        };
        if (keycode == .tab and input.down and self.modifiers.alt() and self.options.allow_alt_tab_while_grabbed) {
            if (input.focus) |focus| transition.escape_grab = focus.keyboard_grabbed and focus.fullscreen;
        }
        return transition;
    }

    /// Records the platform-reported keycode for a pressed key in the borrowed
    /// keymap under the current modifiers, then applies the key change. A
    /// press without a keymap applies the change only.
    pub fn key_with_keycode(self: *KeyboardState, input: KeyInput, keycode: Keycode) std.mem.Allocator.Error!?KeyTransition {
        if (input.down) if (self.keymap) |map| try map.set(input.scancode, self.modifiers, keycode);
        return self.key(input);
    }

    /// Synthesizes the transitions for typing one character (Shift press,
    /// key press, key release, Shift release as needed) into `out` and returns
    /// the filled prefix. Characters the keymap lacks are assigned a reserved
    /// scancode in the keymap, as upstream; that requires a keymap.
    pub fn unicode_key(self: *KeyboardState, character: u21, now_ns: timestamp.Timestamp, out: *[4]KeyTransition) error{ OutOfMemory, NoKeymap }![]KeyTransition {
        const point: u32 = if (character == '\n') @backingInt(Keycode.@"return") else character;
        const key_value: Keycode = @fromBackingInt(point);
        var chord = if (self.keymap) |map| map.chord(key_value) else keyboard.default_chord(key_value);
        if (chord.scancode == .unknown and point < Keycode.scancode_mask) {
            const map = self.keymap orelse return error.NoKeymap;
            chord.scancode = map.next_reserved_scancode();
            try map.set(chord.scancode, chord.modifiers, key_value);
        }
        var count: usize = 0;
        const shifted = chord.modifiers.shift();
        const steps = [_]struct { scancode: Scancode, down: bool, needs_shift: bool }{
            .{ .scancode = .lshift, .down = true, .needs_shift = true },
            .{ .scancode = chord.scancode, .down = true, .needs_shift = false },
            .{ .scancode = chord.scancode, .down = false, .needs_shift = false },
            .{ .scancode = .lshift, .down = false, .needs_shift = true },
        };
        for (steps) |step| {
            if (step.needs_shift and !shifted) continue;
            if (self.key(.{ .scancode = step.scancode, .down = step.down, .source = .virtual, .now_ns = now_ns })) |transition| {
                out[count] = transition;
                count += 1;
            }
        }
        return out[0..count];
    }

    /// Iterates releases of keys held only by the auto-release source. Call
    /// once per frame, like SDL_ReleaseAutoReleaseKeys; it also expires the
    /// hardware-activity window.
    pub fn release_autoreleased(self: *KeyboardState, now_ns: timestamp.Timestamp) Releases {
        if (self.hardware_until_ns) |until| if (now_ns >= until) {
            self.hardware_until_ns = null;
        };
        const pending = self.autorelease_pending;
        self.autorelease_pending = false;
        return .{ .state = self, .only_autorelease = true, .index = if (pending) 0 else 512, .now_ns = now_ns };
    }

    /// Iterates releases of every pressed key (SDL_ResetKeyboard), for example
    /// when focus is lost.
    /// Releases are reported as hardware input at `now_ns`, as upstream.
    pub fn reset(self: *KeyboardState, now_ns: timestamp.Timestamp) Releases {
        return .{ .state = self, .only_autorelease = false, .index = 0, .now_ns = now_ns };
    }

    pub const Releases = struct {
        state: *KeyboardState,
        only_autorelease: bool,
        index: usize,
        now_ns: timestamp.Timestamp,

        pub fn next(self: *Releases) ?KeyTransition {
            while (self.index < 512) {
                const index = self.index;
                self.index += 1;
                if (!self.state.pressed.isSet(index)) continue;
                const held = self.state.sources[index];
                const source: Source = if (self.only_autorelease) blk: {
                    if (@backingInt(held) != @backingInt(Sources.of(.autorelease))) continue;
                    break :blk .autorelease;
                } else .hardware;
                // Upstream re-armed the pending flag through its normal send
                // path; consuming here keeps iteration finite.
                const transition = self.state.key(.{ .scancode = @fromBackingInt(@intCast(index)), .down = false, .source = source, .now_ns = self.now_ns });
                if (self.only_autorelease) self.state.autorelease_pending = false;
                if (transition) |value| return value;
            }
            return null;
        }
    };
};
