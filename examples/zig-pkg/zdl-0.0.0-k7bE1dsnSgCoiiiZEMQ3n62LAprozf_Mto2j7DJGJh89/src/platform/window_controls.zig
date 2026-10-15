//! Window controls for a custom title bar (the Linux counterpart of Electron's
//! `titleBarOverlay`): minimize, maximize/restore and close buttons drawn by the
//! application, placed where the desktop puts them, with the hover and pressed
//! state the buttons need and the title-bar area left between the groups.
//!
//! Pieces:
//! - `Layout`: which buttons sit on which side, read from the desktop. KDE
//!   (kwinrc `[org.kde.kdecoration2]` ButtonsOnLeft/ButtonsOnRight, KWin letters)
//!   and GNOME (`org.gnome.desktop.wm.preferences button-layout`, through
//!   `gsettings`) are recognized; the default is ":minimize,maximize,close".
//!   Parsers are pure; `load` is the only part that touches the file system or
//!   runs a process, and it falls back to the default on any failure.
//! - `Geometry`: button rectangles and the title-bar area for a window width, and
//!   the hit-test description (`HitTest`) that makes the header draggable while
//!   the buttons keep receiving clicks.
//! - `Controls`: hover and pressed tracking fed by pointer events, reporting the
//!   `Action` a completed click asks for. Nothing here calls the window: the
//!   application performs the action, so the state machine needs no window.
//! - `Controls.draw`: a default renderer for the buttons using the zdl software
//!   renderer. Strokes are whole pixels scaled by `Metrics.scale`, so the glyphs stay
//!   crisp on HiDPI when the surface is in physical pixels.
//!
//! Coordinates are window pixels with the origin at the top-left corner.
const std = @import("std");
const hit = @import("hit_test.zig");
const geometry = @import("../video/geometry.zig");
const pixels = @import("../video/pixels.zig");
const renderer_mod = @import("../render/renderer.zig");
const window_state = @import("../video/window_state.zig");

const Renderer = renderer_mod.Renderer;
const Color = pixels.Color;
const FRect = geometry.Rect(f32);
const FPoint = geometry.Point(f32);

/// A window control button.
pub const Button = enum { minimize, maximize, close };

/// What a completed click on a button asks the application to do.
pub const Action = enum { minimize, toggle_maximize, close_request };

/// Most buttons a layout can hold: one of each kind.
pub const max_buttons = 3;

/// The buttons of one side of the title bar, in the order they appear from the
/// window edge outward on the left and from the inner side outward on the right.
pub const Group = struct {
    items: [max_buttons]Button = undefined,
    len: u8 = 0,

    /// Builds a group from buttons in display order, ignoring repeats.
    pub fn from_slice(buttons: []const Button) Group {
        var group: Group = .{};
        for (buttons) |button| _ = group.append(button);
        return group;
    }

    /// The buttons in display order.
    pub fn slice(self: *const Group) []const Button {
        return self.items[0..self.len];
    }

    /// Appends a button unless it is already present. Returns false when it was not added.
    pub fn append(self: *Group, button: Button) bool {
        for (self.slice()) |existing| if (existing == button) return false;
        if (self.len == max_buttons) return false;
        self.items[self.len] = button;
        self.len += 1;
        return true;
    }
};

