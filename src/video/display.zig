//! Display and display-mode model shared by every windowing backend.
//! Altered native port of the backend-independent parts of SDL_video.c:
//! display mode finalization (refresh fractions, density defaults), SDL's
//! mode ordering and duplicate rules, closest fullscreen mode selection, display
//! bounds fallback, usable-bounds hint parsing and display lookup for points,
//! rectangles, window positions and fullscreen windows.
//!
//! Backends (X11, Wayland) discover displays and supply backend-reported bounds
//! and modes; this module never talks to a server. It owns no global display
//! list, no display ids and no hints: callers hold a `[]Display` and pass the
//! primary display's index explicitly.
//!
//! Deliberate differences from SDL:
//! - The current mode is `?Mode`, where null means "the desktop mode". SDL keeps
//!   a pointer into the mode array, which would dangle after reallocation.
//! - Pixel formats are `pixels.Format` values; an unknown format is null.
//! - Lookup distances are computed in i64 and are not capped at SDL's initial
//!   0x7FFFFFFF closest distance, so far-away windows still find a display.
//! - Bounds fallback for the first display uses the origin; SDL would index
//!   `displays[-1]` for a non-primary first display.
//! - The usable-bounds hint must contain four exact integers; sscanf-style
//!   trailing text after the fourth field is rejected.
const std = @import("std");
const event = @import("../events/event.zig");
const geometry = @import("geometry.zig");
const pixels = @import("pixels.zig");

/// Integer pixel rectangle; right and bottom edges are exclusive.
pub const Rect = geometry.Rect(i32);
/// Integer pixel point.
pub const Point = geometry.Point(i32);

/// Errors reported by mode-list and display operations.
pub const Error = std.mem.Allocator.Error || error{InvalidMode};

/// Orientation of a display relative to its natural (portrait or landscape) pose.
pub const Orientation = enum { unknown, landscape, landscape_flipped, portrait, portrait_flipped };

/// SDL_PACKEDLAYOUT values in SDL's numeric order. The ordering of display modes
/// compares these numbers, so the discriminants are part of the sort contract.
/// Byte-array formats have no packed layout and report `none`.
pub const PackedLayout = enum(u8) {
    none = 0,
    p332 = 1,
    p4444 = 2,
    p1555 = 3,
    p5551 = 4,
    p565 = 5,
    p8888 = 6,
    p2101010 = 7,
    p1010102 = 8,
};

/// Packed layout of a pixel format, recovered from the channel bit widths and
/// the position of the alpha channel. 1555 places alpha at the top bit and 5551
/// at the bottom bit; 2101010 and 1010102 are distinguished the same way.
pub fn packed_layout(format: pixels.Format) PackedLayout {
    const masked = switch (format) {
        .masked => |value| value,
        else => return .none,
    };
    const r = masked.channels[0];
    const g = masked.channels[1];
    const b = masked.channels[2];
    const a = masked.channels[3];
    if (r.bits == 3 and g.bits == 3 and b.bits == 2 and a.bits == 0) return .p332;
    if (r.bits == 4 and g.bits == 4 and b.bits == 4 and a.bits == 4) return .p4444;
    if (r.bits == 5 and g.bits == 5 and b.bits == 5 and a.bits == 1) return if (a.shift == 15) .p1555 else .p5551;
    if (r.bits == 5 and g.bits == 6 and b.bits == 5 and a.bits == 0) return .p565;
    if (r.bits == 8 and g.bits == 8 and b.bits == 8 and (a.bits == 8 or a.bits == 0)) return .p8888;
    if (r.bits == 10 and g.bits == 10 and b.bits == 10 and a.bits == 2) return if (a.shift == 30) .p2101010 else .p1010102;
    return .none;
}

