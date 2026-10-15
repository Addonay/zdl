//! Text shaping and glyph rasterization over FreeType and HarfBuzz.
//!
//! Both libraries are loaded at runtime with `std.DynLib`, so an application
//! starts without them and reports a clear error when they are missing. The
//! bindings below are hand-written and cover only the functions and fields used
//! here. Struct layouts were checked against the installed headers for LP64.
//!
//! Rendering choices (aimed at Chrome's Linux output):
//! - Hinting is "light" (vertical only); horizontal positions stay unhinted.
//! - Glyph origins are quantized to quarter pixels (subpixel positioning) and
//!   baselines are snapped to whole device pixels.
//! - Coverage is grayscale antialiased and passed through a gamma table before
//!   blending, which keeps small text as crisp as the browser reference.
//!
//! Sizes are in device pixels. Callers that lay out in logical units multiply
//! by the window scale before measuring or drawing.

const std = @import("std");
const zlay = @import("zlay");
const canvas_mod = @import("canvas.zig");

const Canvas = canvas_mod.Canvas;

// -----------------------------------------------------------------------------
// FreeType bindings
// -----------------------------------------------------------------------------

const FtLibrary = *opaque {};

/// Prefix of FT_FaceRec up to the fields this file reads (`glyph`). The rest of
/// the record is never touched, so it is not declared.
const FaceRec = extern struct {
    num_faces: c_long,
    face_index: c_long,
    face_flags: c_long,
    style_flags: c_long,
    num_glyphs: c_long,
    family_name: ?[*:0]u8,
    style_name: ?[*:0]u8,
    num_fixed_sizes: c_int,
    available_sizes: ?*anyopaque,
    num_charmaps: c_int,
    charmaps: ?*anyopaque,
    generic_data: ?*anyopaque,
    generic_finalizer: ?*anyopaque,
    bbox: [4]c_long,
    units_per_em: u16,
    ascender: i16,
    descender: i16,
    height: i16,
    max_advance_width: i16,
    max_advance_height: i16,
    underline_position: i16,
    underline_thickness: i16,
    glyph: *GlyphSlotRec,
};

const Bitmap = extern struct {
    rows: c_uint,
    width: c_uint,
    pitch: c_int,
    buffer: ?[*]u8,
    num_grays: u16,
    pixel_mode: u8,
    palette_mode: u8,
    palette: ?*anyopaque,
};

/// Prefix of FT_GlyphSlotRec through `bitmap_top`.
const GlyphSlotRec = extern struct {
    library: ?*anyopaque,
    face: ?*FaceRec,
    next: ?*anyopaque,
    glyph_index: c_uint,
    generic_data: ?*anyopaque,
    generic_finalizer: ?*anyopaque,
    metrics: [8]c_long,
    linear_hori_advance: c_long,
    linear_vert_advance: c_long,
    advance: [2]c_long,
    format: c_uint,
    bitmap: Bitmap,
    bitmap_left: c_int,
    bitmap_top: c_int,
};

const FT_LOAD_TARGET_LIGHT: c_int = 1 << 16;
const FT_RENDER_MODE_NORMAL: c_uint = 0;
const FT_PIXEL_MODE_GRAY: u8 = 2;

