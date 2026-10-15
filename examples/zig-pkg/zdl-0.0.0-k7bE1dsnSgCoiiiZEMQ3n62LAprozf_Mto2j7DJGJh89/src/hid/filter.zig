//! Device filtering rules from SDL's hidapi layer (SDL_HIDAPI_ShouldIgnoreDevice
//! in hidapi/SDL_hidapi.c), restricted to the hidraw path. Pure functions over
//! identifiers, so the policy is the same whatever enumeration produced them.
//!
//! The libusb whitelist and GameCube adapter switches belong to SDL's libusb
//! backend, which this native port does not use, so they are omitted. Devices
//! that SDL routes through libusb are ignored here, as SDL does on hidraw.

const std = @import("std");

/// HID bus identifiers as reported by hidapi. Values are the same enum values
/// hidapi exposes, not raw kernel BUS_* codes.
pub const Bus = enum(u8) {
    unknown = 0x00,
    usb = 0x01,
    bluetooth = 0x02,
    i2c = 0x03,
    spi = 0x04,
};

/// Policy settings. SDL reads these from hints; callers pass them directly.
pub const Options = struct {
    /// Ignore non-controller interfaces such as keyboards and mice. Default true, as SDL.
    only_controllers: bool = true,
    /// Comma-separated `0xVVVV/0xPPPP` or `0xVVVV/0x0000` entries, matched case-insensitively.
    ignored_devices: []const u8 = "",
};

const vendor_valve: u16 = 0x28de;
const vendor_flydigi_v1: u16 = 0x04b4;
const product_flydigi_v1_gamepad: u16 = 0x2412;
const vendor_flydigi_v2: u16 = 0x37d7;
const product_flydigi_v2_apex: u16 = 0x2501;
const product_flydigi_v2_apex6: u16 = 0x2502;
const product_flydigi_v2_vader: u16 = 0x2401;
const vendor_nintendo: u16 = 0x057e;
const product_nintendo_gamecube_adapter: u16 = 0x0337;
const vendor_microsoft: u16 = 0x045e;

const usage_page_generic_desktop: u16 = 0x0001;
const usage_page_flydigi_vendor: u16 = 0xffa0;
const usage_generic_mouse: u16 = 0x0002;
const usage_generic_joystick: u16 = 0x0004;
const usage_generic_gamepad: u16 = 0x0005;
const usage_generic_keyboard: u16 = 0x0006;
const usage_generic_multiaxis: u16 = 0x0008;

/// Devices whose hidraw node SDL cannot drive, so they are routed to libusb.
const libusb_required = [_]struct { vendor: u16, product: u16 }{
    .{ .vendor = vendor_nintendo, .product = product_nintendo_gamecube_adapter },
    .{ .vendor = vendor_nintendo, .product = 0x2073 }, // Switch 2 GameCube controller
    .{ .vendor = vendor_nintendo, .product = 0x2067 }, // Switch 2 Joy-Con left
    .{ .vendor = vendor_nintendo, .product = 0x2066 }, // Switch 2 Joy-Con right
    .{ .vendor = vendor_nintendo, .product = 0x2069 }, // Switch 2 Pro
    .{ .vendor = vendor_microsoft, .product = 0x02a0 }, // Xbox 360 big button receiver
};

fn requires_libusb(vendor: u16, product: u16) bool {
    for (libusb_required) |entry| {
        if (entry.vendor == vendor and entry.product == product) return true;
    }
    return false;
}

/// True when the device should be left out of enumeration. `usage_page` and
/// `usage` describe one top-level collection; zero means the report descriptor
/// was unavailable, which skips the controller-only test.
pub fn is_ignored(options: Options, bus: Bus, vendor: u16, product: u16, usage_page: u16, usage: u16) bool {
    if (requires_libusb(vendor, product)) return true;

    if (options.only_controllers and usage_page != 0) {
        if (vendor == vendor_valve) {
            // Steam Controllers also expose a keyboard and mouse collection on USB.
            if (bus == .usb and usage_page == usage_page_generic_desktop and
                (usage == usage_generic_keyboard or usage == usage_generic_mouse))
            {
                return true;
            }
        } else if (vendor == vendor_flydigi_v1 and product == product_flydigi_v1_gamepad) {
            return usage_page != usage_page_flydigi_vendor;
        } else if (vendor == vendor_flydigi_v2 and
            (product == product_flydigi_v2_apex or product == product_flydigi_v2_apex6 or product == product_flydigi_v2_vader))
        {
            return usage_page != usage_page_flydigi_vendor;
        } else if (usage_page == usage_page_generic_desktop and
            (usage == usage_generic_joystick or usage == usage_generic_gamepad or usage == usage_generic_multiaxis))
        {
            // Controller collection: keep it.
        } else {
            return true;
        }
    }

    return matches_ignored_list(options.ignored_devices, vendor, product);
}

/// ASCII case-insensitive substring test, as SDL's strcasestr on ASCII keys.
fn containsIgnoreCase(haystack: []const u8, needle: []const u8) bool {
    if (needle.len > haystack.len) return false;
    var start: usize = 0;
    while (start + needle.len <= haystack.len) : (start += 1) {
        if (std.ascii.eqlIgnoreCase(haystack[start .. start + needle.len], needle)) return true;
    }
    return false;
}

/// Case-insensitive lookup of `0xVVVV/0x0000` and `0xVVVV/0xPPPP` in the list.
fn matches_ignored_list(list: []const u8, vendor: u16, product: u16) bool {
    if (list.len == 0) return false;
    var vendor_key: [13]u8 = undefined;
    var product_key: [13]u8 = undefined;
    _ = std.fmt.bufPrint(&vendor_key, "0x{x:0>4}/0x0000", .{vendor}) catch unreachable;
    _ = std.fmt.bufPrint(&product_key, "0x{x:0>4}/0x{x:0>4}", .{ vendor, product }) catch unreachable;
    return containsIgnoreCase(list, &vendor_key) or
        containsIgnoreCase(list, &product_key);
}
