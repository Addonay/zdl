//! shadcn/ui-style widgets (new-york, v4) built on the immediate-mode `Ui`.
//!
//! Each widget declares its elements for the current frame and reports
//! interaction for the id it was given: `true` from a button or a checkbox
//! means it was pressed this frame. State (checked, open, text) belongs to the
//! program, which passes the current value in and applies the result.
//!
//! Measurements follow the Tailwind classes in shadcn/ui: 4 points per spacing
//! step, radius 0.625rem (10 points) with `rounded-md` at 0.8 of that.

const std = @import("std");
const zlay = @import("zlay");
const runtime = @import("runtime.zig");
const text_mod = @import("text.zig");
const canvas_mod = @import("canvas.zig");

const Ui = runtime.Ui;
const Color = canvas_mod.Color;
const Theme = @import("theme.zig").Theme;
const Id = zlay.ElementId;

pub const Role = text_mod.Role;

const radius_sm: f32 = 6;
const radius_md: f32 = 8;
const radius_lg: f32 = 10;
const radius_full: f32 = 9999;

fn with_alpha(color: Color, alpha: f32) Color {
    return color.withAlpha(alpha * color.a);
}

fn style(font: Role, size: u16, line_height: u16, color: Color) runtime.TextStyle {
    return .{ .font = @backingInt(font), .size = size, .line_height = line_height, .color = color };
}

// -----------------------------------------------------------------------------
// Button
// -----------------------------------------------------------------------------

pub const Variant = enum { default, outline, secondary, ghost, destructive };

pub const ButtonSize = enum { default, sm, icon, icon_sm };

pub const ButtonOptions = struct {
    label: []const u8 = "",
    /// Index into the icon table, drawn before the label.
    icon: ?u16 = null,
    variant: Variant = .default,
    size: ButtonSize = .default,
    /// Fixed width in points; null sizes to the content.
    width: ?f32 = null,
    disabled: bool = false,
    align_left: bool = false,
    font: Role = .medium,
    icon_size: f32 = 16,
    radius: f32 = radius_md,
    height: ?f32 = null,
    padding_x: ?u16 = null,
};

const ButtonColors = struct { background: Color, foreground: Color, border: Color };

fn button_colors(theme: *const Theme, variant: Variant, hovered: bool) ButtonColors {
    return switch (variant) {
        .default => .{
            .background = if (hovered) with_alpha(theme.primary, 0.9) else theme.primary,
            .foreground = theme.primary_foreground,
            .border = Color.transparent,
        },
        .destructive => .{
            .background = theme.destructive,
            .foreground = Color.rgb(255, 255, 255),
            .border = Color.transparent,
        },
        .outline => .{
            .background = if (hovered) theme.accent else theme.background,
            .foreground = if (hovered) theme.accent_foreground else theme.foreground,
            .border = theme.input,
        },
        .secondary => .{
            .background = if (hovered) with_alpha(theme.secondary, 0.8) else theme.secondary,
            .foreground = theme.secondary_foreground,
            .border = Color.transparent,
        },
        .ghost => .{
            .background = if (hovered) theme.accent else Color.transparent,
            .foreground = if (hovered) theme.accent_foreground else theme.foreground,
            .border = Color.transparent,
        },
    };
}

