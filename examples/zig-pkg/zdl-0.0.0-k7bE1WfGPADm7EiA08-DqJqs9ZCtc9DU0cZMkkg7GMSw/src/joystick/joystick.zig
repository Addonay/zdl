//! Joystick state model: axes with SDL's initial-value and jitter rules, buttons,
//! hats, relative balls, GUID construction/parsing, and controller-model lookup.
//!
//! Port of the device-independent parts of SDL_joystick.c (SDL_Send*, the
//! Get* queries, GUID helpers and the vendor/product guesses) and of
//! controller_type.c. The hardware-specific parts live in `linux_evdev.zig` and
//! `virtual.zig`; both feed this model through the `set_*` methods.
//!
//! Ownership: `Joystick` owns its axis, button, hat and ball arrays, allocated
//! with the allocator given to `init` and released by `deinit`. Event output goes
//! into a caller-owned `std.ArrayList(Change)`; the model never keeps a queue.
//!
//! Numeric conventions: axes are `i16` in the SDL range `[axis_min, axis_max]`
//! (-32768..32767). Timestamps are nanoseconds on the same clock the input source
//! reports; a zero timestamp is a programming error (SDL asserts on it).
//!
//! Deliberate differences from SDL:
//! - SDL keeps one global "keyboard focus / background events" flag. Here each
//!   joystick carries `focused` and `background_events_allowed`, set by the host.
//! - There are no global instance IDs or player-index registry; `Joystick` is
//!   the state object itself.
//! - Events are appended to a caller list instead of being pushed onto SDL's
//!   global event queue.
const std = @import("std");
const guid_mod = @import("../core/guid.zig");
const controller_type = @import("controller_type.zig");
const controller_table = @import("controller_table.zig");

pub const Guid = guid_mod.Guid;
pub const ControllerType = controller_type.ControllerType;

/// Lowest and highest axis values, as in SDL_JOYSTICK_AXIS_MIN/MAX.
pub const axis_min: i16 = -32768;
pub const axis_max: i16 = 32767;

/// Hardware bus numbers used in the first GUID word (SDL_sysjoystick.h).
pub const bus = struct {
    pub const unknown: u16 = 0x00;
    pub const usb: u16 = 0x03;
    pub const bluetooth: u16 = 0x05;
    pub const virtual: u16 = 0xff;
};

/// Digital hat position as a bit set. Bit values match SDL_HAT_* (UP=1, RIGHT=2,
/// DOWN=4, LEFT=8), so diagonals are two bits and `centered` is zero.
pub const Hat = packed struct(u8) {
    up: bool = false,
    right: bool = false,
    down: bool = false,
    left: bool = false,
    _reserved: u4 = 0,

    pub const centered: Hat = .{};

    pub fn bits(self: Hat) u8 {
        return @backingInt(self);
    }

    pub fn from_bits(value: u8) Hat {
        return @fromBackingInt(value & 0x0f);
    }

    /// Converts the per-axis states used by SDL's hat decoder. Negative Y is up
    /// and positive Y is down, matching SDL's `position_map` table.
    pub fn from_axis_states(x: HatAxis, y: HatAxis) Hat {
        return .{
            .left = x == .negative,
            .right = x == .positive,
            .up = y == .negative,
            .down = y == .positive,
        };
    }
};

/// Three-state digital axis used to derive a hat position.
pub const HatAxis = enum(u2) {
    negative = 0,
    center = 1,
    positive = 2,
};

/// Per-axis calibration and state. `zero` is the resting value captured from the
/// first sample; events are suppressed until real motion is seen (see `set_axis`).
pub const Axis = struct {
    value: i16 = 0,
    zero: i16 = 0,
    initial_value: i16 = 0,
    has_initial_value: bool = false,
    has_second_value: bool = false,
    sent_initial_value: bool = false,
    sending_initial_value: bool = false,
};

/// Accumulated relative motion for a ball. `take_ball` reads and clears it.
pub const Ball = struct {
    dx: i32 = 0,
    dy: i32 = 0,
};

/// One input change with the timestamp of the source sample.
pub const Change = struct {
    timestamp: u64,
    event: Event,
};

/// Input changes reported by a joystick. Indexes refer to the joystick's own
/// axes, hats, buttons and balls (after face-button swapping).
pub const Event = union(enum) {
    axis: struct { index: usize, value: i16 },
    hat: struct { index: usize, value: Hat },
    button: struct { index: usize, down: bool },
    ball: struct { index: usize, dx: i16, dy: i16 },
};

