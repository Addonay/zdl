//! SDL renderer/20-blending: compare six texture blend equations on checkerboards.
const std = @import("std");
const zdl = @import("zdl");
const common = @import("common");

const panel_count = 6;
const grid_size: f32 = 639.0 / 18.0;
const panel_size = grid_size * 4;
const row_offset = (480 - 2 * panel_size) / 4;
const col_offset = grid_size * 3;
const red_offset = grid_size;
const green_offset = 50.0 / 3.0 + grid_size;
const blue_offset = 100.0 / 3.0 + grid_size;

const App = struct {
    red: common.Texture,
    green: common.Texture,
    blue: common.Texture,
    alpha: u8 = 255,

    fn deinit(self: *App) void {
        self.red.deinit();
        self.green.deinit();
        self.blue.deinit();
    }

    pub fn event(self: *App, _: *zdl.app.callbacks.Context, ev: zdl.app.callbacks.Event) zdl.app.callbacks.Result {
        switch (ev) {
            .key => |key| if (key.kind == .down) switch (key.keycode) {
                .up => {
                    if (self.alpha <= 255 - 8) self.alpha += 8;
                },
                .down => {
                    if (self.alpha >= 8) self.alpha -= 8;
                },
                else => {},
            },
            else => {},
        }
        return .@"continue";
    }
};

pub fn main(init: std.process.Init) !void {
    var app = try make_app(init.gpa);
    defer app.deinit();
    try common.run(App, &app, init, "examples/renderer/blending", frame);
}

fn make_app(allocator: std.mem.Allocator) !App {
    var app: App = undefined;
    app.red = try common.Texture.init(allocator, 50, 50, .rgba8, null, .static);
    errdefer app.red.deinit();
    app.green = try common.Texture.init(allocator, 50, 50, .rgba8, null, .static);
    errdefer app.green.deinit();
    app.blue = try common.Texture.init(allocator, 50, 50, .rgba8, null, .static);
    errdefer app.blue.deinit();
    app.alpha = 255;
    try app.red.storage.view.fill(.{ .r = 255, .g = 0, .b = 0, .a = 255 }, null);
    try app.green.storage.view.fill(.{ .r = 0, .g = 255, .b = 0, .a = 255 }, null);
    try app.blue.storage.view.fill(.{ .r = 0, .g = 0, .b = 255, .a = 255 }, null);
    return app;
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    const blend_modes = [_]common.Blend{
        .REPLACE,
        .ALPHA,
        .ADD,
        .MODULATE,
        .MULTIPLY,
        .{ .color = .{ .source = .inverse_destination_color, .destination = .one }, .alpha = .{ .source = .zero, .destination = .one } },
    };
    const labels = [_][]const u8{ "NONE", "BLEND", "ADD", "MOD", "MUL", "SCREEN CUSTOM" };
    var panels: [panel_count]common.FRect = undefined;
    for (0..panel_count) |i| {
        panels[i] = panel_rect(i);
        var y = panels[i].y;
        while (y < panels[i].y + panel_size) : (y += grid_size) {
            var x = panels[i].x;
            while (x < panels[i].x + panel_size) : (x += grid_size) {
                const checker_x: usize = @intFromFloat(@floor(x / grid_size));
                const checker_y: usize = @intFromFloat(@floor(y / grid_size));
                const shade: u8 = if ((checker_x + checker_y) % 2 == 1) 70 else 110;
                renderer.set_draw_color(.{ .r = shade, .g = shade, .b = shade, .a = 255 });
                try renderer.fill_rect(.{ .x = x, .y = y, .width = grid_size, .height = grid_size });
            }
        }
        renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
        try renderer.debug_text(panels[i].x, panels[i].y - 15, labels[i]);
    }
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.draw_rects(&panels);
    try renderer.debug_text((640 - 176) / 2, 450, "UP/DOWN: CHANGE ALPHA");
    try renderer.debug_text_format((640 - 80) / 2, 460, "ALPHA: {d}", .{app.alpha});

    for (0..panel_count) |i| {
        const blend = blend_modes[i];
        app.red.set_alpha_mod(app.alpha);
        app.green.set_alpha_mod(app.alpha);
        app.blue.set_alpha_mod(app.alpha);
        app.red.set_blend(blend);
        app.green.set_blend(blend);
        app.blue.set_blend(blend);
        const panel = panels[i];
        try renderer.copy(&app.red, null, .{ .x = panel.x + red_offset, .y = panel.y + red_offset, .width = 50, .height = 50 });
        try renderer.copy(&app.green, null, .{ .x = panel.x + green_offset, .y = panel.y + green_offset, .width = 50, .height = 50 });
        try renderer.copy(&app.blue, null, .{ .x = panel.x + blue_offset, .y = panel.y + blue_offset, .width = 50, .height = 50 });
    }
}

fn panel_rect(i: usize) common.FRect {
    const row = i / 3;
    const col = i % 3;
    return .{
        .x = @as(f32, @floatFromInt(col)) * panel_size + @as(f32, @floatFromInt(col)) * col_offset,
        .y = @as(f32, @floatFromInt(row)) * panel_size + @as(f32, @floatFromInt(row + 1)) * row_offset,
        .width = panel_size,
        .height = panel_size,
    };
}