/// A shadcn `Button`. Returns true on the frame it was pressed.
pub fn button(ui: *Ui, id: Id, options: ButtonOptions) bool {
    const icon_only = options.size == .icon or options.size == .icon_sm;
    const height: f32 = options.height orelse switch (options.size) {
        .default, .icon => 36,
        .sm, .icon_sm => 32,
    };
    const padding: f32 = if (options.padding_x) |v| @floatFromInt(v) else switch (options.size) {
        .default => 16,
        .sm => 12,
        .icon, .icon_sm => 0,
    };
    const colors = button_colors(ui.theme, options.variant, ui.hovered(id));
    const clicked = !options.disabled and ui.pressed(id);
    if (!options.disabled) {
        ui.focusable(id);
        ui.clickable(id);
    }

    const width: zlay.SizingAxis = if (options.width) |fixed|
        .fixed(fixed)
    else if (icon_only)
        .fixed(height)
    else
        .fit(.{});
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = width, .height = .fixed(height) },
            .padding = .axes(@intFromFloat(padding), 0),
            .child_gap = if (options.icon != null and !icon_only) 8 else 0,
            .child_alignment = .{ .x = if (options.align_left) .left else .center, .y = .center },
        },
        .background_color = if (options.disabled) with_alpha(colors.background, 0.5) else colors.background,
        .corner_radius = .all(options.radius),
        .border = if (ui.is_focused(id)) .{ .color = ui.theme.ring, .width = .outside(2) } else if (colors.border.a > 0) .{ .color = colors.border, .width = .outside(1) } else .{},
        .user_data = if (options.variant == .outline) @constCast(&ui.decors.xs) else null,
    });
    const foreground = if (options.disabled) with_alpha(colors.foreground, 0.5) else colors.foreground;
    if (options.icon) |index| ui.icon(Id.seeded("button-icon", id.id), index, options.icon_size, foreground);
    if (!icon_only and options.label.len > 0) ui.text_run(options.label, style(options.font, 14, 20, foreground));
    ui.close();
    return clicked;
}

// -----------------------------------------------------------------------------
// Badge
// -----------------------------------------------------------------------------

pub const BadgeVariant = enum { default, secondary, outline };

pub const BadgeOptions = struct {
    label: []const u8,
    icon: ?u16 = null,
    variant: BadgeVariant = .outline,
    foreground: ?Color = null,
    icon_color: ?Color = null,
    padding_x: u16 = 8,
    font: Role = .medium,
};

/// A pill-shaped `Badge` (rounded-full, text-xs medium, icons 12 points).
pub fn badge(ui: *Ui, id: Id, options: BadgeOptions) void {
    const theme = ui.theme;
    const palette: struct { background: Color, border: Color, text: Color } = switch (options.variant) {
        .default => .{ .background = theme.primary, .border = Color.transparent, .text = theme.primary_foreground },
        .secondary => .{ .background = theme.secondary, .border = Color.transparent, .text = theme.secondary_foreground },
        .outline => .{ .background = Color.transparent, .border = theme.border, .text = theme.foreground },
    };
    const background = palette.background;
    const border = palette.border;
    const text_color = palette.text;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fit(.{}), .height = .fit(.{}) },
            .padding = .axes(options.padding_x + 1, 3),
            .child_gap = 4,
            .child_alignment = .center,
        },
        .background_color = background,
        .corner_radius = .all(radius_full),
        .border = .{ .color = border, .width = .outside(1) },
    });
    if (options.icon) |index| ui.icon(Id.seeded("badge-icon", id.id), index, 12, options.icon_color orelse options.foreground orelse text_color);
    ui.text_run(options.label, style(options.font, 12, 16, options.foreground orelse text_color));
    ui.close();
}

// -----------------------------------------------------------------------------
// Checkbox
// -----------------------------------------------------------------------------

/// A 16-point `Checkbox`. Returns true when clicked; the program toggles state.
pub fn checkbox(ui: *Ui, id: Id, checked: bool, check_icon: u16) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    ui.focusable(id);
    ui.clickable(id);
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fixed(16), .height = .fixed(16) },
            .child_alignment = .center,
        },
        .background_color = if (checked) theme.primary else if (theme.dark) with_alpha(theme.input, 0.3) else theme.background,
        .corner_radius = .all(4),
        .border = .{ .color = if (checked) theme.primary else theme.input, .width = .outside(1) },
    });
    if (checked) ui.icon(Id.seeded("check", id.id), check_icon, 12, theme.primary_foreground);
    ui.close();
    return clicked;
}

// -----------------------------------------------------------------------------
// Tabs and toggle groups
// -----------------------------------------------------------------------------

