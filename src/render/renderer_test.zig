//! Ported from SDL test/testautomation_render.c, run against the software
//! renderer and compared with SDL's reference images (testautomation_images.c).
//!
//! The original creates a window and a hardware-selected renderer; here the
//! renderer draws into a 320x240 ARGB8888 raster, which is what SDL's software
//! renderer attached to a window surface does. Not applicable: render driver
//! enumeration, window/software-renderer attachment (render_testSoftware) and the
//! colorspace tests (renderer texture colorspaces are GPU-renderer features),
//! `SDL_RenderTexture9GridTiled` (documented as not ported in render/renderer.zig).
const std = @import("std");
const testing = std.testing;
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");
const geometry = @import("../video/geometry.zig");
const renderer_mod = @import("renderer.zig");
const texture_mod = @import("texture.zig");
const pixels_test = @import("../video/pixels_test.zig");
const images = @import("../testdata/images.zig");
const support = @import("../testdata/support.zig");

const Renderer = renderer_mod.Renderer;
const Texture = texture_mod.Texture;
const FRect = geometry.Rect(f32);
const FPoint = geometry.Point(f32);
const Color = pixels.Color;

const screen_w = 80;
const screen_h = 60;

fn frect(x: f32, y: f32, w: f32, h: f32) FRect {
    return .{ .x = x, .y = y, .width = w, .height = h };
}

const Harness = struct {
    output: surface.Surface,
    renderer: Renderer,

    fn init(self: *Harness) !void {
        self.output = try surface.Surface.init(testing.allocator, 320, 240, pixels_test.packed_format("ARGB8888"), null);
        self.renderer = Renderer.init(testing.allocator, self.output.view);
    }

    fn deinit(self: *Harness) void {
        self.output.deinit();
    }

    /// clearScreen(): black clear, blend none, white draw color.
    fn clear_screen(self: *Harness) !void {
        const r = &self.renderer;
        r.set_draw_color(.{ .r = 0, .g = 0, .b = 0 });
        try r.clear();
        r.set_blend(surface.Blend.REPLACE);
        r.set_draw_color(.{ .r = 255, .g = 255, .b = 255 });
    }

    /// compare(): read the top-left region and compare with a reference raster.
    fn compare(self: *Harness, reference: surface.View, allowable_error: u8) !void {
        var shot = try self.renderer.read_pixels(.{ .x = 0, .y = 0, .width = reference.width, .height = reference.height });
        defer shot.deinit();
        try support.compare_surfaces(shot.view, reference, allowable_error);
    }

    fn compare_image(self: *Harness, image: images.Image, allowable_error: u8) !void {
        var reference = try image.to_surface(testing.allocator);
        defer reference.deinit();
        try self.compare(reference.view, allowable_error);
    }

    fn face_texture(self: *Harness) !Texture {
        _ = self;
        var face = try images.face.to_surface(testing.allocator);
        defer face.deinit();
        return Texture.init_copy(testing.allocator, face.view, .static);
    }
};

// render_testPrimitives
test "sdl render: primitives" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    try h.clear_screen();

    try r.set_draw_color_float(13.0 / 255.0, 73.0 / 255.0, 200.0 / 255.0, 1.0);
    try r.fill_rect(frect(40, 0, 40, 80));
    // Negative width and height.
    r.set_draw_color(.{ .r = 200, .g = 0, .b = 100 });
    try r.fill_rect(frect(10 + 60, 10 + 40, -60, -40));
    // Zero width and height.
    r.set_draw_color(.{ .r = 255, .g = 0, .b = 0 });
    try r.fill_rect(frect(10, 10, 0, 0));

    // Points like so:  X.X.X.X..  /  .X.X.X.X.  /  X.X.X.X..
    var y: usize = 0;
    while (y < 3) : (y += 1) {
        var x: usize = y % 2;
        while (x < screen_w) : (x += 2) {
            r.set_draw_color(.{ .r = @truncate(x * y), .g = @truncate(x * y / 2), .b = @truncate(x * y / 3) });
            try r.draw_point(.{ .x = @floatFromInt(x), .y = @floatFromInt(y) });
        }
    }

    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.draw_line(.{ .x = 0, .y = 30 }, .{ .x = screen_w, .y = 30 });
    r.set_draw_color(.{ .r = 55, .g = 55, .b = 5 });
    try r.draw_line(.{ .x = 40, .y = 30 }, .{ .x = 40, .y = 60 });
    r.set_draw_color(.{ .r = 5, .g = 105, .b = 105 });
    try r.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 29, .y = 29 });
    try r.draw_line(.{ .x = 29, .y = 30 }, .{ .x = 0, .y = 59 });
    try r.draw_line(.{ .x = 79, .y = 0 }, .{ .x = 50, .y = 29 });
    try r.draw_line(.{ .x = 79, .y = 59 }, .{ .x = 50, .y = 30 });

    try h.compare_image(images.primitives, 0);
}