/// Buttons on each side of the title bar.
pub const Layout = struct {
    left: Group = .{},
    right: Group = Group.from_slice(&.{ .minimize, .maximize, .close }),

    /// Parses a GNOME `button-layout` value such as `appmenu:minimize,maximize,close`.
    /// Quotes around the value (gsettings prints them) are ignored; names that are
    /// not one of the three buttons (appmenu, icon, spacer, ...) are skipped. Without
    /// a colon the whole value is the right side.
    pub fn parse_gnome(text: []const u8) Layout {
        const value = std.mem.trim(u8, text, " \t\r\n'\"");
        const colon = std.mem.indexOfScalar(u8, value, ':');
        const left_text = if (colon) |index| value[0..index] else "";
        const right_text = if (colon) |index| value[index + 1 ..] else value;
        var layout: Layout = .{ .left = .{}, .right = .{} };
        layout.left = parse_gnome_side(left_text);
        layout.right = parse_gnome_side(right_text);
        return layout;
    }

    fn parse_gnome_side(text: []const u8) Group {
        var group: Group = .{};
        var names = std.mem.splitScalar(u8, text, ',');
        while (names.next()) |raw| {
            const name = std.mem.trim(u8, raw, " \t\r\n'\"");
            if (std.mem.eql(u8, name, "minimize")) {
                _ = group.append(.minimize);
            } else if (std.mem.eql(u8, name, "maximize")) {
                _ = group.append(.maximize);
            } else if (std.mem.eql(u8, name, "close")) {
                _ = group.append(.close);
            }
        }
        return group;
    }

    /// Parses KWin's `ButtonsOnLeft` / `ButtonsOnRight` letters: `I` minimize,
    /// `A` maximize (keep-above is `F`, help `H`, menu `M`), `X` close. Letters for
    /// buttons this layer does not draw are skipped.
    pub fn parse_kwin_side(text: []const u8) Group {
        var group: Group = .{};
        for (text) |letter| switch (letter) {
            'I' => _ = group.append(.minimize),
            'A' => _ = group.append(.maximize),
            'X' => _ = group.append(.close),
            else => {},
        };
        return group;
    }

    /// Parses a kwinrc file. A missing `ButtonsOnRight` key keeps KWin's default
    /// (minimize, maximize, close); a missing `ButtonsOnLeft` key means no buttons.
    pub fn parse_kwinrc(text: []const u8) Layout {
        var layout: Layout = .{ .left = .{}, .right = default_right };
        var in_section = false;
        var lines = std.mem.splitScalar(u8, text, '\n');
        while (lines.next()) |raw| {
            const line = std.mem.trim(u8, raw, " \t\r");
            if (line.len == 0 or line[0] == '#' or line[0] == ';') continue;
            if (line[0] == '[') {
                in_section = std.mem.eql(u8, line, "[org.kde.kdecoration2]");
                continue;
            }
            if (!in_section) continue;
            const equals = std.mem.indexOfScalar(u8, line, '=') orelse continue;
            const key = std.mem.trim(u8, line[0..equals], " \t");
            const value = std.mem.trim(u8, line[equals + 1 ..], " \t");
            if (std.mem.eql(u8, key, "ButtonsOnLeft")) {
                layout.left = parse_kwin_side(value);
            } else if (std.mem.eql(u8, key, "ButtonsOnRight")) {
                layout.right = parse_kwin_side(value);
            }
        }
        return layout;
    }

    /// The default layout: no buttons on the left, minimize, maximize and close on the right.
    pub const default: Layout = .{ .left = .{}, .right = default_right };

    const default_right = Group.from_slice(&.{ .minimize, .maximize, .close });
};

/// Where the desktop configuration can be found. Callers read these variables
/// (the platform never calls getenv), so tests can supply any combination.
pub const Desktop = struct {
    /// XDG_CURRENT_DESKTOP, for example "KDE" or "ubuntu:GNOME".
    current: ?[]const u8 = null,
    /// XDG_CONFIG_HOME, which holds kwinrc.
    config_home: ?[]const u8 = null,
    /// HOME, used when XDG_CONFIG_HOME is unset.
    home: ?[]const u8 = null,
};