/// The muted rounded container holding tab triggers (`TabsList`).
pub fn tab_list_begin(ui: *Ui, id: Id) void {
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fit(.{}), .height = .fixed(36) },
            .padding = .all(3),
            .child_gap = 0,
            .child_alignment = .{ .x = .left, .y = .center },
        },
        .background_color = ui.theme.muted,
        .corner_radius = .all(radius_lg),
    });
}

pub fn tab_list_end(ui: *Ui) void {
    ui.close();
}

pub const TabOptions = struct {
    label: []const u8,
    /// Small count shown in a pill after the label.
    count: ?u32 = null,
    active: bool = false,
};

/// One `TabsTrigger`. Returns true when pressed.
pub fn tab(ui: *Ui, id: Id, options: TabOptions) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    ui.focusable(id);
    ui.clickable(id);
    const text_color = if (options.active) theme.foreground else with_alpha(theme.foreground, 0.6);
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fit(.{}), .height = .fixed(28) },
            .padding = .axes(8, 0),
            .child_gap = 6,
            .child_alignment = .center,
        },
        .background_color = if (options.active) (if (theme.dark) theme.input else theme.background) else Color.transparent,
        .corner_radius = .all(radius_md),
        .user_data = if (options.active) @constCast(&ui.decors.sm) else null,
    });
    ui.text_run(options.label, style(.medium, 14, 20, text_color));
    if (options.count) |count| {
        var buffer: [12]u8 = undefined;
        const digits = std.fmt.bufPrint(&buffer, "{d}", .{count}) catch "";
        ui.open(Id.seeded("tab-count", id.id), .{
            .layout = .{ .sizing = .{ .width = .fit(.{}), .height = .fixed(20) }, .padding = .axes(4, 0), .child_alignment = .center },
            .background_color = with_alpha(theme.muted_foreground, 0.3),
            .corner_radius = .all(radius_full),
        });
        ui.text_run(digits, style(.medium, 12, 16, theme.foreground));
        ui.close();
    }
    ui.close();
    return clicked;
}

pub const ToggleEdge = enum { single, first, middle, last };

/// One item of a `ToggleGroup` (outline variant). Returns true when pressed.
pub fn toggle_item(ui: *Ui, id: Id, label: []const u8, active: bool, edge: ToggleEdge) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    const hovered = ui.hovered(id);
    ui.focusable(id);
    ui.clickable(id);
    const radius: zlay.CornerRadius = switch (edge) {
        .single => .all(radius_md),
        .first => .{ .top_left = radius_md, .bottom_left = radius_md },
        .last => .{ .top_right = radius_md, .bottom_right = radius_md },
        .middle => .none,
    };
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fit(.{}), .height = .fixed(36) },
            .padding = .axes(17, 0),
            .child_alignment = .center,
        },
        .background_color = if (active) theme.accent else if (hovered) theme.muted else theme.background,
        .corner_radius = radius,
        .border = .{ .color = theme.input, .width = .{ .left = if (edge == .first or edge == .single) 1 else 0, .right = 1, .top = 1, .bottom = 1 } },
        .user_data = @constCast(&ui.decors.xs),
    });
    ui.text_run(label, style(.medium, 14, 20, if (active) theme.accent_foreground else theme.foreground));
    ui.close();
    return clicked;
}

// -----------------------------------------------------------------------------
// Inputs
// -----------------------------------------------------------------------------

pub const FieldOptions = struct {
    placeholder: []const u8 = "",
    width: f32,
    height: f32 = 32,
    align_right: bool = false,
    /// Shows the caret at the end of the value when focused.
    focused: bool = false,
    bordered: bool = false,
};