// render_testPrimitivesWithViewport
test "sdl render: primitives with viewport" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    try h.clear_screen();
    try r.set_viewport(frect(2, 2, 2, 2));
    r.set_draw_color(.{ .r = 255, .g = 255, .b = 255 });
    try r.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 1, .y = 1 });
    try r.set_viewport(frect(3, 3, 1, 1));
    var shot = try r.read_pixels(null);
    defer shot.deinit();
    // SDL reads the pixel at the viewport origin of the full output: (0,0) of the
    // read-back is the output origin, so the diagonal must have reached (3,3).
    const px = try shot.view.read(3, 3);
    try testing.expectEqual(Color{ .r = 0xFF, .g = 0xFF, .b = 0xFF, .a = 0xFF }, px);
}

// render_testBlit
test "sdl render: blit" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    try h.clear_screen();
    var face = try h.face_texture();
    defer face.deinit();
    const w: f32 = @floatFromInt(face.width());
    const ht: f32 = @floatFromInt(face.height());
    const ni: i32 = screen_w - face.width();
    const nj: i32 = screen_h - face.height();
    var j: i32 = 0;
    while (j <= nj) : (j += 4) {
        var i: i32 = 0;
        while (i <= ni) : (i += 4) {
            try r.copy(&face, null, frect(@floatFromInt(i), @floatFromInt(j), w, ht));
        }
    }
    try h.compare_image(images.blit, 0);
}

// render_testBlitColor
test "sdl render: blit with color modulation" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    try h.clear_screen();
    var face = try h.face_texture();
    defer face.deinit();
    const w: f32 = @floatFromInt(face.width());
    const ht: f32 = @floatFromInt(face.height());
    const ni: i32 = screen_w - face.width();
    const nj: i32 = screen_h - face.height();
    var j: i32 = 0;
    while (j <= nj) : (j += 4) {
        var i: i32 = 0;
        while (i <= ni) : (i += 4) {
            face.set_color_mod(@intCast(@divTrunc(255, nj) * j), @intCast(@divTrunc(255, ni) * i), @intCast(@divTrunc(255, nj) * j));
            try r.copy(&face, null, frect(@floatFromInt(i), @floatFromInt(j), w, ht));
        }
    }
    try h.compare_image(images.blit_color, 0);
}

// render_testBlitTiled
test "sdl render: tiled blit" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    var face = try h.face_texture();
    defer face.deinit();
    face.set_scale_mode(.nearest); // so 2x scaling is pixel perfect

    try h.clear_screen();
    try r.copy_tiled(&face, null, 1.0, frect(0, 0, screen_w, screen_h));
    try h.compare_image(images.blit_tiled, 0);

    try h.clear_screen();
    try r.copy_tiled(&face, null, 2.0, frect(0, 0, screen_w * 2, screen_h * 2));
    var reference = try images.blit_tiled.to_surface(testing.allocator);
    defer reference.deinit();
    var doubled = try surface.Surface.scaled(testing.allocator, reference.view, screen_w * 2, screen_h * 2, .nearest);
    defer doubled.deinit();
    try h.compare(doubled.view, 0);
}

fn nine_grid_source(a: std.mem.Allocator, size: u31, columns: []const u8, rows: []const u8) !Texture {
    var source = try surface.Surface.init(a, size, size, pixels_test.packed_format("ABGR8888"), null);
    defer source.deinit();
    for (0..size) |y| for (0..size) |x| {
        try source.view.write(x, y, .{ .r = columns[x] * support.color_separation, .g = rows[y] * support.color_separation, .b = 0, .a = 255 });
    };
    var texture = try Texture.init_copy(a, source.view, .static);
    texture.set_scale_mode(.nearest);
    return texture;
}