/// A display mode as SDL_DisplayMode describes it. Zero width, height or
/// refresh means "unspecified" in lookups; `finalize` fills the derived fields.
pub const Mode = struct {
    /// Display this mode belongs to. `none` for unbound descriptions.
    display_id: event.DisplayId = .none,
    /// Pixel format; null is SDL's unknown format.
    format: ?pixels.Format = null,
    width: i32 = 0,
    height: i32 = 0,
    /// Pixels per logical unit (2.0 means a 1920x1080 mode has 3840x2160 pixels).
    pixel_density: f32 = 0,
    /// Refresh rate in hertz, rounded to two decimals by `finalize`.
    refresh_rate: f32 = 0,
    /// Exact refresh fraction: rate = numerator / denominator. Zero numerator
    /// means the fraction was not supplied and is derived from `refresh_rate`.
    refresh_numerator: u32 = 0,
    refresh_denominator: u32 = 0,

    /// Makes derived fields consistent, as SDL_FinalizeDisplayMode does: density
    /// defaults to 1, a supplied fraction defines the rate, and an unsupplied
    /// fraction is approximated by a Stern-Brocot search with denominators <= 1000.
    pub fn finalize(self: *Mode) void {
        if (self.pixel_density <= 0) self.pixel_density = 1;
        if (self.refresh_numerator > 0) {
            if (self.refresh_denominator == 0) self.refresh_denominator = 1;
            self.refresh_rate = @as(f32, @floatFromInt(self.refresh_numerator)) / @as(f32, @floatFromInt(self.refresh_denominator));
        } else {
            const fraction = refresh_fraction(self.refresh_rate);
            self.refresh_numerator = fraction.numerator;
            self.refresh_denominator = fraction.denominator;
        }
        self.refresh_rate = @round(self.refresh_rate * 100.0) / 100.0;
    }

    /// Bits per pixel of the format, or zero for an unknown format.
    pub fn bits_per_pixel(self: Mode) u32 {
        const format = self.format orelse return 0;
        return @intCast(format.bits_per_pixel());
    }

    /// Bytes of storage per pixel, rounding sub-byte formats up to one byte.
    pub fn bytes_per_pixel(self: Mode) u32 {
        return (self.bits_per_pixel() + 7) / 8;
    }

    /// Two modes describe the same display configuration when their dimensions,
    /// format and refresh do not differ. Use `order` for SDL's duplicate rule.
    pub fn same_description(self: Mode, other: Mode) bool {
        return order(self, other) == .eq;
    }
};

const Fraction = struct { numerator: u32, denominator: u32 };

/// SDL_CalculateFraction: the best rational approximation with denominators
/// and numerators up to 1000, found by walking the Stern-Brocot tree.
fn refresh_fraction(x: f32) Fraction {
    const limit: u32 = 1000;
    var a: u32 = 0;
    var b: u32 = 1;
    var c: u32 = 1;
    var d: u32 = 0;
    while (b <= limit and d <= limit) {
        const mediant = @as(f32, @floatFromInt(a + c)) / @as(f32, @floatFromInt(b + d));
        if (x == mediant) {
            if (b + d <= limit) return .{ .numerator = a + c, .denominator = b + d };
            if (d > b) return .{ .numerator = c, .denominator = d };
            return .{ .numerator = a, .denominator = b };
        } else if (x > mediant) {
            a += c;
            b += d;
        } else {
            c += a;
            d += b;
        }
    }
    if (b > limit) return .{ .numerator = c, .denominator = d };
    return .{ .numerator = a, .denominator = b };
}

/// SDL's display mode order: larger width, then height, then bits per pixel,
/// then packed layout (descending), then refresh rate (descending, at centi-hertz
/// resolution), then pixel density (ascending). `.eq` marks duplicates.
pub fn order(a: Mode, b: Mode) std.math.Order {
    if (a.width != b.width) return descending(a.width, b.width);
    if (a.height != b.height) return descending(a.height, b.height);
    if (a.bits_per_pixel() != b.bits_per_pixel()) return descending(a.bits_per_pixel(), b.bits_per_pixel());
    const layout_a: u8 = @backingInt(if (a.format) |format| packed_layout(format) else PackedLayout.none);
    const layout_b: u8 = @backingInt(if (b.format) |format| packed_layout(format) else PackedLayout.none);
    if (layout_a != layout_b) return descending(layout_a, layout_b);
    const rate_a = lossy_hundredths(a.refresh_rate);
    const rate_b = lossy_hundredths(b.refresh_rate);
    if (rate_a != rate_b) return descending(rate_a, rate_b);
    const density_a = lossy_hundredths(a.pixel_density);
    const density_b = lossy_hundredths(b.pixel_density);
    return std.math.order(density_a, density_b);
}

