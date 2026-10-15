//! SDL gamepad layer: mapping strings, binding parsing, the mapping database
//! with SDL's GUID matching rules, gamepad events and queries computed through
//! bindings, controller types, face styles and button labels.
//!
//! Port of SDL_gamepad.c and the gamepad-related parts of SDL_joystick.c.
//! Platform backends (HIDAPI, RawInput, WGI, XInput, Android) are not ported;
//! their mapping generators are pending. Their GUID checks are provided by
//! `joystick.guid_driver`.
//!
//! Mapping string format: `GUID,name,elements...` where an element is
//! `output:input`. Output names are the gamepad buttons and axes below. Input is
//! `bN` (button), `aN` (axis, with `+`/`-` half-axis and `~` inversion) or `hN.M`
//! (hat N, bit M). Fields `platform:`, `type:`, `face:`, `crc:` and `hint:` carry
//! metadata. Elements that do not parse are ignored, as SDL does.
//!
//! Ownership: `Database` owns mappings it copied (`owned = true`). Built-in
//! mappings borrow the static strings from `gamepad_db.zig`. A `Gamepad` owns
//! its binding list and per-axis/per-hat tracking arrays.
//!
//! Deliberate differences from SDL:
//! - Guide-button delay uses event timestamps (ns) instead of `SDL_GetTicks`.
//! - Hint values come from `Environment`, not SDL's global hint table.
//! - The file loader requires a `platform:` field as SDL does; lines without
//!   one are skipped.
//! - Auto-generated mappings for unknown devices are not ported (pending).
const std = @import("std");
const joystick = @import("joystick.zig");
const gamepad_db = @import("gamepad_db.zig");

pub const Guid = joystick.Guid;

/// Nanoseconds in one millisecond.
const ns_per_ms: u64 = 1_000_000;
/// A guide press released sooner than this is delayed (SDL_MINIMUM_GUIDE_BUTTON_DELAY_MS).
const minimum_guide_delay_ns: u64 = 250 * ns_per_ms;

/// Standard gamepad buttons, numbered as SDL_GamepadButton.
pub const Button = enum(u8) {
    south,
    east,
    west,
    north,
    back,
    guide,
    start,
    left_stick,
    right_stick,
    left_shoulder,
    right_shoulder,
    dpad_up,
    dpad_down,
    dpad_left,
    dpad_right,
    misc1,
    paddle1,
    paddle2,
    paddle3,
    paddle4,
    touchpad,
    misc2,
    misc3,
    misc4,
    misc5,
    misc6,

    const names = [_][]const u8{
        "a",          "b",            "x",             "y",
        "back",       "guide",        "start",         "leftstick",
        "rightstick", "leftshoulder", "rightshoulder", "dpup",
        "dpdown",     "dpleft",       "dpright",       "misc1",
        "paddle1",    "paddle2",      "paddle3",       "paddle4",
        "touchpad",   "misc2",        "misc3",         "misc4",
        "misc5",      "misc6",
    };

    /// Mapping-string name.
    pub fn name(self: Button) []const u8 {
        return names[@backingInt(self)];
    }

    /// Parses a mapping-string name (case-insensitive). With `axby`/`baxy` label
    /// hints, the face buttons are swapped to positional names, as SDL does.
    pub fn from_name(text: []const u8, axby: bool, baxy: bool) ?Button {
        for (names, 0..) |candidate, i| {
            if (!std.ascii.eqlIgnoreCase(text, candidate)) continue;
            var button: Button = @fromBackingInt(@intCast(i));
            if (axby) {
                button = switch (button) {
                    .east => .west,
                    .west => .east,
                    else => button,
                };
            } else if (baxy) {
                button = switch (button) {
                    .south => .east,
                    .east => .south,
                    .west => .north,
                    .north => .west,
                    else => button,
                };
            }
            return button;
        }
        return null;
    }
};

/// Analog axes, numbered as SDL_GamepadAxis.
pub const Axis = enum(u8) {
    left_x,
    left_y,
    right_x,
    right_y,
    left_trigger,
    right_trigger,

    const names = [_][]const u8{ "leftx", "lefty", "rightx", "righty", "lefttrigger", "righttrigger" };

    pub fn name(self: Axis) []const u8 {
        return names[@backingInt(self)];
    }

    /// Case-insensitive lookup of a mapping-string axis name.
    pub fn from_name(text: []const u8) ?Axis {
        for (names, 0..) |candidate, i| {
            if (std.ascii.eqlIgnoreCase(text, candidate)) return @fromBackingInt(@intCast(i));
        }
        return null;
    }

    /// Triggers rest at zero and are unipolar, so mappings use 0..max for them.
    pub fn is_trigger(self: Axis) bool {
        return self == .left_trigger or self == .right_trigger;
    }
};

/// Gamepad model, numbered as SDL_GamepadType.
pub const GamepadType = enum(u8) {
    unknown,
    standard,
    xbox360,
    xbox_one,
    ps3,
    ps4,
    ps5,
    switch_pro,
    joycon_left,
    joycon_right,
    joycon_pair,
    gamecube,
    steam,

    const names = [_][]const u8{
        "unknown",   "standard",   "xbox360",     "xboxone",    "ps3",      "ps4",   "ps5",
        "switchpro", "joyconleft", "joyconright", "joyconpair", "gamecube", "steam",
    };

    pub fn name(self: GamepadType) []const u8 {
        return names[@backingInt(self)];
    }

    /// Parses a `type:` field value. Unknown names give `.unknown`.
    pub fn from_name(text: []const u8) GamepadType {
        const trimmed = if (text.len > 0 and (text[0] == '+' or text[0] == '-')) text[1..] else text;
        for (names, 0..) |candidate, i| {
            if (std.ascii.eqlIgnoreCase(trimmed, candidate)) return @fromBackingInt(@intCast(i));
        }
        return .unknown;
    }
};

