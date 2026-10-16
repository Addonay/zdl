//! Private disposable Cairo ABI; never imported by the zdl module.
const std = @import("std");
pub const Surface = opaque {};
pub const Context = opaque {};
pub const Pattern = opaque {};
pub const Matrix = extern struct { xx: f64, yx: f64, xy: f64, yy: f64, x0: f64, y0: f64 };
pub const Functions = struct {
    cairo_get_matrix: *const fn (*Context, *Matrix) callconv(.c) void,
    cairo_pattern_create_for_surface: *const fn (*Surface) callconv(.c) ?*Pattern,
    cairo_pattern_set_matrix: *const fn (*Pattern, *const Matrix) callconv(.c) void,

    cairo_pattern_create_linear: *const fn (f64, f64, f64, f64) callconv(.c) ?*Pattern,
    cairo_pattern_create_radial: *const fn (f64, f64, f64, f64, f64, f64) callconv(.c) ?*Pattern,
    cairo_pattern_add_color_stop_rgba: *const fn (*Pattern, f64, f64, f64, f64, f64) callconv(.c) void,
    cairo_pattern_status: *const fn (*Pattern) callconv(.c) i32,
    cairo_pattern_destroy: *const fn (*Pattern) callconv(.c) void,
    cairo_set_source: *const fn (*Context, *Pattern) callconv(.c) void,

    cairo_version_string: *const fn () callconv(.c) [*:0]const u8,
    cairo_image_surface_create: *const fn (i32, i32, i32) callconv(.c) ?*Surface,
    cairo_image_surface_get_data: *const fn (*Surface) callconv(.c) ?[*]u8,
    cairo_image_surface_get_stride: *const fn (*Surface) callconv(.c) i32,
    cairo_surface_status: *const fn (*Surface) callconv(.c) i32,
    cairo_surface_destroy: *const fn (*Surface) callconv(.c) void,
    cairo_surface_flush: *const fn (*Surface) callconv(.c) void,
    cairo_surface_mark_dirty: *const fn (*Surface) callconv(.c) void,
    cairo_surface_write_to_png: *const fn (*Surface, [*:0]const u8) callconv(.c) i32,
    cairo_create: *const fn (*Surface) callconv(.c) ?*Context,
    cairo_destroy: *const fn (*Context) callconv(.c) void,
    cairo_status: *const fn (*Context) callconv(.c) i32,
    cairo_save: *const fn (*Context) callconv(.c) void,
    cairo_restore: *const fn (*Context) callconv(.c) void,
    cairo_set_matrix: *const fn (*Context, *const Matrix) callconv(.c) void,
    cairo_transform: *const fn (*Context, *const Matrix) callconv(.c) void,
    cairo_translate: *const fn (*Context, f64, f64) callconv(.c) void,
    cairo_scale: *const fn (*Context, f64, f64) callconv(.c) void,
    cairo_new_path: *const fn (*Context) callconv(.c) void,
    cairo_move_to: *const fn (*Context, f64, f64) callconv(.c) void,
    cairo_line_to: *const fn (*Context, f64, f64) callconv(.c) void,
    cairo_curve_to: *const fn (*Context, f64, f64, f64, f64, f64, f64) callconv(.c) void,
    cairo_close_path: *const fn (*Context) callconv(.c) void,
    cairo_rectangle: *const fn (*Context, f64, f64, f64, f64) callconv(.c) void,
    cairo_arc: *const fn (*Context, f64, f64, f64, f64, f64) callconv(.c) void,
    cairo_set_fill_rule: *const fn (*Context, i32) callconv(.c) void,
    cairo_set_source_rgba: *const fn (*Context, f64, f64, f64, f64) callconv(.c) void,
    cairo_fill: *const fn (*Context) callconv(.c) void,
    cairo_clip: *const fn (*Context) callconv(.c) void,
    cairo_set_line_width: *const fn (*Context, f64) callconv(.c) void,
    cairo_set_line_cap: *const fn (*Context, i32) callconv(.c) void,
    cairo_set_line_join: *const fn (*Context, i32) callconv(.c) void,
    cairo_set_miter_limit: *const fn (*Context, f64) callconv(.c) void,
    cairo_stroke: *const fn (*Context) callconv(.c) void,
    cairo_push_group: *const fn (*Context) callconv(.c) void,
    cairo_pop_group_to_source: *const fn (*Context) callconv(.c) void,
    cairo_paint_with_alpha: *const fn (*Context, f64) callconv(.c) void,
    cairo_paint: *const fn (*Context) callconv(.c) void,
    cairo_set_source_surface: *const fn (*Context, *Surface, f64, f64) callconv(.c) void,
    cairo_get_source: *const fn (*Context) callconv(.c) *Pattern,
    cairo_pattern_set_filter: *const fn (*Pattern, i32) callconv(.c) void,
    cairo_pattern_set_extend: *const fn (*Pattern, i32) callconv(.c) void,
};
pub const Library = struct {
    handle: std.DynLib,
    f: Functions,
    pub fn open(path: [:0]const u8) !Library {
        if (@import("builtin").target.os.tag != .linux) @compileError("Disposable Cairo replay currently targets Linux");
        var handle = try std.DynLib.open(path);
        errdefer handle.close();
        var functions: Functions = undefined;
        const fields = @typeInfo(Functions).@"struct";
        inline for (fields.field_names, fields.field_types) |name, T| @field(functions, name) = handle.lookup(T, name ++ "") orelse return error.MissingSymbol;
        // Disposable Linux prototype: mappings stay resident for shared provider
        // caches; every surface/context is still explicitly released.
        const pinned = std.c.dlopen(path.ptr, .{ .NOW = true, .NOLOAD = true, .NODELETE = true }) orelse return error.ResidencyFailed;
        _ = std.c.dlclose(pinned);
        return .{ .handle = handle, .f = functions };
    }
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }
};