// render_testBlit9Grid
test "sdl render: 9-grid blit" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    var reference = try surface.Surface.init(testing.allocator, screen_w, screen_h, .rgba8, null);
    defer reference.deinit();

    var simple = try nine_grid_source(testing.allocator, 3, &.{ 1, 2, 3 }, &.{ 1, 2, 3 });
    defer simple.deinit();
    const dst = frect(0, 0, screen_w, screen_h);

    // 1.0 scale
    try support.fill_9grid_reference(reference.view, 1, 1, 1, 1);
    try h.clear_screen();
    try r.copy_9grid(&simple, null, 1, 1, 1, 1, 1.0, dst);
    try h.compare(reference.view, 0);
    // 2.0 scale
    try support.fill_9grid_reference(reference.view, 2, 2, 2, 2);
    try h.clear_screen();
    try r.copy_9grid(&simple, null, 1, 1, 1, 1, 2.0, dst);
    try h.compare(reference.view, 0);

    var complex = try nine_grid_source(testing.allocator, 5, &.{ 1, 2, 2, 3, 3 }, &.{ 1, 2, 2, 3, 3 });
    defer complex.deinit();
    // complex 1.0 scale
    try support.fill_9grid_reference(reference.view, 1, 2, 1, 2);
    try h.clear_screen();
    try r.copy_9grid(&complex, null, 1, 2, 1, 2, 1.0, dst);
    try h.compare(reference.view, 0);
    // complex 2.0 scale
    try support.fill_9grid_reference(reference.view, 2, 4, 2, 4);
    try h.clear_screen();
    try r.copy_9grid(&complex, null, 1, 2, 1, 2, 2.0, dst);
    try h.compare(reference.view, 0);
}

const Operation = enum { point, line, rect, copy_xrgb, copy_argb };
const Mode = enum { color_mod, alpha_mod, none, blend, blend_premultiplied, add, add_premultiplied, mod, mul };

fn blend_of(mode: Mode) surface.Blend {
    return switch (mode) {
        .none => surface.Blend.REPLACE,
        .color_mod, .alpha_mod, .blend => surface.Blend.ALPHA,
        .blend_premultiplied => surface.Blend.PREMULTIPLIED,
        .add => surface.Blend.ADD,
        .add_premultiplied => .{ .color = .{ .source = .one, .destination = .one }, .alpha = .{ .source = .zero, .destination = .one } },
        .mod => surface.Blend.MODULATE,
        .mul => surface.Blend.MULTIPLY,
    };
}

fn unit(v: u8) f32 {
    return @as(f32, @floatFromInt(v)) / 255.0;
}

fn rounded(v: f32) u8 {
    return @intFromFloat(@round(std.math.clamp(v, 0.0, 1.0) * 255.0));
}

fn expected_color(mode: Mode, s: Color, d: Color, alpha_dst: bool) Color {
    const sa = unit(s.a);
    const da = unit(d.a);
    const channels = [3][2]u8{ .{ s.r, d.r }, .{ s.g, d.g }, .{ s.b, d.b } };
    var out: [3]u8 = undefined;
    for (channels, &out) |c, *o| {
        const sc = unit(c[0]);
        const dc = unit(c[1]);
        o.* = rounded(switch (mode) {
            .color_mod => (sc * sc) * sa + dc * (1.0 - sa),
            .alpha_mod => sc * (sa * sa) + dc * (1.0 - sa * sa),
            .none => sc,
            .blend => sc * sa + dc * (1.0 - sa),
            .blend_premultiplied => sc + dc * (1.0 - sa),
            .add => sc * sa + dc,
            .add_premultiplied => sc + dc,
            .mod => sc * dc,
            .mul => sc * dc + dc * (1.0 - sa),
        });
    }
    const alpha: u8 = switch (mode) {
        .color_mod, .blend, .blend_premultiplied => rounded(sa + da * (1.0 - sa)),
        .alpha_mod => rounded(sa * sa + da * (1.0 - sa * sa)),
        .none => if (alpha_dst) s.a else 255,
        else => d.a,
    };
    return .{ .r = out[0], .g = out[1], .b = out[2], .a = alpha };
}

