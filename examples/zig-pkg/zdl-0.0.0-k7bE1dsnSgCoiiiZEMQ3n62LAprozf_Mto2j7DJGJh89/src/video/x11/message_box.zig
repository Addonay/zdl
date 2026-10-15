//! X11 message box (SDL_x11messagebox.c, with the parts of SDL_x11toolkit.c it
//! uses): a modal dialog with an icon, a message label and a row of buttons,
//! drawn with core X fonts and the colors of the message box data. Layout,
//! bevels, the pointer protocol (press on button 1, activate on release) and the
//! keyboard protocol (Escape and Return defaults, Tab/Left/Right moving focus)
//! follow SDL's toolkit.
//!
//! The data model is `messagebox/message_box.zig`; the dialog borrows it for the
//! duration of `show`. The allocator holds only the label lines and button
//! layout, and both are freed before `show` returns. The dialog window and its
//! fonts belong to the call and are destroyed before it returns.
//!
//! Deliberate differences from SDL:
//! - Scale is always 1. SDL scales its layout by the Xft DPI.
//! - Right-to-left buttons follow the RTL flag only; SDL also checks the locale
//!   and the message box flip setting.
//! - Colors come from the data's color scheme. Without one, the light scheme is
//!   used. SDL also checks the desktop theme (dbus) to pick a dark scheme.
//! - The dialog is centered horizontally and placed a third of the way down the
//!   primary screen (SDL's rule, without the RandR CRTC lookup). The parent
//!   window only becomes its transient.
//! - The icon glyph uses the plain bold XLFD pattern. SDL's pattern carries a
//!   bracketed glyph list, which is not an XLFD name; it falls back to the text
//!   font where the server rejects it.
//! - Text is drawn with a font set, so UTF-8 labels and buttons are drawn
//!   directly. SDL's Latin-1 path is not used.
//! - Brief flashing and focus-dependent behavior of other backends are not part
//!   of this dialog; it stays open until a button is activated or it is closed.
const std = @import("std");
const message_box = @import("../../messagebox/message_box.zig");
const window = @import("window.zig");
const geometry = @import("../geometry.zig");
const xlib = @import("xlib.zig");

/// Failures while showing the dialog: window and font errors, plus allocation.
pub const Error = window.Error || std.mem.Allocator.Error;

/// SDL_TOOLKIT_X11_ELEMENT_PADDING, _2, _3 and _4 (SDL_x11toolkit.h) at scale 1.
const padding = 4;
const padding_2 = 12;
const padding_3 = 8;
const padding_4 = 16;
/// The minimum width every button gets, as in X11_PositionMessageBox.
const min_button_width = 50;

/// Text sizes used for the body and the buttons (SDL's G_TOOLKITFONT_SIZE, in deci-points).
const text_font_patterns = [_][:0]const u8{
    "-*-*-medium-r-normal--*-140-*-*-*-*-iso10646-1,*",
    "-*-*-medium-r-normal--*-140-*-*-*-*-iso8859-1,*",
    "fixed",
};
/// The icon glyph font (SDL's G_ICONFONT_SIZE = 22), with fallbacks to the text font.
const icon_font_patterns = [_][:0]const u8{
    "-*-*-bold-r-normal-*-22-*-*-*-*-*-iso8859-1",
    "-*-*-medium-r-normal--*-140-*-*-*-*-iso8859-1",
    "fixed",
};

/// A color in the 16-bit channels X uses (XColor), before it is allocated.
const Rgb16 = struct {
    r: u16,
    g: u16,
    b: u16,

    fn from_color(color: message_box.Color) Rgb16 {
        return .{ .r = @as(u16, color.r) * 257, .g = @as(u16, color.g) * 257, .b = @as(u16, color.b) * 257 };
    }

    /// Adds `amount` to every channel, clamped to the 16-bit range (SDL_clamp).
    fn offset(self: Rgb16, amount: i32) Rgb16 {
        return .{ .r = clamp16(self.r, amount), .g = clamp16(self.g, amount), .b = clamp16(self.b, amount) };
    }

    /// The icon's shadow: lighter backgrounds get darker shadows and black gets a
    /// lighter one, as in X11Toolkit_CreateIconControl.
    fn shadow(self: Rgb16) Rgb16 {
        return .{ .r = shadow_channel(self.r), .g = shadow_channel(self.g), .b = shadow_channel(self.b) };
    }
};

