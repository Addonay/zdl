//! Optional native editable-paragraph experiment. No production widget API.
const std = @import("std");
const zdl = @import("zdl");
const paragraph = @import("paragraph/paragraph.zig");
const Session = @import("editor/session.zig").Session;
const surface = zdl.surface;
const Color = zdl.pixels.Color;
const field_x = 24;
const field_y = 72;
fn copy_image(target: surface.View, image: *const paragraph.Image, x: usize, y: usize, max_height: usize) !void {
    const width = @min(image.width, @as(usize, target.width) -| x);
    const height = @min(@min(image.height, max_height), @as(usize, target.height) -| y);
    for (0..height) |row| {
        const input = image.pixels[row * image.stride ..];
        const output = try target.row(row + y);
        for (0..width) |column| {
            const value = std.mem.readInt(u32, input[column * 4 ..][0..4], @import("builtin").target.cpu.arch.endian());
            const start = (x + column) * 4;
            output[start..][0..4].* = .{ @truncate(value >> 16), @truncate(value >> 8), @truncate(value), 255 };
        }
    }
}
fn label(allocator: std.mem.Allocator, library: *paragraph.Library, target: surface.View, text: []const u8, y: usize, font: [:0]const u8) !void {
    var layout = try paragraph.Snapshot.init(allocator, library, text, .{ .width_px = @intCast(target.width - 48), .font = font });
    defer layout.deinit();
    var image = try layout.rasterize();
    defer image.deinit();
    try copy_image(target, &image, 16, y, image.height);
}
fn paint(allocator: std.mem.Allocator, library: *paragraph.Library, editor: *Session, width: u31, height: u31, focused: bool) !surface.Surface {
    var result = try surface.Surface.init(allocator, width, height, .rgba8, null);
    errdefer result.deinit();
    try result.view.fill(.{ .r = 245, .g = 247, .b = 250, .a = 255 }, null);
    try label(allocator, library, result.view, "ZDL · editable paragraph experiment", 12, "Sans Bold 16");
    try result.view.fill(if (focused) .{ .r = 70, .g = 110, .b = 210, .a = 255 } else .{ .r = 150, .g = 155, .b = 165, .a = 255 }, .{ .x = field_x - 1, .y = field_y - 1, .width = @intCast(width - 46), .height = @intCast(height - 142) });
    try result.view.fill(.{ .r = 255, .g = 255, .b = 255, .a = 255 }, .{ .x = field_x, .y = field_y, .width = @intCast(width - 48), .height = @intCast(height - 144) });
    try copy_image(result.view, &editor.image.?, field_x, field_y, height - 144);
    if (editor.preedit.len != 0) {
        const message = try std.fmt.allocPrint(allocator, "Uncommitted preedit: {s}", .{editor.preedit});
        defer allocator.free(message);
        try label(allocator, library, result.view, message, height - 110, "Sans 11");
    }
    try label(allocator, library, result.view, "Type · click/drag · Shift+arrows · Backspace/Delete · Ctrl+A/Z/Y\nEsc closes. One paragraph; native IME/AX conformance remains unverified.", height - 66, "Sans 10");
    return result;
}
fn state_file(init: std.process.Init, editor: *const Session, path: ?[]const u8) !void {
    const output = path orelse return;
    const data = try std.json.Stringify.valueAlloc(init.gpa, .{ .text = editor.source.?.text(), .revision = editor.source.?.revision().value, .anchor = editor.source.?.selection().anchor_byte, .active = editor.source.?.selection().active_byte, .pending = editor.needs_refresh, .preedit = editor.preedit, .mode = @tagName(@import("builtin").mode), .pango = editor.library.versions().pango, .cairo = editor.library.versions().cairo, .missing_glyphs = editor.layout.?.missing_glyphs() }, .{});
    defer init.gpa.free(data);
    try std.Io.Dir.cwd().writeFile(init.io, .{ .sub_path = output, .data = data });
}
fn script(editor: *Session) !void {
    try editor.select_all();
    try editor.commit_text("Ae\u{301}B");
    try editor.move(false, false);
    try editor.erase(false);
    if (!std.mem.eql(u8, editor.source.?.text(), "AB")) return error.GraphemeMismatch;
    try editor.history(true);
    try editor.history(false);
    try editor.select_all();
    try editor.commit_text("Hello · עברית · العربية · cafe\u{301}");
    try editor.hit(5, 12, false);
    try editor.move(true, true);
    try editor.move(true, true);
    try editor.move(true, true);
}
pub fn main(init: std.process.Init) !void {
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    var scripted = false;
    var force_x11 = false;
    var png_path: ?[]const u8 = null;
    var state_path: ?[]const u8 = null;
    while (args.next()) |arg| {
        if (std.mem.eql(u8, arg, "--script")) scripted = true else if (std.mem.eql(u8, arg, "--x11")) force_x11 = true else if (std.mem.eql(u8, arg, "--snapshot")) png_path = args.next() orelse return error.MissingPath else if (std.mem.eql(u8, arg, "--state")) state_path = args.next() orelse return error.MissingPath else return error.UnknownOption;
    }
    var library = try paragraph.Library.open_resident(.{});
    defer library.deinit();
    var doc = try zdl.text.Document.init(init.gpa, "Edit e\u{301} · עברית · العربية", .{});
    defer doc.deinit();
    var registry = try zdl.text.Registry.init(init.gpa, .{});
    defer registry.deinit();
    var registration = try registry.register(&doc);
    defer registration.close();
    var editor = try Session.init(init.gpa, &library, &registry, registration.handle(), 656);
    defer editor.deinit();
    const env = init.minimal.environ;
    const platform = try zdl.linux.Platform.open(init.gpa, init.io, .{ .driver = if (force_x11) .x11 else if (scripted) .offscreen else .auto, .environment = .{ .x11_display = env.getPosix("DISPLAY"), .wayland_display = env.getPosix("WAYLAND_DISPLAY"), .session_type = env.getPosix("XDG_SESSION_TYPE") } });
    defer platform.close();
    var window = try platform.create_window(.{ .title = "ZDL paragraph editor", .size = .{ .width = 720, .height = 400 }, .min_size = .{ .width = 320, .height = 240 } });
    defer window.deinit();
    var focused = true;
    var dragging = false;
    var dirty = true;
    var running = true;
    if (!scripted) try window.start_text_input();
    defer window.stop_text_input() catch {};
    if (scripted) try script(&editor);
    while (running) {
        try platform.pump();
        while (platform.next_event()) |event| {
            switch (event) {
                .quit => {
                    running = false;
                },
                .window => |value| switch (value.kind) {
                    .close_requested => {
                        running = false;
                    },
                    .focus_lost => {
                        focused = false;
                        dragging = false;
                        editor.cancel_composition();
                        try window.stop_text_input();
                        dirty = true;
                    },
                    .focus_gained => {
                        focused = true;
                        try window.start_text_input();
                        dirty = true;
                    },
                    .resized, .pixel_size_changed, .exposed => {
                        const size = try window.size_in_pixels();
                        try editor.resize(@intCast(@min(@max(size.width, 320), 4096) - 64));
                        dirty = true;
                    },
                    else => {},
                },
                .text_input => |value| {
                    if (focused and !(value.text.len == 1 and value.text[0] < 0x20)) {
                        editor.commit_text(value.text) catch |err| std.debug.print("editor input: {t}\n", .{err});
                        dirty = true;
                    }
                },
                .text_editing => |value| {
                    if (focused) {
                        editor.set_preedit(value.text) catch |err| std.debug.print("editor preedit: {t}\n", .{err});
                        dirty = true;
                    }
                },
                .key => |key| {
                    if (key.kind == .down and focused) {
                        const ctrl = key.modifiers.ctrl() and !key.modifiers.alt() and !key.modifiers.mode;
                        if (key.scancode == .escape) {
                            running = false;
                        } else if (ctrl) {
                            switch (key.scancode) {
                                .a => try editor.select_all(),
                                .z => editor.history(!key.modifiers.shift()) catch |err| {
                                    if (err != error.NoUndo and err != error.NoRedo) return err;
                                },
                                .y => editor.history(false) catch |err| {
                                    if (err != error.NoRedo) return err;
                                },
                                else => {},
                            }
                        } else switch (key.scancode) {
                            .left => try editor.move(false, key.modifiers.shift()),
                            .right => try editor.move(true, key.modifiers.shift()),
                            .backspace => try editor.erase(false),
                            .delete => try editor.erase(true),
                            else => {},
                        }
                        dirty = true;
                    }
                },
                .mouse_button => |button| {
                    if (button.button == 1) {
                        const bounds = try window.size_in_pixels();
                        if (button.kind == .down and button.x >= field_x and button.y >= field_y and button.x < @as(f32, @floatFromInt(bounds.width - field_x)) and button.y < @as(f32, @floatFromInt(bounds.height - 72))) {
                            dragging = true;
                            try editor.hit(button.x - field_x - @as(f32, @floatFromInt(editor.image.?.origin_x)), button.y - field_y - @as(f32, @floatFromInt(editor.image.?.origin_y)), false);
                            dirty = true;
                        } else if (button.kind == .up) dragging = false;
                    }
                },
                .mouse_motion => |motion| {
                    if (dragging) {
                        try editor.hit(motion.x - field_x - @as(f32, @floatFromInt(editor.image.?.origin_x)), motion.y - field_y - @as(f32, @floatFromInt(editor.image.?.origin_y)), true);
                        dirty = true;
                    }
                },
                else => {},
            }
        }
        if (dirty) {
            const size = try window.size_in_pixels();
            var frame = try paint(init.gpa, &library, &editor, @intCast(size.width), @intCast(size.height), focused);
            defer frame.deinit();
            try window.present(frame.view);
            const caret = try editor.layout.?.cursor_rect(editor.cursor, editor.strong);
            if (!scripted or force_x11) try window.set_text_input_area(.{ .x = field_x + @as(i32, @intCast(editor.image.?.origin_x)) + @as(i32, @intFromFloat(caret.x)), .y = field_y + @as(i32, @intCast(editor.image.?.origin_y)) + @as(i32, @intFromFloat(caret.y)), .width = 2, .height = @intFromFloat(@ceil(caret.height)) });
            try state_file(init, &editor, state_path);
            if (png_path) |path| {
                const bytes = try zdl.image.encode_png(init.gpa, frame.view, .{});
                defer init.gpa.free(bytes);
                try std.Io.Dir.cwd().writeFile(init.io, .{ .sub_path = path, .data = bytes });
            }
            dirty = false;
        }
        if (scripted) break;
        if (running) _ = try platform.wait_event(null);
    }
    std.debug.print("editor complete mode={s} revision={d} bytes={d}\n", .{ @tagName(@import("builtin").mode), editor.source.?.revision().value, editor.source.?.text().len });
}