// testBlendModeOperation
fn blend_mode_operation(op: Operation, mode: Mode, dst_name: []const u8) !void {
    const a = testing.allocator;
    // Allow up to 2 delta from theoretical value (the software renderer splits
    // drawing into alpha multiplication and a separate blend operation).
    const maximum_error = 2;
    const dst_format = pixels_test.packed_format(dst_name);
    const alpha_dst = dst_format.masked.channels[3].bits != 0;
    var src_color: Color = .{ .r = 10, .g = 128, .b = 240, .a = 100 };
    const dst_color: Color = .{ .r = 128, .g = 128, .b = 128, .a = if (alpha_dst) 128 else 255 };

    var target = try Texture.init(a, 3, 3, dst_format, null, .target);
    defer target.deinit();
    if (alpha_dst) try testing.expect(std.meta.eql(target.blend, surface.Blend.ALPHA));

    var output = try surface.Surface.init(a, 3, 3, .rgba8, null);
    defer output.deinit();
    var r = Renderer.init(a, output.view);
    try r.set_target(&target);
    r.set_draw_color(dst_color);
    try r.clear();

    var source: ?Texture = null;
    defer if (source) |*t| t.deinit();
    if (op == .copy_xrgb or op == .copy_argb) {
        const format = if (op == .copy_xrgb) pixels_test.packed_format("XBGR8888") else pixels_test.packed_format("ABGR8888");
        if (op == .copy_xrgb) src_color.a = 255;
        var t = try Texture.init(a, 1, 1, format, null, .static);
        try t.view().write(0, 0, src_color);
        t.set_blend(blend_of(mode));
        source = t;
    } else {
        r.set_draw_color(src_color);
        r.set_blend(blend_of(mode));
    }
    if (source) |*t| {
        if (mode == .color_mod) t.set_color_mod(src_color.r, src_color.g, src_color.b);
        if (mode == .alpha_mod) t.set_alpha_mod(src_color.a);
    }

    switch (op) {
        .point => try r.draw_point(.{ .x = 0, .y = 0 }),
        .line => try r.draw_line(.{ .x = 0, .y = 0 }, .{ .x = 2, .y = 2 }),
        .rect => try r.fill_rect(frect(0, 0, 3, 3)),
        .copy_xrgb, .copy_argb => try r.copy(&source.?, null, null),
    }
    var result = try r.read_pixels(null);
    defer result.deinit();
    const actual = try result.view.read(0, 0);
    const expected = expected_color(mode, src_color, dst_color, alpha_dst);
    const ok = @abs(@as(i32, actual.r) - expected.r) <= maximum_error and
        @abs(@as(i32, actual.g) - expected.g) <= maximum_error and
        @abs(@as(i32, actual.b) - expected.b) <= maximum_error and
        @abs(@as(i32, actual.a) - expected.a) <= maximum_error;
    if (!ok) std.debug.print("{s} {s} -> {s}: expected {any}, got {any}\n", .{ @tagName(op), @tagName(mode), dst_name, expected, actual });
    try testing.expect(ok);
}

// render_testBlendModes
test "sdl render: blend modes" {
    const modes = std.enums.values(Mode);
    for (modes) |mode| {
        for (std.enums.values(Operation)) |op| {
            for ([_][]const u8{ "XRGB8888", "ARGB8888" }) |dst| {
                // Modulation modes are only supported by texture copies.
                if ((mode == .color_mod or mode == .alpha_mod) and op != .copy_xrgb and op != .copy_argb) continue;
                try blend_mode_operation(op, mode, dst);
            }
        }
    }
}

fn green_raster_reference(h: *Harness, viewport: ?geometry.Rect(i32)) !surface.Surface {
    _ = h;
    var reference = try surface.Surface.init(testing.allocator, screen_w, screen_h, pixels_test.packed_format("ARGB8888"), null);
    errdefer reference.deinit();
    try reference.view.fill(.{ .r = 0, .g = 0, .b = 0 }, null);
    if (viewport) |v| try reference.view.fill(.{ .r = 0, .g = 255, .b = 0 }, v);
    return reference;
}