fn clamp16(channel: u16, amount: i32) u16 {
    return @intCast(std.math.clamp(@as(i32, channel) + amount, 0, 65535));
}

fn shadow_channel(channel: u16) u16 {
    if (channel > 32896) return clamp16(channel, -12500);
    if (channel == 0) return clamp16(channel, 9000);
    return clamp16(channel, -3000);
}

/// The pixel values for every role the dialog draws with.
const Palette = struct {
    background: c_ulong,
    text: c_ulong,
    border: c_ulong,
    button: c_ulong,
    selected: c_ulong,
    bevel_light: c_ulong,
    bevel_lighter: c_ulong,
    bevel_dark: c_ulong,
    pressed: c_ulong,
    shadow: c_ulong,
    white: c_ulong,
    black: c_ulong,
    red: c_ulong,
    red_dark: c_ulong,
    yellow: c_ulong,
    blue: c_ulong,

    /// Allocates every color in the default colormap. The icon colors are fixed; the
    /// rest derive from the scheme's background, border and button colors.
    fn init(connection: *window.Connection, scheme: message_box.ColorScheme) window.Error!Palette {
        const api = &connection.library.functions;
        const colormap = api.XDefaultColormap(connection.display, connection.screen);
        const background = Rgb16.from_color(scheme.background);
        const border = Rgb16.from_color(scheme.button_border);
        const button = Rgb16.from_color(scheme.button_background);
        return .{
            .background = try alloc(connection, colormap, background),
            .text = try alloc(connection, colormap, Rgb16.from_color(scheme.text)),
            .border = try alloc(connection, colormap, border),
            .button = try alloc(connection, colormap, button),
            .selected = try alloc(connection, colormap, Rgb16.from_color(scheme.button_selected)),
            .bevel_light = try alloc(connection, colormap, border.offset(12500)),
            .bevel_lighter = try alloc(connection, colormap, border.offset(32500)),
            .bevel_dark = try alloc(connection, colormap, border.offset(-22500)),
            .pressed = try alloc(connection, colormap, button.offset(-12500)),
            .shadow = try alloc(connection, colormap, background.shadow()),
            .white = try alloc(connection, colormap, .{ .r = 65535, .g = 65535, .b = 65535 }),
            .black = try alloc(connection, colormap, .{ .r = 0, .g = 0, .b = 0 }),
            .red = try alloc(connection, colormap, .{ .r = 65535, .g = 0, .b = 0 }),
            .red_dark = try alloc(connection, colormap, .{ .r = 40535, .g = 0, .b = 0 }),
            .yellow = try alloc(connection, colormap, .{ .r = 65535, .g = 65535, .b = 0 }),
            .blue = try alloc(connection, colormap, .{ .r = 0, .g = 0, .b = 65535 }),
        };
    }

    /// Releases the colors allocated by `init`. TrueColor and DirectColor visuals
    /// allocate no colormap cells, so nothing is freed there.
    fn deinit(self: *const Palette, connection: *window.Connection) void {
        const visual_class = connection.visual.class;
        if (visual_class == xlib.visual_true_color or visual_class == xlib.visual_direct_color) return;
        const api = &connection.library.functions;
        var pixels: [16]c_ulong = undefined;
        var count: usize = 0;
        inline for (@typeInfo(Palette).@"struct".field_names, @typeInfo(Palette).@"struct".field_types) |name, FieldType| {
            if (FieldType == c_ulong) {
                pixels[count] = @field(self, name);
                count += 1;
            }
        }
        const colormap = api.XDefaultColormap(connection.display, connection.screen);
        _ = api.XFreeColors(connection.display, colormap, &pixels, @intCast(count), 0);
    }

    fn alloc(connection: *window.Connection, colormap: xlib.Colormap, rgb: Rgb16) window.Error!c_ulong {
        var color: xlib.XColor = std.mem.zeroes(xlib.XColor);
        color.red = rgb.r;
        color.green = rgb.g;
        color.blue = rgb.b;
        color.flags = xlib.color_do_red | xlib.color_do_green | xlib.color_do_blue;
        if (connection.library.functions.XAllocColor(connection.display, colormap, &color) == 0) return error.WindowFailure;
        return color.pixel;
    }
};