/// Reads the button layout of the running desktop. KDE reads kwinrc; GNOME and
/// its derivatives ask `gsettings`. Any other desktop, and any failure to read or
/// run, yields `Layout.default`. Allocates only transiently.
pub fn load(allocator: std.mem.Allocator, io: std.Io, desktop: Desktop) Layout {
    const names = desktop.current orelse return Layout.default;
    if (std.mem.indexOf(u8, names, "KDE") != null) {
        const path = if (desktop.config_home) |dir|
            std.fmt.allocPrint(allocator, "{s}/kwinrc", .{dir}) catch return Layout.default
        else if (desktop.home) |dir|
            std.fmt.allocPrint(allocator, "{s}/.config/kwinrc", .{dir}) catch return Layout.default
        else
            return Layout.default;
        defer allocator.free(path);
        const text = std.Io.Dir.cwd().readFileAlloc(io, path, allocator, .unlimited) catch return Layout.default;
        defer allocator.free(text);
        return Layout.parse_kwinrc(text);
    }
    if (std.mem.indexOf(u8, names, "GNOME") != null or std.mem.indexOf(u8, names, "Unity") != null) {
        const result = std.process.run(allocator, io, .{
            .argv = &.{ "gsettings", "get", "org.gnome.desktop.wm.preferences", "button-layout" },
            .stdout_limit = .limited(4096),
            .stderr_limit = .limited(4096),
        }) catch return Layout.default;
        defer allocator.free(result.stdout);
        defer allocator.free(result.stderr);
        switch (result.term) {
            .exited => |code| if (code != 0) return Layout.default,
            else => return Layout.default,
        }
        return Layout.parse_gnome(result.stdout);
    }
    return Layout.default;
}

/// Pixel metrics of the header and its buttons. Use `scaled` for HiDPI.
pub const Metrics = struct {
    /// Header and button height.
    height: i32 = 36,
    button_width: i32 = 46,
    /// Side of the symbol box.
    glyph: i32 = 10,
    /// Stroke width of symbols.
    stroke: i32 = 1,

    /// The default metrics multiplied by an integer scale (at least 1).
    pub fn scaled(scale: i32) Metrics {
        const factor = @max(scale, 1);
        const base: Metrics = .{};
        return .{
            .height = base.height * factor,
            .button_width = base.button_width * factor,
            .glyph = base.glyph * factor,
            .stroke = base.stroke * factor,
        };
    }
};

/// Colors of the buttons. The defaults follow Breeze in its light scheme.
pub const Theme = struct {
    symbol: Color = .{ .r = 0x23, .g = 0x26, .b = 0x29 },
    /// Symbols while the window is not focused.
    inactive_symbol: Color = .{ .r = 0x7f, .g = 0x84, .b = 0x8a },
    hover: Color = .{ .r = 0xd5, .g = 0xd8, .b = 0xdb },
    pressed: Color = .{ .r = 0xc3, .g = 0xc7, .b = 0xca },
    close_hover: Color = .{ .r = 0xda, .g = 0x44, .b = 0x53 },
    close_pressed: Color = .{ .r = 0xb8, .g = 0x35, .b = 0x42 },
    close_symbol: Color = .{ .r = 0xff, .g = 0xff, .b = 0xff },
};

/// A button and its rectangle in window pixels.
pub const Placed = struct {
    button: Button,
    rect: geometry.Rect(i32),
};

/// Button rectangles and the title-bar area for one window width.
pub const Geometry = struct {
    buttons: [max_buttons]Placed = undefined,
    len: u8 = 0,
    /// The part of the header between the left and right groups, full header
    /// height. Titles and other content belong here.
    titlebar: geometry.Rect(i32) = .{ .x = 0, .y = 0, .width = 0, .height = 0 },

    /// Lays the layout out in a header across a window `width` pixels wide.
    /// Left buttons start at the left edge, right buttons end at the right edge.
    pub fn compute(layout: Layout, width: i32, metrics: Metrics) Geometry {
        var result: Geometry = .{};
        const left_count: i32 = layout.left.len;
        const right_count: i32 = layout.right.len;
        const right_start = width - right_count * metrics.button_width;
        for (layout.left.slice(), 0..) |button, index| result.push(button, @as(i32, @intCast(index)) * metrics.button_width, 0, metrics);
        for (layout.right.slice(), 0..) |button, index| result.push(button, right_start + @as(i32, @intCast(index)) * metrics.button_width, 0, metrics);
        const left_end = left_count * metrics.button_width;
        result.titlebar = .{
            .x = left_end,
            .y = 0,
            .width = @max(right_start - left_end, 0),
            .height = metrics.height,
        };
        return result;
    }

    fn push(self: *Geometry, button: Button, x: i32, y: i32, metrics: Metrics) void {
        self.buttons[self.len] = .{
            .button = button,
            .rect = .{ .x = x, .y = y, .width = metrics.button_width, .height = metrics.height },
        };
        self.len += 1;
    }

    /// The placed buttons in order (left group, then right group).
    pub fn placed(self: *const Geometry) []const Placed {
        return self.buttons[0..self.len];
    }

    /// Index into `placed()` of the button under `point`, if any.
    pub fn index_at(self: *const Geometry, point: geometry.Point(i32)) ?u8 {
        for (self.placed(), 0..) |item, index| {
            if (item.rect.contains(point)) return @intCast(index);
        }
        return null;
    }

    /// The hit-test description for this header: `header` is draggable and every
    /// button is carved out of it as not draggable, so clicks reach the buttons.
    /// `resize_border` is the window's resize border width in pixels.
    pub fn hit_test(self: *const Geometry, header: geometry.Rect(i32), resize_border: u16) hit.Error!hit.HitTest {
        var result: hit.HitTest = .{ .resize_border = resize_border };
        try result.add(.{ .rect = header, .kind = .draggable });
        for (self.placed()) |item| try result.add(.{ .rect = item.rect, .kind = .not_draggable });
        return result;
    }
};

