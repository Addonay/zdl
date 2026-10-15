//! Automatic gamepad mappings for evdev devices that have no database entry.
//!
//! Port of `SDL_PrivateGenerateAutomaticGamepadMapping` (SDL_gamepad.c) and the
//! evdev part of `LINUX_JoystickGetGamepadMapping` (linux/SDL_sysjoystick.c). The
//! kernel button and axis layout is turned into a `Mapping` of named gamepad
//! fields, which `text` renders as a mapping string that `gamepad.Database.add`
//! accepts.
//!
//! Only devices reporting BTN_GAMEPAD (BTN_SOUTH/BTN_A) are considered. Mapping
//! rules are tried in SDL's order. A field is set from the first source that
//! matches, and a later source may overwrite it when SDL does so. Hats and axes
//! are chosen by fixed kernel code conventions: the Linux Gamepad Specification
//! for triggers (ABS_HAT2X/Y), the Android one (ABS_BRAKE/GAS, ABS_Z/RZ as
//! fallback) and the Xbox/PlayStation de facto one.
//!
//! Source encoding follows SDL's mapping strings: `bN` button, `aN` axis (with
//! `+`/`-` half-axis prefix and `~` for reversed), `hI.M` hat index I with
//! direction mask M (UP=1, RIGHT=2, DOWN=4, LEFT=8).
//!
//! Deliberate differences from SDL:
//! - The generated text is returned as an owned allocation with the GUID's CRC
//!   cleared, instead of being added to a global database. The caller decides
//!   which database receives it and at what priority.
//! - The driver name (SDL reads it from sysfs) is passed in `Options`. The xpad
//!   D-pad quirk needs it, and this module does no file I/O.
//! - The name is not truncated to SDL's 128-byte buffer and the mapping is not
//!   truncated to 1024 bytes; both are allocation-sized here.
const std = @import("std");
const joystick = @import("joystick.zig");
const linux_evdev = @import("linux_evdev.zig");

/// Kernel codes from linux/input-event-codes.h used by the mapping rules.
const btn_gamepad = 0x130;
const btn_south = 0x130;
const btn_east = 0x131;
const btn_x = 0x133;
const btn_north = 0x133;
const btn_y = 0x134;
const btn_west = 0x134;
const btn_tl = 0x136;
const btn_tr = 0x137;
const btn_tl2 = 0x138;
const btn_tr2 = 0x139;
const btn_select = 0x13a;
const btn_start = 0x13b;
const btn_mode = 0x13c;
const btn_thumbl = 0x13d;
const btn_thumbr = 0x13e;
const btn_dpad_up = 0x220;
const btn_dpad_down = 0x221;
const btn_dpad_left = 0x222;
const btn_dpad_right = 0x223;
const btn_gripl = 0x224;
const btn_gripr = 0x225;
const btn_gripl2 = 0x226;
const btn_gripr2 = 0x227;
const btn_trigger_happy1 = 0x2c0;
const btn_trigger_happy2 = 0x2c1;
const btn_trigger_happy3 = 0x2c2;
const btn_trigger_happy4 = 0x2c3;
const btn_trigger_happy5 = 0x2c4;
const btn_trigger_happy6 = 0x2c5;
const btn_trigger_happy7 = 0x2c6;
const btn_trigger_happy8 = 0x2c7;
const key_record = 0xa7;
const abs_x = 0x00;
const abs_y = 0x01;
const abs_z = 0x02;
const abs_rx = 0x03;
const abs_ry = 0x04;
const abs_rz = 0x05;
const abs_gas = 0x09;
const abs_brake = 0x0a;
const abs_hat0x = 0x10;
const abs_hat0y = 0x11;
const abs_hat1x = 0x12;
const abs_hat1y = 0x13;
const abs_hat2x = 0x14;
const abs_hat2y = 0x15;

/// USB vendor ids that change the face-button and paddle conventions.
const vendor_sony: u16 = 0x054c;
const vendor_microsoft: u16 = 0x045e;

/// Hat direction bits in SDL's mapping strings.
const hat_up: u8 = 0x1;
const hat_right: u8 = 0x2;
const hat_down: u8 = 0x4;
const hat_left: u8 = 0x8;

