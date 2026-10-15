//! Reusable native UI toolkit for zdl applications: text (FreeType + HarfBuzz),
//! an antialiased canvas, SVG icons, shadcn/ui-style theme tokens, a zlay-based
//! immediate-mode runtime and a widget set in the shadcn/ui style.
//!
//! Typical use:
//!
//!     const ui = @import("ui");
//!     pub fn main(init: std.process.Init) !void {
//!         var app: App = .{};
//!         try ui.run(App, &app, init, .{ .fonts = &fonts, .icons = &icons });
//!     }
//!
//! where `App` declares `build(self: *App, ui: *ui.Ui) void`.

pub const canvas = @import("canvas.zig");
pub const text = @import("text.zig");
pub const svg = @import("svg.zig");
pub const theme = @import("theme.zig");
pub const runtime = @import("runtime.zig");
pub const widgets = @import("widgets.zig");

pub const Canvas = canvas.Canvas;
pub const Color = canvas.Color;
pub const Rect = canvas.Rect;
pub const Radii = canvas.Radii;
pub const Text = text.Text;
pub const FontId = text.FontId;
pub const Theme = theme.Theme;
pub const Ui = runtime.Ui;
pub const Decor = runtime.Decor;
pub const Decors = runtime.Decors;
pub const Custom = runtime.Custom;
pub const TextStyle = runtime.TextStyle;
pub const Options = runtime.Options;
pub const run = runtime.run;

test {
    _ = canvas;
    _ = text;
    _ = svg;
    _ = theme;
    _ = widgets;
}