/// A `Input` in the table style: transparent until hovered or focused. Returns
/// true when pressed, so the program can focus it.
pub fn field(ui: *Ui, id: Id, value: []const u8, options: FieldOptions) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    const hovered = ui.hovered(id);
    ui.focusable(id);
    ui.clickable(id);
    const focused = options.focused;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fixed(options.width), .height = .fixed(options.height) },
            .padding = .axes(8, 0),
            .child_gap = 0,
            .child_alignment = .{ .x = if (options.align_right) .right else .left, .y = .center },
        },
        .clip = .{ .horizontal = true },
        .background_color = if (options.bordered) with_alpha(theme.input, 0.3) else if (focused) theme.background else if (hovered) with_alpha(theme.input, 0.3) else Color.transparent,
        .corner_radius = .all(radius_md),
        .border = if (focused or options.bordered) .{ .color = theme.input, .width = .outside(1) } else .{},
        .user_data = if (focused) @constCast(&ui.decors.xs) else null,
    });
    if (value.len > 0) {
        var shown = value;
        if (focused) {
            const available = @max(0, options.width - 18);
            while (shown.len > 0 and ui.measure(shown, style(.regular, 14, 20, theme.foreground)) > available) {
                const length = std.unicode.utf8ByteSequenceLength(shown[0]) catch 1;
                shown = shown[@min(length, shown.len)..];
            }
        }
        ui.text_run(shown, style(.regular, 14, 20, theme.foreground));
    } else if (options.placeholder.len > 0) {
        ui.text_run(options.placeholder, style(.regular, 14, 20, theme.muted_foreground));
    }
    if (focused) {
        ui.open(Id.seeded("caret", id.id), .{
            .layout = .{ .sizing = .{ .width = .fixed(1), .height = .fixed(16) } },
            .background_color = theme.foreground,
        });
        ui.close();
    }
    ui.close();
    return clicked;
}

// -----------------------------------------------------------------------------
// Select trigger, menus and popovers
// -----------------------------------------------------------------------------

/// A `SelectTrigger` showing `value`, with a chevron. Returns true when pressed.
pub fn select_trigger(ui: *Ui, id: Id, value: []const u8, width: f32, size_small: bool, chevron_icon: u16) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    const hovered = ui.hovered(id);
    ui.focusable(id);
    ui.clickable(id);
    const height: f32 = if (size_small) 32 else 36;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fixed(width), .height = .fixed(height) },
            .padding = .{ .left = 12, .right = 12, .top = 0, .bottom = 0 },
            .child_gap = 8,
            .child_alignment = .{ .x = .left, .y = .center },
        },
        .background_color = if (theme.dark) with_alpha(theme.input, 0.3) else theme.background,
        .corner_radius = .all(radius_md),
        .border = .{ .color = theme.input, .width = .outside(1) },
        .user_data = @constCast(&ui.decors.xs),
    });
    ui.open(Id.seeded("select-value", id.id), .{
        .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_alignment = .{ .x = .left, .y = .center } },
    });
    ui.text_run(value, style(.regular, 14, 20, theme.foreground));
    ui.close();
    ui.icon(Id.seeded("select-chevron", id.id), chevron_icon, 16, with_alpha(theme.foreground, if (hovered) 0.8 else 0.5));
    ui.close();
    return clicked;
}

/// Popover panel anchored below `anchor` (floating, above other content). With
/// `align_end` the panel's right edge meets the anchor's right edge, as shadcn's
/// `align="end"`. The panel must be declared last so it draws on top.
pub fn popover_begin(ui: *Ui, id: Id, anchor: Id, width: f32, decor: *const runtime.Decor, align_end: bool) void {
    const anchor_box = if (ui.layout.elementData(anchor)) |data| data.bounding_box else zlay.BoundingBox{};
    const above = anchor_box.y > ui.layout.getLayoutDimensions().height - 260;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fixed(width), .height = .fit(.{}) },
            .padding = .all(4),
            .direction = .top_to_bottom,
            .child_gap = 0,
        },
        .background_color = ui.theme.popover,
        .corner_radius = .all(radius_md),
        .border = .{ .color = ui.theme.border, .width = .outside(1) },
        .user_data = @constCast(decor),
        .floating = .{
            .attach_to = .element_with_id,
            .parent_id = anchor.id,
            .attach_points = .{
                .element = if (above) (if (align_end) .right_bottom else .left_bottom) else (if (align_end) .right_top else .left_top),
                .parent = if (above) (if (align_end) .right_top else .left_top) else (if (align_end) .right_bottom else .left_bottom),
            },
            .offset = .{ .x = 0, .y = if (above) -4 else 4 },
            .z_index = 300,
            .pointer_capture_mode = .capture,
        },
    });
}