/// Which symbols a controller prints on its face buttons.
pub const FaceStyle = enum(u8) {
    unknown,
    abxy,
    axby,
    bayx,
    sony,

    pub fn from_name(text: []const u8) FaceStyle {
        if (std.mem.eql(u8, text, "abxy")) return .abxy;
        if (std.mem.eql(u8, text, "axby")) return .axby;
        if (std.mem.eql(u8, text, "bayx")) return .bayx;
        if (std.mem.eql(u8, text, "sony")) return .sony;
        return .unknown;
    }

    /// Default style for a model (SDL_GetGamepadFaceStyleForGamepadType).
    pub fn for_type(kind: GamepadType) FaceStyle {
        return switch (kind) {
            .ps3, .ps4, .ps5 => .sony,
            .switch_pro, .joycon_left, .joycon_right, .joycon_pair => .bayx,
            .gamecube => .axby,
            else => .abxy,
        };
    }
};

/// Printed label of a face button.
pub const ButtonLabel = enum(u8) {
    unknown,
    a,
    b,
    x,
    y,
    cross,
    circle,
    square,
    triangle,

    /// Label printed on `button` for `style`. Non-face buttons are unknown.
    pub fn for_face_style(style: FaceStyle, button: Button) ButtonLabel {
        return switch (style) {
            .abxy => switch (button) {
                .south => .a,
                .east => .b,
                .west => .x,
                .north => .y,
                else => .unknown,
            },
            .axby => switch (button) {
                .south => .a,
                .east => .x,
                .west => .b,
                .north => .y,
                else => .unknown,
            },
            .bayx => switch (button) {
                .south => .b,
                .east => .a,
                .west => .y,
                .north => .x,
                else => .unknown,
            },
            .sony => switch (button) {
                .south => .cross,
                .east => .circle,
                .west => .square,
                .north => .triangle,
                else => .unknown,
            },
            .unknown => .unknown,
        };
    }

    pub fn for_type(kind: GamepadType, button: Button) ButtonLabel {
        return for_face_style(FaceStyle.for_type(kind), button);
    }
};

/// Source of an input value: an axis range, a button, or a hat bit.
pub const Input = union(enum) {
    /// Axis `index` yields a value in [min, max] (inverted when min > max).
    axis: struct { index: usize, min: i16, max: i16 },
    button: usize,
    hat: struct { index: usize, mask: u8 },
};

/// Gamepad output: an axis range or a button.
pub const Output = union(enum) {
    axis: struct { axis: Axis, min: i16, max: i16 },
    button: Button,
};

/// One parsed mapping element.
pub const Binding = struct {
    input: Input,
    output: Output,

    /// Bindings are equal when inputs and outputs match exactly, as SDL's memcmp.
    pub fn eql(a: Binding, b: Binding) bool {
        return std.meta.eql(a.input, b.input) and std.meta.eql(a.output, b.output);
    }
};

const axis_min = joystick.axis_min;
const axis_max = joystick.axis_max;

/// Leading decimal digits of `text`, as C's atoi (stops at the first non-digit).
fn leading_int(text: []const u8) usize {
    var value: usize = 0;
    for (text) |c| {
        if (c < '0' or c > '9') break;
        value = value *| 10 +| (c - '0');
    }
    return value;
}

/// Parses one element (SDL_PrivateParseGamepadElement). Returns null for elements
/// that name an unknown output or input, and for the metadata fields.
fn parse_element(game: []const u8, input_text: []const u8, axby: bool, baxy: bool) ?Binding {
    var rest = game;
    var half_output: u8 = 0;
    if (rest.len > 0 and (rest[0] == '+' or rest[0] == '-')) {
        half_output = rest[0];
        rest = rest[1..];
    }

    var output: Output = undefined;
    if (Axis.from_name(rest)) |axis| {
        output = .{ .axis = .{ .axis = axis, .min = 0, .max = 0 } };
        const range: struct { min: i16, max: i16 } = if (axis.is_trigger() or half_output == '+')
            .{ .min = 0, .max = axis_max }
        else if (half_output == '-')
            .{ .min = 0, .max = axis_min }
        else
            .{ .min = axis_min, .max = axis_max };
        output.axis.min = range.min;
        output.axis.max = range.max;
    } else if (Button.from_name(rest, axby, baxy)) |button| {
        output = .{ .button = button };
    } else {
        return null;
    }

    if (input_text.len == 0) return null;
    var input_rest = input_text;
    var half_input: u8 = 0;
    if (input_rest[0] == '+' or input_rest[0] == '-') {
        half_input = input_rest[0];
        input_rest = input_rest[1..];
    }
    if (input_rest.len == 0) return null;
    const invert = input_rest[input_rest.len - 1] == '~';

    var input: Input = undefined;
    if (input_rest.len >= 2 and input_rest[0] == 'a' and std.ascii.isDigit(input_rest[1])) {
        var min: i16 = axis_min;
        var max: i16 = axis_max;
        if (half_input == '+') {
            min = 0;
            max = axis_max;
        } else if (half_input == '-') {
            min = 0;
            max = axis_min;
        }
        if (invert) std.mem.swap(i16, &min, &max);
        input = .{ .axis = .{ .index = leading_int(input_rest[1..]), .min = min, .max = max } };
    } else if (input_rest.len >= 2 and input_rest[0] == 'b' and std.ascii.isDigit(input_rest[1])) {
        input = .{ .button = leading_int(input_rest[1..]) };
    } else if (input_rest.len >= 4 and input_rest[0] == 'h' and std.ascii.isDigit(input_rest[1]) and
        input_rest[2] == '.' and std.ascii.isDigit(input_rest[3]))
    {
        input = .{ .hat = .{
            .index = leading_int(input_rest[1..]),
            .mask = @intCast(@min(leading_int(input_rest[3..]), 0xff)),
        } };
    } else {
        return null;
    }
    return .{ .input = input, .output = output };
}

