//! Window, event loop and frame rendering for immediate-mode interfaces.
//!
//! Each frame the program's `build` declares its interface through `Ui`, which
//! wraps zlay. zlay computes the layout and returns render commands; this file
//! draws them with `Canvas` and `Text` and presents the result.
//!
//! Units: zlay lays out in logical points (window size). Drawing happens in
//! device pixels (`scale` = pixels per point, from the window's buffer size), so
//! HiDPI output stays sharp and resizing relayouts at the new size.
//!
//! Redraw policy: a frame is drawn only after an event (or while the program
//! reports `animating`). The loop otherwise blocks in `wait_event`, so an idle
//! window uses no CPU.
//!
//! Program interface (checked at compile time):
//!   pub fn build(self: *Program, ui: *Ui) void          // required, declares the frame
//!   pub fn event(self: *Program, ui: *Ui, ev: Event) void   // optional
//!   pub fn animating(self: *const Program) bool         // optional, default false

const std = @import("std");
const zdl = @import("zdl");
const zlay = @import("zlay");
const canvas_mod = @import("canvas.zig");
const text_mod = @import("text.zig");
const svg = @import("svg.zig");
const theme_mod = @import("theme.zig");

pub const Canvas = canvas_mod.Canvas;
pub const Color = canvas_mod.Color;
pub const Rect = canvas_mod.Rect;
pub const Radii = canvas_mod.Radii;
pub const Paint = canvas_mod.Paint;
pub const ShadowLayer = canvas_mod.ShadowLayer;
pub const Text = text_mod.Text;
pub const FontId = text_mod.FontId;
pub const Theme = theme_mod.Theme;
pub const Event = zdl.events.event.Event;

// -----------------------------------------------------------------------------
// Decorations and custom drawing
// -----------------------------------------------------------------------------

/// Extra painting for a rectangle: box shadows under it and an optional
/// vertical gradient replacing its background. Attach to an element as
/// `user_data`; every render command of that element then carries it.
pub const Decor = struct {
    shadows: []const ShadowLayer = &.{},
    /// Top and bottom colors, painted from the top edge to the bottom edge.
    gradient: ?struct { top: Color, bottom: Color } = null,
    /// Suppresses the element's background rectangle. Icons set this because zlay
    /// reuses `background_color` as the image tint and also emits it as a fill.
    skip_fill: bool = false,
};

/// Painting for a `custom` element (charts and other bespoke drawing).
pub const Custom = struct {
    draw: *const fn (canvas: *Canvas, rect: Rect, context: *anyopaque) void,
    context: *anyopaque,
};

/// The decor set for one theme, rebuilt when the theme changes.
pub const Decors = struct {
    flat: Decor = .{},
    xs: Decor = .{},
    sm: Decor = .{},
    md: Decor = .{},
    lg: Decor = .{},
    /// shadcn's card: `bg-gradient-to-t from-primary/5 to-card shadow-xs`.
    card: Decor = .{},
    /// Dashboard inset panel: `shadow-sm` on a rounded background.
    inset: Decor = .{},
    /// Tint-only element (icons).
    icon: Decor = .{ .skip_fill = true },

    layers: struct {
        xs: [1]ShadowLayer,
        sm: [2]ShadowLayer,
        md: [2]ShadowLayer,
        lg: [2]ShadowLayer,
    } = undefined,

    fn build(self: *Decors, theme: *const Theme) void {
        const black = Color.rgba(0, 0, 0, 255);
        const xs_alpha = Color.withAlpha(black, 13);
        const sm_alpha = Color.withAlpha(black, 26);
        const md_alpha = Color.withAlpha(black, 26);
        const lg_alpha = Color.withAlpha(black, 26);
        self.layers = .{
            .xs = .{.{ .offset_y = 1, .blur = 2, .spread = 0, .color = xs_alpha }},
            .sm = .{
                .{ .offset_y = 1, .blur = 3, .spread = 0, .color = sm_alpha },
                .{ .offset_y = 1, .blur = 2, .spread = -1, .color = sm_alpha },
            },
            .md = .{
                .{ .offset_y = 4, .blur = 6, .spread = -1, .color = md_alpha },
                .{ .offset_y = 2, .blur = 4, .spread = -2, .color = md_alpha },
            },
            .lg = .{
                .{ .offset_y = 10, .blur = 15, .spread = -3, .color = lg_alpha },
                .{ .offset_y = 4, .blur = 6, .spread = -4, .color = lg_alpha },
            },
        };
        self.flat = .{};
        self.xs = .{ .shadows = &self.layers.xs };
        self.sm = .{ .shadows = &self.layers.sm };
        self.md = .{ .shadows = &self.layers.md };
        self.lg = .{ .shadows = &self.layers.lg };
        self.inset = .{ .shadows = &self.layers.sm };
        // The gradient runs from the card color at the top to primary at 5 percent
        // over the card at the bottom, as CSS composites it on an opaque card.
        self.card = .{
            .shadows = &self.layers.xs,
            .gradient = .{ .top = theme.card, .bottom = Color.lerp(theme.card, theme.primary, 0.05) },
        };
    }
};

