//! Native dashboard-01: zlay layout, shaped Geist text and owned interactive state.
const std = @import("std");
const zdl = @import("zdl");
const zlay = @import("zlay");
const ui = @import("ui");
const assets = @import("assets");
const data = @import("data.zig");
const curve = @import("curve.zig");
const W = ui.widgets;
const Id = zlay.ElementId;
const C = ui.Color;
fn id(name: []const u8) Id {
    return Id.named(name);
}
fn rid(name: []const u8, row: usize) Id {
    return Id.seeded(name, @intCast(row));
}
fn icon(value: assets.Icon) u16 {
    return @backingInt(value);
}
fn txt(u: *ui.Ui, text: []const u8, font: u16, size: u16, color: C) void {
    u.text_run(text, .{ .font = font, .size = size, .line_height = size + 6, .color = color, .wrap = .none });
}
fn spacer(u: *ui.Ui, name: []const u8) void {
    u.open(id(name), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) } } });
    u.close();
}
const Row = struct {
    section: data.Section,
    selected: bool = false,
    target: [16]u8 = undefined,
    target_len: usize = 0,
    limit: [16]u8 = undefined,
    limit_len: usize = 0,
    deleted: bool = false,
    header: [256]u8 = undefined,
    header_len: usize = 0,
    header_set: bool = false,
};
const Menu = enum { none, user, more, columns, rows, reviewer, actions, add, help, range, draft_type, draft_status, draft_reviewer };
const reviewers = [_][]const u8{ "Eddie Lake", "Jamik Tashpulatov", "Emily Whalen", "Assign reviewer" };
const Draft = struct {
    row: usize,
    header: [256]u8 = undefined,
    header_len: usize = 0,
    target: [16]u8 = undefined,
    target_len: usize = 0,
    limit: [16]u8 = undefined,
    limit_len: usize = 0,
    section_type: []const u8,
    status: data.Status,
    reviewer: []const u8,
};
fn row_title(row: *const Row) []const u8 {
    return if (row.header_set) row.header[0..row.header_len] else row.section.header;
}
fn status_label(status: data.Status) []const u8 {
    return switch (status) {
        .done => "Done",
        .in_process => "In Process",
        .not_started => "Not Started",
    };
}