/// Parses the element list of a mapping (the text after the third comma) into
/// bindings, dropping exact duplicates. Caller frees the returned slice.
/// Labels are swapped when the mapping carries the GameCube/Button label hints.
pub fn parse_bindings(allocator: std.mem.Allocator, mapping: []const u8) std.mem.Allocator.Error![]Binding {
    const axby = std.mem.indexOf(u8, mapping, ",hint:SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS:=1") != null;
    const baxy = std.mem.indexOf(u8, mapping, ",hint:SDL_GAMECONTROLLER_USE_BUTTON_LABELS:=1") != null;

    var list: std.ArrayList(Binding) = .empty;
    errdefer list.deinit(allocator);

    var elements = std.mem.splitScalar(u8, mapping, ',');
    while (elements.next()) |segment| {
        // Spaces are ignored everywhere in an element, as SDL does.
        var stripped_buf: [256]u8 = undefined;
        var stripped_len: usize = 0;
        for (segment) |c| {
            if (c == ' ') continue;
            if (stripped_len == stripped_buf.len) break;
            stripped_buf[stripped_len] = c;
            stripped_len += 1;
        }
        const stripped = stripped_buf[0..stripped_len];
        const colon = std.mem.indexOfScalar(u8, stripped, ':') orelse continue;
        const binding = parse_element(stripped[0..colon], stripped[colon + 1 ..], axby, baxy) orelse continue;
        var duplicate = false;
        for (list.items) |existing| {
            if (existing.eql(binding)) {
                duplicate = true;
                break;
            }
        }
        if (!duplicate) try list.append(allocator, binding);
    }
    return list.toOwnedSlice(allocator);
}

/// Returns the value of `field` (the text after `key`) up to the next comma.
fn field_value(mapping: []const u8, key: []const u8) ?[]const u8 {
    const start = std.mem.indexOf(u8, mapping, key) orelse return null;
    const after = mapping[start + key.len ..];
    const end = std.mem.indexOfScalar(u8, after, ',') orelse after.len;
    return after[0..end];
}

/// Parses leading hexadecimal digits (C strtol base 16 on a 4-char CRC field).
fn parse_hex_u16(text: []const u8) u16 {
    var value: u32 = 0;
    for (text) |c| {
        const digit: u32 = switch (c) {
            '0'...'9' => c - '0',
            'a'...'f' => c - 'a' + 10,
            'A'...'F' => c - 'A' + 10,
            else => break,
        };
        value = value *% 16 +% digit;
    }
    return @truncate(value);
}

/// Mapping priority: a later add replaces an entry only if its priority is equal
/// or higher (SDL_GamepadMappingPriority).
pub const Priority = enum(u8) {
    default = 0,
    api = 1,
    user = 2,
};

/// Host-supplied settings for conditional mapping fields.
pub const Environment = struct {
    /// Platform name matched against `platform:` fields in mapping files.
    platform: []const u8 = "Linux",
    /// Values for `hint:NAME` fields. Unlisted hints use their `:=N` default.
    hints: []const Hint = &.{},

    pub const Hint = struct { name: []const u8, value: bool };

    fn hint_value(self: Environment, name: []const u8, default: bool) bool {
        for (self.hints) |hint| {
            if (std.mem.eql(u8, hint.name, name)) return hint.value;
        }
        return default;
    }
};

/// One mapping in the database.
pub const Entry = struct {
    /// Identifies the device model. The CRC is stored in `mapping` (`crc:` field),
    /// so the GUID's CRC word is zero here.
    guid: Guid,
    name: []const u8,
    mapping: []const u8,
    priority: Priority,
    /// True when `name` and `mapping` are allocated by the database.
    owned: bool,
};

/// Result of adding one mapping string.
pub const AddResult = enum {
    /// A new entry was created.
    added,
    /// An existing entry was replaced.
    replaced,
    /// Matching entry exists with higher priority, or the same text: unchanged.
    kept,
    /// A hint field disabled this mapping, so nothing was stored.
    disabled,
};

pub const AddError = error{ InvalidMapping, OutOfMemory };