// -----------------------------------------------------------------------------
// Icons
// -----------------------------------------------------------------------------

/// Stable handle stored in an image element's `image.data`. The index selects an
/// entry of `Icons`; the renderer resolves it to a coverage mask at the size drawn.
pub const IconRef = struct {
    index: u16,
};

/// Parsed SVG icons plus a cache of rasterized masks per device size.
pub const Icons = struct {
    allocator: std.mem.Allocator,
    icons: []svg.Icon,
    refs: []IconRef,
    masks: std.AutoHashMapUnmanaged(u32, svg.Mask) = .empty,

    pub fn init(allocator: std.mem.Allocator, sources: []const []const u8) !Icons {
        const icons = try allocator.alloc(svg.Icon, sources.len);
        var parsed: usize = 0;
        errdefer {
            for (icons[0..parsed]) |*icon| icon.deinit();
            allocator.free(icons);
        }
        for (sources, 0..) |source, index| {
            icons[index] = try svg.parse(allocator, source);
            parsed += 1;
        }
        const refs = try allocator.alloc(IconRef, sources.len);
        for (refs, 0..) |*entry, index| entry.* = .{ .index = @intCast(index) };
        return .{ .allocator = allocator, .icons = icons, .refs = refs };
    }

    pub fn deinit(self: *Icons) void {
        var masks = self.masks.valueIterator();
        while (masks.next()) |cached| cached.deinit(self.allocator);
        self.masks.deinit(self.allocator);
        for (self.icons) |*icon| icon.deinit();
        self.allocator.free(self.icons);
        self.allocator.free(self.refs);
        self.* = undefined;
    }

    /// Handle for an icon, suitable for `Ui.icon`.
    pub fn ref(self: *Icons, index: u16) *const IconRef {
        return &self.refs[index];
    }

    /// Coverage mask of icon `index` at `size` x `size` device pixels.
    pub fn mask(self: *Icons, index: u16, size: u32) !svg.Mask {
        const key = (@as(u32, index) << 16) | size;
        if (self.masks.get(key)) |found| return found;
        const rasterized = try self.icons[index].rasterize(self.allocator, size);
        try self.masks.put(self.allocator, key, rasterized);
        return rasterized;
    }
};

// -----------------------------------------------------------------------------
// The per-frame interface
// -----------------------------------------------------------------------------

/// Text style for `Ui.text`. Sizes are logical points.
pub const TextStyle = struct {
    font: FontId,
    size: u16,
    line_height: u16 = 0,
    color: Color,
    alignment: zlay.TextAlignment = .left,
    wrap: zlay.TextWrapMode = .none,
};

const max_focusables = 512;
const max_interactive = 512;