pub fn popover_end(ui: *Ui) void {
    ui.close();
}

/// A row in a menu: `DropdownMenuItem` (text-sm, px-2 py-1.5, rounded-sm).
pub fn menu_item(ui: *Ui, id: Id, label: []const u8, icon: ?u16, destructive: bool) bool {
    const theme = ui.theme;
    const clicked = ui.pressed(id);
    const hovered = ui.hovered(id);
    ui.focusable(id);
    ui.clickable(id);
    const color = if (destructive) theme.destructive else theme.popover_foreground;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .grow(.{}), .height = .fixed(32) },
            .padding = .axes(8, 0),
            .child_gap = 8,
            .child_alignment = .{ .x = .left, .y = .center },
        },
        .background_color = if (hovered) theme.accent else Color.transparent,
        .corner_radius = .all(radius_sm),
    });
    if (icon) |index| ui.icon(Id.seeded("menu-icon", id.id), index, 16, if (destructive) color else with_alpha(theme.popover_foreground, 0.9));
    ui.text_run(label, style(.regular, 14, 20, if (hovered and !destructive) theme.accent_foreground else color));
    ui.close();
    return clicked;
}

/// A label inside a menu (`DropdownMenuLabel`, text-sm medium).
pub fn menu_label(ui: *Ui, id: Id, label: []const u8) void {
    ui.open(id, .{
        .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fit(.{}) }, .padding = .axes(8, 6) },
    });
    ui.text_run(label, style(.medium, 14, 20, ui.theme.popover_foreground));
    ui.close();
}

/// A 1-point divider (`DropdownMenuSeparator`), with the menu's margin.
pub fn menu_separator(ui: *Ui, id: Id) void {
    ui.open(id, .{
        .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(1) } },
        .background_color = ui.theme.border,
    });
    ui.close();
}

// -----------------------------------------------------------------------------
// Avatar and separators
// -----------------------------------------------------------------------------

/// A rounded avatar with initials (`AvatarFallback`), grayscale like the reference.
pub fn avatar(ui: *Ui, id: Id, initials: []const u8, size: f32) void {
    const theme = ui.theme;
    ui.open(id, .{
        .layout = .{
            .sizing = .{ .width = .fixed(size), .height = .fixed(size) },
            .child_alignment = .center,
        },
        .background_color = theme.muted,
        .corner_radius = .all(radius_lg),
        .border = .{ .color = with_alpha(theme.foreground, 0.1), .width = .outside(1) },
    });
    ui.text_run(initials, style(.medium, 12, 16, theme.muted_foreground));
    ui.close();
}

/// A 1-point separator (`Separator`), horizontal or vertical.
pub fn separator(ui: *Ui, id: Id, vertical: bool, length: f32) void {
    ui.open(id, .{
        .layout = .{
            .sizing = .{
                .width = if (vertical) .fixed(1) else .grow(.{}),
                .height = if (vertical) .fixed(length) else .fixed(1),
            },
        },
        .background_color = ui.theme.border,
    });
    ui.close();
}

test "shadcn variant colors follow the theme tokens" {
    const theme = Theme.light();
    const primary = button_colors(&theme, .default, false);
    try std.testing.expectApproxEqAbs(theme.primary.r, primary.background.r, 0.01);
    const outline = button_colors(&theme, .outline, false);
    try std.testing.expectApproxEqAbs(theme.background.r, outline.background.r, 0.01);
}