const FreeType = struct {
    lib: std.DynLib,
    init: *const fn (*?FtLibrary) callconv(.c) c_int,
    done: *const fn (FtLibrary) callconv(.c) c_int,
    new_memory_face: *const fn (FtLibrary, [*]const u8, c_long, c_long, *?*FaceRec) callconv(.c) c_int,
    done_face: *const fn (*FaceRec) callconv(.c) c_int,
    set_char_size: *const fn (*FaceRec, c_long, c_long, c_uint, c_uint) callconv(.c) c_int,
    load_glyph: *const fn (*FaceRec, c_uint, c_int) callconv(.c) c_int,
    render_glyph: *const fn (*GlyphSlotRec, c_uint) callconv(.c) c_int,
    set_transform: *const fn (*FaceRec, ?*anyopaque, ?*const [2]c_long) callconv(.c) void,

    fn load() error{MissingLibrary}!FreeType {
        var lib = std.DynLib.open("libfreetype.so.6") catch return error.MissingLibrary;
        errdefer lib.close();
        return .{
            .lib = lib,
            .init = lib.lookup(@FieldType(FreeType, "init"), "FT_Init_FreeType") orelse return error.MissingLibrary,
            .done = lib.lookup(@FieldType(FreeType, "done"), "FT_Done_FreeType") orelse return error.MissingLibrary,
            .new_memory_face = lib.lookup(@FieldType(FreeType, "new_memory_face"), "FT_New_Memory_Face") orelse return error.MissingLibrary,
            .done_face = lib.lookup(@FieldType(FreeType, "done_face"), "FT_Done_Face") orelse return error.MissingLibrary,
            .set_char_size = lib.lookup(@FieldType(FreeType, "set_char_size"), "FT_Set_Char_Size") orelse return error.MissingLibrary,
            .load_glyph = lib.lookup(@FieldType(FreeType, "load_glyph"), "FT_Load_Glyph") orelse return error.MissingLibrary,
            .render_glyph = lib.lookup(@FieldType(FreeType, "render_glyph"), "FT_Render_Glyph") orelse return error.MissingLibrary,
            .set_transform = lib.lookup(@FieldType(FreeType, "set_transform"), "FT_Set_Transform") orelse return error.MissingLibrary,
        };
    }
};

// -----------------------------------------------------------------------------
// HarfBuzz bindings
// -----------------------------------------------------------------------------

const HbBuffer = *opaque {};
const HbFont = *opaque {};

const GlyphInfo = extern struct {
    codepoint: u32,
    mask: u32,
    cluster: u32,
    var1: u32,
    var2: u32,
};

const GlyphPosition = extern struct {
    x_advance: i32,
    y_advance: i32,
    x_offset: i32,
    y_offset: i32,
    var_value: u32,
};

const HarfBuzz = struct {
    lib: std.DynLib,
    buffer_create: *const fn () callconv(.c) ?HbBuffer,
    buffer_destroy: *const fn (HbBuffer) callconv(.c) void,
    buffer_clear: *const fn (HbBuffer) callconv(.c) void,
    buffer_add_utf8: *const fn (HbBuffer, [*]const u8, c_int, c_uint, c_int) callconv(.c) void,
    buffer_guess: *const fn (HbBuffer) callconv(.c) void,
    shape: *const fn (HbFont, HbBuffer, ?*anyopaque, c_uint) callconv(.c) void,
    buffer_length: *const fn (HbBuffer) callconv(.c) c_uint,
    buffer_infos: *const fn (HbBuffer, *c_uint) callconv(.c) [*]const GlyphInfo,
    buffer_positions: *const fn (HbBuffer, *c_uint) callconv(.c) [*]const GlyphPosition,
    ft_font_create: *const fn (*FaceRec) callconv(.c) ?HbFont,
    ft_font_changed: *const fn (HbFont) callconv(.c) void,
    font_destroy: *const fn (HbFont) callconv(.c) void,

    fn load() error{MissingLibrary}!HarfBuzz {
        var lib = std.DynLib.open("libharfbuzz.so.0") catch return error.MissingLibrary;
        errdefer lib.close();
        return .{
            .lib = lib,
            .buffer_create = lib.lookup(@FieldType(HarfBuzz, "buffer_create"), "hb_buffer_create") orelse return error.MissingLibrary,
            .buffer_destroy = lib.lookup(@FieldType(HarfBuzz, "buffer_destroy"), "hb_buffer_destroy") orelse return error.MissingLibrary,
            .buffer_clear = lib.lookup(@FieldType(HarfBuzz, "buffer_clear"), "hb_buffer_clear_contents") orelse return error.MissingLibrary,
            .buffer_add_utf8 = lib.lookup(@FieldType(HarfBuzz, "buffer_add_utf8"), "hb_buffer_add_utf8") orelse return error.MissingLibrary,
            .buffer_guess = lib.lookup(@FieldType(HarfBuzz, "buffer_guess"), "hb_buffer_guess_segment_properties") orelse return error.MissingLibrary,
            .shape = lib.lookup(@FieldType(HarfBuzz, "shape"), "hb_shape") orelse return error.MissingLibrary,
            .buffer_length = lib.lookup(@FieldType(HarfBuzz, "buffer_length"), "hb_buffer_get_length") orelse return error.MissingLibrary,
            .buffer_infos = lib.lookup(@FieldType(HarfBuzz, "buffer_infos"), "hb_buffer_get_glyph_infos") orelse return error.MissingLibrary,
            .buffer_positions = lib.lookup(@FieldType(HarfBuzz, "buffer_positions"), "hb_buffer_get_glyph_positions") orelse return error.MissingLibrary,
            .ft_font_create = lib.lookup(@FieldType(HarfBuzz, "ft_font_create"), "hb_ft_font_create_referenced") orelse return error.MissingLibrary,
            .ft_font_changed = lib.lookup(@FieldType(HarfBuzz, "ft_font_changed"), "hb_ft_font_changed") orelse return error.MissingLibrary,
            .font_destroy = lib.lookup(@FieldType(HarfBuzz, "font_destroy"), "hb_font_destroy") orelse return error.MissingLibrary,
        };
    }
};