/// The two fonts: a font set for text (UTF-8, with fallbacks) and a core font
/// for the one-character icon glyph.
const Fonts = struct {
    text: *xlib.FontSet,
    /// Line height and ascent of the text font set, from XExtentsOfFontSet.
    height: i32,
    ascent: i32,
    icon: *xlib.XFontStruct,

    fn open(connection: *window.Connection) window.Error!Fonts {
        const api = &connection.library.functions;
        const display = connection.display;
        var text: ?*xlib.FontSet = null;
        for (text_font_patterns) |pattern| {
            var missing: ?[*]?[*:0]u8 = null;
            var missing_count: c_int = 0;
            var default_text: ?[*:0]u8 = null;
            text = api.XCreateFontSet(display, pattern.ptr, &missing, &missing_count, &default_text);
            if (missing) |list| api.XFreeStringList(list);
            if (text != null) break;
        }
        const set = text orelse return error.FontUnavailable;
        errdefer api.XFreeFontSet(display, set);
        const extents = api.XExtentsOfFontSet(set) orelse return error.FontUnavailable;
        const logical = extents.max_logical_extent;

        var icon: ?*xlib.XFontStruct = null;
        for (icon_font_patterns) |pattern| {
            icon = api.XLoadQueryFont(display, pattern.ptr);
            if (icon != null) break;
        }
        return .{
            .text = set,
            .height = logical.height,
            .ascent = -@as(i32, logical.y),
            .icon = icon orelse return error.FontUnavailable,
        };
    }

    fn close(self: *Fonts, connection: *window.Connection) void {
        const api = &connection.library.functions;
        _ = api.XFreeFont(connection.display, self.icon);
        api.XFreeFontSet(connection.display, self.text);
        self.* = undefined;
    }
};

/// A rectangle in window coordinates.
const Rect = struct {
    x: i32 = 0,
    y: i32 = 0,
    w: i32 = 0,
    h: i32 = 0,

    fn contains(self: Rect, px: i32, py: i32) bool {
        return px >= self.x and px <= self.x + self.w and py >= self.y and py <= self.y + self.h;
    }
};

/// The press state of a button (SDL_TOOLKIT_CONTROL_STATE_X11_*).
const ButtonState = enum { normal, hover, pressed_held, pressed };

const Button = struct {
    id: i32,
    text: []const u8,
    default_enter: bool,
    default_escape: bool,
    rect: Rect = .{},
    text_width: i32 = 0,
    state: ButtonState = .normal,
    /// The keyboard focus marker: Return activates the selected button.
    selected: bool = false,
};

/// One line of the message label, borrowed from the message text.
const Line = struct {
    text: []const u8,
    rect: Rect = .{},
};

/// The icon kinds SDL draws; `null` when the flags name no severity exactly.
const IconKind = enum { @"error", warning, information };

/// Chooses the icon from the flags the way SDL's switch does: exactly one of the
/// three severity bits. Two bits together (or none) draw no icon.
fn icon_kind(flags: message_box.Flags) ?IconKind {
    return switch (@backingInt(flags) & (0x10 | 0x20 | 0x40)) {
        0x10 => .@"error",
        0x20 => .warning,
        0x40 => .information,
        else => null,
    };
}

/// Splits `text` at line feeds, dropping a carriage return before each one.
/// A trailing line feed does not start an empty line, as SDL's count does.
fn split_lines(allocator: std.mem.Allocator, text: []const u8) std.mem.Allocator.Error![]Line {
    var lines: std.ArrayList(Line) = .empty;
    errdefer lines.deinit(allocator);
    var rest = text;
    while (rest.len > 0) {
        if (std.mem.indexOfScalar(u8, rest, '\n')) |newline| {
            const end = if (newline > 0 and rest[newline - 1] == '\r') newline - 1 else newline;
            try lines.append(allocator, .{ .text = rest[0..end] });
            rest = rest[newline + 1 ..];
        } else {
            try lines.append(allocator, .{ .text = rest });
            rest = rest[rest.len..];
        }
    }
    return lines.toOwnedSlice(allocator);
}

