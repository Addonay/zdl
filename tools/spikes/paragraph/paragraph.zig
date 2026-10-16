//! Disposable paragraph contract experiment, not a new public zdl API.
//! Owner-thread only. Snapshots own text/native layout; Library stays borrowed.
const std = @import("std");
const binding = @import("binding.zig");
pub const Library = binding.Library;
pub const Paths = binding.Paths;
pub const Error = binding.Error || std.mem.Allocator.Error || error{
    InvalidUtf8,
    InvalidOptions,
    InvalidPosition,
    NativePosition,
    ImageTooLarge,
};
pub const Options = struct {
    width_px: u16 = 480,
    font: [:0]const u8 = "Sans 20",
    dpi: f64 = 96,
};
/// Encoded-sRGB straight color supplied to the Cairo rasterizer.
pub const Color = struct { r: f64, g: f64, b: f64, a: f64 = 1 };
pub const RasterOptions = struct {
    foreground: Color = .{ .r = 0, .g = 0, .b = 0 },
    /// Null preserves transparent background. Existing raster methods keep white.
    background: ?Color = .{ .r = 1, .g = 1, .b = 1 },
    selection_color: Color = .{ .r = 0.15, .g = 0.45, .b = 0.95, .a = 0.25 },
    cursor_color: Color = .{ .r = 0.1, .g = 0.2, .b = 0.7 },
};
fn validate_color(value: Color) Error!void {
    inline for (.{ value.r, value.g, value.b, value.a }) |v| if (!std.math.isFinite(v) or v < 0 or v > 1) return error.InvalidOptions;
}
pub const Rect = struct { x: f64, y: f64, width: f64, height: f64 };
pub const Carets = struct { strong: Rect, weak: Rect };
/// Preserve Pango's index/trailing pair: normalization to one byte offset loses
/// wrap-line affinity. Only positions returned by this snapshot may be reused.
pub const Cursor = struct { index: usize, trailing: usize = 0 };
pub const Decoration = struct {
    selection: ?struct { start: usize, end: usize } = null,
    cursor: ?Cursor = null,
    strong: bool = true,
};
pub const Hit = struct { inside: bool, cursor: Cursor };
fn rect(value: binding.Rectangle) Rect {
    return .{ .x = @as(f64, @floatFromInt(value.x)) / 1024, .y = @as(f64, @floatFromInt(value.y)) / 1024, .width = @as(f64, @floatFromInt(value.width)) / 1024, .height = @as(f64, @floatFromInt(value.height)) / 1024 };
}
pub const Snapshot = struct {
    allocator: std.mem.Allocator,
    library: *Library,
    text: []const u8,
    map: *binding.FontMap,
    context: *binding.Context,
    layout: *binding.Layout,
    width: u16,
    height: u16,
    ink: binding.Rectangle,
    logical_stops: std.ArrayList(usize),

    pub fn init(allocator: std.mem.Allocator, library: *Library, text: []const u8, options: Options) Error!Snapshot {
        if (text.len > 1024 * 1024 or options.width_px == 0 or options.width_px > 4096 or
            !std.math.isFinite(options.dpi) or options.dpi < 24 or options.dpi > 768) return error.InvalidOptions;
        if (!std.unicode.utf8ValidateSlice(text)) return error.InvalidUtf8;
        // Embedded NULs are explicitly rejected: Pango's text interpretation must
        // agree with this snapshot's complete UTF-8 source, not a silent prefix.
        if (std.mem.indexOfScalar(u8, text, 0) != null) return error.InvalidOptions;
        const owned = try allocator.dupe(u8, text);
        errdefer allocator.free(owned);
        const map = library.pangocairo.pango_cairo_font_map_new() orelse return error.NativeFailure;
        errdefer library.unref(map);
        const context = library.pango.pango_font_map_create_context(map) orelse return error.NativeFailure;
        errdefer library.unref(context);
        library.pangocairo.pango_cairo_context_set_resolution(context, options.dpi);
        const layout = library.pango.pango_layout_new(context) orelse return error.NativeFailure;
        errdefer library.unref(layout);
        const font = library.pango.pango_font_description_from_string(options.font.ptr) orelse return error.NativeFailure;
        defer library.pango.pango_font_description_free(font);
        const font_size = library.pango.pango_font_description_get_size(font);
        if (font_size <= 0 or font_size > 512 * 1024) return error.InvalidOptions;
        library.pango.pango_layout_set_font_description(layout, font);
        library.pango.pango_layout_set_text(layout, owned.ptr, @intCast(owned.len));
        library.pango.pango_layout_set_width(layout, @as(i32, options.width_px) * 1024);
        library.pango.pango_layout_set_wrap(layout, 2); // PANGO_WRAP_WORD_CHAR.
        var logical: binding.Rectangle = undefined;
        var ink: binding.Rectangle = undefined;
        library.pango.pango_layout_get_pixel_extents(layout, &ink, &logical);
        if (logical.height < 0 or logical.height > 16384) return error.ImageTooLarge;
        const logical_stops = try library.cursor_stops(allocator, layout, owned);
        return .{ .logical_stops = logical_stops, .allocator = allocator, .library = library, .text = owned, .map = map, .context = context, .layout = layout, .width = options.width_px, .height = @intCast(@max(logical.height, 1)), .ink = ink };
    }
    pub fn deinit(self: *Snapshot) void {
        self.logical_stops.deinit(self.allocator);
        self.library.unref(self.layout);
        self.library.unref(self.context);
        self.library.unref(self.map);
        self.allocator.free(self.text);
        self.* = undefined;
    }
    pub fn line_count(self: *const Snapshot) usize {
        return @intCast(self.library.pango.pango_layout_get_line_count(self.layout));
    }
    pub fn missing_glyphs(self: *const Snapshot) usize {
        return @intCast(self.library.pango.pango_layout_get_unknown_glyphs_count(self.layout));
    }
    fn boundary(self: *const Snapshot, offset: usize) bool {
        return offset <= self.text.len and (offset == self.text.len or self.text[offset] & 0xc0 != 0x80);
    }
    /// Converts provider trailing scalar count to a UTF-8 byte offset, retaining
    /// the original Cursor separately for subsequent visual movement.
    pub fn byte_offset(self: *const Snapshot, cursor: Cursor) Error!usize {
        if (!self.boundary(cursor.index)) return error.InvalidPosition;
        var index = cursor.index;
        var left = cursor.trailing;
        while (left != 0) : (left -= 1) {
            if (index == self.text.len) return error.InvalidPosition;
            index += std.unicode.utf8ByteSequenceLength(self.text[index]) catch return error.InvalidPosition;
        }
        return index;
    }
    /// Low-level scalar-boundary query, not proof that offset is a grapheme stop.
    pub fn carets(self: *const Snapshot, offset: usize) Error!Carets {
        if (!self.boundary(offset)) return error.InvalidPosition;
        var strong: binding.Rectangle = undefined;
        var weak: binding.Rectangle = undefined;
        self.library.pango.pango_layout_get_cursor_pos(self.layout, @intCast(offset), &strong, &weak);
        return .{ .strong = rect(strong), .weak = rect(weak) };
    }
    /// Steps through provider cursor positions. Null means beyond layout bounds.
    pub fn move(self: *const Snapshot, cursor: Cursor, right: bool, strong: bool) Error!?Cursor {
        _ = try self.byte_offset(cursor);
        var index: i32 = undefined;
        var trailing: i32 = undefined;
        self.library.pango.pango_layout_move_cursor_visually(self.layout, @intFromBool(strong), @intCast(cursor.index), @intCast(cursor.trailing), if (right) 1 else -1, &index, &trailing);
        if (index == -1 or index == std.math.maxInt(i32)) return null;
        if (index < 0 or trailing < 0) return error.NativePosition;
        const result: Cursor = .{ .index = @intCast(index), .trailing = @intCast(trailing) };
        _ = self.byte_offset(result) catch return error.NativePosition;
        return result;
    }
    pub fn hit_test(self: *const Snapshot, x: f64, y: f64) Error!Hit {
        if (!std.math.isFinite(x) or !std.math.isFinite(y) or @abs(x) > 1e6 or @abs(y) > 1e6) return error.InvalidPosition;
        var index: i32 = undefined;
        var trailing: i32 = undefined;
        const inside = self.library.pango.pango_layout_xy_to_index(self.layout, @intFromFloat(@round(x * 1024)), @intFromFloat(@round(y * 1024)), &index, &trailing) != 0;
        if (index < 0 or trailing < 0) return error.NativePosition;
        const result: Cursor = .{ .index = @intCast(index), .trailing = @intCast(trailing) };
        _ = self.byte_offset(result) catch return error.NativePosition;
        return .{ .inside = inside, .cursor = result };
    }
    /// Borrowed provider logical/grapheme stops, ordered by UTF-8 byte offset.
    pub fn stops(self: *const Snapshot) []const usize {
        return self.logical_stops.items;
    }
    fn lower_stop(self: *const Snapshot, offset: usize) usize {
        var first: usize = 0;
        var end = self.stops().len;
        while (first < end) {
            const mid = first + (end - first) / 2;
            if (self.stops()[mid] < offset) first = mid + 1 else end = mid;
        }
        return first;
    }
    pub fn is_stop(self: *const Snapshot, offset: usize) bool {
        const index = self.lower_stop(offset);
        return index < self.stops().len and self.stops()[index] == offset;
    }
    pub fn adjacent_stop(self: *const Snapshot, offset: usize, forward: bool) ?usize {
        var index = self.lower_stop(offset);
        if (forward) {
            if (index < self.stops().len and self.stops()[index] == offset) index += 1;
            return if (index < self.stops().len) self.stops()[index] else null;
        }
        return if (index > 0) self.stops()[index - 1] else null;
    }
    /// Visual caret with upstream wrap-line handling. Raw provider cursor pairs
    /// remain intact; byte normalization alone would lose the selected line.
    pub fn cursor_rect(self: *const Snapshot, cursor: Cursor, strong: bool) Error!Rect {
        const byte = try self.byte_offset(cursor);
        const caret = try self.carets(byte);
        const chosen = if (strong) caret.strong else caret.weak;
        var line: i32 = 0;
        var x: i32 = 0;
        self.library.pango.pango_layout_index_to_line_x(self.layout, @intCast(cursor.index), @intFromBool(cursor.trailing != 0), &line, &x);
        if (line < 0) return error.NativePosition;
        const iter = self.library.pango.pango_layout_get_iter(self.layout) orelse return error.NativeFailure;
        defer self.library.pango.pango_layout_iter_free(iter);
        var i: i32 = 0;
        while (i < line) : (i += 1) if (self.library.pango.pango_layout_iter_next_line(iter) == 0) return error.NativePosition;
        var bounds: binding.Rectangle = undefined;
        self.library.pango.pango_layout_iter_get_line_extents(iter, null, &bounds);
        const box = rect(bounds);
        if (chosen.y >= box.y and chosen.y < box.y + box.height) return chosen;
        return .{ .x = box.x + @as(f64, @floatFromInt(x)) / 1024, .y = box.y, .width = 0, .height = box.height };
    }
    /// Owned visual rectangles for a logical selection, including bidi splits.
    pub fn selection_rects(self: *const Snapshot, allocator: std.mem.Allocator, start: usize, end: usize) Error![]Rect {
        if (start > end or !self.boundary(start) or !self.boundary(end)) return error.InvalidPosition;
        var result: std.ArrayList(Rect) = .empty;
        errdefer result.deinit(allocator);
        if (start == end) return result.toOwnedSlice(allocator);
        const iter = self.library.pango.pango_layout_get_iter(self.layout) orelse return error.NativeFailure;
        defer self.library.pango.pango_layout_iter_free(iter);
        while (true) {
            const line = self.library.pango.pango_layout_iter_get_line_readonly(iter) orelse return error.NativeFailure;
            const first = self.library.pango.pango_layout_line_get_start_index(line);
            const length = self.library.pango.pango_layout_line_get_length(line);
            if (first < 0 or length < 0) return error.NativePosition;
            if (end > @as(usize, @intCast(first)) and start < @as(usize, @intCast(first + length))) {
                var ranges: ?[*]i32 = null;
                var count: i32 = 0;
                self.library.pango.pango_layout_line_get_x_ranges(line, @intCast(start), @intCast(end), &ranges, &count);
                defer self.library.gobject.g_free(if (ranges) |ptr| @ptrCast(ptr) else null);
                if (count < 0 or (count > 0 and ranges == null)) return error.NativeFailure;
                var logical: binding.Rectangle = undefined;
                self.library.pango.pango_layout_iter_get_line_extents(iter, null, &logical);
                for (0..@as(usize, @intCast(count))) |i| {
                    const left = ranges.?[i * 2];
                    const right = ranges.?[i * 2 + 1];
                    if (right < left) return error.NativePosition;
                    try result.append(allocator, .{ .x = @as(f64, @floatFromInt(left)) / 1024, .y = @as(f64, @floatFromInt(logical.y)) / 1024, .width = @as(f64, @floatFromInt(right - left)) / 1024, .height = @as(f64, @floatFromInt(logical.height)) / 1024 });
                }
            }
            if (self.library.pango.pango_layout_iter_next_line(iter) == 0) break;
        }
        return result.toOwnedSlice(allocator);
    }
    /// Rasterizes the same immutable native layout used by all position queries.
    /// Cairo ARGB32 is native-endian premultiplied sRGB; this spike paints an
    /// opaque white background, so byte-alpha/premultiplication ambiguity is absent.
    pub fn rasterize(self: *const Snapshot) Error!Image {
        return self.rasterize_decorated(.{});
    }
    pub fn rasterize_decorated(self: *const Snapshot, decoration: Decoration) Error!Image {
        return self.rasterize_styled(decoration, .{});
    }
    /// Rasterizes this exact layout with explicit background/foreground. Transparent
    /// output is native-endian premultiplied ARGB32, not ordinary RGBA8 bytes.
    pub fn rasterize_styled(self: *const Snapshot, decoration: Decoration, options: RasterOptions) Error!Image {
        try validate_color(options.foreground);
        try validate_color(options.selection_color);
        try validate_color(options.cursor_color);
        if (options.background) |value| try validate_color(value);
        const left = @min(@as(i64, 0), self.ink.x);
        const top = @min(@as(i64, 0), self.ink.y);
        const right = @max(@as(i64, self.width), @as(i64, self.ink.x) + self.ink.width);
        const bottom = @max(@as(i64, self.height), @as(i64, self.ink.y) + self.ink.height);
        const width: usize = @intCast(right - left + 16);
        const height: usize = @intCast(bottom - top + 16);
        if (width > 16384 or height > 16384) return error.ImageTooLarge;
        if (width * height * 4 > 64 * 1024 * 1024) return error.ImageTooLarge;
        const cairo = &self.library.cairo;
        const surface = cairo.cairo_image_surface_create(0, @intCast(width), @intCast(height)) orelse return error.NativeFailure;
        errdefer cairo.cairo_surface_destroy(surface);
        if (cairo.cairo_surface_status(surface) != 0) return error.NativeFailure;
        const painter = cairo.cairo_create(surface) orelse return error.NativeFailure;
        defer cairo.cairo_destroy(painter);
        if (cairo.cairo_status(painter) != 0) return error.NativeFailure;
        if (options.background) |value| {
            cairo.cairo_set_source_rgba(painter, value.r, value.g, value.b, value.a);
            cairo.cairo_paint(painter);
        }
        const origin_x: f64 = @floatFromInt(8 - left);
        const origin_y: f64 = @floatFromInt(8 - top);
        if (decoration.selection) |selection| {
            const rectangles = try self.selection_rects(self.allocator, selection.start, selection.end);
            defer self.allocator.free(rectangles);
            cairo.cairo_set_source_rgba(painter, options.selection_color.r, options.selection_color.g, options.selection_color.b, options.selection_color.a);
            for (rectangles) |box| cairo.cairo_rectangle(painter, origin_x + box.x, origin_y + box.y, box.width, box.height);
            cairo.cairo_fill(painter);
        }
        cairo.cairo_set_source_rgba(painter, options.foreground.r, options.foreground.g, options.foreground.b, options.foreground.a);
        cairo.cairo_move_to(painter, @floatFromInt(8 - left), @floatFromInt(8 - top));
        self.library.pangocairo.pango_cairo_show_layout(painter, self.layout);
        if (decoration.cursor) |cursor| {
            const box = try self.cursor_rect(cursor, decoration.strong);
            cairo.cairo_set_source_rgba(painter, options.cursor_color.r, options.cursor_color.g, options.cursor_color.b, options.cursor_color.a);
            cairo.cairo_rectangle(painter, origin_x + box.x, origin_y + box.y, 1.5, box.height);
            cairo.cairo_fill(painter);
        }
        if (cairo.cairo_status(painter) != 0 or cairo.cairo_surface_status(surface) != 0) return error.NativeFailure;
        cairo.cairo_surface_flush(surface);
        const stride = cairo.cairo_image_surface_get_stride(surface);
        if (stride < @as(i32, @intCast(width * 4))) return error.NativeFailure;
        const data = cairo.cairo_image_surface_get_data(surface) orelse return error.NativeFailure;
        return .{ .library = self.library, .surface = surface, .width = width, .height = height, .stride = @intCast(stride), .pixels = data[0 .. @as(usize, @intCast(stride)) * height], .origin_x = @intCast(8 - left), .origin_y = @intCast(8 - top) };
    }
};
/// Independent native bitmap lifetime; Snapshot may be destroyed first.
/// Pixel bytes borrow this image, and become invalid on deinit. Library outlives it.
pub const Image = struct {
    library: *Library,
    surface: *binding.Surface,
    width: usize,
    height: usize,
    stride: usize,
    pixels: []const u8,
    origin_x: usize,
    origin_y: usize,
    pub fn deinit(self: *Image) void {
        self.library.cairo.cairo_surface_destroy(self.surface);
        self.* = undefined;
    }
    pub fn write_png(self: *const Image, path: [:0]const u8) Error!void {
        if (self.library.cairo.cairo_surface_write_to_png(self.surface, path.ptr) != 0) return error.NativeFailure;
    }
};