const Program = struct {
    rows: [100]Row = undefined,
    draft: ?Draft = null,
    draft_chart: ui.Custom = undefined,
    replace_focus: u32 = 0,
    count: usize = data.sections.len,
    sidebar: bool = true,
    active_nav: usize = 0,
    tab: usize = 0,
    range: usize = 0,
    page: usize = 0,
    page_size: usize = 10,
    menu: Menu = .none,
    anchor: Id = .{},
    menu_row: usize = 0,
    cols: [6]bool = @splat(true),
    drag_row: ?usize = null,
    scratch: [256][128]u8 = undefined,
    scratch_count: usize = 0,
    avatar: ?zdl.image.load.Image = null,
    avatar_custom: ui.Custom = undefined,
    avatar_color_custom: ui.Custom = undefined,
    chart_custom: ui.Custom = undefined,
    chart_u: ?*ui.Ui = null,
    chart_box: ui.Rect = .{ .x = 0, .y = 0, .w = 0, .h = 0 },
    hover_visit: ?usize = null,
    notice: []const u8 = "",
    fn init() Program {
        var p: Program = .{};
        for (data.sections, 0..) |section, i| {
            p.rows[i] = .{ .section = section, .target_len = section.target.len, .limit_len = section.limit.len };
            @memcpy(p.rows[i].target[0..section.target.len], section.target);
            @memcpy(p.rows[i].limit[0..section.limit.len], section.limit);
        }
        return p;
    }
    fn format(self: *Program, comptime pattern: []const u8, args: anytype) []const u8 {
        const i = self.scratch_count;
        self.scratch_count += 1;
        return std.fmt.bufPrint(&self.scratch[i], pattern, args) catch "";
    }
    fn toggle(self: *Program, menu: Menu, anchor: Id) void {
        self.menu = if (self.menu == menu and self.anchor.id == anchor.id) .none else menu;
        self.anchor = anchor;
    }
    fn collect_filtered(self: *Program, out: *[100]usize) usize {
        var n: usize = 0;
        for (self.rows[0..self.count], 0..) |row, i| {
            if (row.deleted) continue;
            if (self.tab == 1 and !std.mem.eql(u8, row.section.header, "Past Performance") and !std.mem.eql(u8, row.section.section_type, "Research")) continue;
            if (self.tab == 2 and !std.mem.eql(u8, row.section.reviewer, "Eddie Lake")) continue;
            if (self.tab == 3 and row.section.status != .in_process) continue;
            out[n] = i;
            n += 1;
        }
        return n;
    }
    pub fn event(self: *Program, u: *ui.Ui, ev: zdl.events.event.Event) void {
        switch (ev) {
            .key => |key| if (key.kind == .down) {
                if (key.scancode == .escape) {
                    if (self.menu != .none) self.menu = .none else self.draft = null;
                    u.focus = 0;
                }
                if (key.scancode == .a and (key.modifiers.left_ctrl or key.modifiers.right_ctrl)) self.replace_focus = u.focus;
                if (key.scancode == .backspace) {
                    if (self.draft != null and (u.focus == id("draft-header").id or u.focus == id("draft-target").id or u.focus == id("draft-limit").id)) self.edit_draft(u.focus, null) else self.edit(u.focus, null);
                }
            },
            .text_input => |input| {
                if (self.draft != null and (u.focus == id("draft-header").id or u.focus == id("draft-target").id or u.focus == id("draft-limit").id)) {
                    self.edit_draft(u.focus, input.text);
                } else {
                    for (input.text) |ch| {
                        if (ch >= '0' and ch <= '9') self.edit(u.focus, ch);
                    }
                }
            },
            else => {},
        }
    }
    fn edit(self: *Program, focus: u32, char: ?u8) void {
        for (self.rows[0..self.count], 0..) |*row, i| {
            const target = rid("target", i).id == focus;
            if (!target and rid("limit", i).id != focus) continue;
            const buf = if (target) &row.target else &row.limit;
            const len = if (target) &row.target_len else &row.limit_len;
            if (self.replace_focus == focus) {
                len.* = 0;
                self.replace_focus = 0;
            }
            if (char) |ch| {
                if (len.* < buf.len) {
                    buf[len.*] = ch;
                    len.* += 1;
                }
            } else {
                len.* -|= 1;
            }
        }
    }
    pub fn build(self: *Program, u: *ui.Ui) void {
        self.scratch_count = 0;
        self.chart_u = u;
        self.avatar_custom = .{ .draw = draw_avatar, .context = self };
        self.avatar_color_custom = .{ .draw = draw_avatar_color, .context = self };
        self.chart_custom = .{ .draw = draw_chart, .context = self };
        if (self.menu != .none and u.pointer_pressed() and !u.hovered(id("popover")) and !u.hovered(self.anchor)) self.menu = .none;
        const width = u.layout.getLayoutDimensions().width;
        const sidebar_width: f32 = if (self.sidebar and width >= 900) 280 else 64;
        u.open(id("root"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .padding = .{ .top = 8, .right = 8, .bottom = 8 }, .child_gap = 8 }, .background_color = u.theme.sidebar });
        self.build_sidebar(u, sidebar_width);
        u.open(id("inset"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .direction = .top_to_bottom }, .background_color = u.theme.background, .corner_radius = .all(14), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.inset });
        u.open(id("header"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(48) }, .padding = .{ .left = 16, .right = 148 }, .child_gap = 16, .child_alignment = .{ .y = .center } }, .border = .{ .color = u.theme.border, .width = .{ .bottom = 1 } } });
        if (W.button(u, id("sidebar-toggle"), .{ .icon = icon(.lucide_panel_left), .variant = .ghost, .size = .icon_sm })) self.sidebar = !self.sidebar;
        W.separator(u, id("header-separator"), true, 16);
        txt(u, "Documents", 1, 16, u.theme.foreground);
        spacer(u, "header-fill");
        if (W.button(u, id("github"), .{ .label = "GitHub", .variant = .ghost, .size = .sm })) self.notice = "Source: github.com/Addonay/zdl";
        u.close();
        u.drag_regions.add(.{ .rect = .{ .x = @intFromFloat(sidebar_width + 168), .y = 8, .width = @intFromFloat(@max(0, width - sidebar_width - 420)), .height = 40 }, .kind = .draggable }) catch {};
        u.open(id("scroll-content"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .padding = .all(24), .direction = .top_to_bottom, .child_gap = 24 }, .clip = .{ .vertical = true } });
        self.build_cards(u, width - sidebar_width - 64);
        self.build_chart(u);
        self.build_table(u);
        if (self.notice.len > 0) txt(u, self.notice, 0, 13, u.theme.muted_foreground);
        u.close();
        u.close();
        self.build_drawer(u);
        self.build_menu(u);
        u.close();
    }
    fn build_sidebar(self: *Program, u: *ui.Ui, width: f32) void {
        const full = width > 64;
        u.open(id("sidebar"), .{ .layout = .{ .sizing = .{ .width = .fixed(width), .height = .grow(.{}) }, .direction = .top_to_bottom, .padding = .{ .left = 16, .right = 8, .top = 8, .bottom = 8 }, .child_gap = 8 } });
        u.open(id("brand"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(32) }, .child_gap = 8, .padding = .axes(6, 0), .child_alignment = .{ .y = .center } } });
        u.icon(id("brand-icon"), icon(.tabler_inner_shadow_top), 20, u.theme.foreground);
        if (full) txt(u, "Acme Inc.", 2, 16, u.theme.foreground);
        u.close();
        u.open(id("quick-create-row"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fit(.{}) }, .padding = .{ .top = 8 }, .child_gap = 8 } });
        if (W.button(u, id("quick"), .{ .label = if (full) "Quick Create" else "", .align_left = full, .icon = icon(.tabler_circle_plus_filled), .width = if (full) width - 64 else 32, .size = .sm, .font = .regular, .padding_x = 8 })) self.toggle(.add, id("quick"));
        if (full and W.button(u, id("mail"), .{ .icon = icon(.tabler_mail), .variant = .outline, .size = .icon_sm })) self.notice = "No unread messages";
        u.close();
        const labels = [_][]const u8{ "Dashboard", "Lifecycle", "Analytics", "Projects", "Team", "Data Library", "Reports", "Word Assistant", "More" };
        const icons = [_]assets.Icon{ .tabler_dashboard, .tabler_list_details, .tabler_chart_bar, .tabler_folder, .tabler_users, .tabler_database, .tabler_report, .tabler_file_word, .tabler_dots };
        u.open(id("nav-list"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 4 } });
        for (labels, icons, 0..) |label, glyph, i| {
            if (i == 5 and full) {
                u.open(id("documents-label"), .{ .layout = .{ .padding = .{ .top = 24, .left = 8, .bottom = 6 } } });
                txt(u, "Documents", 0, 12, u.theme.muted_foreground);
                u.close();
            }
            const key = rid("nav", i);
            if (W.button(u, key, .{ .label = if (full) label else "", .icon = icon(glyph), .variant = .ghost, .size = .sm, .width = width - 24, .align_left = full, .font = .regular, .padding_x = 8 })) {
                if (i == 8) self.toggle(.more, key) else {
                    self.active_nav = i;
                    self.notice = label;
                }
            }
        }
        u.close();
        spacer(u, "sidebar-space");
        const footer_labels = [_][]const u8{ "Settings", "Get Help", "Search" };
        const footer_icons = [_]assets.Icon{ .tabler_settings, .tabler_help, .tabler_search };
        for (footer_labels, footer_icons, 0..) |label, glyph, i| if (W.button(u, rid("secondary", i), .{ .label = if (full) label else "", .icon = icon(glyph), .variant = .ghost, .size = .sm, .width = width - 24, .align_left = full, .font = .regular, .padding_x = 8 })) {
            if (i == 0) u.toggle_theme() else self.notice = if (i == 1) "Use Tab to navigate, Enter to activate, and Escape to dismiss." else "Search documents from the table headers.";
        };
        u.clickable(id("user-row"));
        u.focusable(id("user-row"));
        u.open(id("user-row"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(48) }, .child_gap = 8, .padding = .axes(8, 0), .child_alignment = .{ .y = .center } } });
        u.open(id("avatar"), .{ .layout = .{ .sizing = .{ .width = .fixed(32), .height = .fixed(32) } }, .custom = .{ .data = &self.avatar_custom } });
        u.close();
        if (full) {
            u.open(id("user-name"), .{ .layout = .{ .direction = .top_to_bottom, .sizing = .{ .width = .grow(.{}) } } });
            u.text_run("shadcn", .{ .font = 1, .size = 14, .line_height = 18, .color = u.theme.foreground });
            u.text_run("m@example.com", .{ .font = 0, .size = 12, .line_height = 16, .color = u.theme.muted_foreground });
            u.close();
            if (W.button(u, id("user-menu"), .{ .icon = icon(.tabler_dots_vertical), .variant = .ghost, .size = .icon_sm })) self.toggle(.user, id("user-row"));
        }
        u.close();
        if (u.pressed(id("user-row")) and !u.pressed(id("user-menu"))) self.toggle(.user, id("user-row"));
        u.close();
    }
    fn draw_avatar(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        if (self.avatar) |photo| canvas.draw_image(photo.surface.view, rect, .{ .radius = rect.w / 4, .grayscale = true }) catch {};
    }
    fn draw_avatar_color(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        if (self.avatar) |photo| canvas.draw_image(photo.surface.view, rect, .{ .radius = rect.w / 4 }) catch {};
    }
    fn build_cards(self: *Program, u: *ui.Ui, width: f32) void {
        _ = self;
        const columns: f32 = if (width < 900) 2 else 4;
        const card_width = (width - 16 * (columns - 1)) / columns;
        const titles = [_][]const u8{ "Total Revenue", "New Customers", "Active Accounts", "Growth Rate" };
        const values = [_][]const u8{ "$1,250.00", "1,234", "45,678", "4.5%" };
        const badges = [_][]const u8{ "+12.5%", "-20%", "+12.5%", "+4.5%" };
        const headlines = [_][]const u8{ "Trending up this month", "Down 20% this period", "Strong user retention", "Steady performance increase" };
        const notes = [_][]const u8{ "Visitors for the last 6 months", "Acquisition needs attention", "Engagement exceed targets", "Meets growth projections" };
        u.open(id("cards"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 16, .direction = if (width < 900) .top_to_bottom else .left_to_right } });
        for (0..4) |i| {
            if (width < 900 and i % 2 == 0) u.open(rid("card-row", i / 2), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 16 } });
            u.open(rid("card", i), .{ .layout = .{ .sizing = .{ .width = .fixed(card_width), .height = .fixed(204) }, .padding = .all(25), .direction = .top_to_bottom, .child_gap = 8 }, .background_color = u.theme.card, .corner_radius = .all(14), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.card });
            u.open(rid("card-heading", i), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 8, .child_alignment = .{ .y = .top } } });
            const min_value = u.measure(values[i], .{ .font = 2, .size = 30, .color = u.theme.foreground });
            u.open(rid("card-heading-text", i), .{ .layout = .{ .sizing = .{ .width = .grow(.{ .min = min_value }) }, .direction = .top_to_bottom, .child_gap = 8 } });
            txt(u, titles[i], 0, 14, u.theme.muted_foreground);
            txt(u, values[i], 2, 30, u.theme.foreground);
            u.close();
            W.badge(u, rid("card-badge", i), .{ .label = badges[i], .icon = icon(if (i == 1) .tabler_trending_down else .tabler_trending_up) });
            u.close();
            u.open(rid("card-footer", i), .{ .layout = .{ .direction = .top_to_bottom, .sizing = .{ .width = .grow(.{}) }, .padding = .{ .top = 16 }, .child_gap = 6 } });
            u.open(rid("trend-line", i), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 8 } });
            u.text_run(headlines[i], .{ .font = 1, .size = 14, .line_height = 20, .color = u.theme.foreground });
            u.icon(rid("trend-icon", i), icon(if (i == 1) .tabler_trending_down else .tabler_trending_up), 16, u.theme.foreground);
            u.close();
            u.text_run(notes[i], .{ .font = 0, .size = 14, .line_height = 20, .color = u.theme.muted_foreground });
            u.close();
            u.close();
            if (width < 900 and i % 2 == 1) u.close();
        }
        u.close();
    }
    fn build_chart(self: *Program, u: *ui.Ui) void {
        u.open(id("chart-card"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(392) }, .direction = .top_to_bottom, .padding = .all(25), .child_gap = 24 }, .background_color = u.theme.card, .corner_radius = .all(14), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.xs });
        u.open(id("chart-heading"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_alignment = .{ .y = .top }, .child_gap = 8 } });
        u.open(id("chart-title"), .{ .layout = .{ .direction = .top_to_bottom, .sizing = .{ .width = .grow(.{}) }, .child_gap = 8 } });
        u.text_run("Total Visitors", .{ .font = 2, .size = 16, .line_height = 16, .color = u.theme.foreground });
        txt(u, if (u.layout.getLayoutDimensions().width < 900) "Last 3 months" else "Total for the last 3 months", 0, 14, u.theme.muted_foreground);
        u.close();
        const labels = [_][]const u8{ "Last 3 months", "Last 30 days", "Last 7 days" };
        if (u.layout.getLayoutDimensions().width < 900) {
            if (W.select_trigger(u, id("range-select"), labels[self.range], 150, false, icon(.lucide_chevron_down))) self.toggle(.range, id("range-select"));
        } else {
            u.open(id("range-group"), .{ .layout = .{ .sizing = .{ .width = .fit(.{}) } } });
            for (labels, 0..) |label, i| {
                if (W.toggle_item(u, rid("range", i), label, self.range == i, if (i == 0) .first else if (i == 2) .last else .middle)) self.range = i;
            }
            u.close();
        }
        u.close();
        u.open(id("plot"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) } }, .custom = .{ .data = &self.chart_custom } });
        u.close();
        if (self.hover_visit) |i| {
            u.open(id("tooltip"), .{ .layout = .{ .padding = .all(10), .direction = .top_to_bottom, .child_gap = 4 }, .background_color = u.theme.popover, .border = .{ .color = u.theme.border, .width = .outside(1) }, .corner_radius = .all(6), .floating = .{ .attach_to = .element_with_id, .parent_id = id("plot").id, .attach_points = .{ .element = .left_top, .parent = .left_top }, .offset = .{ .x = std.math.clamp(u.pointer().x - self.chart_box.x + 12, 0, @max(0, self.chart_box.w - 170)), .y = 10 }, .z_index = 80 } });
            const v = data.visits[i];
            txt(u, self.format("{s} {d}, 2024", .{ if (v.month == 4) "April" else if (v.month == 5) "May" else "June", v.day }), 1, 13, u.theme.foreground);
            txt(u, self.format("Desktop  {d}", .{v.desktop}), 0, 13, u.theme.foreground);
            txt(u, self.format("Mobile    {d}", .{v.mobile}), 0, 13, u.theme.muted_foreground);
            u.close();
        }
        u.close();
    }
    fn draw_chart(canvas: *ui.Canvas, box: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        const u = self.chart_u.?;
        const scale = u.scale;
        // CardContent has 24pt top padding; the SVG has 5pt margins and a 30pt X axis.
        const svg_box: ui.Rect = .{ .x = box.x, .y = box.y + 24 * scale, .w = box.w, .h = box.h - 24 * scale };
        const rect: ui.Rect = .{ .x = svg_box.x + 5 * scale, .y = svg_box.y + 5 * scale, .w = svg_box.w - 10 * scale, .h = svg_box.h - 40 * scale };
        if (rect.w <= 0 or rect.h <= 0) return;
        self.chart_box = .{ .x = rect.x / scale, .y = rect.y / scale, .w = rect.w / scale, .h = rect.h / scale };
        const count: usize = if (self.range == 0) data.visits.len else if (self.range == 1) 31 else 8;
        const start = data.visits.len - count;
        const bottom = rect.bottom();
        var maximum: f64 = 0;
        for (data.visits[start..]) |v| maximum = @max(maximum, @as(f64, @floatFromInt(v.desktop + v.mobile)));
        const upper = curve.upper_bound(maximum);
        var top_values: [128]f64 = undefined;
        var mid_values: [128]f64 = undefined;
        for (data.visits[start..], 0..) |v, i| {
            top_values[i] = bottom - @as(f64, rect.h) * @as(f64, @floatFromInt(v.desktop + v.mobile)) / upper;
            mid_values[i] = bottom - @as(f64, rect.h) * @as(f64, @floatFromInt(v.mobile)) / upper;
        }
        const top_curve = curve.Natural.init(top_values[0..count]) catch return;
        const mid_curve = curve.Natural.init(mid_values[0..count]) catch return;
        for (0..5) |i| {
            const y = rect.y + rect.h * @as(f32, @floatFromInt(i)) / 4;
            canvas.fill_rect(.{ .x = rect.x, .y = y - scale / 2, .w = rect.w, .h = scale }, .{ .solid = u.theme.border.withAlpha(u.theme.border.a / 2) });
        }
        var top_points: [1025]ui.canvas.Point = undefined;
        var mid_points: [1025]ui.canvas.Point = undefined;
        const samples = (count - 1) * 8 + 1;
        var min_top = bottom;
        var min_mid = bottom;
        var max_mid = rect.y;
        for (0..samples) |i| {
            const position = @as(f64, @floatFromInt(i)) / 8;
            const x = rect.x + rect.w * @as(f32, @floatCast(position / @as(f64, @floatFromInt(count - 1))));
            const top: f32 = @floatCast(top_curve.at(position));
            const mid: f32 = @floatCast(mid_curve.at(position));
            top_points[i] = .{ .x = x, .y = top };
            mid_points[i] = .{ .x = x, .y = mid };
            min_top = @min(min_top, top);
            min_mid = @min(min_mid, mid);
            max_mid = @max(max_mid, mid);
        }
        const desktop_paint: ui.canvas.Paint = .{ .vertical = .{ .top_color = u.theme.primary, .bottom_color = u.theme.primary.withAlpha(25.5), .top_y = min_top + (max_mid - min_top) * 0.05, .bottom_y = min_top + (max_mid - min_top) * 0.95 } };
        const mobile_paint: ui.canvas.Paint = .{ .vertical = .{ .top_color = u.theme.primary.withAlpha(204), .bottom_color = u.theme.primary.withAlpha(25.5), .top_y = min_mid + (bottom - min_mid) * 0.05, .bottom_y = min_mid + (bottom - min_mid) * 0.95 } };
        const columns: usize = @intFromFloat(@ceil(rect.w));
        canvas.push_clip(rect);
        for (0..columns) |column| {
            const position = @as(f64, @floatFromInt(column)) / @as(f64, rect.w) * @as(f64, @floatFromInt(count - 1));
            const top: f32 = @floatCast(top_curve.at(position));
            const mid: f32 = @floatCast(mid_curve.at(position));
            const x = rect.x + @as(f32, @floatFromInt(column));
            canvas.fill_rect(.{ .x = x, .y = mid, .w = 1, .h = @max(0, bottom - mid) }, mobile_paint);
            canvas.fill_rect(.{ .x = x, .y = @min(top, mid), .w = 1, .h = @abs(mid - top) }, desktop_paint);
        }
        canvas.stroke_polyline(mid_points[0..samples], scale, u.theme.primary);
        canvas.stroke_polyline(top_points[0..samples], scale, u.theme.primary);
        canvas.pop_clip();
        const pointer = u.pointer();
        const previous_hover = self.hover_visit;
        self.hover_visit = if (pointer.x >= self.chart_box.x and pointer.x <= self.chart_box.x + self.chart_box.w and pointer.y >= self.chart_box.y and pointer.y < self.chart_box.y + self.chart_box.h)
            start + @min(count - 1, @as(usize, @intFromFloat(@round((pointer.x - self.chart_box.x) / self.chart_box.w * @as(f32, @floatFromInt(count - 1))))))
        else
            null;
        if (previous_hover != self.hover_visit) u.request_redraw();
        // Recharts preserves the last tick, then greedily fits labels backwards.
        var end = svg_box.right();
        var remaining = count;
        while (remaining > 0) {
            remaining -= 1;
            const v = data.visits[start + remaining];
            const label = self.format("{s} {d}", .{ if (v.month == 4) "Apr" else if (v.month == 5) "May" else "Jun", v.day });
            const size = 12 * scale;
            const tw = u.text.measure(0, label, size) catch 0;
            var x = rect.x + rect.w * @as(f32, @floatFromInt(remaining)) / @as(f32, @floatFromInt(count - 1));
            if (remaining == count - 1) x = @min(x, end - tw / 2);
            if (x - tw / 2 < svg_box.x or x + tw / 2 > end) continue;
            u.text.draw(canvas, 0, label, x - tw / 2, bottom + 22.52 * scale, size, u.theme.muted_foreground) catch {};
            end = x - tw / 2 - 32 * scale;
        }
    }
    fn build_table(self: *Program, u: *ui.Ui) void {
        u.open(id("table-toolbar"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_alignment = .{ .y = .center }, .child_gap = 8 } });
        W.tab_list_begin(u, id("tabs"));
        const labels = [_][]const u8{ "Outline", "Past Performance", "Key Personnel", "Focus Documents" };
        for (labels, 0..) |label, i| if (W.tab(u, rid("tab", i), .{ .label = label, .active = self.tab == i, .count = if (i == 1) 3 else if (i == 2) 2 else null })) {
            self.tab = i;
            self.page = 0;
        };
        W.tab_list_end(u);
        spacer(u, "toolbar-fill");
        if (W.button(u, id("columns"), .{ .label = "Customize Columns", .icon = icon(.tabler_layout_columns), .variant = .outline, .size = .sm })) self.toggle(.columns, id("columns"));
        if (W.button(u, id("add-section"), .{ .label = "Add Section", .icon = icon(.tabler_plus), .variant = .outline, .size = .sm })) self.toggle(.add, id("add-section"));
        u.close();
        var filtered: [100]usize = undefined;
        const n = self.collect_filtered(&filtered);
        const pages = @max(1, (n + self.page_size - 1) / self.page_size);
        self.page = @min(self.page, pages - 1);
        u.open(id("table"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .direction = .top_to_bottom }, .corner_radius = .all(10), .border = .{ .color = u.theme.border, .width = .outside(1) } });
        u.open(id("table-heading"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(42) }, .padding = .axes(12, 0), .child_gap = 12, .child_alignment = .{ .y = .center } }, .background_color = u.theme.muted });
        u.open(id("heading-grip"), .{ .layout = .{ .sizing = .{ .width = .fixed(20) } } });
        u.close();
        var all = true;
        for (filtered[0..n]) |i| if (!self.rows[i].selected) {
            all = false;
            break;
        };
        if (W.checkbox(u, id("select-all"), all, icon(.lucide_check))) for (filtered[0..n]) |i| {
            self.rows[i].selected = !all;
        };
        const headings = [_][]const u8{ "Header", "Section Type", "Status", "Target", "Limit", "Reviewer" };
        for (headings, 0..) |label, i| if (self.cols[i]) {
            self.cell_begin(u, rid("th", i), i);
            u.text_run(label, .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
            u.close();
        };
        u.open(id("heading-actions"), .{ .layout = .{ .sizing = .{ .width = .fixed(32) } } });
        u.close();
        u.close();
        const begin = @min(n, self.page * self.page_size);
        const end = @min(n, begin + self.page_size);
        for (filtered[begin..end]) |i| {
            const row = &self.rows[i];
            const row_id = rid("row", i);
            u.open(row_id, .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(52) }, .padding = .axes(12, 0), .child_gap = 12, .child_alignment = .{ .y = .center } }, .background_color = if (row.selected or u.hovered(row_id)) u.theme.muted else u.theme.background, .border = .{ .color = u.theme.border, .width = .{ .top = 1 } } });
            if (W.button(u, rid("grip", i), .{ .icon = icon(.tabler_grip_vertical), .variant = .ghost, .size = .icon_sm, .width = 20 })) self.drag_row = i;
            if (self.drag_row) |source| if (u.layout.pointerState().state == .released_this_frame and u.hovered(row_id)) {
                std.mem.swap(Row, &self.rows[source], row);
                self.drag_row = null;
            };
            if (W.checkbox(u, rid("select", i), row.selected, icon(.lucide_check))) row.selected = !row.selected;
            for (0..6) |column| if (self.cols[column]) {
                self.cell_begin(u, rid("cell", i * 6 + column), column);
                switch (column) {
                    0 => {
                        const key = rid("open-row", i);
                        u.focusable(key);
                        u.clickable(key);
                        u.open(key, .{ .layout = .{ .sizing = .{ .width = .fit(.{}), .height = .fixed(32) }, .child_alignment = .{ .y = .center } } });
                        txt(u, row_title(row), 1, 14, u.theme.foreground);
                        u.close();
                        if (u.pressed(key)) self.open_draft(i);
                    },
                    1 => W.badge(u, rid("type", i), .{ .label = row.section.section_type, .padding_x = 6, .font = .regular, .foreground = u.theme.muted_foreground }),
                    2 => W.badge(u, rid("status", i), .{ .label = status_label(row.section.status), .padding_x = 6, .font = .regular, .icon = icon(if (row.section.status == .done) .tabler_circle_check_filled else .tabler_loader), .icon_color = if (row.section.status == .done) (if (u.theme.dark) C.rgb(74, 222, 128) else C.rgb(34, 197, 94)) else u.theme.muted_foreground, .foreground = u.theme.muted_foreground }),
                    3 => {
                        if (W.field(u, rid("target", i), row.target[0..row.target_len], .{ .width = 56, .focused = u.is_focused(rid("target", i)) })) u.set_focus(rid("target", i));
                    },
                    4 => {
                        if (W.field(u, rid("limit", i), row.limit[0..row.limit_len], .{ .width = 48, .focused = u.is_focused(rid("limit", i)) })) u.set_focus(rid("limit", i));
                    },
                    5 => {
                        if (W.button(u, rid("reviewer", i), .{ .label = row.section.reviewer, .variant = .ghost, .size = .sm, .font = .regular, .align_left = true, .padding_x = 0 })) {
                            self.menu_row = i;
                            self.toggle(.reviewer, rid("reviewer", i));
                        }
                    },
                    else => {},
                }
                u.close();
            };
            if (W.button(u, rid("actions", i), .{ .icon = icon(.tabler_dots_vertical), .variant = .ghost, .size = .icon_sm })) {
                self.menu_row = i;
                self.toggle(.actions, rid("actions", i));
            }
            u.close();
        }
        u.close();
        u.open(id("pagination"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 16, .child_alignment = .{ .y = .center } } });
        var selected: usize = 0;
        for (self.rows[0..self.count]) |r| {
            if (r.selected and !r.deleted) selected += 1;
        }
        txt(u, self.format("{d} of {d} row(s) selected.", .{ selected, n }), 0, 14, u.theme.muted_foreground);
        spacer(u, "pagination-fill");
        txt(u, "Rows per page", 1, 14, u.theme.foreground);
        if (W.select_trigger(u, id("rows-per-page"), self.format("{d}", .{self.page_size}), 64, true, icon(.lucide_chevron_down))) self.toggle(.rows, id("rows-per-page"));
        txt(u, self.format("Page {d} of {d}", .{ self.page + 1, pages }), 1, 14, u.theme.foreground);
        const glyphs = [_]assets.Icon{ .tabler_chevrons_left, .tabler_chevron_left, .tabler_chevron_right, .tabler_chevrons_right };
        for (glyphs, 0..) |g, i| if (W.button(u, rid("page", i), .{ .icon = icon(g), .variant = .outline, .size = .icon_sm, .disabled = if (i < 2) self.page == 0 else self.page + 1 == pages })) {
            self.page = switch (i) {
                0 => 0,
                1 => self.page -| 1,
                2 => @min(pages - 1, self.page + 1),
                else => pages - 1,
            };
        };
        u.close();
    }
    fn cell_begin(_: *Program, u: *ui.Ui, key: Id, column: usize) void {
        u.open(key, .{ .layout = .{ .sizing = .{ .width = if (column == 0) .grow(.{}) else .fixed(switch (column) {
            1 => 146,
            2 => 130,
            3 => 68,
            4 => 56,
            else => 180,
        }) }, .child_alignment = .{ .y = .center } } });
    }
    fn open_draft(self: *Program, index: usize) void {
        const row = &self.rows[index];
        var draft = Draft{ .row = index, .section_type = row.section.section_type, .status = row.section.status, .reviewer = row.section.reviewer };
        const title = row_title(row);
        draft.header_len = @min(title.len, draft.header.len);
        @memcpy(draft.header[0..draft.header_len], title[0..draft.header_len]);
        draft.target_len = row.target_len;
        @memcpy(draft.target[0..row.target_len], row.target[0..row.target_len]);
        draft.limit_len = row.limit_len;
        @memcpy(draft.limit[0..row.limit_len], row.limit[0..row.limit_len]);
        self.draft = draft;
        self.menu = .none;
    }
    fn commit_draft(self: *Program) void {
        const draft = self.draft orelse return;
        const row = &self.rows[draft.row];
        row.header = draft.header;
        row.header_len = draft.header_len;
        row.header_set = true;
        row.target = draft.target;
        row.target_len = draft.target_len;
        row.limit = draft.limit;
        row.limit_len = draft.limit_len;
        row.section.section_type = draft.section_type;
        row.section.status = draft.status;
        row.section.reviewer = draft.reviewer;
        self.draft = null;
        self.menu = .none;
    }
    fn edit_draft(self: *Program, focus: u32, input: ?[]const u8) void {
        const draft = if (self.draft) |*value| value else return;
        const header = focus == id("draft-header").id;
        const target = focus == id("draft-target").id;
        const bytes: []u8 = if (header) &draft.header else if (target) &draft.target else &draft.limit;
        const len = if (header) &draft.header_len else if (target) &draft.target_len else &draft.limit_len;
        if (self.replace_focus == focus) {
            len.* = 0;
            self.replace_focus = 0;
        }
        if (input) |text_value| {
            const view = std.unicode.Utf8View.init(text_value) catch return;
            var it = view.iterator();
            while (it.nextCodepointSlice()) |slice| {
                if (slice[0] < 32 or slice[0] == 127) continue;
                if (!header and (slice.len != 1 or slice[0] < '0' or slice[0] > '9')) continue;
                if (slice.len > bytes.len - len.*) break;
                @memcpy(bytes[len.*..][0..slice.len], slice);
                len.* += slice.len;
            }
        } else if (len.* > 0) {
            len.* -= 1;
            while (len.* > 0 and bytes[len.*] & 0xc0 == 0x80) len.* -= 1;
        }
    }
    fn draft_field(_: *Program, u: *ui.Ui, name: []const u8, label: []const u8, value: []const u8, width: f32) void {
        u.open(Id.seeded("field-label", id(name).id), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 12 } });
        u.text_run(label, .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
        if (W.field(u, id(name), value, .{ .width = width, .height = 36, .bordered = true, .focused = u.is_focused(id(name)) })) u.set_focus(id(name));
        u.close();
    }
    fn build_drawer(self: *Program, u: *ui.Ui) void {
        const draft = if (self.draft) |*value| value else return;
        u.focusable_count = 0; // Trap keyboard focus inside the open drawer/menu.
        self.draft_chart = .{ .draw = draw_draft_chart, .context = self };
        const dimensions = u.layout.getLayoutDimensions();
        const width = @min(384, dimensions.width);
        const inside = width - 33;
        u.open(id("drawer-scrim"), .{ .layout = .{ .sizing = .{ .width = .fixed(dimensions.width), .height = .fixed(dimensions.height) } }, .background_color = C.rgba(0, 0, 0, 128), .floating = .{ .attach_to = .element_with_id, .parent_id = id("root").id, .attach_points = .{ .element = .left_top, .parent = .left_top }, .z_index = 100, .pointer_capture_mode = .capture } });
        u.close();
        if (u.pointer_pressed() and u.hovered(id("drawer-scrim")) and !u.hovered(id("drawer")) and self.menu == .none) {
            self.draft = null;
            u.request_redraw();
            return;
        }
        u.open(id("drawer"), .{ .layout = .{ .sizing = .{ .width = .fixed(width), .height = .fixed(dimensions.height) }, .direction = .top_to_bottom, .padding = .{ .left = 17, .right = 16, .top = 16, .bottom = 16 }, .child_gap = 0 }, .background_color = u.theme.background, .border = .{ .color = u.theme.border, .width = .{ .left = 1 } }, .floating = .{ .attach_to = .element_with_id, .parent_id = id("root").id, .attach_points = .{ .element = .right_top, .parent = .right_top }, .z_index = 200, .pointer_capture_mode = .capture } });
        u.open(id("drawer-title"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 6, .padding = .{ .bottom = 16 } } });
        u.text_run(draft.header[0..draft.header_len], .{ .font = 2, .size = 16, .line_height = 24, .color = u.theme.foreground });
        txt(u, "Showing total visitors for the last 6 months", 0, 14, u.theme.muted_foreground);
        u.close();
        u.open(id("drawer-scroll"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .direction = .top_to_bottom, .child_gap = 16 }, .clip = .{ .vertical = true } });
        u.open(id("drawer-chart"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(inside * 9 / 16) } }, .custom = .{ .data = &self.draft_chart } });
        u.close();
        W.separator(u, id("drawer-separator-1"), false, inside);
        u.open(id("drawer-explanation"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 8 } });
        u.open(id("drawer-trend"), .{ .layout = .{ .child_gap = 8, .child_alignment = .{ .y = .center } } });
        u.text_run("Trending up by 5.2% this month", .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
        u.icon(id("drawer-trend-icon"), icon(.tabler_trending_up), 16, u.theme.foreground);
        u.close();
        u.text_run("Showing total visitors for the last 6 months. This is just some random text to test the layout. It spans multiple lines and should wrap around.", .{ .font = 0, .size = 14, .line_height = 20, .color = u.theme.muted_foreground, .wrap = .words });
        u.close();
        W.separator(u, id("drawer-separator-2"), false, inside);
        self.draft_field(u, "draft-header", "Header", draft.header[0..draft.header_len], inside);
        u.open(id("draft-select-row"), .{ .layout = .{ .child_gap = 16 } });
        u.open(id("draft-type-label"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 12 } });
        u.text_run("Type", .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
        if (W.select_trigger(u, id("draft-type"), draft.section_type, (inside - 16) / 2, false, icon(.lucide_chevron_down))) self.toggle(.draft_type, id("draft-type"));
        u.close();
        u.open(id("draft-status-label"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 12 } });
        u.text_run("Status", .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
        if (W.select_trigger(u, id("draft-status"), status_label(draft.status), (inside - 16) / 2, false, icon(.lucide_chevron_down))) self.toggle(.draft_status, id("draft-status"));
        u.close();
        u.close();
        u.open(id("draft-number-row"), .{ .layout = .{ .child_gap = 16 } });
        self.draft_field(u, "draft-target", "Target", draft.target[0..draft.target_len], (inside - 16) / 2);
        self.draft_field(u, "draft-limit", "Limit", draft.limit[0..draft.limit_len], (inside - 16) / 2);
        u.close();
        u.open(id("draft-reviewer-label"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 12 } });
        u.text_run("Reviewer", .{ .font = 1, .size = 14, .line_height = 14, .color = u.theme.foreground });
        if (W.select_trigger(u, id("draft-reviewer"), draft.reviewer, inside, false, icon(.lucide_chevron_down))) self.toggle(.draft_reviewer, id("draft-reviewer"));
        u.close();
        u.close();
        u.open(id("drawer-footer"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 8, .padding = .{ .top = 16 } } });
        if (W.button(u, id("submit-draft"), .{ .label = "Submit", .width = inside })) {
            self.commit_draft();
            u.request_redraw();
        }
        if (W.button(u, id("cancel-draft"), .{ .label = "Done", .variant = .outline, .width = inside })) {
            self.draft = null;
            self.menu = .none;
            u.request_redraw();
        }
        u.close();
        u.close();
    }
    fn draw_draft_chart(canvas: *ui.Canvas, box: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        const u = self.chart_u.?;
        const desktop = [_]f64{ 186, 305, 237, 73, 209, 214 };
        const mobile = [_]f64{ 80, 200, 120, 190, 130, 140 };
        var top: [6]f64 = undefined;
        var mid: [6]f64 = undefined;
        const rect: ui.Rect = .{ .x = box.x, .y = box.y + 5 * u.scale, .w = box.w - 10 * u.scale, .h = box.h - 10 * u.scale };
        for (0..6) |i| {
            top[i] = rect.bottom() - @as(f64, rect.h) * (desktop[i] + mobile[i]) / 600;
            mid[i] = rect.bottom() - @as(f64, rect.h) * mobile[i] / 600;
        }
        const tc = curve.Natural.init(&top) catch return;
        const mc = curve.Natural.init(&mid) catch return;
        for (0..5) |i| canvas.fill_rect(.{ .x = rect.x, .y = rect.y + rect.h * @as(f32, @floatFromInt(i)) / 4, .w = rect.w, .h = u.scale }, .{ .solid = u.theme.border.withAlpha(u.theme.border.a / 2) });
        var tp: [129]ui.canvas.Point = undefined;
        var mp: [129]ui.canvas.Point = undefined;
        for (0..129) |i| {
            const t = @as(f64, @floatFromInt(i)) * 5 / 128;
            const x = rect.x + rect.w * @as(f32, @floatFromInt(i)) / 128;
            tp[i] = .{ .x = x, .y = @floatCast(tc.at(t)) };
            mp[i] = .{ .x = x, .y = @floatCast(mc.at(t)) };
        }
        canvas.push_clip(rect);
        const columns: usize = @intFromFloat(@ceil(rect.w));
        for (0..columns) |i| {
            const t = @as(f64, @floatFromInt(i)) / @as(f64, rect.w) * 5;
            const ty: f32 = @floatCast(tc.at(t));
            const my: f32 = @floatCast(mc.at(t));
            const x = rect.x + @as(f32, @floatFromInt(i));
            canvas.fill_rect(.{ .x = x, .y = my, .w = 1, .h = @max(0, rect.bottom() - my) }, .{ .solid = u.theme.primary.withAlpha(153) });
            canvas.fill_rect(.{ .x = x, .y = ty, .w = 1, .h = @max(0, my - ty) }, .{ .solid = u.theme.primary.withAlpha(102) });
        }
        canvas.stroke_polyline(&mp, u.scale, u.theme.primary);
        canvas.stroke_polyline(&tp, u.scale, u.theme.primary);
        canvas.pop_clip();
    }
    fn build_menu(self: *Program, u: *ui.Ui) void {
        if (self.menu == .none) return;
        W.popover_begin(u, id("popover"), self.anchor, if (self.menu == .user) 256 else 230, &u.decors.md, true);
        switch (self.menu) {
            .user => {
                u.open(id("account-profile"), .{ .layout = .{ .padding = .axes(4, 6), .child_gap = 8, .child_alignment = .{ .y = .center } } });
                u.open(id("account-avatar"), .{ .layout = .{ .sizing = .{ .width = .fixed(32), .height = .fixed(32) } }, .custom = .{ .data = &self.avatar_color_custom } });
                u.close();
                u.open(id("account-identity"), .{ .layout = .{ .direction = .top_to_bottom } });
                u.text_run("shadcn", .{ .font = 1, .size = 14, .line_height = 18, .color = u.theme.foreground });
                u.text_run("m@example.com", .{ .font = 0, .size = 12, .line_height = 16, .color = u.theme.muted_foreground });
                u.close();
                u.close();
                W.menu_separator(u, id("account-line"));
                if (W.menu_item(u, id("account"), "Account", icon(.tabler_user_circle), false)) self.menu = .none;
                if (W.menu_item(u, id("billing"), "Billing", icon(.tabler_credit_card), false)) self.menu = .none;
                if (W.menu_item(u, id("notifications"), "Notifications", icon(.tabler_notification), false)) self.menu = .none;
                W.menu_separator(u, id("logout-line"));
                if (W.menu_item(u, id("sign-out"), "Log out", icon(.tabler_logout), false)) self.menu = .none;
            },
            .columns => {
                const labels = [_][]const u8{ "Header", "Section Type", "Status", "Target", "Limit", "Reviewer" };
                for (labels, 0..) |label, i| {
                    u.open(rid("column-item", i), .{ .layout = .{ .child_gap = 8, .padding = .all(6), .child_alignment = .{ .y = .center } } });
                    if (W.checkbox(u, rid("visible", i), self.cols[i], icon(.lucide_check))) self.cols[i] = !self.cols[i];
                    txt(u, label, 0, 14, u.theme.foreground);
                    u.close();
                }
            },
            .draft_type => {
                const types = [_][]const u8{ "Table of Contents", "Executive Summary", "Technical Approach", "Design", "Capabilities", "Focus Documents", "Narrative", "Cover Page" };
                for (types, 0..) |value, i| if (W.menu_item(u, rid("draft-type-option", i), value, null, false)) {
                    if (self.draft) |*draft| draft.section_type = value;
                    self.menu = .none;
                };
            },
            .draft_status => {
                for ([_]data.Status{ .done, .in_process, .not_started }, 0..) |value, i| if (W.menu_item(u, rid("draft-status-option", i), status_label(value), null, false)) {
                    if (self.draft) |*draft| draft.status = value;
                    self.menu = .none;
                };
            },
            .draft_reviewer => {
                for (reviewers, 0..) |value, i| if (W.menu_item(u, rid("draft-reviewer-option", i), value, null, false)) {
                    if (self.draft) |*draft| draft.reviewer = value;
                    self.menu = .none;
                };
            },
            .range => {
                const labels = [_][]const u8{ "Last 3 months", "Last 30 days", "Last 7 days" };
                for (labels, 0..) |label, i| if (W.menu_item(u, rid("range-option", i), label, null, false)) {
                    self.range = i;
                    self.menu = .none;
                };
            },
            .rows => {
                for ([_]usize{ 10, 20, 30, 50 }, 0..) |value, i| if (W.menu_item(u, rid("row-count", i), self.format("{d}", .{value}), null, false)) {
                    self.page_size = value;
                    self.page = 0;
                    self.menu = .none;
                };
            },
            .reviewer => {
                for (reviewers, 0..) |name, i| if (W.menu_item(u, rid("reviewer-option", i), name, null, false)) {
                    self.rows[self.menu_row].section.reviewer = name;
                    self.menu = .none;
                };
            },
            .actions => {
                if (W.menu_item(u, id("edit-row"), "Edit", null, false)) self.open_draft(self.menu_row);
                if (W.menu_item(u, id("mark-done"), "Mark as done", icon(.lucide_check), false)) {
                    self.rows[self.menu_row].section.status = .done;
                    self.menu = .none;
                }
                if (W.menu_item(u, id("move-up"), "Move up", null, false)) {
                    if (self.menu_row > 0) std.mem.swap(Row, &self.rows[self.menu_row], &self.rows[self.menu_row - 1]);
                    self.menu = .none;
                }
                if (W.menu_item(u, id("delete"), "Delete", icon(.tabler_trash), true)) {
                    self.rows[self.menu_row].deleted = true;
                    self.menu = .none;
                }
            },
            .add => {
                W.menu_label(u, id("new-section-title"), "Add a document section");
                if (W.menu_item(u, id("new-section"), "Untitled section", icon(.tabler_plus), false)) {
                    if (self.count < self.rows.len) {
                        self.rows[self.count] = .{ .section = .{ .id = @intCast(self.count + 1), .header = "Untitled section", .section_type = "Narrative", .status = .in_process, .target = "0", .limit = "0", .reviewer = "Assign reviewer" }, .target_len = 1, .limit_len = 1 };
                        self.rows[self.count].target[0] = '0';
                        self.rows[self.count].limit[0] = '0';
                        self.count += 1;
                    }
                    self.menu = .none;
                }
            },
            .more => {
                if (W.menu_item(u, id("share"), "Share documents", icon(.tabler_share), false)) {
                    self.notice = "Documents are local to this demo";
                    self.menu = .none;
                }
                if (W.menu_item(u, id("trash"), "View trash", icon(.tabler_trash), false)) {
                    for (self.rows[0..self.count]) |*r| r.deleted = false;
                    self.notice = "Deleted sections restored";
                    self.menu = .none;
                }
            },
            else => {},
        }
        W.popover_end(u);
    }
};
pub fn main(init: std.process.Init) !void {
    var p = Program.init();
    p.avatar = try zdl.image.load.load_jpg(init.gpa, assets.avatar_jpg);
    defer if (p.avatar) |*photo| photo.deinit();
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    var options = ui.Options{ .title = "Acme Inc. · Documents", .fonts = &assets.font_files, .icons = &assets.icon_sources };
    while (args.next()) |arg| {
        if (std.mem.eql(u8, arg, "--size")) try options.set_size(args.next() orelse return error.MissingSize) else if (std.mem.eql(u8, arg, "--drawer")) {
            const index = try std.fmt.parseInt(usize, args.next() orelse return error.MissingRow, 10);
            if (index >= p.count) return error.InvalidRow;
            p.open_draft(index);
        } else if (std.mem.eql(u8, arg, "--smoke")) options.smoke = true else if (std.mem.eql(u8, arg, "--dark")) options.dark = true else if (std.mem.eql(u8, arg, "--snapshot")) options.snapshot_path = args.next() orelse return error.MissingSnapshotPath else return error.UnknownArgument;
    }
    try ui.run(Program, &p, init, options);
}