/// Hover and pressed tracking for the buttons of one header.
///
/// Feed it pointer events in window coordinates: `press` for the left button,
/// `release` when it comes up, and `pointer_moved` / `pointer_left` for hover.
/// A click acts only when the press and the release land on the same button,
/// as native buttons do, so dragging off a button cancels it.
pub const Controls = struct {
    layout: Layout = Layout.default,
    metrics: Metrics = .{},
    geometry: Geometry = .{},
    width: i32 = 0,
    hover: ?u8 = null,
    pressed: ?u8 = null,
    maximized: bool = false,
    focused: bool = true,

    /// Controls for a layout and metrics. Call `set_width` before use.
    pub fn init(layout: Layout, metrics: Metrics) Controls {
        return .{ .layout = layout, .metrics = metrics };
    }

    /// Recomputes button positions for a window `width` pixels wide. Call on every resize.
    pub fn set_width(self: *Controls, width: i32) void {
        if (width == self.width and self.geometry.len != 0) return;
        self.width = width;
        self.geometry = Geometry.compute(self.layout, width, self.metrics);
    }

    /// Copies the state the glyphs depend on from window flags: maximized shows the
    /// restore glyph, and an unfocused window dims the symbols.
    pub fn set_window_state(self: *Controls, flags: window_state.Flags) void {
        self.maximized = flags.maximized;
        self.focused = flags.input_focus;
    }

    /// Updates hover for a pointer at `point`.
    pub fn pointer_moved(self: *Controls, point: geometry.Point(i32)) void {
        self.hover = self.geometry.index_at(point);
    }

    /// The pointer left the window: nothing is hovered. A press in progress stays
    /// pressed and can still be released on the same button.
    pub fn pointer_left(self: *Controls) void {
        self.hover = null;
    }

    /// Left button pressed at `point`. Returns true when the press landed on a
    /// button, in which case the application should not treat it as content.
    pub fn press(self: *Controls, point: geometry.Point(i32)) bool {
        self.pointer_moved(point);
        self.pressed = self.hover;
        return self.pressed != null;
    }

    /// Left button released at `point`. Returns the action when the release is on
    /// the button that was pressed, and clears the press either way.
    pub fn release(self: *Controls, point: geometry.Point(i32)) ?Action {
        self.pointer_moved(point);
        const pressed = self.pressed orelse return null;
        self.pressed = null;
        if (self.hover != pressed) return null;
        return action_for(self.geometry.placed()[pressed].button);
    }

    /// The action a button performs.
    pub fn action_for(button: Button) Action {
        return switch (button) {
            .minimize => .minimize,
            .maximize => .toggle_maximize,
            .close => .close_request,
        };
    }

    /// The rectangle the application can use for its title: between the button groups.
    pub fn titlebar_area(self: *const Controls) geometry.Rect(i32) {
        return self.geometry.titlebar;
    }

    /// Hit-test regions for this header. See `Geometry.hit_test`.
    pub fn hit_test(self: *const Controls, resize_border: u16) hit.Error!hit.HitTest {
        const header: geometry.Rect(i32) = .{ .x = 0, .y = 0, .width = self.width, .height = self.metrics.height };
        return self.geometry.hit_test(header, resize_border);
    }

    /// Draws the buttons with the zdl software renderer, in window pixels. The
    /// header background is the caller's to draw; buttons are transparent until hovered.
    pub fn draw(self: *const Controls, renderer: *Renderer, theme: Theme) renderer_mod.Error!void {
        const stroke: f32 = @floatFromInt(self.metrics.stroke);
        for (self.geometry.placed(), 0..) |item, index| {
            const is_close = item.button == .close;
            const is_pressed = self.pressed == @as(u8, @intCast(index));
            const is_hover = self.hover == @as(u8, @intCast(index));
            if (is_pressed or is_hover) {
                const background = if (is_close)
                    (if (is_pressed) theme.close_pressed else theme.close_hover)
                else
                    (if (is_pressed) theme.pressed else theme.hover);
                renderer.set_draw_color(background);
                try renderer.fill_rect(to_frect(item.rect));
            }
            const symbol = if (is_close and (is_hover or is_pressed))
                theme.close_symbol
            else if (!self.focused)
                theme.inactive_symbol
            else
                theme.symbol;
            renderer.set_draw_color(symbol);
            const center = center_of(item.rect);
            const half: f32 = @as(f32, @floatFromInt(self.metrics.glyph)) / 2;
            switch (item.button) {
                .minimize => try fill_bar(renderer, center.x - half, center.y, @floatFromInt(self.metrics.glyph), stroke),
                .maximize => if (self.maximized) {
                    try draw_restore(renderer, center.x - half, center.y - half, @floatFromInt(self.metrics.glyph), stroke);
                } else {
                    try draw_square(renderer, center.x - half, center.y - half, @floatFromInt(self.metrics.glyph), stroke);
                },
                .close => try draw_cross(renderer, center.x - half, center.y - half, @floatFromInt(self.metrics.glyph), stroke),
            }
        }
    }
};