fn descending(a: anytype, b: anytype) std.math.Order {
    return std.math.order(b, a);
}

/// Truncates to centi-units like SDL's `(int)(value * 100)`; out-of-range or
/// NaN values saturate instead of invoking undefined behavior.
fn lossy_hundredths(value: f32) i64 {
    return std.math.lossyCast(i64, value * 100.0);
}

/// Descriptor of a fullscreen request: borderless desktop fullscreen, or
/// exclusive fullscreen with a concrete mode from the display's list.
pub const FullscreenMode = union(enum) {
    desktop,
    exclusive: Mode,

    /// True when a concrete mode switch is requested.
    pub fn is_exclusive(self: FullscreenMode) bool {
        return self == .exclusive;
    }
};

/// Fullscreen-capable modes of one display, sorted by `order`. Owns its storage
/// through the allocator passed to each mutating call.
pub const ModeList = struct {
    items: std.ArrayList(Mode) = .empty,

    /// Frees the mode storage and invalidates the list.
    pub fn deinit(self: *ModeList, allocator: std.mem.Allocator) void {
        self.items.deinit(allocator);
        self.* = undefined;
    }

    /// Removes every mode and releases storage (SDL_ResetFullscreenDisplayModes).
    pub fn reset(self: *ModeList, allocator: std.mem.Allocator) void {
        self.items.clearAndFree(allocator);
    }

    /// Borrowed, sorted view of the modes; valid until the next mutation.
    pub fn modes(self: ModeList) []const Mode {
        return self.items.items;
    }

    /// Adds a finalized copy of `mode` bound to `display_id`. Returns false,
    /// without changing the list, when an equal mode already exists.
    pub fn add(self: *ModeList, allocator: std.mem.Allocator, display_id: event.DisplayId, mode: Mode) Error!bool {
        var finalized = mode;
        finalized.display_id = display_id;
        finalized.finalize();
        for (self.items.items) |existing| {
            if (order(finalized, existing) == .eq) return false;
        }
        try self.items.append(allocator, finalized);
        std.mem.sort(Mode, self.items.items, {}, less_than);
        return true;
    }

    fn less_than(_: void, a: Mode, b: Mode) bool {
        return order(a, b) == .lt;
    }

    /// Finds the list entry for a requested mode (SDL_GetFullscreenModeMatch).
    /// The request is finalized first. An exact field match wins; otherwise the
    /// first entry with the same width, height, format and refresh is used.
    pub fn match(self: ModeList, requested: Mode) ?Mode {
        var finalized = requested;
        finalized.finalize();
        for (self.items.items) |candidate| {
            if (std.meta.eql(finalized, candidate)) return candidate;
        }
        for (self.items.items) |candidate| {
            if (order(finalized, candidate) == .eq) return candidate;
        }
        return null;
    }

    /// Picks the best fullscreen mode for a requested size, following
    /// SDL_GetClosestFullscreenDisplayMode. The list is walked from the largest
    /// mode down, so the first mode that is too wide ends the search. Among
    /// modes that fit, the closest aspect ratio wins; then the closest refresh
    /// (only for equal sizes); then the deeper color format.
    ///
    /// `refresh_rate` of zero means "any": the caller should pass the desktop
    /// refresh (see `Display.closest_fullscreen_mode`). Modes with density above
    /// one are skipped unless `include_high_density` is set.
    pub fn closest(self: ModeList, width: i32, height: i32, refresh_rate: f32, include_high_density: bool) ?Mode {
        const aspect: f32 = if (height > 0) @as(f32, @floatFromInt(width)) / @as(f32, @floatFromInt(height)) else 1;
        var best: ?Mode = null;
        for (self.items.items) |mode| {
            if (width > mode.width) break;
            if (height > mode.height) continue;
            if (mode.pixel_density > 1 and !include_high_density) continue;
            if (best) |current| {
                const mode_aspect = @as(f32, @floatFromInt(mode.width)) / @as(f32, @floatFromInt(mode.height));
                const current_aspect = @as(f32, @floatFromInt(current.width)) / @as(f32, @floatFromInt(current.height));
                if (@abs(aspect - current_aspect) < @abs(aspect - mode_aspect)) continue;
                if (mode.width == current.width and mode.height == current.height) {
                    if (@abs(current.refresh_rate - refresh_rate) < @abs(mode.refresh_rate - refresh_rate)) continue;
                    if (current.bytes_per_pixel() > mode.bytes_per_pixel()) continue;
                }
            }
            best = mode;
        }
        return best;
    }
};