/// Everything the dialog keeps while it is open. The window is created by `show`
/// and borrowed by this struct, so it has a stable address for the whole call.
const Dialog = struct {
    connection: *window.Connection,
    win: *window.Window,
    fonts: *Fonts,
    palette: Palette,
    icon: ?Icon = null,
    label: ?[]Line = null,
    label_rect: Rect = .{},
    buttons: []Button,
    flags: message_box.Flags = .{},
    /// Button under the pointer, or the one pressed with button 1.
    fiddled: ?usize = null,
    /// Button with keyboard focus (SDL's focused_control).
    focused: ?usize = null,
    has_focus: bool = false,
    last_key: ?window.Scancode = null,
    escape_button: ?usize = null,
    enter_button: ?usize = null,
    /// Set when a button activates or the window is closed.
    result: ?i32 = null,
    closed: bool = false,
    dirty: bool = false,

    const Icon = struct {
        kind: IconKind,
        rect: Rect = .{},
        glyph: u8,
        glyph_x: i32 = 0,
        glyph_y: i32 = 0,
    };

    /// Handles one event for this window and marks the dialog for redraw when the
    /// state changed. Events for other windows are ignored.
    fn handle(self: *Dialog, event: window.Event) void {
        if (event.window != self.win.id) return;
        switch (event.payload) {
            .close, .destroyed => self.closed = true,
            .exposed => self.dirty = true,
            .focused => |focused| {
                if (focused) {
                    self.has_focus = true;
                } else self.focus_lost();
            },
            .motion => |motion| self.pointer_moved(motion.position),
            .button => |button| {
                if (button.pressed) self.button_pressed(button.button, button.position) else self.button_released(button.button, button.position);
            },
            .key => |press| self.key(press),
            else => {},
        }
    }

    /// FocusOut: clears the pointer and key state, as SDL does.
    fn focus_lost(self: *Dialog) void {
        self.has_focus = false;
        if (self.fiddled) |index| self.buttons[index].selected = false;
        self.fiddled = null;
        for (self.buttons) |*button| button.state = .normal;
        self.dirty = true;
    }

    /// Hover tracking: while the dialog has focus, the button under the pointer
    /// shows the hover state.
    fn pointer_moved(self: *Dialog, position: geometry.Point(i32)) void {
        if (!self.has_focus) return;
        const previous = self.fiddled;
        self.fiddled = self.button_at(position.x, position.y);
        if (previous) |index| {
            self.buttons[index].state = .normal;
            self.dirty = true;
        }
        if (self.fiddled) |index| {
            self.buttons[index].state = .hover;
            self.dirty = true;
        }
    }

    /// Button 1 pressed on a button starts a held press; other buttons only clear
    /// the previous press.
    fn button_pressed(self: *Dialog, button: u8, position: geometry.Point(i32)) void {
        if (self.fiddled) |index| {
            self.buttons[index].state = .normal;
            self.dirty = true;
        }
        if (button != 1) return;
        self.fiddled = self.button_at(position.x, position.y);
        if (self.fiddled) |index| {
            self.buttons[index].state = .pressed_held;
            self.dirty = true;
        }
    }

    /// Button 1 released over the button it was pressed on activates it.
    fn button_released(self: *Dialog, button: u8, position: geometry.Point(i32)) void {
        if (button != 1) return;
        const index = self.fiddled orelse return;
        if (self.button_at(position.x, position.y) == index) {
            self.buttons[index].state = .pressed;
            self.activate(index);
            self.buttons[index].state = .normal;
            self.dirty = true;
        }
    }

    /// Escape and Return press their default buttons; the matching release
    /// activates them. Tab, Left and Right move the focus marker on release.
    fn key(self: *Dialog, event: window.Event.Key) void {
        if (event.pressed) {
            self.last_key = event.scancode;
            switch (event.scancode) {
                .escape => {
                    for (self.buttons, 0..) |*button, index| {
                        if (!button.default_escape) continue;
                        button.state = .pressed;
                        self.escape_button = index;
                        self.dirty = true;
                    }
                },
                .@"return", .kp_enter => {
                    for (self.buttons, 0..) |*button, index| {
                        if (!button.selected) continue;
                        button.state = .pressed;
                        self.enter_button = index;
                        self.dirty = true;
                    }
                },
                else => {},
            }
            return;
        }
        // A release for a key that was not pressed here is ignored.
        if (self.last_key != event.scancode) return;
        switch (event.scancode) {
            .escape => if (self.escape_button) |index| self.activate_pressed(index),
            .@"return", .kp_enter => if (self.enter_button) |index| self.activate_pressed(index),
            .tab, .left, .right => self.move_focus(event.scancode),
            else => {},
        }
    }

    /// Moves the focus marker from the focused button: Tab wraps to the first
    /// button, Left and Right stop at the ends (SDL's dynamic-control rule).
    fn move_focus(self: *Dialog, scancode: window.Scancode) void {
        if (self.focused) |current| self.buttons[current].selected = false;
        self.dirty = true;
        const current = self.focused orelse return;
        const count: isize = @intCast(self.buttons.len);
        var next: isize = if (scancode == .left) @as(isize, @intCast(current)) - 1 else @as(isize, @intCast(current)) + 1;
        if (next < 0 or next >= count) {
            next = if (scancode == .tab) 0 else @intCast(current);
        }
        const index: usize = @intCast(next);
        self.focused = index;
        self.buttons[index].selected = true;
    }

    /// Activates a button held by the keyboard. Only buttons still in the pressed
    /// state activate, as SDL's button callback requires.
    fn activate_pressed(self: *Dialog, index: usize) void {
        if (self.buttons[index].state == .pressed) self.activate(index);
        self.buttons[index].state = .normal;
        self.dirty = true;
    }

    fn activate(self: *Dialog, index: usize) void {
        self.result = self.buttons[index].id;
        self.closed = true;
    }

    /// The button under (x, y), inclusive at its edges as in SDL.
    fn button_at(self: *const Dialog, x: i32, y: i32) ?usize {
        for (self.buttons, 0..) |button, index| {
            if (button.rect.contains(x, y)) return index;
        }
        return null;
    }

    /// Redraws the whole dialog and flushes it to the server.
    fn draw(self: *Dialog) void {
        if (!self.dirty) return;
        self.dirty = false;
        const api = &self.connection.library.functions;
        const display = self.connection.display;
        const drawable: xlib.Drawable = @intCast(@backingInt(self.win.id));
        const gc = self.win.gc;
        const size = self.win.size;
        _ = api.XSetForeground(display, gc, self.palette.background);
        _ = api.XFillRectangle(display, drawable, gc, 0, 0, size.width, size.height);
        if (self.icon) |icon| self.draw_icon(icon);
        if (self.label) |lines| {
            _ = api.XSetForeground(display, gc, self.palette.text);
            for (lines) |line| {
                self.draw_text(line.text, self.label_rect.x + line.rect.x, self.label_rect.y + line.rect.y);
            }
        }
        for (self.buttons) |button| self.draw_button(button);
        _ = api.XFlush(display);
    }

    fn draw_icon(self: *Dialog, icon: Icon) void {
        const api = &self.connection.library.functions;
        const display = self.connection.display;
        const drawable: xlib.Drawable = @intCast(@backingInt(self.win.id));
        const gc = self.win.gc;
        const x = icon.rect.x;
        const y = icon.rect.y;
        // The disc is the icon rectangle without its two extra pixels of margin.
        const w = icon.rect.w - 2;
        const h = icon.rect.h - 2;
        const palette = self.palette;
        _ = api.XSetForeground(display, gc, palette.shadow);
        _ = api.XFillArc(display, drawable, gc, x + 2, y + 2, fill_size(w), fill_size(h), 0, 360 * 64);
        const disc: struct { outer: c_ulong, inner: c_ulong, glyph: c_ulong } = switch (icon.kind) {
            .@"error" => .{ .outer = palette.red_dark, .inner = palette.red, .glyph = palette.white },
            .warning => .{ .outer = palette.black, .inner = palette.yellow, .glyph = palette.black },
            .information => .{ .outer = palette.white, .inner = palette.blue, .glyph = palette.white },
        };
        _ = api.XSetForeground(display, gc, disc.outer);
        _ = api.XFillArc(display, drawable, gc, x, y, fill_size(w), fill_size(h), 0, 360 * 64);
        _ = api.XSetForeground(display, gc, disc.inner);
        _ = api.XFillArc(display, drawable, gc, x + 1, y + 1, fill_size(w - 2), fill_size(h - 2), 0, 360 * 64);
        _ = api.XSetForeground(display, gc, disc.glyph);
        _ = api.XSetFont(display, gc, self.fonts.icon.fid);
        _ = api.XDrawString(display, drawable, gc, x + icon.glyph_x, y + icon.glyph_y, @ptrCast(&icon.glyph), 1);
    }

    fn draw_button(self: *Dialog, button: Button) void {
        const api = &self.connection.library.functions;
        const display = self.connection.display;
        const gc = self.win.gc;
        const r = button.rect;
        const palette = self.palette;
        const hover_fill = if (button.state == .hover) palette.selected else palette.button;
        if (button.state == .pressed or button.state == .pressed_held) {
            self.fill(palette.bevel_dark, r.x, r.y, r.w, r.h);
            self.fill(palette.bevel_lighter, r.x, r.y, r.w - 1, r.h - 1);
            self.fill(palette.bevel_light, r.x + 1, r.y + 1, r.w - 3, r.h - 2);
            self.fill(palette.border, r.x + 1, r.y + 1, r.w - 3, r.h - 3);
            self.fill(palette.pressed, r.x + 2, r.y + 2, r.w - 4, r.h - 4);
        } else if (button.selected) {
            self.fill(palette.bevel_dark, r.x, r.y, r.w, r.h);
            self.fill(palette.bevel_lighter, r.x + 1, r.y + 1, r.w - 3, r.h - 3);
            self.fill(palette.border, r.x + 2, r.y + 2, r.w - 4, r.h - 4);
            self.fill(palette.bevel_light, r.x + 2, r.y + 2, r.w - 5, r.h - 5);
            self.fill(hover_fill, r.x + 3, r.y + 3, r.w - 6, r.h - 6);
        } else {
            self.fill(palette.bevel_dark, r.x, r.y, r.w, r.h);
            self.fill(palette.bevel_lighter, r.x, r.y, r.w - 1, r.h - 1);
            self.fill(palette.border, r.x + 1, r.y + 1, r.w - 2, r.h - 2);
            self.fill(palette.bevel_light, r.x + 1, r.y + 1, r.w - 3, r.h - 3);
            self.fill(hover_fill, r.x + 2, r.y + 2, r.w - 4, r.h - 4);
        }
        _ = api.XSetForeground(display, gc, palette.text);
        // Text is centered in the button by its width and the font height.
        const text_x = r.x + @divTrunc(r.w - button.text_width, 2);
        const text_y = r.y + @divTrunc(r.h - self.fonts.height, 2);
        self.draw_text(button.text, text_x, text_y);
    }

    fn fill(self: *Dialog, color: c_ulong, x: i32, y: i32, w: i32, h: i32) void {
        const api = &self.connection.library.functions;
        const drawable: xlib.Drawable = @intCast(@backingInt(self.win.id));
        _ = api.XSetForeground(self.connection.display, self.win.gc, color);
        _ = api.XFillRectangle(self.connection.display, drawable, self.win.gc, x, y, fill_size(w), fill_size(h));
    }

    /// Draws UTF-8 text with its top-left at (x, y): the baseline sits one font
    /// ascent below.
    fn draw_text(self: *Dialog, text: []const u8, x: i32, y: i32) void {
        if (text.len == 0) return;
        const api = &self.connection.library.functions;
        const drawable: xlib.Drawable = @intCast(@backingInt(self.win.id));
        api.Xutf8DrawString(self.connection.display, drawable, self.fonts.text, self.win.gc, x, y + self.fonts.ascent, text.ptr, @intCast(text.len));
    }
};