fn to_frect(rect: geometry.Rect(i32)) FRect {
    return .{
        .x = @floatFromInt(rect.x),
        .y = @floatFromInt(rect.y),
        .width = @floatFromInt(rect.width),
        .height = @floatFromInt(rect.height),
    };
}

fn center_of(rect: geometry.Rect(i32)) FPoint {
    return .{
        .x = @as(f32, @floatFromInt(rect.x)) + @as(f32, @floatFromInt(rect.width)) / 2,
        .y = @as(f32, @floatFromInt(rect.y)) + @as(f32, @floatFromInt(rect.height)) / 2,
    };
}

fn fill_bar(renderer: *Renderer, x: f32, y: f32, length: f32, thickness: f32) renderer_mod.Error!void {
    try renderer.fill_rect(.{ .x = x, .y = y, .width = length, .height = thickness });
}

fn draw_square(renderer: *Renderer, x: f32, y: f32, side: f32, thickness: f32) renderer_mod.Error!void {
    try fill_bar(renderer, x, y, side, thickness);
    try fill_bar(renderer, x, y + side - thickness, side, thickness);
    try renderer.fill_rect(.{ .x = x, .y = y, .width = thickness, .height = side });
    try renderer.fill_rect(.{ .x = x + side - thickness, .y = y, .width = thickness, .height = side });
}

/// Two overlapping squares: the back one shows only its top and right edges, so
/// the front square needs no fill to stay clear.
fn draw_restore(renderer: *Renderer, x: f32, y: f32, side: f32, thickness: f32) renderer_mod.Error!void {
    const offset = @max(@round(side / 4), thickness * 2);
    const front = side - offset;
    try fill_bar(renderer, x + offset, y, front, thickness);
    try renderer.fill_rect(.{ .x = x + side - thickness, .y = y, .width = thickness, .height = front });
    try draw_square(renderer, x, y + offset, front, thickness);
}