/// What a program sees while building a frame. Valid only inside `build` and
/// `event` (the pointer and focus state are the runtime's).
pub const Ui = struct {
    layout: *zlay.Context,
    text: *Text,
    icons: *Icons,
    theme: *Theme,
    decors: *Decors,
    window: ?zdl.linux.Window = null,
    activated: u32 = 0,
    text_storage: [65536]u8 = undefined,
    text_used: usize = 0,
    drag_regions: zdl.linux.HitTest = .{},
    /// Device pixels per logical point.
    scale: f32 = 1,
    /// zlay id of the element with keyboard focus, or 0.
    focus: u32 = 0,
    /// Set by a program to request another frame after this one.
    redraw: bool = false,

    focusables: [max_focusables]u32 = undefined,
    focusable_count: usize = 0,
    previous_focusables: [max_focusables]u32 = undefined,
    previous_focusable_count: usize = 0,
    interactive: [max_interactive]u32 = undefined,
    interactive_count: usize = 0,

    /// Opens an element. Pair every call with `close`.
    pub fn open(self: *Ui, id: zlay.ElementId, declaration: zlay.ElementDeclaration) void {
        self.layout.openElement(id);
        self.layout.configureOpenElement(declaration);
    }

    pub fn close(self: *Ui) void {
        self.layout.closeElement();
    }

    /// Declares a line of text inside the current element.
    pub fn text_run(self: *Ui, string: []const u8, style: TextStyle) void {
        if (string.len > self.text_storage.len - self.text_used) @panic("UI frame text storage exhausted");
        const owned = self.text_storage[self.text_used..][0..string.len];
        @memcpy(owned, string);
        self.text_used += string.len;
        self.layout.text(owned, .{
            .font_id = style.font,
            .font_size = style.size,
            .line_height = style.line_height,
            .color = style.color,
            .alignment = style.alignment,
            .wrap_mode = style.wrap,
        });
    }

    /// Declares an icon of `size` points, tinted with `color`. `id` must be
    /// unique among the siblings of the current element.
    pub fn icon(self: *Ui, id: zlay.ElementId, index: u16, size: f32, color: Color) void {
        self.open(id, .{
            .layout = .{ .sizing = .{ .width = .fixed(size), .height = .fixed(size) } },
            .background_color = color,
            .image = .{ .data = @constCast(self.icons.ref(index)) },
            .user_data = @constCast(&self.decors.icon),
        });
        self.close();
    }

    /// True while the pointer is over the element with this id (last layout).
    pub fn hovered(self: *Ui, id: zlay.ElementId) bool {
        return self.layout.pointerOver(id);
    }

    /// True on the frame the primary button went down over the element.
    pub fn pressed(self: *Ui, id: zlay.ElementId) bool {
        return self.activated == id.id or (self.layout.pointerState().state == .pressed_this_frame and self.layout.pointerOver(id));
    }

    /// True on the frame the primary button went down anywhere in the window.
    pub fn pointer_pressed(self: *Ui) bool {
        return self.layout.pointerState().state == .pressed_this_frame;
    }

    /// Pointer position in logical points.
    pub fn pointer(self: *Ui) zlay.Vec2 {
        return self.layout.pointerState().position;
    }

    pub fn is_focused(self: *Ui, id: zlay.ElementId) bool {
        return self.focus != 0 and self.focus == id.id;
    }

    pub fn set_focus(self: *Ui, id: zlay.ElementId) void {
        self.focus = id.id;
        self.redraw = true;
    }

    /// Registers an element that can take keyboard focus (Tab cycles these).
    /// Call from `build` in visual order.
    pub fn focusable(self: *Ui, id: zlay.ElementId) void {
        if (self.focusable_count == max_focusables) return;
        self.focusables[self.focusable_count] = id.id;
        self.focusable_count += 1;
    }

    /// Marks an element that should show the pointer cursor when hovered.
    pub fn clickable(self: *Ui, id: zlay.ElementId) void {
        if (self.interactive_count == max_interactive) return;
        self.interactive[self.interactive_count] = id.id;
        self.interactive_count += 1;
    }

    /// Measures a line of text in logical points. Used by zlay and by programs.
    pub fn measure(self: *Ui, string: []const u8, style: TextStyle) f32 {
        const px = @as(f32, @floatFromInt(style.size)) * self.scale;
        const width = self.text.measure(style.font, string, px) catch 0;
        return width / self.scale;
    }

    /// Text metrics for a style, in logical points.
    pub fn metrics(self: *Ui, style: TextStyle) text_mod.Metrics {
        const px = @as(f32, @floatFromInt(style.size)) * self.scale;
        const raw = self.text.metrics(style.font, px);
        return .{ .ascent = raw.ascent / self.scale, .descent = raw.descent / self.scale };
    }

    pub fn toggle_theme(self: *Ui) void {
        self.theme.* = if (self.theme.dark) Theme.light() else Theme.dark_theme();
        self.decors.build(self.theme);
        self.redraw = true;
    }

    /// Requests another frame even if no event arrives (for animations).
    pub fn request_redraw(self: *Ui) void {
        self.redraw = true;
    }
};