/// One physical display. Bounds, usable bounds and modes are either supplied by
/// a backend or derived here. Fields are plain data so a backend can update them.
pub const Display = struct {
    id: event.DisplayId,
    /// Borrowed human-readable name; the caller keeps it alive.
    name: []const u8 = "",
    /// Backend-reported bounds in desktop coordinates. Null means "derive them
    /// from the left-to-right layout" (see `bounds_of`).
    bounds: ?Rect = null,
    /// Backend-reported usable area (for example without panels). Null means the
    /// full bounds are usable.
    usable_bounds: ?Rect = null,
    natural_orientation: Orientation = .unknown,
    current_orientation: Orientation = .unknown,
    /// Platform scale applied to the display (for example 2.0 on HiDPI panels).
    content_scale: f32 = 1,
    /// Desktop mode as the operating system reports it.
    desktop_mode: Mode = .{},
    /// Mode currently in effect, or null while the desktop mode is in effect.
    current_mode: ?Mode = null,
    /// True while a temporary fullscreen mode switch is active; the desktop mode
    /// is then not overwritten by reports.
    fullscreen_active: bool = false,
    /// Exclusive-capable modes. Empty until the backend fills it.
    fullscreen_modes: ModeList = .{},

    /// Releases the fullscreen mode storage.
    pub fn deinit(self: *Display, allocator: std.mem.Allocator) void {
        self.fullscreen_modes.deinit(allocator);
        self.* = undefined;
    }

    /// The mode in effect: the current mode, or the desktop mode when none is set.
    pub fn current(self: Display) Mode {
        return self.current_mode orelse self.desktop_mode;
    }

    /// Replaces the desktop mode (SDL_SetDesktopDisplayMode). Reports are ignored
    /// while a temporary fullscreen mode is active, as SDL does. The result says
    /// which change notifications the backend should emit.
    pub fn set_desktop_mode(self: *Display, mode: Mode) ModeChange {
        if (self.fullscreen_active) return .{};
        const previous = self.desktop_mode;
        var finalized = mode;
        finalized.display_id = self.id;
        finalized.finalize();
        self.desktop_mode = finalized;
        const desktop_changed = mode_changed(previous, finalized);
        return .{
            .desktop_changed = desktop_changed,
            .current_changed = desktop_changed and self.current_mode == null,
        };
    }

    /// Sets the mode in effect; null restores the desktop mode
    /// (SDL_SetCurrentDisplayMode). Returns true when the change is observable.
    pub fn set_current_mode(self: *Display, mode: ?Mode) bool {
        const previous = self.current();
        self.current_mode = mode;
        return mode_changed(previous, self.current());
    }

    /// Updates the platform content scale; returns true when it changed, so the
    /// caller can emit a content-scale event and recheck windows on this display.
    pub fn set_content_scale(self: *Display, scale: f32) bool {
        if (scale == self.content_scale) return false;
        self.content_scale = scale;
        return true;
    }

    /// Usable area of the display: the backend's usable bounds, or the given full
    /// bounds when none were reported.
    pub fn usable(self: Display, full_bounds: Rect) Rect {
        return self.usable_bounds orelse full_bounds;
    }

    /// Adds a fullscreen mode for this display (see `ModeList.add`).
    pub fn add_fullscreen_mode(self: *Display, allocator: std.mem.Allocator, mode: Mode) Error!bool {
        return self.fullscreen_modes.add(allocator, self.id, mode);
    }

    /// Closest fullscreen mode for a request (SDL_GetClosestFullscreenDisplayMode).
    /// A zero refresh rate matches the desktop refresh. Returns null when no
    /// listed mode is large enough.
    pub fn closest_fullscreen_mode(self: Display, width: i32, height: i32, refresh_rate: f32, include_high_density: bool) ?Mode {
        const refresh = if (refresh_rate == 0) self.desktop_mode.refresh_rate else refresh_rate;
        return self.fullscreen_modes.closest(width, height, refresh, include_high_density);
    }
};