/// Clamps a rectangle size to the non-negative range the X calls take.
fn fill_size(value: i32) c_uint {
    return @intCast(@max(value, 0));
}

/// Text width of `text` in the dialog font (Xutf8TextEscapement).
fn text_width(connection: *window.Connection, fonts: *const Fonts, text: []const u8) i32 {
    if (text.len == 0) return 0;
    const api = &connection.library.functions;
    return api.Xutf8TextEscapement(fonts.text, text.ptr, @intCast(text.len));
}

/// Shows `data` as a modal dialog and runs its event loop until a button is
/// activated or the window is closed. Returns the activated button's id, or null
/// when the window was closed without one. `parent` becomes the transient parent.
/// With no buttons, one OK button is used (`message_box.simple`).
///
/// The window is created, shown and destroyed inside the call, and the event
/// loop blocks the calling thread on the connection.
pub fn show(allocator: std.mem.Allocator, connection: *window.Connection, parent: ?*const window.Window, data: message_box.Data) Error!?i32 {
    const fonts_value = try Fonts.open(connection);
    var fonts = fonts_value;
    defer fonts.close(connection);
    const scheme = data.color_scheme orelse default_scheme;
    const palette = try Palette.init(connection, scheme);
    defer palette.deinit(connection);

    const source_buttons = if (data.buttons.len == 0) message_box.simple(.{}, "", "").buttons else data.buttons;
    const buttons = try allocator.alloc(Button, source_buttons.len);
    defer allocator.free(buttons);
    var focus: ?usize = null;
    for (source_buttons, buttons, 0..) |source, *button, index| {
        button.* = .{
            .id = source.id,
            .text = source.text,
            .default_enter = source.flags.return_key_default,
            .default_escape = source.flags.escape_key_default,
            .selected = source.flags.return_key_default,
            .text_width = text_width(connection, &fonts, source.text),
        };
        if (button.selected) focus = index;
    }

    var dialog: Dialog = .{
        .connection = connection,
        .win = undefined,
        .fonts = &fonts,
        .palette = palette,
        .buttons = buttons,
        .flags = data.flags,
        .focused = focus,
    };

    if (icon_kind(data.flags)) |kind| {
        const glyph: u8 = switch (kind) {
            .@"error" => 'X',
            .warning => '!',
            .information => 'i',
        };
        dialog.icon = try icon_layout(connection, &fonts, kind, glyph);
    }
    if (data.message.len > 0) {
        // Line rectangles are relative to the label: each line is one font height below the last.
        const lines = try split_lines(allocator, data.message);
        var total: i32 = 0;
        var widest: i32 = 0;
        for (lines) |*line| {
            line.rect = .{ .y = total, .w = text_width(connection, &fonts, line.text), .h = fonts.height };
            total += fonts.height;
            widest = @max(widest, line.rect.w);
        }
        dialog.label = lines;
        dialog.label_rect = .{ .w = widest, .h = total };
    }
    defer if (dialog.label) |lines| allocator.free(lines);

    const size = layout(&dialog);
    const width = std.math.cast(u16, size.w) orelse return error.InvalidSize;
    const height = std.math.cast(u16, size.h) orelse return error.InvalidSize;
    var win = try window.Window.create(connection, .{
        .size = .{ .width = width, .height = height },
        .title = data.title,
        .visible = false,
    });
    defer win.deinit();
    dialog.win = &win;
    try set_dialog_type(connection, &win);
    if (parent) |owner| try win.set_transient_for(owner);
    try win.set_minimum_size(.{ .width = width, .height = height });
    try win.set_maximum_size(.{ .width = width, .height = height });
    const screen_width = connection.library.functions.XDisplayWidth(connection.display, connection.screen);
    const screen_height = connection.library.functions.XDisplayHeight(connection.display, connection.screen);
    try win.move(.{
        .x = @divTrunc(screen_width - @as(c_int, width), 2),
        .y = @divTrunc(screen_height - @as(c_int, height), 3),
    });
    try win.show();
    try win.raise();
    dialog.dirty = true;
    dialog.draw();

    while (!dialog.closed) {
        const event = (try connection.next_event_within(-1)) orelse continue;
        dialog.handle(event);
        dialog.draw();
    }
    return dialog.result;
}