/// Two diagonals, drawn as antialiased lines and offset by whole strokes when thick.
fn draw_cross(renderer: *Renderer, x: f32, y: f32, side: f32, thickness: f32) renderer_mod.Error!void {
    var step: f32 = 0;
    while (step < thickness) : (step += 1) {
        const shift = step - (thickness - 1) / 2;
        try renderer.draw_line_antialiased(.{ .x = x + shift, .y = y }, .{ .x = x + side + shift, .y = y + side });
        try renderer.draw_line_antialiased(.{ .x = x + side + shift, .y = y }, .{ .x = x + shift, .y = y + side });
    }
}

test "GNOME button layout" {
    const layout = Layout.parse_gnome("'appmenu:minimize,maximize,close'\n");
    try std.testing.expectEqual(@as(usize, 0), layout.left.len);
    try std.testing.expectEqualSlices(Button, &.{ .minimize, .maximize, .close }, layout.right.slice());

    const close_left = Layout.parse_gnome("close,minimize:");
    try std.testing.expectEqualSlices(Button, &.{ .close, .minimize }, close_left.left.slice());
    try std.testing.expectEqual(@as(usize, 0), close_left.right.len);

    const unknown_only = Layout.parse_gnome("icon:spacer");
    try std.testing.expectEqual(@as(usize, 0), unknown_only.right.len);
    try std.testing.expectEqual(@as(usize, 0), unknown_only.left.len);
}

test "KWin button letters" {
    try std.testing.expectEqualSlices(Button, &.{ .close, .minimize }, Layout.parse_kwin_side("XI").slice());
    try std.testing.expectEqualSlices(Button, &.{ .minimize, .maximize, .close }, Layout.parse_kwin_side("HIAX").slice());
    try std.testing.expectEqual(@as(usize, 0), Layout.parse_kwin_side("MFBS").len);
    // Repeated letters appear once.
    try std.testing.expectEqualSlices(Button, &.{.close}, Layout.parse_kwin_side("XXX").slice());
}

test "kwinrc sections and defaults" {
    const configured = Layout.parse_kwinrc(
        \\[Windows]
        \\ButtonsOnRight=XIA
        \\[org.kde.kdecoration2]
        \\ButtonsOnLeft=XM
        \\ButtonsOnRight=IA
        \\
    );
    try std.testing.expectEqualSlices(Button, &.{.close}, configured.left.slice());
    try std.testing.expectEqualSlices(Button, &.{ .minimize, .maximize }, configured.right.slice());

    // A section without the key keeps the default right side; no left side.
    const missing = Layout.parse_kwinrc("[org.kde.kdecoration2]\nLibrary=x\n");
    try std.testing.expectEqualSlices(Button, &.{ .minimize, .maximize, .close }, missing.right.slice());
    try std.testing.expectEqual(@as(usize, 0), missing.left.len);

    const empty = Layout.parse_kwinrc("");
    try std.testing.expectEqual(Layout.default.right.len, empty.right.len);
}

test "load falls back to the default for unknown desktops" {
    const layout = load(std.testing.allocator, std.testing.io, .{ .current = "XFCE" });
    try std.testing.expectEqualSlices(Button, Layout.default.right.slice(), layout.right.slice());
    const none = load(std.testing.allocator, std.testing.io, .{});
    try std.testing.expectEqual(Layout.default.right.len, none.right.len);
}