/// Counts of each input kind a device exposes.
pub const Layout = struct {
    axes: usize = 0,
    buttons: usize = 0,
    hats: usize = 0,
    balls: usize = 0,
};

/// Joystick state. See the module comment for the ownership model.
pub const Joystick = struct {
    allocator: std.mem.Allocator,
    guid: Guid,
    axes: []Axis,
    buttons: []bool,
    hats: []Hat,
    balls: []Ball,
    /// Exchanges buttons 0<->1 and 2<->3 when set, as SDL does for controllers
    /// whose labels are reversed (see `SDL_Joystick.swap_face_buttons`).
    swap_face_buttons: bool = false,
    /// Lets input through while the application has no focus when true.
    background_events_allowed: bool = false,
    /// Host-maintained focus flag; false suppresses press events unless background
    /// events are allowed. Releases and centering always pass.
    focused: bool = true,
    /// Timestamp of the most recent accepted change.
    update_complete: u64 = 0,

    /// Allocates zeroed state for `layout`. Release with `deinit`.
    pub fn init(allocator: std.mem.Allocator, guid: Guid, layout: Layout) std.mem.Allocator.Error!Joystick {
        const axes = try allocator.alloc(Axis, layout.axes);
        errdefer allocator.free(axes);
        @memset(axes, .{});
        const buttons = try allocator.alloc(bool, layout.buttons);
        errdefer allocator.free(buttons);
        @memset(buttons, false);
        const hats = try allocator.alloc(Hat, layout.hats);
        errdefer allocator.free(hats);
        @memset(hats, Hat.centered);
        const balls = try allocator.alloc(Ball, layout.balls);
        @memset(balls, .{});
        return .{
            .allocator = allocator,
            .guid = guid,
            .axes = axes,
            .buttons = buttons,
            .hats = hats,
            .balls = balls,
        };
    }

    pub fn deinit(self: *Joystick) void {
        self.allocator.free(self.axes);
        self.allocator.free(self.buttons);
        self.allocator.free(self.hats);
        self.allocator.free(self.balls);
        self.* = undefined;
    }

    pub fn is_virtual(self: *const Joystick) bool {
        return guid_driver(self.guid) == 'v';
    }

    /// Input is dropped while the host reports no focus and background events
    /// are disallowed. Button releases, hat centering and axis returns to zero
    /// still pass, as in SDL.
    pub fn events_suppressed(self: *const Joystick) bool {
        return !self.background_events_allowed and !self.focused;
    }

    /// Current axis value, or 0 when `index` is out of range (SDL behavior).
    pub fn axis_value(self: *const Joystick, index: usize) i16 {
        if (index >= self.axes.len) return 0;
        return self.axes[index].value;
    }

    /// First value reported by the axis, or null before any sample arrived.
    pub fn axis_initial_value(self: *const Joystick, index: usize) ?i16 {
        if (index >= self.axes.len or !self.axes[index].has_initial_value) return null;
        return self.axes[index].initial_value;
    }

    pub fn hat_value(self: *const Joystick, index: usize) Hat {
        if (index >= self.hats.len) return Hat.centered;
        return self.hats[index];
    }

    pub fn button_down(self: *const Joystick, index: usize) bool {
        if (index >= self.buttons.len) return false;
        return self.buttons[index];
    }

    /// Returns the accumulated motion since the last call and clears it.
    pub fn take_ball(self: *Joystick, index: usize) ?struct { dx: i32, dy: i32 } {
        if (index >= self.balls.len) return null;
        const ball = self.balls[index];
        self.balls[index] = .{};
        return .{ .dx = ball.dx, .dy = ball.dy };
    }

    /// Records an axis sample (SDL_SendJoystickAxis). The first sample becomes
    /// the resting value. Until the axis moves beyond the jitter window, its
    /// initial value is reported first. A repeat of the same value is dropped.
    pub fn set_axis(
        self: *Joystick,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        timestamp: u64,
        index: usize,
        value: i16,
    ) std.mem.Allocator.Error!void {
        if (index >= self.axes.len) return;
        std.debug.assert(timestamp != 0);
        const info = &self.axes[index];
        // A first sample pinned at an extreme that then relaxes to near-zero is
        // treated as a not-yet-calibrated start, so it becomes the initial value.
        const extreme_start = info.initial_value <= -32767 or info.initial_value == 32767;
        if (!info.has_initial_value or
            (!info.has_second_value and extreme_start and @abs(@as(i32, value)) < @divTrunc(axis_max, 4)))
        {
            info.initial_value = value;
            info.value = value;
            info.zero = value;
            info.has_initial_value = true;
        } else if (value == info.value and !info.sending_initial_value) {
            return;
        } else {
            info.has_second_value = true;
        }

        if (!info.sent_initial_value) {
            // Motion is reported only after real activity: a small deviation from
            // the resting value is treated as jitter (ShanWan PS3 pads needed 1/80).
            const max_allowed_jitter = @divTrunc(axis_max, 80);
            if (@abs(@as(i32, value) - info.value) <= max_allowed_jitter and !self.is_virtual()) return;
            info.sent_initial_value = true;
            info.sending_initial_value = true;
            try self.set_axis(allocator, out, timestamp, index, info.initial_value);
            info.sending_initial_value = false;
        }

        if (self.events_suppressed()) {
            if (info.sending_initial_value or
                (value > info.zero and value >= info.value) or
                (value < info.zero and value <= info.value))
            {
                return;
            }
        }

        info.value = value;
        self.update_complete = timestamp;
        try out.append(allocator, .{
            .timestamp = timestamp,
            .event = .{ .axis = .{ .index = index, .value = value } },
        });
    }

    /// Records a hat position (SDL_SendJoystickHat). Duplicates are dropped.
    pub fn set_hat(
        self: *Joystick,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        timestamp: u64,
        index: usize,
        value: Hat,
    ) std.mem.Allocator.Error!void {
        if (index >= self.hats.len) return;
        std.debug.assert(timestamp != 0);
        if (value.bits() == self.hats[index].bits()) return;
        if (self.events_suppressed() and value.bits() != Hat.centered.bits()) return;
        self.hats[index] = value;
        self.update_complete = timestamp;
        try out.append(allocator, .{
            .timestamp = timestamp,
            .event = .{ .hat = .{ .index = index, .value = value } },
        });
    }

    /// Records a button state (SDL_SendJoystickButton), applying face-button
    /// swapping first. Duplicates are dropped, presses are suppressed while the
    /// events are suppressed, and releases always pass.
    pub fn set_button(
        self: *Joystick,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        timestamp: u64,
        index: usize,
        down: bool,
    ) std.mem.Allocator.Error!void {
        std.debug.assert(timestamp != 0);
        var button = index;
        if (self.swap_face_buttons) {
            button = switch (index) {
                0 => 1,
                1 => 0,
                2 => 3,
                3 => 2,
                else => index,
            };
        }
        if (button >= self.buttons.len) return;
        if (down == self.buttons[button]) return;
        if (self.events_suppressed() and down) return;
        self.buttons[button] = down;
        self.update_complete = timestamp;
        try out.append(allocator, .{
            .timestamp = timestamp,
            .event = .{ .button = .{ .index = button, .down = down } },
        });
    }

    /// Adds relative ball motion (SDL_SendJoystickBall). Ignored while events
    /// are suppressed, because SDL drops all ball motion in that state.
    pub fn set_ball(
        self: *Joystick,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        timestamp: u64,
        index: usize,
        dx: i16,
        dy: i16,
    ) std.mem.Allocator.Error!void {
        if (index >= self.balls.len) return;
        if (self.events_suppressed()) return;
        std.debug.assert(timestamp != 0);
        self.balls[index].dx += dx;
        self.balls[index].dy += dy;
        self.update_complete = timestamp;
        try out.append(allocator, .{
            .timestamp = timestamp,
            .event = .{ .ball = .{ .index = index, .dx = dx, .dy = dy } },
        });
    }

    /// Reports every input at rest (SDL_PrivateJoystickForceRecentering). Used
    /// before disconnect or when the host loses the device, so that consumers see
    /// released buttons and centered sticks.
    pub fn recenter(
        self: *Joystick,
        allocator: std.mem.Allocator,
        out: *std.ArrayList(Change),
        timestamp: u64,
    ) std.mem.Allocator.Error!void {
        for (self.axes, 0..) |axis, i| {
            if (axis.has_initial_value) try self.set_axis(allocator, out, timestamp, i, axis.zero);
        }
        for (0..self.buttons.len) |i| try self.set_button(allocator, out, timestamp, i, false);
        for (0..self.hats.len) |i| try self.set_hat(allocator, out, timestamp, i, Hat.centered);
    }
};