// -----------------------------------------------------------------------------
// Runtime
// -----------------------------------------------------------------------------

pub const Options = struct {
    title: []const u8 = "zdl",
    width: u16 = 1440,
    height: u16 = 900,
    min_width: u16 = 640,
    min_height: u16 = 480,
    /// Font files (TTF/OTF bytes) by FontId, borrowed for the run.
    fonts: []const []const u8,
    /// SVG icon sources by icon index, borrowed for the run.
    icons: []const []const u8,
    dark: bool = false,
    custom_titlebar: bool = true,
    titlebar_height: u16 = 48,
    /// Open a native window, present one frame and close for runtime QA.
    smoke: bool = false,
    /// Write a deterministic first frame without opening a display.
    snapshot_path: ?[]const u8 = null,
    /// Frame rate while an animation runs. Idle windows block in `wait_event`.
    animation_hz: f64 = 60,
};

const wheel_step: f32 = 40;

/// Runs `program` until the window is closed. `build` is called every frame that
/// needs one; the program is borrowed for the duration of the call.
pub fn run(comptime Program: type, program: *Program, init: std.process.Init, options: Options) !void {
    const allocator = init.gpa;
    const io = init.io;
    comptime {
        if (!@hasDecl(Program, "build")) @compileError("ui.run: " ++ @typeName(Program) ++ " must declare build(self, ui)");
    }

    const environment = init.minimal.environ;
    var platform = try zdl.linux.Platform.open(allocator, io, .{
        .driver = if (options.snapshot_path != null) .offscreen else .auto,
        .environment = .{
            .video_driver = environment.getPosix("SDL_VIDEO_DRIVER"),
            .wayland_display = environment.getPosix("WAYLAND_DISPLAY"),
            .session_type = environment.getPosix("XDG_SESSION_TYPE"),
            .x11_display = environment.getPosix("DISPLAY"),
            .xcursor_theme = environment.getPosix("XCURSOR_THEME"),
        },
    });
    defer platform.close();

    var window = try platform.create_window(.{
        .title = options.title,
        .size = .{ .width = options.width, .height = options.height },
        .min_size = .{ .width = options.min_width, .height = options.min_height },
        .resizable = true,
        .borderless = options.custom_titlebar,
    });
    defer window.deinit();
    if (options.snapshot_path == null) try window.start_text_input();

    var text = try Text.init(allocator, options.fonts);
    defer text.deinit();
    var icons = try Icons.init(allocator, options.icons);
    defer icons.deinit();

    var theme: Theme = if (options.dark) Theme.dark_theme() else Theme.light();
    var decors: Decors = .{};
    decors.build(&theme);

    const logical = try window.size();
    const layout_options: zlay.Options = .{
        .layout_dimensions = .{ .width = @floatFromInt(logical.width), .height = @floatFromInt(logical.height) },
        .error_handler = .{ .function = report_layout_error },
    };
    const layout_memory = try allocator.alloc(u8, zlay.minMemorySize(layout_options));
    defer allocator.free(layout_memory);

    var ui: Ui = .{
        .layout = undefined,
        .text = &text,
        .icons = &icons,
        .theme = &theme,
        .decors = &decors,
        .window = window,
    };
    var measured_options = layout_options;
    measured_options.measure_text = measure_callback;
    measured_options.measure_text_user_data = &ui;
    ui.layout = try zlay.Context.init(layout_memory, measured_options);
    ui.redraw = true;

    var surface = try zdl.surface.Surface.init(allocator, 1, 1, .rgba8, null);
    defer surface.deinit();

    var frame: Frame(Program) = .{
        .allocator = allocator,
        .window = window,
        .program = program,
        .ui = &ui,
        .surface = &surface,
        .animation_hz = options.animation_hz,
        .snapshot_path = options.snapshot_path,
        .custom_titlebar = options.custom_titlebar,
        .smoke = options.smoke,
        .controls = zdl.linux.window_controls.Controls.init(zdl.linux.window_controls.load(allocator, io, .{
            .current = environment.getPosix("XDG_CURRENT_DESKTOP"),
            .home = environment.getPosix("HOME"),
            .config_home = environment.getPosix("XDG_CONFIG_HOME"),
        }), .{ .height = options.titlebar_height }),
    };
    const result = try zdl.app.callbacks.run(Frame(Program), &frame, platform, io, .{
        .pacing = .wait_event,
    });
    if (result == .failure) return error.RenderFailed;
}