/// The light scheme used when the data does not give one (SDL's
/// g_default_colors for the light theme).
const default_scheme: message_box.ColorScheme = .{
    .background = .{ .r = 191, .g = 184, .b = 191 },
    .text = .{ .r = 0, .g = 0, .b = 0 },
    .button_border = .{ .r = 127, .g = 120, .b = 127 },
    .button_background = .{ .r = 191, .g = 184, .b = 191 },
    .button_selected = .{ .r = 235, .g = 235, .b = 235 },
};

/// Sizes the icon and places its glyph (X11Toolkit_CalculateIconControl at scale 1).
/// The rectangle is the glyph square plus the padding, and two more pixels for the shadow.
fn icon_layout(connection: *window.Connection, fonts: *const Fonts, kind: IconKind, glyph: u8) window.Error!Dialog.Icon {
    const api = &connection.library.functions;
    var char_info: xlib.XCharStruct = std.mem.zeroes(xlib.XCharStruct);
    var direction: c_int = 0;
    var ascent: c_int = 0;
    var descent: c_int = 0;
    const text = [_]u8{glyph};
    _ = api.XTextExtents(fonts.icon, &text, 1, &direction, &ascent, &descent, &char_info);
    const glyph_w: i32 = char_info.width;
    const glyph_h: i32 = char_info.ascent + char_info.descent;
    const glyph_a: i32 = char_info.ascent;
    const square = @max(glyph_w, glyph_h) + padding * 2;
    return .{
        .kind = kind,
        .glyph = glyph,
        .rect = .{ .w = square + 2, .h = square + 2 },
        .glyph_y = glyph_a + @divTrunc(square - glyph_h, 2),
        .glyph_x = @divTrunc(square - glyph_w, 2),
    };
}