// render_testViewport
test "sdl render: viewport" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    const viewport = geometry.Rect(i32){ .x = screen_w / 3, .y = screen_h / 3, .width = screen_w / 2, .height = screen_h / 2 };
    var reference = try green_raster_reference(&h, viewport);
    defer reference.deinit();

    try h.clear_screen();
    try r.set_viewport(frect(@floatFromInt(viewport.x), @floatFromInt(viewport.y), @floatFromInt(viewport.width), @floatFromInt(viewport.height)));
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    // SDL_RenderFillRect(NULL) fills the viewport.
    try r.fill_rect(frect(0, 0, @floatFromInt(viewport.width), @floatFromInt(viewport.height)));
    try r.set_viewport(null);
    try h.compare(reference.view, 0);

    // Clear ignores the viewport.
    try reference.view.fill(.{ .r = 0, .g = 255, .b = 0 }, null);
    try h.clear_screen();
    try r.set_viewport(frect(@floatFromInt(viewport.x), @floatFromInt(viewport.y), @floatFromInt(viewport.width), @floatFromInt(viewport.height)));
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.clear();
    try r.set_viewport(null);
    try h.compare(reference.view, 0);
}

// render_testClipRect
test "sdl render: clip rect" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    var cliprect = frect(screen_w / 3, screen_h / 3, screen_w / 2, screen_h / 2);
    var reference = try green_raster_reference(&h, .{ .x = screen_w / 3, .y = screen_h / 3, .width = screen_w / 2, .height = screen_h / 2 });
    defer reference.deinit();

    try h.clear_screen();
    try r.set_clip(cliprect);
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    // SDL_RenderFillRect(NULL) fills the whole render area, which the clip limits.
    try r.fill_rect(frect(0, 0, 320, 240));
    try r.set_clip(null);
    try h.compare(reference.view, 0);

    // An empty clip rectangle clips all drawing.
    cliprect.height = 0;
    try r.set_clip(cliprect);
    r.set_draw_color(.{ .r = 255, .g = 0, .b = 0 });
    try r.fill_rect(frect(0, 0, 320, 240));
    try r.set_clip(null);
    try h.compare(reference.view, 0);

    // Clear ignores the clip rectangle.
    try reference.view.fill(.{ .r = 0, .g = 255, .b = 0 }, null);
    try h.clear_screen();
    try r.set_clip(cliprect);
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.clear();
    try r.set_clip(null);
    try h.compare(reference.view, 0);
}

// render_testLogicalSize
test "sdl render: logical size" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    const factor = 2;
    var viewport = geometry.Rect(i32){
        .x = ((screen_w / 4) / factor) * factor,
        .y = ((screen_h / 4) / factor) * factor,
        .width = ((screen_w / 2) / factor) * factor,
        .height = ((screen_h / 2) / factor) * factor,
    };
    var reference = try green_raster_reference(&h, viewport);
    defer reference.deinit();

    try h.clear_screen();
    try r.set_logical_presentation(.{ .width = 320 / factor, .height = 240 / factor, .mode = .letterbox });
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.fill_rect(frect(@floatFromInt(@divExact(viewport.x, factor)), @floatFromInt(@divExact(viewport.y, factor)), @floatFromInt(@divExact(viewport.width, factor)), @floatFromInt(@divExact(viewport.height, factor))));
    try r.set_logical_presentation(null);
    try h.compare(reference.view, 0);

    // Logical size together with a viewport.
    try h.clear_screen();
    try r.set_logical_presentation(.{ .width = 320 / factor, .height = 240 / factor, .mode = .letterbox });
    try r.set_viewport(frect((screen_w / 4) / factor, (screen_h / 4) / factor, (screen_w / 2) / factor, (screen_h / 2) / factor));
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.fill_rect(frect(0, 0, (screen_w / 2) / factor, (screen_h / 2) / factor));
    try r.set_viewport(null);
    try r.set_logical_presentation(null);
    try h.compare(reference.view, 0);

    // A logical size with a different aspect ratio than the output: letterboxed
    // presentation rectangle is {20, 0, 280x240}.
    viewport = .{ .x = screen_w / 4, .y = 0, .width = screen_w, .height = screen_h };
    try reference.view.fill(.{ .r = 0, .g = 0, .b = 0 }, null);
    try reference.view.fill(.{ .r = 0, .g = 255, .b = 0 }, viewport);
    try h.clear_screen();
    try r.set_logical_presentation(.{ .width = 320 - 2 * (screen_w / 4), .height = 240, .mode = .letterbox });
    const origin = try r.render_to_window(.{ .x = 0, .y = 0 });
    const corner = try r.render_to_window(.{ .x = 320 - 2 * (screen_w / 4), .y = 240 });
    try testing.expectEqual(FPoint{ .x = 20, .y = 0 }, origin);
    try testing.expectEqual(FPoint{ .x = 300, .y = 240 }, corner);
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.fill_rect(frect(0, 0, 320 - 2 * (screen_w / 4), 240));
    try r.set_logical_presentation(null);
    try h.compare(reference.view, 0);
}