fn report_layout_error(err: zlay.ErrorData) void {
    std.debug.print("zlay: {s}\n", .{err.text});
}

fn measure_callback(text_value: []const u8, config: *const zlay.TextConfig, user_data: ?*anyopaque) zlay.Dimensions {
    const ui: *Ui = @ptrCast(@alignCast(user_data.?));
    const style: TextStyle = .{ .font = config.font_id, .size = config.font_size, .color = config.color };
    const width = ui.measure(text_value, style);
    const height: f32 = if (config.line_height > 0)
        @floatFromInt(config.line_height)
    else
        ui.metrics(style).height();
    return .{ .width = width, .height = height };
}

/// Callbacks for `zdl.app.callbacks.run`, one instance per window.
fn Frame(comptime Program: type) type {
    return struct {
        const Self = @This();

        allocator: std.mem.Allocator,
        window: zdl.linux.Window,
        program: *Program,
        ui: *Ui,
        surface: *zdl.surface.Surface,
        animation_hz: f64,
        snapshot_path: ?[]const u8,
        custom_titlebar: bool,
        smoke: bool,
        controls: zdl.linux.window_controls.Controls,

        pointer: zlay.Vec2 = .{ .x = -1, .y = -1 },
        pointer_down: bool = false,
        wheel: zlay.Vec2 = .{},
        raster_size: zdl.linux.PixelSize = .{ .width = 0, .height = 0 },
        last_cursor: ?zdl.linux.SystemCursor = null,
        last_frame_ns: u64 = 0,
        needs_frame: bool = true,

        pub fn event(self: *Self, context: *zdl.app.callbacks.Context, value: Event) zdl.app.callbacks.Result {
            _ = context;
            self.needs_frame = true;
            if (self.custom_titlebar) switch (value) {
                .mouse_motion => |m| self.controls.pointer_moved(.{ .x = @intFromFloat(m.x), .y = @intFromFloat(m.y) }),
                .mouse_button => |b| if (b.button == 1) {
                    const point = zdl.geometry.Point(i32){ .x = @intFromFloat(b.x), .y = @intFromFloat(b.y) };
                    if (b.kind == .down) {
                        if (self.controls.press(point)) return .@"continue";
                    } else if (self.controls.release(point)) |action| {
                        switch (action) {
                            .minimize => self.window.minimize() catch {},
                            .toggle_maximize => self.window.set_maximized(!self.controls.maximized) catch {},
                            .close_request => return .success,
                        }
                        return .@"continue";
                    }
                },
                else => {},
            };
            switch (value) {
                .mouse_motion => |motion| self.pointer = .{ .x = motion.x, .y = motion.y },
                .mouse_button => |button| {
                    if (button.button == zdl.events.mouse.button.left) self.pointer_down = button.kind == .down;
                    self.pointer = .{ .x = button.x, .y = button.y };
                },
                .mouse_wheel => |wheel| {
                    self.wheel.x += wheel.x * wheel_step;
                    self.wheel.y += wheel.y * wheel_step;
                },
                .key => |key| if (key.kind == .down and (key.scancode == .@"return" or key.scancode == .space) and self.ui.focus != 0) {
                    self.ui.activated = self.ui.focus;
                } else if (key.kind == .down and key.keycode == .tab and !key.repeat) {
                    self.advance_focus(key.modifiers.left_shift or key.modifiers.right_shift);
                    return .@"continue";
                },
                else => {},
            }
            if (@hasDecl(Program, "event")) Program.event(self.program, self.ui, value);
            return .@"continue";
        }

        pub fn iterate(self: *Self, context: *zdl.app.callbacks.Context) zdl.app.callbacks.Result {
            self.draw_frame(context) catch |err| {
                std.debug.print("frame failed: {s}\n", .{@errorName(err)});
                return .failure;
            };
            return if (self.snapshot_path != null or self.smoke) .success else .@"continue";
        }

        fn advance_focus(self: *Self, backwards: bool) void {
            const ui = self.ui;
            const count = ui.focusable_count;
            if (count == 0) return;
            var index: usize = 0;
            for (ui.focusables[0..count], 0..) |id, i| {
                if (id == ui.focus) index = i;
            }
            const next = if (ui.focus == 0)
                (if (backwards) count - 1 else 0)
            else if (backwards)
                (index + count - 1) % count
            else
                (index + 1) % count;
            ui.focus = ui.focusables[next];
            self.needs_frame = true;
        }

        fn draw_frame(self: *Self, context: *zdl.app.callbacks.Context) !void {
            const ui = self.ui;
            const logical = try self.window.size();
            const pixels = try self.window.size_in_pixels();
            if (pixels.width == 0 or pixels.height == 0) return;
            if (pixels.width != self.raster_size.width or pixels.height != self.raster_size.height) {
                const replacement = try zdl.surface.Surface.init(self.allocator, @intCast(pixels.width), @intCast(pixels.height), .rgba8, null);
                self.surface.deinit();
                self.surface.* = replacement;
                self.raster_size = pixels;
                self.needs_frame = true;
            }
            const scale: f32 = @as(f32, @floatFromInt(pixels.width)) / @as(f32, @floatFromInt(@max(logical.width, 1)));
            if (scale != ui.scale) {
                ui.scale = scale;
                ui.layout.resetMeasureTextCache();
                self.needs_frame = true;
            }
            const logical_size: zlay.Dimensions = .{ .width = @floatFromInt(logical.width), .height = @floatFromInt(logical.height) };
            if (!std.meta.eql(ui.layout.getLayoutDimensions(), logical_size)) {
                ui.layout.setLayoutDimensions(logical_size);
                self.needs_frame = true;
            }

            const now: u64 = context.now_ns();
            const dt: f32 = if (self.last_frame_ns == 0)
                0
            else
                @min(0.1, @as(f32, @floatFromInt(now - self.last_frame_ns)) / std.time.ns_per_s);
            self.last_frame_ns = now;

            const animating = if (@hasDecl(Program, "animating")) Program.animating(self.program) else false;
            const scrolling = self.wheel.x != 0 or self.wheel.y != 0;
            if (!self.needs_frame and !animating and !ui.redraw and !scrolling) {
                context.pacing = .wait_event;
                return;
            }
            ui.redraw = false;

            // zlay hit-tests the pointer against the previous layout, as in Clay.
            ui.layout.setPointerState(self.pointer, self.pointer_down);
            ui.layout.updateScrollContainers(false, self.wheel, dt);
            self.wheel = .{};

            ui.previous_focusables = ui.focusables;
            ui.previous_focusable_count = ui.focusable_count;
            ui.focusable_count = 0;
            ui.interactive_count = 0;
            ui.text_used = 0;
            ui.layout.beginLayout();
            ui.drag_regions = .{ .resize_border = 6 };
            self.program.build(ui);
            ui.activated = 0;
            const commands = ui.layout.endLayout(dt);
            if (ui.focus != 0 and !contains(ui.focusables[0..ui.focusable_count], ui.focus)) ui.focus = 0;
            self.update_cursor();

            var canvas = Canvas.init(self.surface.view.data, pixels.width, pixels.height, self.surface.view.stride);
            canvas.clear(ui.theme.background);
            var painter: Painter = .{ .canvas = &canvas, .text = ui.text, .icons = ui.icons, .scale = scale };
            for (commands) |command| painter.draw(command);

            if (self.custom_titlebar) {
                self.controls.set_width(logical.width);
                self.controls.set_window_state(try self.window.flags());
                var regions = ui.drag_regions;
                for (self.controls.geometry.placed()) |placed| try regions.add(.{ .rect = placed.rect, .kind = .not_draggable });
                try self.window.set_hit_test(regions);
                var renderer = zdl.render.renderer.Renderer.init(self.allocator, self.surface.view);
                try renderer.set_scale(scale, scale);
                try self.controls.draw(&renderer, .{
                    .symbol = to_renderer_color(ui.theme.foreground),
                    .inactive_symbol = to_renderer_color(ui.theme.muted_foreground),
                    .hover = to_renderer_color(ui.theme.accent),
                });
            }
            if (self.snapshot_path) |path| {
                const bytes = try zdl.image.png.encode(self.allocator, self.surface.view);
                defer self.allocator.free(bytes);
                try std.Io.Dir.cwd().writeFile(context.io, .{ .sub_path = path, .data = bytes });
            }
            try self.window.present(self.surface.view);
            self.needs_frame = false;
            context.pacing = if (animating or ui.redraw) .{ .rate_hz = self.animation_hz } else .wait_event;
        }

        fn update_cursor(self: *Self) void {
            var wanted: zdl.linux.SystemCursor = .default;
            for (self.ui.interactive[0..self.ui.interactive_count]) |id| {
                if (pointer_over(self.ui, id)) {
                    wanted = .pointer;
                    break;
                }
            }
            if (self.last_cursor == null or self.last_cursor.? != wanted) {
                self.window.set_cursor(wanted) catch {};
                self.last_cursor = wanted;
            }
        }
    };
}