/// Gamepad mapping database. Initialize with `init`, add text mappings or built-in
/// ones, and release with `deinit`. Lookup order and matching follow SDL.
pub const Database = struct {
    allocator: std.mem.Allocator,
    entries: std.ArrayList(Entry) = .empty,

    /// Creates a database containing the built-in Linux mappings.
    pub fn init(allocator: std.mem.Allocator) std.mem.Allocator.Error!Database {
        var db: Database = .{ .allocator = allocator };
        errdefer db.deinit();
        for (gamepad_db.linux) |text| {
            _ = db.add_text_unchecked(text, .default) catch |err| switch (err) {
                error.OutOfMemory => return error.OutOfMemory,
                error.InvalidMapping => unreachable, // built-in strings are validated by the generator
            };
        }
        return db;
    }

    pub fn deinit(self: *Database) void {
        for (self.entries.items) |entry| {
            if (entry.owned) {
                self.allocator.free(entry.name);
                self.allocator.free(entry.mapping);
            }
        }
        self.entries.deinit(self.allocator);
        self.* = undefined;
    }

    /// Adds one mapping string (SDL_AddGamepadMapping). Hint fields are evaluated
    /// against `env` and label hints rewrite the mapping to positional buttons.
    pub fn add(self: *Database, text: []const u8, priority: Priority, env: Environment) AddError!AddResult {
        return self.add_text(text, priority, env);
    }

    /// Adds every mapping line in `contents` that has a `platform:` field matching
    /// `env.platform` (SDL_AddGamepadMappingsFromFile). Returns the number added.
    pub fn load_text(self: *Database, contents: []const u8, env: Environment) AddError!usize {
        var count: usize = 0;
        var lines = std.mem.splitScalar(u8, contents, '\n');
        while (lines.next()) |raw| {
            const line = std.mem.trim(u8, raw, " \r\t");
            const platform = field_value(line, "platform:") orelse continue;
            if (platform.len > env.platform.len or
                !std.ascii.eqlIgnoreCase(platform, env.platform[0..platform.len])) continue;
            const result = self.add_text(line, .api, env) catch |err| switch (err) {
                error.InvalidMapping => continue,
                error.OutOfMemory => return error.OutOfMemory,
            };
            if (result == .added or result == .replaced) count += 1;
        }
        return count;
    }

    /// Finds the mapping for `guid` (SDL_PrivateGetGamepadMappingForGUID).
    /// Matching order: version and CRC exact, then without CRC, then without the
    /// version when the GUID uses one. `adding` restricts the search to exact
    /// matches, which is used when inserting a new mapping.
    pub fn find(self: *const Database, guid: Guid, adding: bool) ?*const Entry {
        if (self.match(guid, true, true)) |entry| return entry;
        if (adding) return null;
        if (self.match(guid, true, false)) |entry| return entry;
        if (joystick.guid_uses_version(guid)) {
            if (self.match(guid, false, true)) |entry| return entry;
            if (self.match(guid, false, false)) |entry| return entry;
        }
        return null;
    }

    fn match(self: *const Database, guid: Guid, match_version: bool, exact_crc: bool) ?*const Entry {
        const crc = joystick.guid_info(guid).crc;
        var wanted = guid;
        joystick.set_guid_crc(&wanted, 0);
        if (!match_version) joystick.set_guid_version(&wanted, 0);

        var best: ?*const Entry = null;
        for (self.entries.items) |*entry| {
            var candidate = entry.guid;
            if (std.mem.allEqual(u8, &candidate.data, 0)) continue;
            if (!match_version) joystick.set_guid_version(&candidate, 0);
            if (!std.mem.eql(u8, &wanted.data, &candidate.data)) continue;

            if (field_value(entry.mapping, "crc:")) |_| {
                const mapping_crc = parse_hex_u16(field_value(entry.mapping, "crc:").?);
                if (mapping_crc != crc) continue;
                return entry;
            } else if (crc != 0 and exact_crc) {
                continue;
            }
            if (best == null) best = entry;
        }
        return best;
    }

    fn add_text_unchecked(self: *Database, text: []const u8, priority: Priority) AddError!AddResult {
        return self.add_text(text, priority, .{});
    }

    fn add_text(self: *Database, text: []const u8, priority: Priority, env: Environment) AddError!AddResult {
        const first = std.mem.indexOfScalar(u8, text, ',') orelse return error.InvalidMapping;
        const guid = Guid.parse(text[0..first]) catch return error.InvalidMapping;
        const second_rel = std.mem.indexOfScalar(u8, text[first + 1 ..], ',') orelse return error.InvalidMapping;
        const second = first + 1 + second_rel;
        const name = text[first + 1 .. second];
        var mapping = std.mem.trim(u8, text[second + 1 ..], " \t\r\n");

        // Hint fields. Label hints rewrite the mapping; other hints gate it.
        var rewritten: ?[]u8 = null;
        defer if (rewritten) |buffer| self.allocator.free(buffer);
        if (std.mem.indexOf(u8, mapping, "hint:")) |hint_at| {
            var hint_text = mapping[hint_at + "hint:".len ..];
            const negate = hint_text.len > 0 and hint_text[0] == '!';
            if (negate) hint_text = hint_text[1..];
            const hint_end = std.mem.indexOfAny(u8, hint_text, ",:") orelse hint_text.len;
            const hint_name = hint_text[0..hint_end];
            var default = false;
            if (hint_end + 2 < hint_text.len and hint_text[hint_end] == ':' and hint_text[hint_end + 1] == '=') {
                default = hint_text[hint_end + 2] == '1';
            }
            if (std.mem.eql(u8, hint_name, "SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS")) {
                if (!negate) rewritten = try positional_axby(self.allocator, mapping);
            } else if (std.mem.eql(u8, hint_name, "SDL_GAMECONTROLLER_USE_BUTTON_LABELS")) {
                if (!negate) rewritten = try positional_baxy(self.allocator, mapping);
            } else {
                var value = env.hint_value(hint_name, default);
                if (negate) value = !value;
                if (!value) return .disabled;
            }
            if (rewritten) |buffer| mapping = buffer;
        }

        // CRC reconciliation: the GUID's CRC word and the mapping's crc field must
        // agree. The mapping text is rebuilt when the GUID supplies the CRC.
        var crc_guid = guid;
        const guid_crc = joystick.guid_info(guid).crc;
        var final_mapping: []const u8 = mapping;
        var final_buffer: ?[]u8 = null;
        defer if (final_buffer) |buffer| self.allocator.free(buffer);
        if (guid_crc != 0) {
            final_buffer = try with_crc_field(self.allocator, mapping, guid_crc);
            final_mapping = final_buffer.?;
        } else if (field_value(mapping, "crc:")) |crc_text| {
            const crc = parse_hex_u16(crc_text);
            if (crc != 0) joystick.set_guid_crc(&crc_guid, crc);
        }

        if (self.find(crc_guid, true)) |existing_const| {
            const index = self.index_of(existing_const);
            const existing = &self.entries.items[index];
            if (@backingInt(existing.priority) > @backingInt(priority)) return .kept;
            const owned_name = try self.allocator.dupe(u8, name);
            errdefer self.allocator.free(owned_name);
            const owned_mapping = try self.allocator.dupe(u8, final_mapping);
            if (existing.owned) {
                self.allocator.free(existing.name);
                self.allocator.free(existing.mapping);
            }
            existing.name = owned_name;
            existing.mapping = owned_mapping;
            existing.owned = true;
            existing.priority = priority;
            return .replaced;
        }

        var stored_guid = crc_guid;
        joystick.set_guid_crc(&stored_guid, 0);
        const owned_name = try self.allocator.dupe(u8, name);
        errdefer self.allocator.free(owned_name);
        const owned_mapping = try self.allocator.dupe(u8, final_mapping);
        errdefer self.allocator.free(owned_mapping);
        try self.entries.append(self.allocator, .{
            .guid = stored_guid,
            .name = owned_name,
            .mapping = owned_mapping,
            .priority = priority,
            .owned = true,
        });
        return .added;
    }

    fn index_of(self: *const Database, entry: *const Entry) usize {
        const base = @intFromPtr(self.entries.items.ptr);
        return (@intFromPtr(entry) - base) / @sizeOf(Entry);
    }
};