// -----------------------------------------------------------------------------
// Text system
// -----------------------------------------------------------------------------

/// Index into the font list passed to `Text.init`.
pub const FontId = u16;

/// Conventional font roles. Programs pass font files in this order.
pub const Role = enum(FontId) {
    regular,
    medium,
    semibold,
    bold,
    mono,
};

pub const Error = error{ MissingLibrary, FontLoadFailed, OutOfMemory, FreeTypeFailed };

/// Coverage of one glyph bitmap, tightly packed (no row padding).
const Glyph = struct {
    left: i32,
    top: i32,
    width: u32,
    height: u32,
    coverage: []u8,
};

const GlyphKey = struct {
    font: FontId,
    glyph: u32,
    size_64: u32,
    subpixel: u8,
};

const Face = struct {
    ft: *FaceRec,
    hb: HbFont,
    /// Size currently set on the FreeType face, in 26.6 pixels.
    size_64: u32 = 0,
};

/// Ascent and descent in device pixels.
pub const Metrics = struct {
    ascent: f32,
    descent: f32,

    pub fn height(self: Metrics) f32 {
        return self.ascent + self.descent;
    }
};

/// One shaped glyph. `x` is the pen position in device pixels from the start of
/// the run, `y` is the offset above the baseline (positive is up, as in HarfBuzz).
pub const Placed = struct {
    glyph: u32,
    x: f32,
    y: f32,
};

/// Result of shaping. `glyphs` is owned by the `Text` and is overwritten by the
/// next call to `shape`, `measure` or `draw`.
pub const Run = struct {
    glyphs: []const Placed,
    width: f32,
};