// GUID layout (SDL_CreateJoystickGUID / SDL_GetJoystickGUIDInfo): sixteen bytes,
// read as eight little-endian 16-bit words:
//   word 0 bus, word 1 CRC-16 of the product name, word 2 vendor, word 3 zero,
//   word 4 product, word 5 zero, word 6 version, byte 14 driver signature,
//   byte 15 driver data.
// Words 2..6 are absent in the "name" form, where the product name follows the
// CRC from byte 4.

/// Vendor, product, version and name CRC decoded from a GUID.
pub const GuidInfo = struct {
    vendor: u16 = 0,
    product: u16 = 0,
    version: u16 = 0,
    crc: u16 = 0,
};

/// Inputs for `create_guid`. A zero `vendor` selects the name-only form.
pub const GuidParams = struct {
    bus: u16,
    vendor: u16 = 0,
    product: u16 = 0,
    version: u16 = 0,
    vendor_name: ?[]const u8 = null,
    product_name: ?[]const u8 = null,
    driver_signature: u8 = 0,
    driver_data: u8 = 0,
};

fn word(guid: Guid, index: usize) u16 {
    return std.mem.readInt(u16, guid.data[index * 2 ..][0..2], .little);
}

fn put_word(guid: *Guid, index: usize, value: u16) void {
    std.mem.writeInt(u16, guid.data[index * 2 ..][0..2], value, .little);
}