/// A gamepad output named in a mapping string. The declaration order is the order
/// SDL writes the fields, so `@tagName` gives the text name. `paddle1..4` keep
/// SDL's SDL2-compatible names: paddle1 = right paddle 1, paddle2 = left paddle 1,
/// paddle3 = right paddle 2, paddle4 = left paddle 2.
pub const Field = enum {
    a,
    b,
    x,
    y,
    back,
    guide,
    start,
    leftstick,
    rightstick,
    leftshoulder,
    rightshoulder,
    dpup,
    dpdown,
    dpleft,
    dpright,
    misc1,
    misc2,
    misc3,
    misc4,
    misc5,
    misc6,
    paddle1,
    paddle2,
    paddle3,
    paddle4,
    leftx,
    lefty,
    rightx,
    righty,
    lefttrigger,
    righttrigger,
    touchpad,
};

/// Which half of an axis a mapping uses (`+`/`-` prefix in the text).
pub const Half = enum { full, positive, negative };

/// An axis source: `aN`, optionally a half axis and/or reversed (`~`).
pub const AxisSource = struct {
    index: u16,
    half: Half = .full,
    reversed: bool = false,
};

/// A hat source: `hI.M`, hat pair I and its direction bits.
pub const HatSource = struct { index: u8, mask: u8 };

/// The kernel input bound to one output field.
pub const Source = union(enum) {
    none,
    /// `bN`: kernel button mapped to button index N.
    button: u16,
    axis: AxisSource,
    hat: HatSource,
};

/// One source per output field.
pub const Mapping = std.EnumArray(Field, Source);

/// Options from the caller, for conditions that need data outside the device.
pub const Options = struct {
    /// Kernel driver name (sysfs `driver` link), such as "xpad". Null when unknown.
    driver: ?[]const u8 = null,
};