pub const Text = struct {
    allocator: std.mem.Allocator,
    ft: FreeType,
    hb: HarfBuzz,
    library: FtLibrary,
    faces: []Face,
    buffer: HbBuffer,
    run: std.ArrayList(Placed) = .empty,
    glyphs: std.AutoHashMapUnmanaged(GlyphKey, Glyph) = .empty,
    /// Gamma-adjusted coverage; see `coverage_table`.
    coverage_lut: [256]u8,

    /// Loads FreeType and HarfBuzz and registers each font file. The font bytes
    /// must outlive the returned `Text`; `fonts` are typically `@embedFile` results.
    pub fn init(allocator: std.mem.Allocator, fonts: []const []const u8) Error!Text {
        var ft = FreeType.load() catch return error.MissingLibrary;
        errdefer ft.lib.close();
        var hb = HarfBuzz.load() catch return error.MissingLibrary;
        errdefer hb.lib.close();

        var library: ?FtLibrary = null;
        if (ft.init(&library) != 0 or library == null) return error.FreeTypeFailed;
        errdefer _ = ft.done(library.?);

        const faces = try allocator.alloc(Face, fonts.len);
        errdefer allocator.free(faces);
        var loaded: usize = 0;
        errdefer for (faces[0..loaded]) |face| {
            hb.font_destroy(face.hb);
            _ = ft.done_face(face.ft);
        };
        for (fonts, 0..) |bytes, index| {
            var face: ?*FaceRec = null;
            if (ft.new_memory_face(library.?, bytes.ptr, @intCast(bytes.len), 0, &face) != 0 or face == null) {
                return error.FontLoadFailed;
            }
            const hb_font = hb.ft_font_create(face.?) orelse {
                _ = ft.done_face(face.?);
                return error.FontLoadFailed;
            };
            faces[index] = .{ .ft = face.?, .hb = hb_font };
            loaded += 1;
        }

        const buffer = hb.buffer_create() orelse return error.OutOfMemory;
        return .{
            .allocator = allocator,
            .ft = ft,
            .hb = hb,
            .library = library.?,
            .faces = faces,
            .buffer = buffer,
            .coverage_lut = coverage_table(),
        };
    }

    pub fn deinit(self: *Text) void {
        var iterator = self.glyphs.valueIterator();
        while (iterator.next()) |cached| self.allocator.free(cached.coverage);
        self.glyphs.deinit(self.allocator);
        self.run.deinit(self.allocator);
        self.hb.buffer_destroy(self.buffer);
        for (self.faces) |face| {
            self.hb.font_destroy(face.hb);
            _ = self.ft.done_face(face.ft);
        }
        self.allocator.free(self.faces);
        _ = self.ft.done(self.library);
        self.hb.lib.close();
        self.ft.lib.close();
        self.* = undefined;
    }

    /// Ascent and descent of a font at a device pixel size.
    pub fn metrics(self: *Text, font: FontId, px: f32) Metrics {
        const face = self.faces[font].ft;
        const scale = px / @as(f32, @floatFromInt(face.units_per_em));
        return .{
            .ascent = @as(f32, @floatFromInt(face.ascender)) * scale,
            .descent = -@as(f32, @floatFromInt(face.descender)) * scale,
        };
    }

    /// Shapes `text` with kerning and ligatures. The run is valid until the next
    /// call that shapes text.
    pub fn shape(self: *Text, font: FontId, text: []const u8, px: f32) Error!Run {
        const face = self.set_size(font, px);
        self.run.clearRetainingCapacity();
        if (text.len == 0) return .{ .glyphs = &.{}, .width = 0 };

        self.hb.buffer_clear(self.buffer);
        self.hb.buffer_add_utf8(self.buffer, text.ptr, @intCast(text.len), 0, @intCast(text.len));
        self.hb.buffer_guess(self.buffer);
        self.hb.shape(face.hb, self.buffer, null, 0);

        var count: c_uint = 0;
        const infos = self.hb.buffer_infos(self.buffer, &count);
        const positions = self.hb.buffer_positions(self.buffer, &count);
        var pen: i64 = 0;
        for (infos[0..count], positions[0..count]) |info, position| {
            const x = pen + position.x_offset;
            try self.run.append(self.allocator, .{
                .glyph = info.codepoint,
                .x = @as(f32, @floatFromInt(x)) / 64,
                .y = @as(f32, @floatFromInt(position.y_offset)) / 64,
            });
            pen += position.x_advance;
        }
        return .{ .glyphs = self.run.items, .width = @as(f32, @floatFromInt(pen)) / 64 };
    }

    /// Advance width of `text` in device pixels.
    pub fn measure(self: *Text, font: FontId, text: []const u8, px: f32) Error!f32 {
        return (try self.shape(font, text, px)).width;
    }

    /// Longest prefix of `text` that fits in `max_width` once an ellipsis is
    /// appended, written into `buffer`. Returns `text` unchanged when it fits.
    pub fn fit_with_ellipsis(self: *Text, font: FontId, text: []const u8, px: f32, max_width: f32, buffer: []u8) Error![]const u8 {
        if ((try self.measure(font, text, px)) <= max_width) return text;
        const ellipsis = "\u{2026}";
        const room = max_width - (try self.measure(font, ellipsis, px));
        var end: usize = text.len;
        while (end > 0) {
            end -= 1;
            // Only cut at UTF-8 character starts.
            if (text[end] & 0xC0 == 0x80) continue;
            if ((try self.measure(font, text[0..end], px)) <= room) break;
        }
        if (end + ellipsis.len > buffer.len) return text[0..end];
        @memcpy(buffer[0..end], text[0..end]);
        @memcpy(buffer[end..][0..ellipsis.len], ellipsis);
        return buffer[0 .. end + ellipsis.len];
    }

    /// Draws `text` with its pen at (`x`, `baseline`) in device pixels.
    pub fn draw(self: *Text, canvas: *Canvas, font: FontId, text: []const u8, x: f32, baseline: f32, px: f32, color: canvas_mod.Color) Error!void {
        const run = try self.shape(font, text, px);
        const size_64 = self.faces[font].size_64;
        const base_y: i32 = @intFromFloat(@round(baseline));
        for (run.glyphs) |placed| {
            const origin_x = x + placed.x;
            var whole: i32 = @intFromFloat(@floor(origin_x));
            var subpixel: u8 = @intFromFloat(@round((origin_x - @floor(origin_x)) * 4));
            if (subpixel == 4) {
                whole += 1;
                subpixel = 0;
            }
            const origin_y: i32 = base_y - @as(i32, @intFromFloat(@round(placed.y)));
            const bitmap = try self.glyph(font, placed.glyph, size_64, subpixel);
            if (bitmap.width == 0 or bitmap.height == 0) continue;
            canvas.blend_coverage(bitmap.coverage, bitmap.width, bitmap.height, whole + bitmap.left, origin_y - bitmap.top, color, &self.coverage_lut);
        }
    }

    fn glyph(self: *Text, font: FontId, index: u32, size_64: u32, subpixel: u8) Error!Glyph {
        const key: GlyphKey = .{ .font = font, .glyph = index, .size_64 = size_64, .subpixel = subpixel };
        if (self.glyphs.get(key)) |found| return found;

        const face = &self.faces[font];
        var delta: [2]c_long = .{ @as(c_long, subpixel) * 16, 0 };
        self.ft.set_transform(face.ft, null, &delta);
        defer self.ft.set_transform(face.ft, null, null);
        if (self.ft.load_glyph(face.ft, index, FT_LOAD_TARGET_LIGHT) != 0) return error.FreeTypeFailed;
        const slot = face.ft.glyph;
        if (self.ft.render_glyph(slot, FT_RENDER_MODE_NORMAL) != 0) return error.FreeTypeFailed;

        const bitmap = slot.bitmap;
        const width: u32 = bitmap.width;
        const height: u32 = bitmap.rows;
        const coverage = try self.allocator.alloc(u8, width * height);
        errdefer self.allocator.free(coverage);
        if (width > 0 and height > 0) {
            std.debug.assert(bitmap.pixel_mode == FT_PIXEL_MODE_GRAY);
            const source = bitmap.buffer orelse return error.FreeTypeFailed;
            const pitch: usize = @intCast(@abs(bitmap.pitch));
            for (0..height) |row| {
                @memcpy(coverage[row * width ..][0..width], source[row * pitch ..][0..width]);
            }
        }
        const glyph_value: Glyph = .{
            .left = slot.bitmap_left,
            .top = slot.bitmap_top,
            .width = width,
            .height = height,
            .coverage = coverage,
        };
        try self.glyphs.put(self.allocator, key, glyph_value);
        return glyph_value;
    }

    /// Selects the pixel size on the FreeType face and tells HarfBuzz to refresh
    /// its scale. Returns the face for the caller's convenience.
    fn set_size(self: *Text, font: FontId, px: f32) *Face {
        const face = &self.faces[font];
        const size_64: u32 = @intFromFloat(@max(1, @round(px * 64)));
        if (face.size_64 != size_64) {
            _ = self.ft.set_char_size(face.ft, 0, size_64, 72, 72);
            self.hb.ft_font_changed(face.hb);
            face.size_64 = size_64;
        }
        return face;
    }
};

/// Gamma-adjusted coverage. A slight boost keeps thin strokes from washing out
/// after blending in sRGB, close to Skia's default text contrast on Linux.
fn coverage_table() [256]u8 {
    var table: [256]u8 = undefined;
    for (&table, 0..) |*entry, index| {
        const coverage = @as(f32, @floatFromInt(index)) / 255.0;
        const adjusted = std.math.pow(f32, coverage, 0.82);
        entry.* = @intFromFloat(@round(adjusted * 255.0));
    }
    return table;
}

test "coverage table is monotone and keeps endpoints" {
    const table = coverage_table();
    try std.testing.expectEqual(@as(u8, 0), table[0]);
    try std.testing.expectEqual(@as(u8, 255), table[255]);
    for (table[1..], table[0 .. table.len - 1]) |next, prev| try std.testing.expect(next >= prev);
}