/// Positions the icon, label and buttons and returns the window size: a first
/// line (icon and label) above a second line (buttons), each centered against
/// the wider of the two, port of X11_PositionMessageBox at scale 1.
fn layout(dialog: *Dialog) struct { w: i32, h: i32 } {
    const flags = dialog.flags;
    var first_width: i32 = 0;
    var first_height: i32 = 0;
    var second_width: i32 = 0;
    var second_height: i32 = 0;
    const rtl = flags.buttons_right_to_left;

    const label_first_height: i32 = dialog.fonts.height;
    if (dialog.icon) |*icon| {
        if (dialog.label != null) {
            icon.rect.y = 0;
            first_width = icon.rect.w + padding_2 + dialog.label_rect.w;
            dialog.label_rect.x = icon.rect.w + padding_2;
            icon.rect.x = 0;
            if (dialog.label_rect.h > icon.rect.h) {
                dialog.label_rect.y = @divTrunc(icon.rect.h - label_first_height, 2);
                first_height = dialog.label_rect.y + dialog.label_rect.h;
            } else {
                dialog.label_rect.y = @divTrunc(icon.rect.h - dialog.label_rect.h, 2);
                first_height = icon.rect.h;
            }
        } else {
            first_width = icon.rect.w;
            first_height = icon.rect.h;
            icon.rect.x = 0;
            icon.rect.y = 0;
        }
    } else if (dialog.label != null) {
        first_width = dialog.label_rect.w;
        first_height = dialog.label_rect.h;
        dialog.label_rect.x = 0;
        dialog.label_rect.y = 0;
    }

    var max_button_width: i32 = min_button_width;
    var max_button_height: i32 = 0;
    for (dialog.buttons) |*button| {
        button.rect.w = button.text_width + padding_3 * 2;
        button.rect.h = dialog.fonts.height + padding_3 * 2;
        max_button_width = @max(max_button_width, button.rect.w);
        max_button_height = @max(max_button_height, button.rect.h);
        button.rect.x = 0;
        button.rect.y = 0;
    }
    for (dialog.buttons) |*button| {
        button.rect.w = max_button_width;
        button.rect.h = max_button_height;
    }
    const count = dialog.buttons.len;
    if (count > 0) {
        if (first_height != 0) {
            second_height = max_button_height + padding_4;
        } else {
            second_height = max_button_height;
        }
        if (first_height != 0) {
            for (dialog.buttons) |*button| button.rect.y = first_height + padding_4;
        }
        if (rtl) {
            var index = count;
            while (index > 0) {
                index -= 1;
                if (index + 1 < count) {
                    const next = dialog.buttons[index + 1].rect;
                    dialog.buttons[index].rect.x = next.x + next.w + padding_3;
                }
            }
            second_width = dialog.buttons[0].rect.x + dialog.buttons[0].rect.w;
        } else {
            for (1..count) |index| {
                const previous = dialog.buttons[index - 1].rect;
                dialog.buttons[index].rect.x = previous.x + previous.w + padding_3;
            }
            const last = dialog.buttons[count - 1].rect;
            second_width = last.x + last.w;
        }
    }

    // Center the shorter line against the longer one.
    if (second_width > first_width) {
        const pad = @divTrunc(second_width - first_width, 2);
        if (dialog.label != null) dialog.label_rect.x += pad;
        if (dialog.icon) |*icon| icon.rect.x += pad;
    } else {
        const pad = @divTrunc(first_width - second_width, 2);
        for (dialog.buttons) |*button| button.rect.x += pad;
    }

    const window_width = @max(first_width, second_width) + padding_2 * 2;
    const window_height = first_height + second_height + padding_2 * 2;
    if (dialog.label != null) {
        dialog.label_rect.x += padding_2;
        dialog.label_rect.y += padding_2;
    }
    if (dialog.icon) |*icon| {
        icon.rect.x += padding_2;
        icon.rect.y += padding_2;
    }
    for (dialog.buttons) |*button| {
        button.rect.x += padding_2;
        button.rect.y += padding_2;
    }
    return .{ .w = window_width, .h = window_height };
}

fn set_dialog_type(connection: *window.Connection, win: *window.Window) window.Error!void {
    const api = &connection.library.functions;
    var dialog_type = [_]xlib.Atom{connection.atom(._NET_WM_WINDOW_TYPE_DIALOG)};
    _ = api.XChangeProperty(connection.display, @backingInt(win.id), connection.atom(._NET_WM_WINDOW_TYPE), xlib.xa_atom, 32, xlib.prop_mode_replace, @ptrCast(&dialog_type), 1);
    try connection.flush();
}