/// Decodes the vendor/product/version/CRC of a GUID. Names-only GUIDs yield
/// only the CRC, and GUIDs from other buses yield all zeros.
pub fn guid_info(guid: Guid) GuidInfo {
    const bus_word = word(guid, 0);
    const standard_form = (bus_word < ' ' or bus_word == bus.virtual) and word(guid, 3) == 0 and word(guid, 5) == 0;
    if (standard_form) {
        return .{
            .vendor = word(guid, 2),
            .product = word(guid, 4),
            .version = word(guid, 6),
            .crc = word(guid, 1),
        };
    }
    if (bus_word < ' ' or bus_word == bus.virtual) return .{ .crc = word(guid, 1) };
    return .{};
}

/// CRC-16 with the reflected polynomial 0xA001, init 0, no final XOR. This is
/// the algorithm SDL uses for name CRCs, and mappings depend on it: do not
/// change it. `seed` allows chaining over several byte runs.
pub fn crc16(seed: u16, bytes: []const u8) u16 {
    var crc = seed;
    for (bytes) |byte| {
        crc = crc16_for_byte(@as(u8, @truncate(crc)) ^ byte) ^ (crc >> 8);
    }
    return crc;
}

fn crc16_for_byte(byte: u8) u16 {
    var crc: u16 = 0;
    var r = byte;
    for (0..8) |_| {
        crc = (if ((crc ^ r) & 1 != 0) @as(u16, 0xA001) else 0) ^ (crc >> 1);
        r >>= 1;
    }
    return crc;
}

/// Builds a GUID (SDL_CreateJoystickGUID). The name CRC covers the vendor
/// name, a space and the product name when both are present, else the product
/// name alone.
pub fn create_guid(params: GuidParams) Guid {
    var guid: Guid = .{};
    const vendor_name = params.vendor_name orelse "";
    const product_name = params.product_name orelse "";
    var crc: u16 = 0;
    if (vendor_name.len != 0 and product_name.len != 0) {
        crc = crc16(crc, vendor_name);
        crc = crc16(crc, " ");
        crc = crc16(crc, product_name);
    } else {
        crc = crc16(crc, product_name);
    }

    put_word(&guid, 0, params.bus);
    put_word(&guid, 1, crc);
    if (params.vendor != 0) {
        put_word(&guid, 2, params.vendor);
        put_word(&guid, 3, 0);
        put_word(&guid, 4, params.product);
        put_word(&guid, 5, 0);
        put_word(&guid, 6, params.version);
        guid.data[14] = params.driver_signature;
        guid.data[15] = params.driver_data;
    } else {
        // Name-only form: the name occupies bytes 4..., leaving room for the
        // driver bytes when a signature is present. The NUL terminator fits.
        var space: usize = 12;
        if (params.driver_signature != 0) {
            space -= 2;
            guid.data[14] = params.driver_signature;
            guid.data[15] = params.driver_data;
        }
        const n = @min(product_name.len, space - 1);
        @memcpy(guid.data[4..][0..n], product_name[0..n]);
    }
    return guid;
}