/// Rewrites button labels for mappings that use labelled face buttons (the
/// GameCube hint): swaps `b:` and `x:`, and marks the hint as positional with `!`.
fn positional_axby(allocator: std.mem.Allocator, mapping: []const u8) std.mem.Allocator.Error![]u8 {
    const out = try allocator.dupe(u8, mapping);
    if (std.mem.indexOf(u8, out, ",b:")) |at| out[at + 1] = 'x';
    if (std.mem.indexOf(u8, out, ",x:")) |at| out[at + 1] = 'b';
    return insert_negation(allocator, out, "hint:SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS");
}

/// Rewrites button labels for mappings that use Nintendo-style labels (the
/// button-label hint): rotates a/b/x/y to positional names.
fn positional_baxy(allocator: std.mem.Allocator, mapping: []const u8) std.mem.Allocator.Error![]u8 {
    const out = try allocator.dupe(u8, mapping);
    if (std.mem.indexOf(u8, out, ",a:")) |at| out[at + 1] = 'b';
    if (std.mem.indexOf(u8, out, ",b:")) |at| out[at + 1] = 'a';
    if (std.mem.indexOf(u8, out, ",x:")) |at| out[at + 1] = 'y';
    if (std.mem.indexOf(u8, out, ",y:")) |at| out[at + 1] = 'x';
    return insert_negation(allocator, out, "hint:SDL_GAMECONTROLLER_USE_BUTTON_LABELS");
}

/// Replaces `buffer` with a copy that has `!` after the first `key` occurrence.
fn insert_negation(allocator: std.mem.Allocator, buffer: []u8, key: []const u8) std.mem.Allocator.Error![]u8 {
    defer allocator.free(buffer);
    const at = std.mem.indexOf(u8, buffer, key) orelse return allocator.dupe(u8, buffer);
    const hint_at = at + "hint:".len;
    var result: std.ArrayList(u8) = .empty;
    errdefer result.deinit(allocator);
    try result.appendSlice(allocator, buffer[0..hint_at]);
    try result.append(allocator, '!');
    try result.appendSlice(allocator, buffer[hint_at..]);
    return result.toOwnedSlice(allocator);
}

/// Returns a copy of `mapping` whose `crc:` field equals `crc` (4 lowercase hex
/// digits). The field is appended when missing and replaced otherwise.
fn with_crc_field(allocator: std.mem.Allocator, mapping: []const u8, crc: u16) std.mem.Allocator.Error![]u8 {
    var crc_buf: [16]u8 = undefined;
    const crc_text = std.fmt.bufPrint(&crc_buf, "crc:{x:0>4}", .{crc}) catch unreachable;
    var result: std.ArrayList(u8) = .empty;
    errdefer result.deinit(allocator);
    if (std.mem.indexOf(u8, mapping, "crc:")) |at| {
        const after = mapping[at..];
        const end = std.mem.indexOfScalar(u8, after, ',') orelse after.len;
        try result.appendSlice(allocator, mapping[0..at]);
        try result.appendSlice(allocator, crc_text);
        try result.appendSlice(allocator, after[end..]);
    } else {
        try result.appendSlice(allocator, mapping);
        if (mapping.len != 0 and mapping[mapping.len - 1] != ',') try result.append(allocator, ',');
        try result.appendSlice(allocator, crc_text);
        try result.append(allocator, ',');
    }
    return result.toOwnedSlice(allocator);
}

