//! Disposable WP-02 Pango/Cairo ABI boundary. Never imported by zdl.
const std = @import("std");
pub const Layout = opaque {};
pub const LayoutIter = opaque {};
pub const LayoutLine = opaque {};
pub const FontMap = opaque {};
pub const Context = opaque {};
pub const FontDescription = opaque {};
pub const Surface = opaque {};
pub const Painter = opaque {};
pub const Rectangle = extern struct { x: i32, y: i32, width: i32, height: i32 };
const Pango = struct {
    pango_version_string: *const fn () callconv(.c) [*:0]const u8,
    pango_font_map_create_context: *const fn (*FontMap) callconv(.c) ?*Context,
    pango_font_description_from_string: *const fn ([*:0]const u8) callconv(.c) ?*FontDescription,
    pango_font_description_get_size: *const fn (*const FontDescription) callconv(.c) i32,
    pango_font_description_free: *const fn (*FontDescription) callconv(.c) void,
    pango_layout_new: *const fn (*Context) callconv(.c) ?*Layout,
    pango_layout_set_text: *const fn (*Layout, [*]const u8, i32) callconv(.c) void,
    pango_layout_set_width: *const fn (*Layout, i32) callconv(.c) void,
    pango_layout_set_wrap: *const fn (*Layout, i32) callconv(.c) void,
    pango_layout_set_font_description: *const fn (*Layout, *const FontDescription) callconv(.c) void,
    pango_layout_get_pixel_extents: *const fn (*Layout, ?*Rectangle, ?*Rectangle) callconv(.c) void,
    pango_layout_get_line_count: *const fn (*Layout) callconv(.c) i32,
    pango_layout_get_unknown_glyphs_count: *const fn (*Layout) callconv(.c) i32,
    pango_layout_get_cursor_pos: *const fn (*Layout, i32, *Rectangle, *Rectangle) callconv(.c) void,
    pango_layout_move_cursor_visually: *const fn (*Layout, i32, i32, i32, i32, *i32, *i32) callconv(.c) void,
    pango_layout_get_log_attrs_readonly: *const fn (*Layout, *i32) callconv(.c) ?[*]const u32,
    pango_layout_get_iter: *const fn (*Layout) callconv(.c) ?*LayoutIter,
    pango_layout_iter_free: *const fn (*LayoutIter) callconv(.c) void,
    pango_layout_iter_next_line: *const fn (*LayoutIter) callconv(.c) i32,
    pango_layout_iter_get_line_extents: *const fn (*LayoutIter, ?*Rectangle, ?*Rectangle) callconv(.c) void,
    pango_layout_iter_get_line_readonly: *const fn (*LayoutIter) callconv(.c) ?*LayoutLine,
    pango_layout_line_get_start_index: *const fn (*LayoutLine) callconv(.c) i32,
    pango_layout_line_get_length: *const fn (*LayoutLine) callconv(.c) i32,
    pango_layout_line_get_x_ranges: *const fn (*LayoutLine, i32, i32, *?[*]i32, *i32) callconv(.c) void,
    pango_layout_index_to_line_x: *const fn (*Layout, i32, i32, *i32, *i32) callconv(.c) void,
    pango_layout_xy_to_index: *const fn (*Layout, i32, i32, *i32, *i32) callconv(.c) i32,
};
const PangoCairo = struct {
    pango_cairo_font_map_new: *const fn () callconv(.c) ?*FontMap,
    pango_cairo_context_set_resolution: *const fn (*Context, f64) callconv(.c) void,
    pango_cairo_show_layout: *const fn (*Painter, *Layout) callconv(.c) void,
};
const GObject = struct {
    g_object_unref: *const fn (*anyopaque) callconv(.c) void,
    // Exported by libglib, a dependency searched through this loaded handle.
    g_free: *const fn (?*anyopaque) callconv(.c) void,
};
const Cairo = struct {
    cairo_version_string: *const fn () callconv(.c) [*:0]const u8,
    cairo_image_surface_create: *const fn (i32, i32, i32) callconv(.c) ?*Surface,
    cairo_surface_status: *const fn (*Surface) callconv(.c) i32,
    cairo_surface_destroy: *const fn (*Surface) callconv(.c) void,
    cairo_surface_flush: *const fn (*Surface) callconv(.c) void,
    cairo_surface_write_to_png: *const fn (*Surface, [*:0]const u8) callconv(.c) i32,
    cairo_image_surface_get_data: *const fn (*Surface) callconv(.c) ?[*]u8,
    cairo_image_surface_get_stride: *const fn (*Surface) callconv(.c) i32,
    cairo_create: *const fn (*Surface) callconv(.c) ?*Painter,
    cairo_status: *const fn (*Painter) callconv(.c) i32,
    cairo_destroy: *const fn (*Painter) callconv(.c) void,
    cairo_set_source_rgba: *const fn (*Painter, f64, f64, f64, f64) callconv(.c) void,
    cairo_paint: *const fn (*Painter) callconv(.c) void,
    cairo_rectangle: *const fn (*Painter, f64, f64, f64, f64) callconv(.c) void,
    cairo_fill: *const fn (*Painter) callconv(.c) void,
    cairo_move_to: *const fn (*Painter, f64, f64) callconv(.c) void,
};

