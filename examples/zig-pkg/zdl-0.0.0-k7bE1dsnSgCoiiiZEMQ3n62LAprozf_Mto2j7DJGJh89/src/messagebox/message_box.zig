//! Typed message box description (SDL_MessageBoxData and its button, color and
//! flag types, SDL_messagebox.h) plus the backend-independent helpers from
//! SDL_video.c: the simple one-button form and the severity rule for flags.
//!
//! The data is borrowed for the duration of a `show` call. Strings and button
//! slices are not copied by this module. Backends that need them longer copy them
//! themselves.
//!
//! Deliberate differences from SDL:
//! - `numbuttons < 0` cannot occur with a slice, so that check is not needed.
//! - SDL's `window` parent pointer is omitted. Backends that need a parent
//!   (X11, Wayland) take their own window handle; zenity ignores it, as SDL does.
//! - Button ids are `i32` as in SDL. Colors use one named field per role instead
//!   of SDL's indexed array, so there is no out-of-range role.
/// The bit values of SDL_MessageBoxFlags, kept in the same positions.
pub const Flags = packed struct(u32) {
    /// SDL_MESSAGEBOX_ERROR (0x10).
    error_dialog: bool = false,
    /// SDL_MESSAGEBOX_WARNING (0x20).
    warning_dialog: bool = false,
    /// SDL_MESSAGEBOX_INFORMATION (0x40).
    information: bool = false,
    /// SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT (0x80).
    buttons_left_to_right: bool = false,
    /// SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT (0x100).
    buttons_right_to_left: bool = false,
    _padding: u27 = 0,

    /// Icon severity. A dialog with several severity bits, or none, shows the
    /// information icon, matching SDL's switch on the masked flags.
    pub fn severity(self: Flags) Severity {
        const masked = @backingInt(self) & (0x10 | 0x20 | 0x40);
        return switch (masked) {
            0x10 => .@"error",
            0x20 => .warning,
            else => .information,
        };
    }
};

/// The icon a message box shows, derived from `Flags`.
pub const Severity = enum { information, warning, @"error" };

/// SDL_MessageBoxButtonFlags.
pub const ButtonFlags = packed struct(u32) {
    /// SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT: activated by Return.
    return_key_default: bool = false,
    /// SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT: activated by Escape.
    escape_key_default: bool = false,
    _padding: u30 = 0,
};

/// One button. `id` is reported back when the user activates it.
pub const Button = struct {
    flags: ButtonFlags = .{},
    id: i32,
    /// Label. Empty text gives a button with no label.
    text: []const u8,
};

/// An RGB color (SDL_MessageBoxColor).
pub const Color = struct { r: u8, g: u8, b: u8 };

/// Colors for the message box roles (SDL_MessageBoxColorType). Backends that
/// draw their own dialog use these; native toolkits ignore them.
pub const ColorScheme = struct {
    background: Color,
    text: Color,
    button_border: Color,
    button_background: Color,
    button_selected: Color,
};

/// Everything needed to show a message box. Borrowed for the duration of a call.
pub const Data = struct {
    flags: Flags = .{},
    /// Window title. Empty means no title.
    title: []const u8 = "",
    /// Message body. Empty means no message.
    message: []const u8 = "",
    /// Buttons in display order. Empty means the backend supplies its default.
    buttons: []const Button = &.{},
    /// Null uses the system's colors.
    color_scheme: ?ColorScheme = null,
};

const simple_ok_button = [_]Button{.{
    .flags = .{ .return_key_default = true, .escape_key_default = true },
    .id = 0,
    .text = "OK",
}};

/// The one-button form (SDL_ShowSimpleMessageBox): an "OK" button that is both the
/// Return and Escape default, with id 0.
pub fn simple(flags: Flags, title: []const u8, message: []const u8) Data {
    return .{
        .flags = flags,
        .title = title,
        .message = message,
        .buttons = &simple_ok_button,
    };
}