/// Gamepad model from vendor/product ids (SDL_GetGamepadTypeFromVIDPID). `name`
/// disambiguates devices that share ids. `for_ui` allows the GameCube label.
pub fn type_from_vid_pid(vendor: u16, product: u16, name: ?[]const u8, for_ui: bool) GamepadType {
    const nintendo: u16 = 0x057e;
    if (vendor == 0 and product == 0) {
        if (name) |n| {
            if (std.mem.eql(u8, n, "Lic Pro Controller") or
                std.mem.eql(u8, n, "Nintendo Wireless Gamepad") or
                std.mem.eql(u8, n, "Wireless Gamepad")) return .switch_pro;
        }
        return .unknown;
    }
    if (vendor == 0x0001 and product == 0x0001) return .standard;
    if (vendor == nintendo and (product == 0x2006 or product == 0x2067)) return .joycon_left;
    if (vendor == nintendo and (product == 0x2007 or product == 0x2066)) {
        if (name) |n| if (std.mem.indexOf(u8, n, "NES Controller") != null) return .standard;
        return .joycon_right;
    }
    if (vendor == nintendo and product == 0x200e) {
        if (name) |n| {
            if (std.mem.indexOf(u8, n, "(L)") != null) return .joycon_left;
            if (std.mem.indexOf(u8, n, "L+R") != null) return .joycon_pair;
        }
        return .joycon_right;
    }
    if (vendor == nintendo and (product == 0x2008 or product == 0x2068)) return .joycon_pair;
    if (for_ui and is_gamecube(vendor, product)) return .gamecube;

    return switch (joystick.guess_controller_type(vendor, product)) {
        .xbox360_controller => .xbox360,
        .xbox_one_controller, .xbox_elite_controller => .xbox_one,
        .ps3_controller => .ps3,
        .ps4_controller => .ps4,
        .ps5_controller, .ps5_edge_controller => .ps5,
        .xinput_ps4_controller => if (for_ui) .ps4 else .standard,
        .switch_pro_controller, .switch2_pro_controller, .switch_input_only_controller, .switch2_input_only_controller => .switch_pro,
        .xinput_switch_controller => if (for_ui) .switch_pro else .xbox360,
        .steam_controller, .steam_controller_v2, .steam_controller_neptune, .steam_controller_triton, .hori_steam_controller, .unknown_steam_controller => .steam,
        else => .standard,
    };
}

/// Built-in list of GameCube adapters (SDL_joystick.c initial_gamecube_devices).
fn is_gamecube(vendor: u16, product: u16) bool {
    const devices = [_][2]u16{
        .{ 0x0079, 0x1843 }, .{ 0x0079, 0x1844 }, .{ 0x0079, 0x1846 },
        .{ 0x057e, 0x0337 }, .{ 0x057e, 0x2073 }, .{ 0x05e3, 0x0681 },
    };
    for (devices) |device| {
        if (device[0] == vendor and device[1] == product) return true;
    }
    return false;
}

/// Gamepad model for a GUID and optional name (SDL_GetGamepadTypeFromGUID).
pub fn type_from_guid(guid: Guid, name: ?[]const u8) GamepadType {
    const info = joystick.guid_info(guid);
    const kind = type_from_vid_pid(info.vendor, info.product, name, true);
    if (kind == .standard and joystick.guid_driver(guid) == 'x') return .xbox_one;
    return kind;
}

/// Name for an evdev device without a mapping-table name (SDL_CreateJoystickName
/// and SDL_CreateDeviceName, without the vendor-name normalization table, which is
/// pending). Caller frees the result.
pub fn joystick_name(
    allocator: std.mem.Allocator,
    vendor: u16,
    product: u16,
    vendor_name: ?[]const u8,
    product_name: ?[]const u8,
) std.mem.Allocator.Error![]u8 {
    if (joystick.guess_controller_name(vendor, product)) |known| return allocator.dupe(u8, known);
    const vendor_text = std.mem.trimStart(u8, vendor_name orelse "", " ");
    const product_text = std.mem.trimStart(u8, product_name orelse "", " ");
    if (vendor_text.len != 0 and product_text.len != 0) {
        return std.fmt.allocPrint(allocator, "{s} {s}", .{ vendor_text, product_text });
    }
    if (product_text.len != 0) return allocator.dupe(u8, product_text);
    if (vendor != 0 or product != 0) {
        return switch (type_from_vid_pid(vendor, product, null, true)) {
            .xbox360 => allocator.dupe(u8, "Xbox 360 Controller"),
            .xbox_one => allocator.dupe(u8, "Xbox One Controller"),
            .ps3 => allocator.dupe(u8, "PS3 Controller"),
            .ps4 => allocator.dupe(u8, "PS4 Controller"),
            .ps5 => allocator.dupe(u8, "DualSense Wireless Controller"),
            .switch_pro => allocator.dupe(u8, "Nintendo Switch Pro Controller"),
            .steam => allocator.dupe(u8, "Steam Controller"),
            else => std.fmt.allocPrint(allocator, "0x{x:0>4}/0x{x:0>4}", .{ vendor, product }),
        };
    }
    return allocator.dupe(u8, "Controller");
}