test "table edits follow reordered rows and filtered views omit deleted sections" {
    var program = Program.init();
    program.edit(rid("target", 0).id, null);
    program.edit(rid("target", 0).id, '9');
    std.mem.swap(Row, &program.rows[0], &program.rows[1]);
    try std.testing.expectEqualStrings("19", program.rows[1].target[0..program.rows[1].target_len]);
    try std.testing.expectEqualStrings("Cover page", program.rows[1].section.header);
    program.rows[1].deleted = true;
    var indices: [100]usize = undefined;
    const count = program.collect_filtered(&indices);
    try std.testing.expectEqual(data.sections.len - 1, count);
    for (indices[0..count]) |i| try std.testing.expect(i != 1);
}

test {
    _ = curve;
}

test "drawer edits own UTF-8 titles and survive row reordering; cancel keeps the row" {
    var program = Program.init();
    program.open_draft(0);
    program.replace_focus = id("draft-header").id;
    program.edit_draft(id("draft-header").id, "Résumé €");
    program.edit_draft(id("draft-header").id, null);
    program.replace_focus = id("draft-target").id;
    program.edit_draft(id("draft-target").id, "42");
    program.commit_draft();
    std.mem.swap(Row, &program.rows[0], &program.rows[1]);
    try std.testing.expectEqualStrings("Résumé ", row_title(&program.rows[1]));
    try std.testing.expectEqualStrings("42", program.rows[1].target[0..program.rows[1].target_len]);
    program.open_draft(1);
    program.replace_focus = id("draft-header").id;
    program.edit_draft(id("draft-header").id, "Cancelled edit");
    program.draft = null;
    try std.testing.expectEqualStrings("Résumé ", row_title(&program.rows[1]));
}