/// Builds the mapping for `device`, following SDL's rules. Returns null when the
/// device is not a gamepad (no BTN_GAMEPAD key).
pub fn generate(device: *const linux_evdev.Device, options: Options) ?Mapping {
    if (!has_key(device, btn_gamepad)) return null;
    var out = Mapping.initFill(.none);
    const vendor = joystick.guid_info(device.guid).vendor;

    if (button(device, btn_south)) |source| out.set(.a, source);
    if (button(device, btn_east)) |source| out.set(.b, source);
    // Sony pads report square as BTN_WEST and triangle as BTN_NORTH; other pads
    // use BTN_X for the left face button and BTN_Y for the top one.
    if (vendor == vendor_sony) {
        if (button(device, btn_west)) |source| out.set(.x, source);
        if (button(device, btn_north)) |source| out.set(.y, source);
    } else {
        if (button(device, btn_x)) |source| out.set(.x, source);
        if (button(device, btn_y)) |source| out.set(.y, source);
    }
    if (button(device, btn_select)) |source| out.set(.back, source);
    if (button(device, btn_start)) |source| out.set(.start, source);
    if (button(device, btn_thumbl)) |source| out.set(.leftstick, source);
    if (button(device, btn_thumbr)) |source| out.set(.rightstick, source);
    if (button(device, btn_mode)) |source| out.set(.guide, source);

    // Shoulders: digital buttons first, then a hat, then analog hat axes.
    // `mapped` bit 1 is left, bit 2 is right.
    var mapped: u8 = 0;
    if (button(device, btn_tl)) |source| {
        out.set(.leftshoulder, source);
        mapped |= 0x1;
    }
    if (button(device, btn_tr)) |source| {
        out.set(.rightshoulder, source);
        mapped |= 0x2;
    }
    if (mapped != 0x3 and device.has_hat[1]) {
        // SDL assigns these in the hat-1 DOWN/RIGHT directions, overriding both.
        out.set(.leftshoulder, hat(device, 1, hat_down));
        out.set(.rightshoulder, hat(device, 1, hat_right));
        mapped = 0x3;
    }
    if (mapped & 0x1 == 0) {
        if (abs(device, abs_hat1y)) |source| {
            out.set(.leftshoulder, source);
            mapped |= 0x1;
        }
    }
    if (mapped & 0x2 == 0) {
        if (abs(device, abs_hat1x)) |source| {
            out.set(.rightshoulder, source);
            mapped |= 0x2;
        }
    }

    // Triggers: analog axes in three conventions, then a hat, then digital buttons.
    mapped = 0;
    if (abs(device, abs_hat2y) orelse abs(device, abs_brake) orelse abs(device, abs_z)) |source| {
        out.set(.lefttrigger, source);
        mapped |= 0x1;
    }
    if (abs(device, abs_hat2x) orelse abs(device, abs_gas) orelse abs(device, abs_rz)) |source| {
        out.set(.righttrigger, source);
        mapped |= 0x2;
    }
    if (mapped != 0x3 and device.has_hat[2]) {
        out.set(.lefttrigger, hat(device, 2, hat_down));
        out.set(.righttrigger, hat(device, 2, hat_right));
        mapped = 0x3;
    }
    if (mapped & 0x1 == 0) {
        if (button(device, btn_tl2)) |source| {
            out.set(.lefttrigger, source);
            mapped |= 0x1;
        }
    }
    if (mapped & 0x2 == 0) {
        if (button(device, btn_tr2)) |source| out.set(.righttrigger, source);
    }

    // D-pad: digital buttons, then hat 0, then the HAT0X/HAT0Y axes, then the xpad
    // BTN_TRIGGER_HAPPY1..4 quirk.
    mapped = 0;
    if (button(device, btn_dpad_up)) |source| {
        out.set(.dpup, source);
        mapped |= hat_up;
    }
    if (button(device, btn_dpad_down)) |source| {
        out.set(.dpdown, source);
        mapped |= hat_down;
    }
    if (button(device, btn_dpad_left)) |source| {
        out.set(.dpleft, source);
        mapped |= hat_left;
    }
    if (button(device, btn_dpad_right)) |source| {
        out.set(.dpright, source);
        mapped |= hat_right;
    }
    if (mapped != hat_up | hat_down | hat_left | hat_right) {
        if (device.has_hat[0]) {
            out.set(.dpleft, hat(device, 0, hat_left));
            out.set(.dpright, hat(device, 0, hat_right));
            out.set(.dpup, hat(device, 0, hat_up));
            out.set(.dpdown, hat(device, 0, hat_down));
        } else if (abs(device, abs_hat0x) != null and abs(device, abs_hat0y) != null) {
            const x = abs(device, abs_hat0x).?;
            const y = abs(device, abs_hat0y).?;
            out.set(.dpleft, x);
            out.set(.dpright, x);
            out.set(.dpup, y);
            out.set(.dpdown, y);
        } else if (options.driver != null and std.mem.eql(u8, options.driver.?, "xpad") and
            has_key(device, btn_trigger_happy1) and has_key(device, btn_trigger_happy2) and
            has_key(device, btn_trigger_happy3) and has_key(device, btn_trigger_happy4))
        {
            out.set(.dpleft, button(device, btn_trigger_happy1).?);
            out.set(.dpright, button(device, btn_trigger_happy2).?);
            out.set(.dpup, button(device, btn_trigger_happy3).?);
            out.set(.dpdown, button(device, btn_trigger_happy4).?);
        }
    }

    // Sticks: ABS_X/Y for the left stick. The right stick is RX/RY (Linux Gamepad
    // Specification, Xbox, PlayStation) or Z/RZ (Android convention).
    if (abs(device, abs_x)) |x| {
        if (abs(device, abs_y)) |y| {
            out.set(.leftx, x);
            out.set(.lefty, y);
        }
    }
    if (abs(device, abs_rx) != null and abs(device, abs_ry) != null) {
        out.set(.rightx, abs(device, abs_rx).?);
        out.set(.righty, abs(device, abs_ry).?);
    } else if (abs(device, abs_z) != null and abs(device, abs_rz) != null) {
        out.set(.rightx, abs(device, abs_z).?);
        out.set(.righty, abs(device, abs_rz).?);
    }

    // Paddles: GRIPR/GRIPL and GRIPR2/GRIPL2. Microsoft Elite pads on older
    // drivers report them as BTN_TRIGGER_HAPPY5..8 instead.
    mapped = 0;
    if (button(device, btn_gripr)) |source| {
        out.set(.paddle1, source);
        mapped |= 0x2;
    }
    if (button(device, btn_gripl)) |source| {
        out.set(.paddle2, source);
        mapped |= 0x1;
    }
    if (button(device, btn_gripr2)) |source| {
        out.set(.paddle3, source);
        mapped |= 0x8;
    }
    if (button(device, btn_gripl2)) |source| {
        out.set(.paddle4, source);
        mapped |= 0x4;
    }
    if (mapped != 0xf and vendor == vendor_microsoft) {
        if (has_key(device, btn_trigger_happy5) and has_key(device, btn_trigger_happy6) and
            has_key(device, btn_trigger_happy7) and has_key(device, btn_trigger_happy8))
        {
            out.set(.paddle1, button(device, btn_trigger_happy5).?);
            out.set(.paddle2, button(device, btn_trigger_happy7).?);
            out.set(.paddle3, button(device, btn_trigger_happy6).?);
            out.set(.paddle4, button(device, btn_trigger_happy8).?);
        }
    }

    // Xbox Series controllers report the Share button as KEY_RECORD.
    if (button(device, key_record)) |source| out.set(.misc1, source);
    return out;
}