/// Live gamepad bound to one joystick. It owns its bindings and tracking state.
/// Queries (`button`, `axis`) read the joystick's current state; `process` turns
/// joystick changes into gamepad changes.
pub const Gamepad = struct {
    allocator: std.mem.Allocator,
    bindings: []Binding,
    name: []const u8,
    kind: GamepadType,
    face_style: FaceStyle,
    /// Per joystick axis: index of the binding that last produced output.
    last_match_axis: []?usize,
    /// Per joystick hat: bits seen last time.
    last_hat_mask: []u8,
    guide_down_ns: u64 = 0,
    guide_delayed: bool = false,

    /// Gamepad change: an axis value or a button state with its timestamp.
    pub const Change = struct {
        timestamp: joystick.Timestamp,
        event: union(enum) {
            axis: struct { axis: Axis, value: i16 },
            button: struct { button: Button, down: bool },
        },
    };

    /// Binds a database entry to a joystick (SDL_OpenGamepad, without HIDAPI).
    /// Trigger inputs get their resting value set to the binding's minimum, as
    /// SDL does, so the joystick state reads zero for unpressed triggers.
    pub fn init(
        allocator: std.mem.Allocator,
        entry: *const Entry,
        js: *joystick.Joystick,
        name: []const u8,
    ) std.mem.Allocator.Error!Gamepad {
        const bindings = try parse_bindings(allocator, entry.mapping);
        errdefer allocator.free(bindings);

        const kind = mapping_type(entry.mapping) orelse type_from_guid(js.guid, name);
        const face_style = mapping_face(entry.mapping) orelse
            if (std.mem.indexOf(u8, entry.mapping, "SDL_GAMECONTROLLER_USE_GAMECUBE_LABELS") != null)
                FaceStyle.axby
            else if (std.mem.indexOf(u8, entry.mapping, "SDL_GAMECONTROLLER_USE_BUTTON_LABELS") != null)
                FaceStyle.bayx
            else
                FaceStyle.for_type(kind);

        for (bindings) |binding| {
            switch (binding.input) {
                .axis => |input_axis| switch (binding.output) {
                    .axis => |out_axis| if (out_axis.axis.is_trigger() and input_axis.index < js.axes.len) {
                        js.axes[input_axis.index].value = input_axis.min;
                        js.axes[input_axis.index].zero = input_axis.min;
                    },
                    .button => {},
                },
                else => {},
            }
        }

        const last_match_axis = try allocator.alloc(?usize, js.axes.len);
        errdefer allocator.free(last_match_axis);
        @memset(last_match_axis, null);
        const last_hat_mask = try allocator.alloc(u8, js.hats.len);
        @memset(last_hat_mask, 0);

        return .{
            .allocator = allocator,
            .bindings = bindings,
            .name = name,
            .kind = kind,
            .face_style = face_style,
            .last_match_axis = last_match_axis,
            .last_hat_mask = last_hat_mask,
        };
    }

    pub fn deinit(self: *Gamepad) void {
        self.allocator.free(self.bindings);
        self.allocator.free(self.last_match_axis);
        self.allocator.free(self.last_hat_mask);
        self.* = undefined;
    }

    /// Translates one joystick change into gamepad changes appended to `out`.
    /// Ball motion has no gamepad equivalent and is dropped.
    pub fn process(
        self: *Gamepad,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        change: joystick.Change,
    ) std.mem.Allocator.Error!void {
        switch (change.event) {
            .axis => |a| try self.handle_axis(allocator, out, change.timestamp, a.index, a.value),
            .button => |b| try self.handle_button(allocator, out, change.timestamp, b.index, b.down),
            .hat => |h| try self.handle_hat(allocator, out, change.timestamp, h.index, h.value),
            .ball => {},
        }
    }

    /// Releases the guide button after a delayed press (SDL_GamepadHandleDelayedGuideButton).
    pub fn release_delayed_guide(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp) std.mem.Allocator.Error!void {
        try self.send_button(allocator, out, timestamp, .guide, false);
    }

    fn send_axis(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, axis: Axis, value: i16) std.mem.Allocator.Error!void {
        _ = self;
        try out.append(allocator, .{ .timestamp = timestamp, .event = .{ .axis = .{ .axis = axis, .value = value } } });
    }

    fn send_button(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, button: Button, down: bool) std.mem.Allocator.Error!void {
        if (button == .guide) {
            if (down) {
                self.guide_down_ns = timestamp;
                if (self.guide_delayed) return; // duplicate press while a release is pending
            } else {
                if (timestamp < self.guide_down_ns + minimum_guide_delay_ns) {
                    self.guide_delayed = true;
                    return;
                }
                self.guide_delayed = false;
            }
        }
        try out.append(allocator, .{ .timestamp = timestamp, .event = .{ .button = .{ .button = button, .down = down } } });
    }

    fn reset_output(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, binding_index: usize) std.mem.Allocator.Error!void {
        switch (self.bindings[binding_index].output) {
            .axis => |a| try self.send_axis(allocator, out, timestamp, a.axis, 0),
            .button => |b| try self.send_button(allocator, out, timestamp, b, false),
        }
    }

    fn handle_axis(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, index: usize, raw: i16) std.mem.Allocator.Error!void {
        if (index >= self.last_match_axis.len) return;
        const value: i32 = raw;
        var match: ?usize = null;
        for (self.bindings, 0..) |binding, i| {
            switch (binding.input) {
                .axis => |input| {
                    if (input.index != index) continue;
                    const hit = if (input.min < input.max)
                        value >= input.min and value <= input.max
                    else
                        value >= input.max and value <= input.min;
                    if (hit) {
                        match = i;
                        break;
                    }
                },
                else => {},
            }
        }

        if (self.last_match_axis[index]) |last| {
            const changed = match == null or !same_output(self.bindings[last], self.bindings[match.?]);
            if (changed) try self.reset_output(allocator, out, timestamp, last);
        }

        if (match) |m| {
            const binding = self.bindings[m];
            const input = binding.input.axis;
            switch (binding.output) {
                .axis => |output| {
                    var mapped: i32 = value;
                    if (input.min != output.min or input.max != output.max) {
                        const span = @as(i32, input.max) - input.min;
                        if (span != 0) {
                            const normalized = @as(f32, @floatFromInt(value - input.min)) / @as(f32, @floatFromInt(span));
                            mapped = output.min + @as(i32, @intFromFloat(normalized * @as(f32, @floatFromInt(@as(i32, output.max) - output.min))));
                        } else {
                            mapped = output.min;
                        }
                    }
                    try self.send_axis(allocator, out, timestamp, output.axis, @intCast(mapped));
                },
                .button => |button| {
                    // Half-threshold: a button fires past the midpoint of its input range.
                    const threshold = @as(i32, input.min) + @divTrunc(@as(i32, input.max) - input.min, 2);
                    const down = if (input.max < input.min) value <= threshold else value >= threshold;
                    try self.send_button(allocator, out, timestamp, button, down);
                },
            }
        }
        self.last_match_axis[index] = match;
    }

    fn handle_button(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, index: usize, down: bool) std.mem.Allocator.Error!void {
        for (self.bindings) |binding| {
            switch (binding.input) {
                .button => |input| {
                    if (input != index) continue;
                    switch (binding.output) {
                        .axis => |output| try self.send_axis(allocator, out, timestamp, output.axis, if (down) output.max else output.min),
                        .button => |button| try self.send_button(allocator, out, timestamp, button, down),
                    }
                    return;
                },
                else => {},
            }
        }
    }

    fn handle_hat(self: *Gamepad, allocator: std.mem.Allocator, out: *std.ArrayList(Change), timestamp: joystick.Timestamp, index: usize, value: joystick.Hat) std.mem.Allocator.Error!void {
        if (index >= self.last_hat_mask.len) return;
        const bits = value.bits();
        const changed = self.last_hat_mask[index] ^ bits;
        for (self.bindings, 0..) |binding, i| {
            switch (binding.input) {
                .hat => |input| {
                    if (input.index != index or (changed & input.mask) == 0) continue;
                    if ((bits & input.mask) != 0) {
                        switch (binding.output) {
                            .axis => |output| try self.send_axis(allocator, out, timestamp, output.axis, output.max),
                            .button => |button| try self.send_button(allocator, out, timestamp, button, true),
                        }
                    } else {
                        try self.reset_output(allocator, out, timestamp, i);
                    }
                },
                else => {},
            }
        }
        self.last_hat_mask[index] = bits;
    }

    /// Current state of a gamepad button, computed from the joystick through the
    /// bindings (SDL_GetGamepadButton). Any binding that reads pressed wins.
    pub fn read_button(self: *const Gamepad, js: *const joystick.Joystick, target: Button) bool {
        var result = false;
        for (self.bindings) |binding| {
            if (binding.output != .button or binding.output.button != target) continue;
            switch (binding.input) {
                .axis => |input| {
                    const value: i32 = js.axis_value(input.index);
                    const threshold = @as(i32, input.min) + @divTrunc(@as(i32, input.max) - input.min, 2);
                    if (input.min < input.max) {
                        if (value >= input.min and value <= input.max) result = result or value >= threshold;
                    } else {
                        if (value >= input.max and value <= input.min) result = result or value <= threshold;
                    }
                },
                .button => |index| result = result or js.button_down(index),
                .hat => |input| result = result or (js.hat_value(input.index).bits() & input.mask) != 0,
            }
        }
        return result;
    }

    /// Current state of a gamepad axis, computed from the joystick (SDL_GetGamepadAxis).
    /// Missing inputs read zero; a button binding reads the output maximum while pressed.
    pub fn read_axis(self: *const Gamepad, js: *const joystick.Joystick, target: Axis) i16 {
        var result: i16 = 0;
        for (self.bindings) |binding| {
            if (binding.output != .axis or binding.output.axis.axis != target) continue;
            const out_range = binding.output.axis;
            var value: i32 = 0;
            switch (binding.input) {
                .axis => |input| {
                    if (input.index >= js.axes.len) continue;
                    value = js.axis_value(input.index);
                    const valid = if (input.min < input.max)
                        value >= input.min and value <= input.max
                    else
                        value >= input.max and value <= input.min;
                    if (valid) {
                        if (input.min != out_range.min or input.max != out_range.max) {
                            const span = @as(i32, input.max) - input.min;
                            if (span != 0) {
                                const normalized = @as(f32, @floatFromInt(value - input.min)) / @as(f32, @floatFromInt(span));
                                value = out_range.min + @as(i32, @intFromFloat(normalized * @as(f32, @floatFromInt(@as(i32, out_range.max) - out_range.min))));
                            } else {
                                value = out_range.min;
                            }
                        }
                    } else {
                        value = 0;
                    }
                },
                .button => |index| {
                    if (js.button_down(index)) value = out_range.max;
                },
                .hat => |input| {
                    if ((js.hat_value(input.index).bits() & input.mask) != 0) value = out_range.max;
                },
            }
            if (@abs(value) > @abs(@as(i32, result))) result = @intCast(value);
        }
        return result;
    }

    /// True when some binding produces `target`.
    pub fn has_button(self: *const Gamepad, target: Button) bool {
        for (self.bindings) |binding| {
            if (binding.output == .button and binding.output.button == target) return true;
        }
        return false;
    }

    /// True when some binding produces `target`.
    pub fn has_axis(self: *const Gamepad, target: Axis) bool {
        for (self.bindings) |binding| {
            if (binding.output == .axis and binding.output.axis.axis == target) return true;
        }
        return false;
    }

    /// Label printed on the button in this gamepad's face style.
    pub fn button_label(self: *const Gamepad, target: Button) ButtonLabel {
        return ButtonLabel.for_face_style(self.face_style, target);
    }
};

fn same_output(a: Binding, b: Binding) bool {
    return switch (a.output) {
        .axis => |out_a| switch (b.output) {
            .axis => |out_b| out_a.axis == out_b.axis,
            .button => false,
        },
        .button => |button_a| switch (b.output) {
            .button => |button_b| button_a == button_b,
            .axis => false,
        },
    };
}

fn mapping_type(mapping: []const u8) ?GamepadType {
    const text = field_value(mapping, "type:") orelse return null;
    const kind = GamepadType.from_name(text);
    return if (kind == .unknown) null else kind;
}

fn mapping_face(mapping: []const u8) ?FaceStyle {
    const text = field_value(mapping, "face:") orelse return null;
    const style = FaceStyle.from_name(text);
    return if (style == .unknown) null else style;
}