test "geometry places groups at the edges and leaves the title area between" {
    const layout: Layout = .{ .left = Group.from_slice(&.{.close}), .right = Group.from_slice(&.{ .minimize, .maximize }) };
    const metrics: Metrics = .{ .height = 30, .button_width = 40 };
    const result = Geometry.compute(layout, 400, metrics);
    const items = result.placed();
    try std.testing.expectEqual(@as(usize, 3), items.len);
    try std.testing.expectEqual(@as(i32, 0), items[0].rect.x);
    try std.testing.expectEqual(@as(i32, 320), items[1].rect.x);
    try std.testing.expectEqual(@as(i32, 360), items[2].rect.x);
    try std.testing.expectEqual(@as(i32, 40), result.titlebar.x);
    try std.testing.expectEqual(@as(i32, 280), result.titlebar.width);
    try std.testing.expectEqual(@as(i32, 30), result.titlebar.height);
    try std.testing.expectEqual(@as(?u8, 1), result.index_at(.{ .x = 330, .y = 10 }));
    try std.testing.expectEqual(@as(?u8, null), result.index_at(.{ .x = 330, .y = 30 }));
}

test "hit-test description makes the header draggable and buttons clickable" {
    var controls = Controls.init(Layout.default, .{ .height = 30, .button_width = 40 });
    controls.set_width(400);
    const description = try controls.hit_test(6);
    try std.testing.expectEqual(hit.Hit.draggable, hit.classify(description, 400, 300, .{ .x = 100, .y = 10 }, true));
    try std.testing.expectEqual(hit.Hit.normal, hit.classify(description, 400, 300, .{ .x = 380, .y = 10 }, true));
    try std.testing.expectEqual(hit.Hit.normal, hit.classify(description, 400, 300, .{ .x = 300, .y = 10 }, true));
    // The resize border still wins at the top edge above a button.
    try std.testing.expect(hit.classify(description, 400, 300, .{ .x = 399, .y = 0 }, true) == .resize);
    try std.testing.expectEqual(hit.Hit.normal, hit.classify(description, 400, 300, .{ .x = 100, .y = 200 }, true));
}

test "a click completes only on the button it started on" {
    var controls = Controls.init(Layout.default, .{ .height = 30, .button_width = 40 });
    controls.set_width(400);
    const close: geometry.Point(i32) = .{ .x = 380, .y = 10 };
    const maximize: geometry.Point(i32) = .{ .x = 340, .y = 10 };

    try std.testing.expect(controls.press(close));
    try std.testing.expectEqual(@as(?Action, .close_request), controls.release(close));

    try std.testing.expect(controls.press(maximize));
    try std.testing.expectEqual(@as(?Action, null), controls.release(close));

    try std.testing.expect(!controls.press(.{ .x = 100, .y = 10 }));
    try std.testing.expectEqual(@as(?Action, null), controls.release(.{ .x = 100, .y = 10 }));
    try std.testing.expectEqual(@as(?Action, null), controls.release(maximize));
}

test "hover is cleared when the pointer leaves and a press survives leaving" {
    var controls = Controls.init(Layout.default, .{});
    controls.set_width(300);
    const minimize: geometry.Point(i32) = .{ .x = 300 - 3 * 46 + 10, .y = 5 };
    controls.pointer_moved(minimize);
    try std.testing.expect(controls.hover != null);
    try std.testing.expect(controls.press(minimize));
    controls.pointer_left();
    try std.testing.expectEqual(@as(?u8, null), controls.hover);
    try std.testing.expect(controls.pressed != null);
    // Released away from the button: no action, and the press is over.
    try std.testing.expectEqual(@as(?Action, null), controls.release(.{ .x = 100, .y = 5 }));
    try std.testing.expectEqual(@as(?u8, null), controls.pressed);
}

test "maximize toggles and window flags select the glyph state" {
    var controls = Controls.init(Layout.default, .{});
    controls.set_width(300);
    controls.set_window_state(.{ .maximized = true, .input_focus = false });
    try std.testing.expect(controls.maximized);
    try std.testing.expect(!controls.focused);
    try std.testing.expectEqual(Action.toggle_maximize, Controls.action_for(.maximize));
}

test "scaled metrics keep their proportions" {
    const scaled = Metrics.scaled(2);
    try std.testing.expectEqual(@as(i32, 72), scaled.height);
    try std.testing.expectEqual(@as(i32, 92), scaled.button_width);
    try std.testing.expectEqual(@as(i32, 2), scaled.stroke);
    try std.testing.expectEqual(@as(i32, 36), Metrics.scaled(0).height);
}