// render_testGetSetTextureScaleMode
test "sdl render: texture scale mode get and set" {
    var texture = try Texture.init(testing.allocator, 16, 16, pixels_test.packed_format("ARGB8888"), null, .streaming);
    defer texture.deinit();
    for ([_]surface.ScaleMode{ .nearest, .linear, .pixel_art }) |mode| {
        texture.set_scale_mode(mode);
        try testing.expectEqual(mode, texture.scale_mode);
    }
}

// render_testRGBSurfaceNoAlpha
test "sdl render: RGB surface without alpha and rotated copy" {
    const a = testing.allocator;
    const rgbx32 = pixels_test.packed_format("XBGR8888"); // SDL_PIXELFORMAT_RGBX32 on little-endian
    var output = try surface.Surface.init(a, 128, 128, rgbx32, null);
    defer output.deinit();
    try testing.expectEqual(32, rgbx32.bits_per_pixel());
    var r = Renderer.init(a, output.view);

    var source = try surface.Surface.init(a, 16, 16, rgbx32, null);
    defer source.deinit();
    try source.view.fill(.{ .r = 0, .g = 0, .b = 0 }, null);
    var texture = try Texture.init_copy(a, source.view, .static);
    defer texture.deinit();

    r.set_draw_color(.{ .r = 0xaa, .g = 0xbb, .b = 0xcc, .a = 0 });
    try r.clear();
    r.set_draw_color(.{ .r = 0, .g = 0, .b = 0, .a = 0 });
    try r.copy_ex(&texture, null, frect(32, 32, 16, 16), 180, .{ .x = 0, .y = 0 }, .{});

    const background: Color = .{ .r = 0xaa, .g = 0xbb, .b = 0xcc, .a = 0xff };
    const black: Color = .{ .r = 0, .g = 0, .b = 0, .a = 0xff };
    try testing.expectEqual(background, try output.view.read(0, 0));
    try testing.expectEqual(background, try output.view.read(15, 15));
    try testing.expectEqual(black, try output.view.read(16, 16));
    try testing.expectEqual(black, try output.view.read(31, 31));
    try testing.expectEqual(background, try output.view.read(32, 32));
}

fn uv_quad(vertices: *[6]renderer_mod.Vertex, rect: FRect, min: f32, max: f32) void {
    const white: Color = .{ .r = 255, .g = 255, .b = 255, .a = 255 };
    const p = [6][4]f32{
        .{ rect.x, rect.y, min, min },
        .{ rect.x + rect.width, rect.y, max, min },
        .{ rect.x + rect.width, rect.y + rect.height, max, max },
        .{ rect.x, rect.y, min, min },
        .{ rect.x + rect.width, rect.y + rect.height, max, max },
        .{ rect.x, rect.y + rect.height, min, max },
    };
    for (p, vertices) |src, *v| v.* = .{ .position = .{ .x = src[0], .y = src[1] }, .color = white, .uv = .{ .x = src[2], .y = src[3] } };
}