fn contains(list: []const u32, value: u32) bool {
    for (list) |item| {
        if (item == value) return true;
    }
    return false;
}

fn pointer_over(ui: *Ui, id: u32) bool {
    for (ui.layout.pointerOverIds()) |over| {
        if (over.id == id) return true;
    }
    return false;
}

/// Draws zlay render commands into the canvas.
const Painter = struct {
    canvas: *Canvas,
    text: *Text,
    icons: *Icons,
    scale: f32,

    fn device_rect(self: Painter, box: zlay.BoundingBox) Rect {
        return .{ .x = box.x * self.scale, .y = box.y * self.scale, .w = box.width * self.scale, .h = box.height * self.scale };
    }

    fn device_radii(self: Painter, radius: zlay.CornerRadius) Radii {
        return .{
            .tl = radius.top_left * self.scale,
            .tr = radius.top_right * self.scale,
            .br = radius.bottom_right * self.scale,
            .bl = radius.bottom_left * self.scale,
        };
    }

    fn draw(self: *Painter, command: zlay.RenderCommand) void {
        const rect = self.device_rect(command.bounding_box);
        switch (command.data) {
            .rectangle => |data| {
                const radii = self.device_radii(data.corner_radius);
                const decor: ?*const Decor = if (command.user_data) |pointer| @ptrCast(@alignCast(pointer)) else null;
                if (decor) |value| if (value.skip_fill) return;
                if (decor) |value| {
                    for (value.shadows) |layer| {
                        self.canvas.shadow(rect, radii, .{
                            .offset_y = layer.offset_y * self.scale,
                            .blur = layer.blur * self.scale,
                            .spread = layer.spread * self.scale,
                            .color = layer.color,
                        });
                    }
                }
                const paint: Paint = if (decor != null and decor.?.gradient != null) blk: {
                    const gradient = decor.?.gradient.?;
                    break :blk .{ .vertical = .{ .top_color = gradient.top, .bottom_color = gradient.bottom, .top_y = rect.y, .bottom_y = rect.bottom() } };
                } else .{ .solid = data.color };
                self.canvas.fill_rounded(rect, radii, paint);
            },
            .border => |data| {
                const widths = data.width;
                if (widths.left == widths.right and widths.left == widths.top and widths.left == widths.bottom) {
                    const width = @as(f32, @floatFromInt(widths.left)) * self.scale;
                    self.canvas.stroke_rounded(rect, self.device_radii(data.corner_radius), width, data.color);
                } else {
                    const left: f32 = @as(f32, @floatFromInt(widths.left)) * self.scale;
                    const right: f32 = @as(f32, @floatFromInt(widths.right)) * self.scale;
                    const top: f32 = @as(f32, @floatFromInt(widths.top)) * self.scale;
                    const bottom: f32 = @as(f32, @floatFromInt(widths.bottom)) * self.scale;
                    if (top > 0) self.canvas.fill_rect(.{ .x = rect.x, .y = rect.y, .w = rect.w, .h = top }, .{ .solid = data.color });
                    if (bottom > 0) self.canvas.fill_rect(.{ .x = rect.x, .y = rect.bottom() - bottom, .w = rect.w, .h = bottom }, .{ .solid = data.color });
                    if (left > 0) self.canvas.fill_rect(.{ .x = rect.x, .y = rect.y, .w = left, .h = rect.h }, .{ .solid = data.color });
                    if (right > 0) self.canvas.fill_rect(.{ .x = rect.right() - right, .y = rect.y, .w = right, .h = rect.h }, .{ .solid = data.color });
                }
            },
            .text => |data| {
                const font_px = @as(f32, @floatFromInt(data.font_size)) * self.scale;
                const metrics = self.text.metrics(data.font_id, font_px);
                const line_height = rect.h;
                const baseline = rect.y + (line_height - metrics.height()) / 2 + metrics.ascent;
                self.text.draw(self.canvas, data.font_id, data.text, rect.x, baseline, font_px, data.color) catch {};
            },
            .image => |data| {
                const ref: *const IconRef = @ptrCast(@alignCast(data.image_data orelse return));
                const size: u32 = @intFromFloat(@max(1, @round(rect.w)));
                const mask = self.icons.mask(ref.index, size) catch return;
                self.canvas.blend_coverage(mask.coverage, mask.width, mask.height, @intFromFloat(@round(rect.x)), @intFromFloat(@round(rect.y)), data.background_color, null);
            },
            .scissor_start => self.canvas.push_clip(rect),
            .scissor_end => self.canvas.pop_clip(),
            .custom => |data| {
                const custom: *const Custom = @ptrCast(@alignCast(data.custom_data orelse return));
                custom.draw(self.canvas, rect, custom.context);
            },
            .overlay_color_start, .overlay_color_end, .none => {},
        }
    }
};

fn to_renderer_color(color: Color) zdl.render.renderer.Color {
    return .{ .r = @intFromFloat(color.r), .g = @intFromFloat(color.g), .b = @intFromFloat(color.b), .a = @intFromFloat(color.a) };
}