/// Sets the vendor word, keeping every other field.
pub fn set_guid_vendor(guid: *Guid, vendor: u16) void {
    put_word(guid, 2, vendor);
}

/// Sets the product word.
pub fn set_guid_product(guid: *Guid, product: u16) void {
    put_word(guid, 4, product);
}

/// Sets the version word.
pub fn set_guid_version(guid: *Guid, version: u16) void {
    put_word(guid, 6, version);
}

/// Sets the name CRC word. Mappings store their CRC here for exact matching.
pub fn set_guid_crc(guid: *Guid, crc: u16) void {
    put_word(guid, 1, crc);
}

/// Driver signature byte: 'h' HIDAPI, 'x' XInput, 'w' WGI, 'r' RawInput,
/// 'm' MFi, 'v' virtual. Zero when no driver wrote a signature.
pub fn guid_driver(guid: Guid) u8 {
    return guid.data[14];
}

/// True when the GUID carries vendor and product ids that identify the model.
/// MFi GUIDs use the version word as a button-capability mask instead.
pub fn guid_uses_version(guid: Guid) bool {
    if (guid_driver(guid) == 'm') return false;
    const info = guid_info(guid);
    return info.vendor != 0 and info.product != 0;
}

/// Looks up the built-in controller model table (controller_table.zig). Missing
/// ids are `unknown_non_steam_controller`, as in SDL's GuessControllerType.
pub fn guess_controller_type(vendor: u16, product: u16) ControllerType {
    return guess_controller_type_with_hint(vendor, product, null);
}

/// As `guess_controller_type`, but a hint string in SDL's override format
/// (`0xVVVV/0xPPPP=Name[,...]`, the SDL_HINT_GAMECONTROLLERTYPE syntax) takes
/// precedence. The name is matched without the `k_eControllerType_` prefix.
pub fn guess_controller_type_with_hint(vendor: u16, product: u16, hint: ?[]const u8) ControllerType {
    if (hint) |text| if (override_from_hint(text, vendor, product)) |name| return type_from_override_name(name);
    const id = (@as(u32, vendor) << 16) | product;
    var lo: usize = 0;
    var hi: usize = controller_table.entries.len;
    while (lo < hi) {
        const mid = lo + (hi - lo) / 2;
        const entry_id = controller_table.entries[mid].id;
        if (entry_id == id) return controller_table.entries[mid].kind;
        if (entry_id < id) lo = mid + 1 else hi = mid;
    }
    return .unknown_non_steam_controller;
}

/// Product name from the built-in table, when SDL names this model itself.
pub fn guess_controller_name(vendor: u16, product: u16) ?[]const u8 {
    const id = (@as(u32, vendor) << 16) | product;
    for (controller_table.entries) |entry| {
        if (entry.id == id) return entry.name;
    }
    return null;
}

fn override_from_hint(text: []const u8, vendor: u16, product: u16) ?[]const u8 {
    var lower_buf: [32]u8 = undefined;
    var upper_buf: [32]u8 = undefined;
    const lower = std.fmt.bufPrint(&lower_buf, "0x{x:0>4}/0x{x:0>4}=", .{ vendor, product }) catch return null;
    const upper = std.fmt.bufPrint(&upper_buf, "0x{X:0>4}/0x{X:0>4}=", .{ vendor, product }) catch return null;
    const at = std.mem.indexOf(u8, text, lower) orelse std.mem.indexOf(u8, text, upper) orelse return null;
    var name = text[at + lower.len ..];
    if (std.mem.startsWith(u8, name, "k_eControllerType_")) name = name["k_eControllerType_".len..];
    return name;
}

fn type_from_override_name(name: []const u8) ControllerType {
    const prefixes = [_]struct { text: []const u8, kind: ControllerType }{
        .{ .text = "Xbox360", .kind = .xbox360_controller },
        .{ .text = "XboxOne", .kind = .xbox_one_controller },
        .{ .text = "PS3", .kind = .ps3_controller },
        .{ .text = "PS4", .kind = .ps4_controller },
        .{ .text = "PS5", .kind = .ps5_controller },
        .{ .text = "SwitchPro", .kind = .switch_pro_controller },
        .{ .text = "Steam", .kind = .steam_controller },
    };
    for (prefixes) |p| {
        if (std.ascii.startsWithIgnoreCase(name, p.text)) return p.kind;
    }
    return .unknown_non_steam_controller;
}