fn render_uv_test(address: ?renderer_mod.TextureAddress, reference: images.Image) !void {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    try h.clear_screen();
    var face = try h.face_texture();
    defer face.deinit();
    const w: f32 = @as(f32, @floatFromInt(face.width())) * 2;
    const ht: f32 = @as(f32, @floatFromInt(face.height())) * 2;
    var vertices: [6]renderer_mod.Vertex = undefined;
    uv_quad(&vertices, frect((screen_w - w) / 2, (screen_h - ht) / 2, w, ht), -0.5, 1.5);
    if (address) |mode| r.set_texture_address(mode, mode);
    try r.render_geometry(&face, &vertices, null);
    try h.compare_image(reference, 0);
}

// render_testUVClamping
test "sdl render: geometry UV clamping" {
    try render_uv_test(.clamp, images.clamped_sprite);
}

// render_testUVWrapping (SDL's default texture address mode is AUTO, which wraps
// when coordinates leave [0, 1])
test "sdl render: geometry UV wrapping" {
    try render_uv_test(null, images.wrapping_sprite);
    try render_uv_test(.wrap, images.wrapping_sprite);
}

// render_testTextureState
test "sdl render: texture state changes" {
    var h: Harness = undefined;
    try h.init();
    defer h.deinit();
    const r = &h.renderer;
    const expected = [_]Color{
        // Step 0: plain copy
        .{ .r = 0x00, .g = 0x00, .b = 0x00, .a = 0xFF }, .{ .r = 0xFF, .g = 0xFF, .b = 0xFF, .a = 0xFF },
        // Step 1: color mod to red
        .{ .r = 0x00, .g = 0x00, .b = 0x00, .a = 0xFF }, .{ .r = 0xFF, .g = 0x00, .b = 0x00, .a = 0xFF },
        // Step 2: alpha mod to 128 (cleared to green)
        .{ .r = 0x00, .g = 0x7F, .b = 0x00, .a = 0xFF }, .{ .r = 0x80, .g = 0xFF, .b = 0x80, .a = 0xFF },
        // Step 3: nearest stretch
        .{ .r = 0xFF, .g = 0xFF, .b = 0xFF, .a = 0xFF }, .{ .r = 0x00, .g = 0xFF, .b = 0x00, .a = 0xFF },
        // Step 4: linear stretch
        .{ .r = 0x80, .g = 0x80, .b = 0x80, .a = 0xFF }, .{ .r = 0x00, .g = 0xFF, .b = 0x00, .a = 0xFF },
    };
    r.set_draw_color(.{ .r = 0, .g = 255, .b = 0 });
    try r.clear();
    var texture = try Texture.init(testing.allocator, 2, 1, .rgba8, null, .static);
    defer texture.deinit();
    const texels = [8]u8{ 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
    var source = try surface.View.init(@constCast(&texels), 2, 1, 8, .rgba8, null);
    source.data = @constCast(&texels);
    try texture.update(null, source);

    var dst = frect(0, 0, 2, 1);
    try r.copy(&texture, null, dst);
    dst.y += 1;
    texture.set_color_mod(0xFF, 0x00, 0x00);
    try r.copy(&texture, null, dst);
    texture.set_color_mod(0xFF, 0xFF, 0xFF);
    dst.y += 1;
    texture.set_alpha_mod(0x80);
    try r.copy(&texture, null, dst);
    texture.set_alpha_mod(0xFF);
    dst.y += 1;
    dst.width = 1;
    texture.set_scale_mode(.nearest);
    try r.copy(&texture, null, dst);
    dst.y += 1;
    texture.set_scale_mode(.linear);
    try r.copy(&texture, null, dst);

    var shot = try r.read_pixels(.{ .x = 0, .y = 0, .width = 2, .height = 5 });
    defer shot.deinit();
    for (0..5) |row| for (0..2) |col| {
        const actual = try shot.view.read(col, row);
        const want = expected[row * 2 + col];
        const ok = @abs(@as(i32, actual.r) - want.r) <= 1 and @abs(@as(i32, actual.g) - want.g) <= 1 and
            @abs(@as(i32, actual.b) - want.b) <= 1 and @abs(@as(i32, actual.a) - want.a) <= 1;
        if (!ok) std.debug.print("step {d} pixel {d}: expected {any}, got {any}\n", .{ row, col, want, actual });
        try testing.expect(ok);
    };
}