/// Renders `mapping` as the element list of a mapping string (`name:source,...`).
/// Fields with no source are omitted.
pub fn write_elements(writer: *std.Io.Writer, mapping: Mapping) std.Io.Writer.Error!void {
    var first = true;
    for (std.enums.values(Field)) |field| {
        const source = mapping.get(field);
        if (source == .none) continue;
        if (!first) try writer.writeByte(',');
        first = false;
        try writer.print("{s}:", .{@tagName(field)});
        switch (source) {
            .none => unreachable,
            .button => |index| try writer.print("b{d}", .{index}),
            .axis => |axis| {
                switch (axis.half) {
                    .full => {},
                    .positive => try writer.writeByte('+'),
                    .negative => try writer.writeByte('-'),
                }
                try writer.print("a{d}", .{axis.index});
                if (axis.reversed) try writer.writeByte('~');
            },
            .hat => |h| try writer.print("h{d}.{d}", .{ h.index, h.mask }),
        }
    }
}

/// Builds the full mapping text for `device`: `<guid>,<name>,<elements>`, where
/// the GUID has its CRC cleared and commas in the name become spaces (SDL). Pass
/// the result to `gamepad.Database.add`. Returns null for non-gamepads. The caller
/// owns the returned slice and frees it with `allocator`.
pub fn text(
    allocator: std.mem.Allocator,
    device: *const linux_evdev.Device,
    options: Options,
) error{OutOfMemory}!?[]u8 {
    const mapping = generate(device, options) orelse return null;

    var guid = device.guid;
    joystick.set_guid_crc(&guid, 0);

    var out: std.Io.Writer.Allocating = .init(allocator);
    errdefer out.deinit();
    const hex = guid.to_string();
    out.writer.writeAll(&hex) catch return error.OutOfMemory;
    out.writer.writeByte(',') catch return error.OutOfMemory;
    for (device.name) |c| {
        out.writer.writeByte(if (c == ',') ' ' else c) catch return error.OutOfMemory;
    }
    out.writer.writeByte(',') catch return error.OutOfMemory;
    write_elements(&out.writer, mapping) catch return error.OutOfMemory;
    return out.toOwnedSlice() catch return error.OutOfMemory;
}

fn has_key(device: *const linux_evdev.Device, code: usize) bool {
    return code < device.has_key.len and device.has_key[code];
}

/// Button source for a kernel key code, when the device reports it.
fn button(device: *const linux_evdev.Device, code: usize) ?Source {
    if (!has_key(device, code)) return null;
    return .{ .button = device.key_map[code] };
}

/// Axis source for a kernel absolute code, when the device reports it.
fn abs(device: *const linux_evdev.Device, code: usize) ?Source {
    if (code >= device.has_abs.len or !device.has_abs[code]) return null;
    return .{ .axis = .{ .index = device.abs_map[code] } };
}

/// Hat source for hat pair `index` (ABS_HAT<index>X/Y) with direction `mask`.
fn hat(device: *const linux_evdev.Device, index: usize, mask: u8) Source {
    return .{ .hat = .{ .index = device.hat_index[index], .mask = mask } };
}