/// Notifications produced by `Display.set_desktop_mode`.
pub const ModeChange = struct {
    desktop_changed: bool = false,
    current_changed: bool = false,
};

/// Whether a report changes what a consumer can observe (SDL's DisplayModeChanged).
/// Fields that are zero in `old` are treated as unknown and never count as a change.
fn mode_changed(old: Mode, new: Mode) bool {
    return (old.display_id != .none and old.display_id != new.display_id) or
        (old.format != null and !std.meta.eql(old.format, new.format)) or
        (old.width != 0 and old.height != 0 and (old.width != new.width or old.height != new.height)) or
        (old.pixel_density != 0 and old.pixel_density != new.pixel_density) or
        (old.refresh_rate != 0 and old.refresh_rate != new.refresh_rate);
}

/// Bounds of `displays[index]` in desktop coordinates. Backend bounds win. Without
/// them, the primary display sits at the origin and every other display starts at
/// the right edge of the previous one (SDL_GetDisplayBounds' fallback), keeping the
/// previous display's top coordinate. Only the mode size is taken from the mode.
pub fn bounds_of(displays: []const Display, index: usize, primary: usize) Rect {
    const display = displays[index];
    if (display.bounds) |reported| return reported;
    const current_mode = display.current();
    var result: Rect = .{ .x = 0, .y = 0, .width = current_mode.width, .height = current_mode.height };
    if (index != primary and index > 0) {
        const previous = bounds_of(displays, index - 1, primary);
        result.x = previous.x +| previous.width;
        result.y = previous.y;
    }
    return result;
}

/// Parses SDL_HINT_DISPLAY_USABLE_BOUNDS, written as "x,y,width,height". Fields
/// are trimmed and must be decimal integers. Returns null on any malformed input.
pub fn parse_usable_bounds_hint(text: []const u8) ?Rect {
    var values: [4]i32 = undefined;
    var fields = std.mem.splitScalar(u8, text, ',');
    for (&values) |*value| {
        const field = fields.next() orelse return null;
        value.* = std.fmt.parseInt(i32, std.mem.trim(u8, field, " \t"), 10) catch return null;
    }
    return .{ .x = values[0], .y = values[1], .width = values[2], .height = values[3] };
}

/// True when the integer point lies inside a non-empty rectangle; the right and
/// bottom edges are exclusive. Uses i64 so the edge sums cannot overflow.
fn contains_point(rect: Rect, x: i64, y: i64) bool {
    if (rect.width <= 0 or rect.height <= 0) return false;
    return x >= rect.x and y >= rect.y and
        x < @as(i64, rect.x) + rect.width and y < @as(i64, rect.y) + rect.height;
}

/// Display for a point (SDL_GetDisplayForPoint): the display containing it, else
/// the nearest one, measured from the point to the closest point of each bounds.
pub fn display_for_point(displays: []const Display, primary: usize, point: Point) ?event.DisplayId {
    return display_for_rect(displays, primary, .{ .x = point.x, .y = point.y, .width = 1, .height = 1 });
}