pub const Error = std.DynLib.Error || error{ MissingSymbol, NativeFailure, UnsupportedAbi };
/// Explicit paths enable absence testing without changing process search paths.
pub const Paths = struct {
    pango: [:0]const u8 = "libpango-1.0.so.0",
    pangocairo: [:0]const u8 = "libpangocairo-1.0.so.0",
    gobject: [:0]const u8 = "libgobject-2.0.so.0",
    cairo: [:0]const u8 = "libcairo.so.2",
};
fn resolve(comptime Table: type, library: *std.DynLib) Error!Table {
    var table: Table = undefined;
    const fields = @typeInfo(Table).@"struct";
    inline for (fields.field_names, fields.field_types) |name, Field| {
        @field(table, name) = library.lookup(Field, name ++ "") orelse return error.MissingSymbol;
    }
    return table;
}

/// Must stay at a stable address until every prototype Snapshot is deinitialized.
pub const Library = struct {
    handles: [4]std.DynLib,
    pango: Pango,
    pangocairo: PangoCairo,
    gobject: GObject,
    cairo: Cairo,

    /// Linux experiment: successful opens retain provider mappings for process
    /// lifetime. Static GObject types cannot safely point into unloaded code.
    /// deinit still balances every owned loader reference; NODELETE residency
    /// is intentional and is not a promise to reclaim provider globals/caches.
    pub fn open_resident(paths: Paths) Error!Library {
        if (@import("builtin").target.os.tag != .linux) @compileError("This disposable provider spike targets Linux");
        var pango = try std.DynLib.open(paths.pango);
        errdefer pango.close();
        var pangocairo = try std.DynLib.open(paths.pangocairo);
        errdefer pangocairo.close();
        var gobject = try std.DynLib.open(paths.gobject);
        errdefer gobject.close();
        var cairo = try std.DynLib.open(paths.cairo);
        errdefer cairo.close();
        const functions = .{
            .pango = try resolve(Pango, &pango),
            .pangocairo = try resolve(PangoCairo, &pangocairo),
            .gobject = try resolve(GObject, &gobject),
            .cairo = try resolve(Cairo, &cairo),
        };
        // std.DynLib exposes no residency flags. Pin only after every table has
        // resolved, before any native type is registered. Balance each probe.
        inline for (.{ paths.pango, paths.pangocairo, paths.gobject, paths.cairo }) |path| {
            const resident = std.c.dlopen(path.ptr, .{ .NOW = true, .NOLOAD = true, .NODELETE = true }) orelse return error.NativeFailure;
            _ = std.c.dlclose(resident);
        }
        return .{ .pango = functions.pango, .pangocairo = functions.pangocairo, .gobject = functions.gobject, .cairo = functions.cairo, .handles = .{ pango, pangocairo, gobject, cairo } };
    }
    pub fn deinit(self: *Library) void {
        var index = self.handles.len;
        while (index != 0) {
            index -= 1;
            self.handles[index].close();
        }
        self.* = undefined;
    }
    /// Version slices borrow resident provider memory, not caller-owned strings.
    pub fn versions(self: *const Library) struct { pango: []const u8, cairo: []const u8 } {
        return .{ .pango = std.mem.span(self.pango.pango_version_string()), .cairo = std.mem.span(self.cairo.cairo_version_string()) };
    }
    /// Public PangoLogAttr uses guint bitfields. This disposable decoder is
    /// restricted to little-endian Linux GCC-compatible ABI: guint is 32 bits,
    /// is_cursor_position is bit 4. No opaque glyph/font prefix is inspected.
    pub fn cursor_stops(self: *Library, allocator: std.mem.Allocator, layout: *Layout, text: []const u8) (Error || std.mem.Allocator.Error)!std.ArrayList(usize) {
        if (@import("builtin").target.cpu.arch.endian() != .little or @sizeOf(c_uint) != 4) return error.UnsupportedAbi;
        var count: i32 = 0;
        const attributes = self.pango.pango_layout_get_log_attrs_readonly(layout, &count) orelse return error.NativeFailure;
        const scalars = std.unicode.utf8CountCodepoints(text) catch return error.NativeFailure;
        if (count < 1 or count != scalars + 1) return error.NativeFailure;
        var result = try std.ArrayList(usize).initCapacity(allocator, @intCast(count));
        errdefer result.deinit(allocator);
        var byte: usize = 0;
        for (0..@as(usize, @intCast(count))) |index| {
            if (attributes[index] & (1 << 4) != 0) result.appendAssumeCapacity(byte);
            if (byte < text.len) byte += std.unicode.utf8ByteSequenceLength(text[byte]) catch return error.NativeFailure;
        }
        if (result.items.len == 0 or result.items[0] != 0 or result.items[result.items.len - 1] != text.len) return error.NativeFailure;
        return result;
    }
    pub fn unref(self: *Library, object: anytype) void {
        self.gobject.g_object_unref(@ptrCast(object));
    }
};
