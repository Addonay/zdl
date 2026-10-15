//! Figma VLC Redesign implemented with native zdl playback and zlay layout.
const std = @import("std");
const zdl = @import("zdl");
const zlay = @import("zlay");
const ui = @import("ui");
const media = @import("media");
const assets = @import("player-assets");
const W = ui.widgets;
const Id = zlay.ElementId;
const C = ui.Color;
fn id(name: []const u8) Id {
    return Id.named(name);
}
fn ix(value: assets.Icon) u16 {
    return @backingInt(value);
}
fn text(u: *ui.Ui, value: []const u8, font: u16, size: u16, color: C) void {
    u.text_run(value, .{ .font = font, .size = size, .line_height = size + 6, .color = color, .wrap = .none });
}
fn space(u: *ui.Ui, name: []const u8) void {
    u.open(id(name), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) } } });
    u.close();
}
const Program = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    player: ?*media.Player = null,
    playlist: std.ArrayList([]u8) = .empty,
    current: usize = 0,
    sidebar: bool = false,
    preferences: bool = false,
    info: bool = false,
    repeat: bool = false,
    notice: []const u8 = "",
    video_custom: ui.Custom = undefined,
    seek_custom: ui.Custom = undefined,
    volume_custom: ui.Custom = undefined,
    seek_rect: ui.Rect = .{ .x = 0, .y = 0, .w = 0, .h = 0 },
    volume_rect: ui.Rect = .{ .x = 0, .y = 0, .w = 0, .h = 0 },
    layout_scale: f32 = 1,
    video_background: C = C.rgb(42, 41, 38),
    video_cache: ?zdl.surface.Surface = null,
    cached_seconds: ?f64 = null,
    frame_ui: ?*ui.Ui = null,
    scratch: [64][256]u8 = undefined,
    used: usize = 0,
    fn deinit(self: *Program) void {
        if (self.player) |p| p.close();
        if (self.video_cache) |*cache| cache.deinit();
        for (self.playlist.items) |path| self.allocator.free(path);
        self.playlist.deinit(self.allocator);
    }
    fn format(self: *Program, comptime pattern: []const u8, args: anytype) []const u8 {
        const index = self.used;
        self.used += 1;
        return std.fmt.bufPrint(&self.scratch[index], pattern, args) catch "";
    }
    fn add(self: *Program, path: []const u8) !void {
        const owned = try self.allocator.dupe(u8, path);
        errdefer self.allocator.free(owned);
        try self.playlist.append(self.allocator, owned);
    }
    fn load(self: *Program, index: usize) void {
        if (index >= self.playlist.items.len) return;
        // Close the previous audio device before opening its replacement.
        if (self.player) |p| p.close();
        self.player = null;
        self.cached_seconds = null;
        self.player = media.Player.open(self.allocator, self.io, self.playlist.items[index]) catch |err| {
            self.notice = @errorName(err);
            return;
        };
        self.current = index;
        self.notice = "";
    }
    fn open_files(self: *Program) void {
        var result = zdl.dialog.zenity.run(self.allocator, self.io, .{ .kind = .open_file, .title = "Open media", .allow_many = true, .filters = &.{ .{ .name = "Media", .pattern = "mp4;mkv;webm;mov;avi;mp3;flac;wav;ogg" }, .{ .name = "All files", .pattern = "*" } } }) catch |err| {
            self.notice = @errorName(err);
            return;
        };
        defer result.deinit(self.allocator);
        switch (result) {
            .cancelled => {},
            .selected => |paths| {
                const start = self.playlist.items.len;
                for (paths) |path| self.add(path) catch {
                    self.notice = "Out of memory";
                    return;
                };
                self.load(start);
            },
        }
    }
    fn next(self: *Program, backwards: bool) void {
        const count = self.playlist.items.len;
        if (count == 0) return;
        self.load(if (backwards) (self.current + count - 1) % count else (self.current + 1) % count);
    }
    pub fn animating(self: *const Program) bool {
        return if (self.player) |p| !p.is_paused() else false;
    }
    pub fn event(self: *Program, u: *ui.Ui, ev: zdl.events.event.Event) void {
        switch (ev) {
            .key => |key| if (key.kind == .down and !key.repeat) {
                if (key.scancode == .space and u.focus != 0) return;
                if (key.scancode == .escape) {
                    self.preferences = false;
                    self.info = false;
                }
                if (key.scancode == .o and (key.modifiers.left_ctrl or key.modifiers.right_ctrl)) self.open_files();
                if (key.scancode == .f) if (u.window) |window| window.set_fullscreen(!(window.flags() catch return).fullscreen) catch {};
                if (self.player) |p| switch (key.scancode) {
                    .space => p.toggle_pause() catch {},
                    .left => p.seek(@max(0, p.position() - 5)) catch {},
                    .right => p.seek(p.position() + 5) catch {},
                    .up => p.set_volume(@min(1, p.get_volume() + 0.05)) catch {},
                    .down => p.set_volume(@max(0, p.get_volume() - 0.05)) catch {},
                    .m => p.set_muted(!p.is_muted()) catch {},
                    else => {},
                };
            },
            .drop => |drop| if (drop.kind == .file) {
                self.add(drop.data orelse return) catch return;
                self.load(self.playlist.items.len - 1);
            },
            else => {},
        }
    }
    pub fn build(self: *Program, u: *ui.Ui) void {
        self.used = 0;
        self.layout_scale = u.scale;
        self.frame_ui = u;
        self.skin(u);
        self.video_background = u.theme.card;
        if (self.player) |p| {
            p.update() catch |err| {
                self.notice = @errorName(err);
                p.pause();
            };
            while (p.poll_event()) |playback_event| switch (playback_event) {
                .ended => if (self.repeat or self.current + 1 < self.playlist.items.len) {
                    self.next(false);
                    break;
                },
                .failed => |err| {
                    self.notice = @errorName(err);
                    p.pause();
                },
            };
        }
        self.video_custom = .{ .draw = draw_video, .context = self };
        self.seek_custom = .{ .draw = draw_seek, .context = self };
        self.volume_custom = .{ .draw = draw_volume, .context = self };
        const dimensions = u.layout.getLayoutDimensions();
        u.open(id("player-root"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .direction = .top_to_bottom }, .background_color = u.theme.background });
        u.open(id("titlebar"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(40) }, .padding = .{ .left = 8, .right = 148 }, .child_gap = 4, .child_alignment = .{ .y = .center } } });
        text(u, "VLC", 2, 15, u.theme.primary);
        if (self.button(u, "file-menu", .more, false)) self.open_files();
        if (self.button(u, "sidebar-toggle", .sidebar, false)) self.sidebar = !self.sidebar;
        W.separator(u, id("title-divider"), true, 20);
        if (W.button(u, id("open-file"), .{ .label = "Videos", .icon = ix(.folder), .variant = .ghost, .size = .sm, .font = .regular, .radius = 4 })) self.open_files();
        space(u, "title-left-space");
        u.open(id("window-title"), .{ .layout = .{ .sizing = .{ .width = .fit(.{}), .height = .fit(.{}) } }, .floating = .{ .attach_to = .element_with_id, .parent_id = id("titlebar").id, .attach_points = .{ .element = .center_center, .parent = .center_center } } });
        text(u, "VLC Media Player", 0, 14, u.theme.muted_foreground);
        u.close();
        space(u, "title-right-space");
        if (self.button(u, "fullscreen", .fullscreen, false)) if (u.window) |window| window.set_fullscreen(!(window.flags() catch return).fullscreen) catch {};
        u.close();
        u.drag_regions.add(.{ .rect = .{ .x = 260, .y = 0, .width = @intFromFloat(@max(0, dimensions.width - 470)), .height = 40 }, .kind = .draggable }) catch {};
        u.open(id("body"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .padding = .{ .left = if (self.sidebar) 0 else 10, .right = 10 } } });
        if (self.sidebar) self.build_sidebar(u);
        u.open(id("video"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) } }, .custom = .{ .data = &self.video_custom } });
        if (self.player == null) {
            u.open(id("empty-video"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .direction = .top_to_bottom, .child_alignment = .center, .child_gap = 16 } });
            text(u, "VLC Media Player", 1, 24, u.theme.foreground);
            text(u, "Drop a video here or open a media file", 0, 14, u.theme.muted_foreground);
            if (W.button(u, id("open-empty"), .{ .label = "Open media", .icon = ix(.folder), .size = .sm, .radius = 4 })) self.open_files();
            if (self.notice.len > 0) text(u, self.notice, 0, 14, u.theme.primary);
            u.close();
        }
        if (self.notice.len > 0 and self.player != null) {
            u.open(id("playback-error"), .{ .layout = .{ .padding = .all(16) }, .background_color = u.theme.popover, .corner_radius = .all(4), .floating = .{ .attach_to = .element_with_id, .parent_id = id("video").id, .attach_points = .{ .element = .center_center, .parent = .center_center }, .z_index = 90 } });
            text(u, self.notice, 0, 14, u.theme.primary);
            u.close();
        }
        u.close();
        u.close();
        self.build_controls(u);
        if (self.preferences or self.info) self.build_settings(u);
        u.close();
    }
    fn skin(_: *Program, u: *ui.Ui) void {
        const dark = u.theme.dark;
        u.theme.background = if (dark) C.rgb(27, 27, 27) else C.rgb(213, 213, 213);
        u.theme.foreground = if (dark) C.rgb(234, 234, 234) else C.rgb(22, 22, 22);
        u.theme.muted_foreground = if (dark) C.rgb(143, 143, 143) else C.rgb(64, 64, 64);
        u.theme.card = if (dark) C.rgb(42, 41, 38) else C.rgb(237, 237, 237);
        u.theme.primary = if (dark) C.rgb(211, 121, 24) else C.rgb(232, 133, 26);
        u.theme.primary_foreground = C.rgb(14, 14, 14);
        u.theme.accent = if (dark) C.rgb(55, 55, 55) else C.rgb(179, 179, 179);
        u.theme.border = if (dark) C.rgb(55, 55, 55) else C.rgb(179, 179, 179);
        u.theme.popover = if (dark) C.rgb(25, 25, 25) else C.rgb(237, 237, 237);
        u.theme.sidebar = if (dark) C.rgb(14, 14, 14) else C.rgb(221, 221, 221);
    }
    fn button(_: *Program, u: *ui.Ui, name: []const u8, glyph: assets.Icon, active: bool) bool {
        return W.button(u, id(name), .{ .icon = ix(glyph), .icon_size = 24, .variant = if (active) .default else .ghost, .size = .icon_sm, .radius = 4 });
    }
    fn build_sidebar(self: *Program, u: *ui.Ui) void {
        u.open(id("navigation"), .{ .layout = .{ .sizing = .{ .width = .fixed(50), .height = .grow(.{}) }, .direction = .top_to_bottom, .padding = .axes(8, 8), .child_gap = 16 } });
        const glyphs = [_]assets.Icon{ .home, .videos, .music, .streaming, .playlist, .recent, .add };
        for (glyphs, 0..) |glyph, i| {
            const key = Id.seeded("library", @intCast(i));
            if (W.button(u, key, .{ .icon = ix(glyph), .icon_size = 24, .variant = .ghost, .size = .icon_sm, .radius = 4 })) {
                if (i == 6) self.open_files() else if (i == 4) self.sidebar = true;
            }
        }
        u.close();
        u.open(id("playlist"), .{ .layout = .{ .sizing = .{ .width = .fixed(300), .height = .grow(.{}) }, .direction = .top_to_bottom, .padding = .all(20), .child_gap = 16 }, .background_color = u.theme.sidebar, .clip = .{ .vertical = true } });
        text(u, "Playlists", 0, 16, u.theme.foreground);
        text(u, self.format("{d} items", .{self.playlist.items.len}), 0, 14, u.theme.muted_foreground);
        W.separator(u, id("playlist-rule"), false, 260);
        if (W.button(u, id("playlist-add"), .{ .label = "Add media", .icon = ix(.add), .variant = .ghost, .size = .sm, .align_left = true, .font = .regular, .radius = 4 })) self.open_files();
        for (self.playlist.items, 0..) |path, i| {
            const key = Id.seeded("playlist-entry", @intCast(i));
            if (W.button(u, key, .{ .label = std.fs.path.basename(path), .icon = ix(.videos), .variant = if (self.current == i) .secondary else .ghost, .size = .sm, .width = 260, .align_left = true, .font = .regular, .radius = 4 })) self.load(i);
        }
        u.close();
    }
    fn build_controls(self: *Program, u: *ui.Ui) void {
        var advance: ?bool = null;
        defer if (advance) |backwards| {
            self.next(backwards);
            u.request_redraw();
        };
        const p = self.player;
        const playing = if (p) |value| !value.is_paused() else false;
        u.open(id("playback-controls"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(50) }, .padding = .axes(16, 0), .child_gap = 8, .child_alignment = .{ .y = .center } } });
        if (self.button(u, "previous", .previous, false)) advance = true;
        if (self.button(u, "play-pause", if (playing) .pause else .play, true)) {
            if (p) |value| value.toggle_pause() catch {} else self.open_files();
        }
        if (self.button(u, "next", .next, false)) advance = false;
        const position = if (p) |value| value.position() else 0;
        const duration = if (p) |value| value.duration() else 0;
        text(u, self.time(position), 4, 14, u.theme.muted_foreground);
        u.clickable(id("seek"));
        u.open(id("seek"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(28) } }, .custom = .{ .data = &self.seek_custom } });
        u.close();
        if (u.pressed(id("seek")) and self.seek_rect.w > 0) if (p) |value| value.seek(std.math.clamp((u.pointer().x - self.seek_rect.x) / self.seek_rect.w, 0, 1) * duration) catch {};
        text(u, self.time(duration), 4, 14, u.theme.muted_foreground);
        if (self.button(u, "mute", .volume, false)) if (p) |value| value.set_muted(!value.is_muted()) catch {};
        u.clickable(id("volume"));
        u.open(id("volume"), .{ .layout = .{ .sizing = .{ .width = .fixed(90), .height = .fixed(24) } }, .custom = .{ .data = &self.volume_custom } });
        u.close();
        if (u.pressed(id("volume")) and self.volume_rect.w > 0) if (p) |value| value.set_volume(std.math.clamp((u.pointer().x - self.volume_rect.x) / self.volume_rect.w, 0, 1)) catch {};
        if (self.button(u, "tracks", .subtitles, false)) {
            self.info = !self.info;
            self.preferences = false;
        }
        if (self.button(u, "preferences", .settings, false)) {
            self.preferences = !self.preferences;
            self.info = false;
        }
        if (self.button(u, "playlist-button", .playlist, false)) self.sidebar = !self.sidebar;
        u.close();
    }
    fn time(self: *Program, seconds: f64) []const u8 {
        const whole: u64 = @intFromFloat(@max(0, seconds));
        return self.format("{d:0>2}:{d:0>2}:{d:0>2}", .{ whole / 3600, (whole / 60) % 60, whole % 60 });
    }
    fn build_settings(self: *Program, u: *ui.Ui) void {
        u.open(id("settings-panel"), .{ .layout = .{ .sizing = .{ .width = .fixed(420), .height = .fit(.{}) }, .direction = .top_to_bottom, .padding = .all(24), .child_gap = 16 }, .background_color = u.theme.popover, .corner_radius = .all(8), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.lg, .floating = .{ .attach_to = .element_with_id, .parent_id = id("player-root").id, .attach_points = .{ .element = .center_center, .parent = .center_center }, .z_index = 100 } });
        text(u, if (self.info) "Media information" else "Preferences", 1, 20, u.theme.foreground);
        if (self.info) {
            if (self.player) |p| {
                const meta = p.metadata();
                text(u, self.format("{d} × {d} · {s}", .{ meta.width, meta.height, meta.video_codec orelse "Audio" }), 0, 14, u.theme.foreground);
                for (p.tracks()) |track| text(u, self.format("{s} · {s} · {s}", .{ @tagName(track.kind), track.codec, track.language orelse "und" }), 0, 14, u.theme.muted_foreground);
            } else text(u, "Open a media file to inspect its tracks", 0, 14, u.theme.muted_foreground);
        } else {
            text(u, "Playback", 1, 14, u.theme.foreground);
            if (W.button(u, id("repeat"), .{ .label = if (self.repeat) "Repeat playlist: On" else "Repeat playlist: Off", .variant = .outline, .size = .sm, .radius = 4 })) self.repeat = !self.repeat;
            text(u, "Appearance", 1, 14, u.theme.foreground);
            if (W.button(u, id("appearance"), .{ .label = if (u.theme.dark) "Switch to light mode" else "Switch to dark mode", .variant = .outline, .size = .sm, .radius = 4 })) u.toggle_theme();
            text(u, "Keyboard shortcuts", 1, 14, u.theme.foreground);
            text(u, "Space    Play / Pause", 4, 13, u.theme.muted_foreground);
            text(u, "Left / Right    Seek 5 seconds", 4, 13, u.theme.muted_foreground);
            text(u, "Up / Down    Volume", 4, 13, u.theme.muted_foreground);
            text(u, "M    Mute       F    Fullscreen", 4, 13, u.theme.muted_foreground);
            text(u, "Ctrl+O    Open media", 4, 13, u.theme.muted_foreground);
        }
        if (W.button(u, id("close-settings"), .{ .label = "Done", .size = .sm, .radius = 4 })) {
            self.preferences = false;
            self.info = false;
        }
        u.close();
    }
    fn draw_video(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        canvas.fill_rounded(rect, .all(8 * self.layout_scale), .{ .solid = self.video_background });
        const p = self.player orelse return;
        const x: i32 = @intFromFloat(@round(rect.x));
        const y: i32 = @intFromFloat(@round(rect.y));
        if (x < 0 or y < 0) return;
        const width: u31 = @intFromFloat(@max(0, @min(rect.w, @as(f32, @floatFromInt(canvas.width)) - rect.x)));
        const height: u31 = @intFromFloat(@max(0, @min(rect.h, @as(f32, @floatFromInt(canvas.height)) - rect.y)));
        if (width == 0 or height == 0) return;
        const picture = p.current_frame() orelse return;
        const resize = if (self.video_cache) |cache| cache.view.width != width or cache.view.height != height else true;
        if (resize) {
            const replacement = zdl.surface.Surface.init(self.allocator, width, height, .rgba8, null) catch {
                self.notice = "Out of memory";
                return;
            };
            if (self.video_cache) |*cache| cache.deinit();
            self.video_cache = replacement;
            self.cached_seconds = null;
        }
        const cache = &self.video_cache.?;
        if (self.cached_seconds == null or self.cached_seconds.? != picture.seconds) {
            _ = p.draw(cache.view) catch |err| {
                self.notice = @errorName(err);
                p.pause();
                self.frame_ui.?.request_redraw();
                return;
            };
            self.cached_seconds = picture.seconds;
        }
        const offset = @as(usize, @intCast(y)) * canvas.stride + @as(usize, @intCast(x)) * 4;
        for (0..height) |row| {
            @memcpy(canvas.pixels[offset + row * canvas.stride ..][0 .. @as(usize, width) * 4], cache.view.data[row * cache.view.stride ..][0 .. @as(usize, width) * 4]);
        }
    }
    fn draw_seek(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        self.seek_rect = .{ .x = rect.x / self.layout_scale, .y = rect.y / self.layout_scale, .w = rect.w / self.layout_scale, .h = rect.h / self.layout_scale };
        const ratio = if (self.player) |p| if (p.duration() > 0) std.math.clamp(p.position() / p.duration(), 0, 1) else 0 else 0;
        const base = C.rgb(9, 9, 9);
        const orange = C.rgb(211, 121, 24);
        canvas.fill_rounded(rect, .all(4 * self.layout_scale), .{ .solid = base });
        const played = rect.w * @as(f32, @floatCast(ratio));
        canvas.fill_rounded(.{ .x = rect.x, .y = rect.y, .w = played, .h = rect.h }, .all(4 * self.layout_scale), .{ .solid = C.rgb(55, 31, 6) });
        canvas.fill_rounded(.{ .x = rect.x + @max(0, played - 4 * self.layout_scale), .y = rect.y + 3 * self.layout_scale, .w = 8 * self.layout_scale, .h = rect.h - 6 * self.layout_scale }, .all(3 * self.layout_scale), .{ .solid = orange });
    }
    fn draw_volume(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        self.volume_rect = .{ .x = rect.x / self.layout_scale, .y = rect.y / self.layout_scale, .w = rect.w / self.layout_scale, .h = rect.h / self.layout_scale };
        const volume = if (self.player) |p| if (p.is_muted()) 0 else p.get_volume() else 0;
        canvas.fill_rounded(rect, .all(3 * self.layout_scale), .{ .solid = C.rgb(9, 9, 9) });
        canvas.fill_rounded(.{ .x = rect.x + 4 * self.layout_scale, .y = rect.y + 8 * self.layout_scale, .w = @max(0, (rect.w - 8 * self.layout_scale) * volume), .h = 8 * self.layout_scale }, .all(2 * self.layout_scale), .{ .solid = C.rgb(134, 166, 16) });
    }
};
pub fn main(init: std.process.Init) !void {
    var app = Program{ .allocator = init.gpa, .io = init.io };
    defer app.deinit();
    var options = ui.Options{ .title = "VLC Media Player", .fonts = &assets.fonts, .icons = &assets.icons, .dark = true, .titlebar_height = 40 };
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    while (args.next()) |arg| {
        if (std.mem.eql(u8, arg, "--smoke")) options.smoke = true else if (std.mem.eql(u8, arg, "--snapshot")) options.snapshot_path = args.next() orelse return error.MissingSnapshotPath else if (std.mem.eql(u8, arg, "--light")) options.dark = false else if (std.mem.eql(u8, arg, "--playlist")) app.sidebar = true else try app.add(arg);
    }
    if (app.playlist.items.len > 0) {
        app.load(0);
        if (app.player) |p| {
            for (0..20) |_| {
                try p.update();
                try zdl.system.timer.delay_precise_ns(init.io, 10 * std.time.ns_per_ms);
            }
        }
    }
    try ui.run(Program, &app, init, options);
}