/// Display for a rectangle (SDL_GetDisplayForRect), decided by the rectangle's
/// center: the first display that contains it wins; otherwise the display whose
/// nearest edge point is closest to the center (ties keep the earlier display).
pub fn display_for_rect(displays: []const Display, primary: usize, rect: Rect) ?event.DisplayId {
    const center_x = @as(i64, rect.x) + @divTrunc(rect.width, 2);
    const center_y = @as(i64, rect.y) + @divTrunc(rect.height, 2);
    var closest: ?usize = null;
    var closest_distance: i64 = 0;
    for (0..displays.len) |index| {
        const bounds = bounds_of(displays, index, primary);
        if (contains_point(bounds, center_x, center_y)) return displays[index].id;
        const nearest_x = clamp_to_bounds(center_x, bounds.x, bounds.width);
        const nearest_y = clamp_to_bounds(center_y, bounds.y, bounds.height);
        const dx = center_x - nearest_x;
        const dy = center_y - nearest_y;
        const distance = dx * dx + dy * dy;
        if (closest == null or distance < closest_distance) {
            closest = index;
            closest_distance = distance;
        }
    }
    if (closest) |index| return displays[index].id;
    return null;
}

/// Clamps a coordinate to [origin, origin + extent - 1], as SDL's closest-point
/// helper does for integer rectangles (an empty rectangle clamps to its origin
/// edge, which the caller's distance still measures consistently).
fn clamp_to_bounds(value: i64, origin: i32, extent: i32) i64 {
    const first: i64 = origin;
    const last = first + extent - 1;
    if (value < first) return first;
    if (value > last) return last;
    return value;
}

/// Display whose bounds origin is exactly (x, y), or null. Used to honor requests
/// that place a window at a display origin before any geometry is known.
pub fn display_at_origin(displays: []const Display, primary: usize, x: i32, y: i32) ?event.DisplayId {
    for (0..displays.len) |index| {
        const bounds = bounds_of(displays, index, primary);
        if (bounds.x == x and bounds.y == y) return displays[index].id;
    }
    return null;
}

/// Display for a window position (SDL_GetDisplayForWindowPosition). `backend` is
/// the display the platform reported for the window, if any. Without it, a
/// fullscreen window is placed by its origin (its size may lag a move between
/// displays), and any other window by its center rectangle. The primary display
/// is the last resort.
pub fn display_for_window_position(displays: []const Display, primary: usize, backend: ?event.DisplayId, rect: Rect, fullscreen: bool) ?event.DisplayId {
    if (backend) |id| if (id != .none) return id;
    if (fullscreen) {
        if (display_for_rect(displays, primary, .{ .x = rect.x, .y = rect.y, .width = 1, .height = 1 })) |id| return id;
    } else {
        if (display_for_rect(displays, primary, rect)) |id| return id;
    }
    return primary_id(displays, primary);
}

/// Where a fullscreen window currently sits, as the window state machine reports
/// it: an explicitly requested display, a pending display from a position request,
/// and the rectangle to test (pending or current geometry).
pub const FullscreenPlacement = struct {
    explicit: ?event.DisplayId = null,
    pending: ?event.DisplayId = null,
    rect: Rect,
};

/// Display a fullscreen operation should target (SDL_GetVideoDisplayForFullscreenWindow).
/// Priority: explicit fullscreen display, pending display, the display at the
/// placement origin, then the display containing the placement rectangle, then
/// the primary display.
pub fn display_for_fullscreen(displays: []const Display, primary: usize, placement: FullscreenPlacement) ?event.DisplayId {
    if (placement.explicit) |id| if (id != .none) return id;
    if (placement.pending) |id| if (id != .none) return id;
    if (display_at_origin(displays, primary, placement.rect.x, placement.rect.y)) |id| return id;
    if (display_for_rect(displays, primary, placement.rect)) |id| return id;
    return primary_id(displays, primary);
}

/// Id of the primary display, or null when there are no displays.
pub fn primary_id(displays: []const Display, primary: usize) ?event.DisplayId {
    if (primary >= displays.len) return null;
    return displays[primary].id;
}
