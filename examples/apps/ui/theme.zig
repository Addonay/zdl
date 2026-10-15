//! Design tokens for the shadcn/ui "new-york" look, converted from the oklch
//! values in globals.css to sRGB.
//!
//! Conversion follows Björn Ottosson's oklab reference: oklch to oklab, then to
//! linear sRGB through the LMS cube, then the sRGB transfer curve. Out-of-gamut
//! channels are clamped. Alpha stays linear, as in CSS.

const std = @import("std");
const zlay = @import("zlay");

pub const Color = zlay.Color;

/// Converts oklch (lightness 0..1, chroma, hue in degrees, alpha 0..1) to an
/// opaque-or-translucent zlay color with channels in 0..255.
pub fn oklch(lightness: f32, chroma: f32, hue_degrees: f32, alpha: f32) Color {
    const hue = hue_degrees * std.math.pi / 180.0;
    const a = chroma * @cos(hue);
    const b = chroma * @sin(hue);

    const l_ = lightness + 0.3963377774 * a + 0.2158037573 * b;
    const m_ = lightness - 0.1055613458 * a - 0.0638541728 * b;
    const s_ = lightness - 0.0894841775 * a - 1.2914855480 * b;
    const l = l_ * l_ * l_;
    const m = m_ * m_ * m_;
    const s = s_ * s_ * s_;

    const red = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s;
    const green = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s;
    const blue = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s;
    return .{
        .r = encode_srgb(red) * 255,
        .g = encode_srgb(green) * 255,
        .b = encode_srgb(blue) * 255,
        .a = std.math.clamp(alpha, 0, 1) * 255,
    };
}

fn encode_srgb(linear: f32) f32 {
    const clamped = std.math.clamp(linear, 0, 1);
    if (clamped <= 0.0031308) return 12.92 * clamped;
    return 1.055 * std.math.pow(f32, clamped, 1.0 / 2.4) - 0.055;
}

/// Light or dark palette. Field names follow the CSS custom properties.
pub const Theme = struct {
    dark: bool,
    background: Color,
    foreground: Color,
    card: Color,
    card_foreground: Color,
    popover: Color,
    popover_foreground: Color,
    primary: Color,
    primary_foreground: Color,
    secondary: Color,
    secondary_foreground: Color,
    muted: Color,
    muted_foreground: Color,
    accent: Color,
    accent_foreground: Color,
    destructive: Color,
    border: Color,
    input: Color,
    ring: Color,
    sidebar: Color,
    sidebar_foreground: Color,
    sidebar_primary: Color,
    sidebar_primary_foreground: Color,
    sidebar_accent: Color,
    sidebar_accent_foreground: Color,
    sidebar_border: Color,
    /// Shadow color used by shadow-xs / shadow-sm (black at 5 to 10 percent).
    shadow: Color,

    pub fn light() Theme {
        return .{
            .dark = false,
            .background = oklch(1, 0, 0, 1),
            .foreground = oklch(0, 0, 0, 1),
            .card = oklch(1, 0, 0, 1),
            .card_foreground = oklch(0, 0, 0, 1),
            .popover = oklch(1, 0, 0, 1),
            .popover_foreground = oklch(0, 0, 0, 1),
            .primary = oklch(0, 0, 0, 1),
            .primary_foreground = oklch(0.985, 0, 0, 1),
            .secondary = oklch(0.97, 0, 0, 1),
            .secondary_foreground = oklch(0.205, 0, 0, 1),
            .muted = oklch(0.97, 0, 0, 1),
            .muted_foreground = oklch(0.556, 0, 0, 1),
            .accent = oklch(0.97, 0, 0, 1),
            .accent_foreground = oklch(0.205, 0, 0, 1),
            .destructive = oklch(0.577, 0.245, 27.325, 1),
            .border = oklch(0.922, 0, 0, 1),
            .input = oklch(0.922, 0, 0, 1),
            .ring = oklch(0.708, 0, 0, 1),
            .sidebar = oklch(0.985, 0, 0, 1),
            .sidebar_foreground = oklch(0, 0, 0, 1),
            .sidebar_primary = oklch(0.205, 0, 0, 1),
            .sidebar_primary_foreground = oklch(0.985, 0, 0, 1),
            .sidebar_accent = oklch(0.97, 0, 0, 1),
            .sidebar_accent_foreground = oklch(0.205, 0, 0, 1),
            .sidebar_border = oklch(0.922, 0, 0, 1),
            .shadow = oklch(0, 0, 0, 1),
        };
    }

    pub fn dark_theme() Theme {
        return .{
            .dark = true,
            .background = oklch(0.145, 0, 0, 1),
            .foreground = oklch(0.985, 0, 0, 1),
            .card = oklch(0.205, 0, 0, 1),
            .card_foreground = oklch(0.985, 0, 0, 1),
            .popover = oklch(0.205, 0, 0, 1),
            .popover_foreground = oklch(0.985, 0, 0, 1),
            .primary = oklch(0.922, 0, 0, 1),
            .primary_foreground = oklch(0.205, 0, 0, 1),
            .secondary = oklch(0.269, 0, 0, 1),
            .secondary_foreground = oklch(0.985, 0, 0, 1),
            .muted = oklch(0.269, 0, 0, 1),
            .muted_foreground = oklch(0.708, 0, 0, 1),
            .accent = oklch(0.371, 0, 0, 1),
            .accent_foreground = oklch(0.985, 0, 0, 1),
            .destructive = oklch(0.704, 0.191, 22.216, 1),
            .border = oklch(1, 0, 0, 0.1),
            .input = oklch(1, 0, 0, 0.15),
            .ring = oklch(0.556, 0, 0, 1),
            .sidebar = oklch(0.205, 0, 0, 1),
            .sidebar_foreground = oklch(0.985, 0, 0, 1),
            .sidebar_primary = oklch(0.488, 0.243, 264.376, 1),
            .sidebar_primary_foreground = oklch(0.985, 0, 0, 1),
            .sidebar_accent = oklch(0.269, 0, 0, 1),
            .sidebar_accent_foreground = oklch(0.985, 0, 0, 1),
            .sidebar_border = oklch(1, 0, 0, 0.1),
            .shadow = oklch(0, 0, 0, 1),
        };
    }

    /// Chart series color (`var(--primary)` in the dashboard's chart config).
    pub fn chart_series(self: Theme) Color {
        return self.primary;
    }
};

test "oklch white and black map to sRGB endpoints" {
    const white = oklch(1, 0, 0, 1);
    const black = oklch(0, 0, 0, 1);
    try std.testing.expectApproxEqAbs(@as(f32, 255), white.r, 0.5);
    try std.testing.expectApproxEqAbs(@as(f32, 255), white.b, 0.5);
    try std.testing.expectApproxEqAbs(@as(f32, 0), black.g, 0.5);
}

test "oklch neutral gray 0.556 is near sRGB 115" {
    // shadcn muted-foreground (oklch 0.556) is about #737373.
    const gray = oklch(0.556, 0, 0, 1);
    try std.testing.expectApproxEqAbs(@as(f32, 115), gray.r, 2);
}
