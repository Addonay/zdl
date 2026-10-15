//! Native dashboard-01: zlay layout, shaped Geist text and owned interactive state.
const std = @import("std");
const zdl = @import("zdl");
const zlay = @import("zlay");
const ui = @import("ui");
const assets = @import("assets");
const data = @import("data.zig");
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
};
const Menu = enum { none, user, more, columns, rows, reviewer, actions, add, help };
const reviewers = [_][]const u8{ "Eddie Lake", "Jamik Tashpulatov", "Maya Johnson", "Assign reviewer" };
const Program = struct {
    rows: [100]Row = undefined,
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
                    self.menu = .none;
                    u.focus = 0;
                }
                if (key.scancode == .backspace) self.edit(u.focus, null);
            },
            .text_input => |input| for (input.text) |ch| {
                if (ch >= '0' and ch <= '9') self.edit(u.focus, ch);
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
        self.chart_custom = .{ .draw = draw_chart, .context = self };
        if (self.menu != .none and u.pointer_pressed() and !u.hovered(id("popover")) and !u.hovered(self.anchor)) self.menu = .none;
        const width = u.layout.getLayoutDimensions().width;
        const sidebar_width: f32 = if (self.sidebar and width >= 900) 280 else 64;
        u.open(id("root"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .padding = .{ .top = 8, .right = 8, .bottom = 8 }, .child_gap = 8 }, .background_color = u.theme.sidebar });
        self.build_sidebar(u, sidebar_width);
        u.open(id("inset"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .direction = .top_to_bottom }, .background_color = u.theme.background, .corner_radius = .all(16), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.inset });
        u.open(id("header"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(48) }, .padding = .{ .left = 16, .right = 148 }, .child_gap = 16, .child_alignment = .{ .y = .center } }, .border = .{ .color = u.theme.border, .width = .{ .bottom = 1 } } });
        if (W.button(u, id("sidebar-toggle"), .{ .icon = icon(.lucide_panel_left), .variant = .ghost, .size = .icon_sm })) self.sidebar = !self.sidebar;
        W.separator(u, id("header-separator"), true, 16);
        txt(u, "Documents", 1, 16, u.theme.foreground);
        spacer(u, "header-fill");
        if (W.button(u, id("github"), .{ .label = "GitHub", .variant = .ghost, .size = .sm })) self.notice = "Source: github.com/Addonay/zdl";
        u.close();
        u.drag_regions.add(.{ .rect = .{ .x = @intFromFloat(sidebar_width + 168), .y = 8, .width = @intFromFloat(@max(0, width - sidebar_width - 420)), .height = 40 }, .kind = .draggable }) catch {};
        u.open(id("scroll-content"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .grow(.{}) }, .padding = .all(24), .direction = .top_to_bottom, .child_gap = 24 }, .clip = .{ .vertical = true } });
        self.build_cards(u, width - sidebar_width - 56);
        self.build_chart(u);
        self.build_table(u);
        if (self.notice.len > 0) txt(u, self.notice, 0, 13, u.theme.muted_foreground);
        u.close();
        u.close();
        self.build_menu(u);
        u.close();
    }
    fn build_sidebar(self: *Program, u: *ui.Ui, width: f32) void {
        const full = width > 64;
        u.open(id("sidebar"), .{ .layout = .{ .sizing = .{ .width = .fixed(width), .height = .grow(.{}) }, .direction = .top_to_bottom, .padding = .{ .left = 16, .right = 8, .top = 8, .bottom = 8 }, .child_gap = 8 } });
        u.open(id("brand"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(40) }, .child_gap = 10, .padding = .axes(8, 0), .child_alignment = .{ .y = .center } } });
        u.icon(id("brand-icon"), icon(.tabler_inner_shadow_top), 18, u.theme.foreground);
        if (full) txt(u, "Acme Inc.", 2, 16, u.theme.foreground);
        u.close();
        u.open(id("quick-create-row"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fit(.{}) }, .child_gap = 8 } });
        if (W.button(u, id("quick"), .{ .label = if (full) "Quick Create" else "", .align_left = full, .icon = icon(.tabler_circle_plus_filled), .width = if (full) width - 64 else 32, .size = .sm })) self.toggle(.add, id("quick"));
        if (full and W.button(u, id("mail"), .{ .icon = icon(.tabler_mail), .variant = .outline, .size = .icon_sm })) self.notice = "No unread messages";
        u.close();
        const labels = [_][]const u8{ "Dashboard", "Lifecycle", "Analytics", "Projects", "Team", "Data Library", "Reports", "Word Assistant", "More" };
        const icons = [_]assets.Icon{ .tabler_dashboard, .tabler_list_details, .tabler_chart_bar, .tabler_folder, .tabler_users, .tabler_database, .tabler_report, .tabler_file_word, .tabler_dots };
        u.open(id("nav-list"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 4 } });
        for (labels, icons, 0..) |label, glyph, i| {
            if (i == 5 and full) {
                u.open(id("documents-label"), .{ .layout = .{ .padding = .{ .top = 20, .left = 8, .bottom = 4 } } });
                txt(u, "Documents", 0, 12, u.theme.muted_foreground);
                u.close();
            }
            const key = rid("nav", i);
            if (W.button(u, key, .{ .label = if (full) label else "", .icon = icon(glyph), .variant = .ghost, .size = .sm, .width = width - 24, .align_left = full, .font = .regular })) {
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
        for (footer_labels, footer_icons, 0..) |label, glyph, i| if (W.button(u, rid("secondary", i), .{ .label = if (full) label else "", .icon = icon(glyph), .variant = .ghost, .size = .sm, .width = width - 24, .align_left = full, .font = .regular })) {
            if (i == 0) u.toggle_theme() else self.notice = if (i == 1) "Use Tab to navigate, Enter to activate, and Escape to dismiss." else "Search documents from the table headers.";
        };
        u.open(id("user-row"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(56) }, .child_gap = 8, .padding = .axes(8, 0), .child_alignment = .{ .y = .center } } });
        W.avatar(u, id("avatar"), "CN", 32);
        if (full) {
            u.open(id("user-name"), .{ .layout = .{ .direction = .top_to_bottom, .sizing = .{ .width = .grow(.{}) } } });
            txt(u, "shadcn", 1, 14, u.theme.foreground);
            txt(u, "m@example.com", 0, 12, u.theme.muted_foreground);
            u.close();
            if (W.button(u, id("user-menu"), .{ .icon = icon(.tabler_dots_vertical), .variant = .ghost, .size = .icon_sm })) self.toggle(.user, id("user-menu"));
        }
        u.close();
        u.close();
    }
    fn build_cards(self: *Program, u: *ui.Ui, width: f32) void {
        _ = self;
        const titles = [_][]const u8{ "Total Revenue", "New Customers", "Active Accounts", "Growth Rate" };
        const values = [_][]const u8{ "$1,250.00", "1,234", "45,678", "4.5%" };
        const badges = [_][]const u8{ "+12.5%", "-20%", "+12.5%", "+4.5%" };
        const headlines = [_][]const u8{ "Trending up this month", "Down 20% this period", "Strong user retention", "Steady performance increase" };
        const notes = [_][]const u8{ "Visitors for the last 6 months", "Acquisition needs attention", "Engagement exceed targets", "Meets growth projections" };
        u.open(id("cards"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 16, .direction = if (width < 900) .top_to_bottom else .left_to_right } });
        for (0..4) |i| {
            if (width < 900 and i % 2 == 0) u.open(rid("card-row", i / 2), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_gap = 16 } });
            u.open(rid("card", i), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(204) }, .padding = .all(24), .direction = .top_to_bottom, .child_gap = 8 }, .background_color = u.theme.card, .corner_radius = .all(14), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.card });
            u.open(rid("card-heading", i), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_alignment = .{ .y = .center } } });
            txt(u, titles[i], 0, 14, u.theme.muted_foreground);
            spacer(u, switch (i) {
                0 => "cs0",
                1 => "cs1",
                2 => "cs2",
                else => "cs3",
            });
            W.badge(u, rid("card-badge", i), .{ .label = badges[i], .icon = icon(if (i == 1) .tabler_trending_down else .tabler_trending_up) });
            u.close();
            txt(u, values[i], 2, 30, u.theme.foreground);
            u.open(rid("card-footer", i), .{ .layout = .{ .direction = .top_to_bottom, .sizing = .{ .width = .grow(.{}) }, .padding = .{ .top = 16 }, .child_gap = 4 } });
            u.text_run(headlines[i], .{ .font = 1, .size = 14, .line_height = 20, .color = u.theme.foreground });
            u.text_run(notes[i], .{ .font = 0, .size = 14, .line_height = 20, .color = u.theme.muted_foreground });
            u.close();
            u.close();
            if (width < 900 and i % 2 == 1) u.close();
        }
        u.close();
    }
    fn build_chart(self: *Program, u: *ui.Ui) void {
        u.open(id("chart-card"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(392) }, .direction = .top_to_bottom, .padding = .all(24), .child_gap = 24 }, .background_color = u.theme.card, .corner_radius = .all(14), .border = .{ .color = u.theme.border, .width = .outside(1) }, .user_data = &u.decors.xs });
        u.open(id("chart-heading"), .{ .layout = .{ .sizing = .{ .width = .grow(.{}) }, .child_alignment = .{ .y = .center } } });
        u.open(id("chart-title"), .{ .layout = .{ .direction = .top_to_bottom, .child_gap = 4 } });
        txt(u, "Total Visitors", 2, 16, u.theme.foreground);
        txt(u, if (self.range == 0) "Total for the last 3 months" else if (self.range == 1) "Total for the last 30 days" else "Total for the last 7 days", 0, 14, u.theme.muted_foreground);
        u.close();
        spacer(u, "chart-heading-space");
        const labels = [_][]const u8{ "Last 3 months", "Last 30 days", "Last 7 days" };
        for (labels, 0..) |label, i| {
            if (W.toggle_item(u, rid("range", i), label, self.range == i, if (i == 0) .first else if (i == 2) .last else .middle)) self.range = i;
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
    fn draw_chart(canvas: *ui.Canvas, rect: ui.Rect, context: *anyopaque) void {
        const self: *Program = @ptrCast(@alignCast(context));
        const u = self.chart_u.?;
        self.chart_box = .{ .x = rect.x / u.scale, .y = rect.y / u.scale, .w = rect.w / u.scale, .h = rect.h / u.scale };
        const count: usize = if (self.range == 0) data.visits.len else if (self.range == 1) 30 else 7;
        const start = data.visits.len - count;
        const bottom = rect.bottom() - 24 * u.scale;
        const height = bottom - rect.y;
        for (0..5) |i| {
            const y = rect.y + height * @as(f32, @floatFromInt(i)) / 4;
            canvas.fill_rect(.{ .x = rect.x, .y = y, .w = rect.w, .h = u.scale }, .{ .solid = u.theme.border.withAlpha(100) });
        }
        var top_points: [100]ui.canvas.Point = undefined;
        var mid_points: [100]ui.canvas.Point = undefined;
        for (data.visits[start..], 0..) |v, i| {
            const x = rect.x + rect.w * @as(f32, @floatFromInt(i)) / @as(f32, @floatFromInt(count - 1));
            top_points[i] = .{ .x = x, .y = bottom - height * @as(f32, @floatFromInt(v.desktop + v.mobile)) / 1000 };
            mid_points[i] = .{ .x = x, .y = bottom - height * @as(f32, @floatFromInt(v.mobile)) / 1000 };
        }
        // Interpolate each screen column; two stacked translucent area gradients.
        const columns: usize = @intFromFloat(@max(0, rect.w));
        for (0..columns) |column| {
            const t = @as(f32, @floatFromInt(column)) / @max(1, rect.w) * @as(f32, @floatFromInt(count - 1));
            const a: usize = @min(count - 2, @as(usize, @intFromFloat(t)));
            const mix = t - @as(f32, @floatFromInt(a));
            const y1 = top_points[a].y * (1 - mix) + top_points[a + 1].y * mix;
            const y2 = mid_points[a].y * (1 - mix) + mid_points[a + 1].y * mix;
            const x = rect.x + @as(f32, @floatFromInt(column));
            canvas.fill_rect(.{ .x = x, .y = y1, .w = 1, .h = @max(0, y2 - y1) }, .{ .vertical = .{ .top_color = u.theme.primary.withAlpha(100), .bottom_color = u.theme.primary.withAlpha(12), .top_y = rect.y, .bottom_y = bottom } });
            canvas.fill_rect(.{ .x = x, .y = y2, .w = 1, .h = @max(0, bottom - y2) }, .{ .vertical = .{ .top_color = u.theme.primary.withAlpha(65), .bottom_color = u.theme.primary.withAlpha(5), .top_y = rect.y, .bottom_y = bottom } });
        }
        canvas.stroke_polyline(top_points[0..count], u.scale, u.theme.primary.withAlpha(190));
        canvas.stroke_polyline(mid_points[0..count], u.scale, u.theme.primary.withAlpha(150));
        const pointer = u.pointer();
        const previous_hover = self.hover_visit;
        self.hover_visit = if (pointer.x >= self.chart_box.x and pointer.x <= self.chart_box.x + self.chart_box.w and pointer.y >= self.chart_box.y and pointer.y < self.chart_box.y + self.chart_box.h) start + @min(count - 1, @as(usize, @intFromFloat((pointer.x - self.chart_box.x) / self.chart_box.w * @as(f32, @floatFromInt(count - 1))))) else null;
        if (previous_hover != self.hover_visit) u.request_redraw();
        const ticks: usize = if (count > 30) 13 else 5;
        for (0..ticks) |i| {
            const index = i * (count - 1) / (ticks - 1);
            const v = data.visits[start + index];
            const label = self.format("{s} {d}", .{ if (v.month == 4) "Apr" else if (v.month == 5) "May" else "Jun", v.day });
            const size = 12 * u.scale;
            const tw = u.text.measure(0, label, size) catch 0;
            u.text.draw(canvas, 0, label, rect.x + rect.w * @as(f32, @floatFromInt(i)) / @as(f32, @floatFromInt(ticks - 1)) - tw / 2, bottom + 20 * u.scale, size, u.theme.muted_foreground) catch {};
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
            txt(u, label, 1, 14, u.theme.foreground);
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
                    0 => txt(u, row.section.header, 1, 14, u.theme.foreground),
                    1 => W.badge(u, rid("type", i), .{ .label = row.section.section_type, .foreground = u.theme.muted_foreground }),
                    2 => W.badge(u, rid("status", i), .{ .label = if (row.section.status == .done) "Done" else "In Process", .icon = icon(if (row.section.status == .done) .tabler_circle_check_filled else .tabler_loader), .foreground = u.theme.muted_foreground }),
                    3 => {
                        if (W.field(u, rid("target", i), row.target[0..row.target_len], .{ .width = 56, .focused = u.is_focused(rid("target", i)) })) u.set_focus(rid("target", i));
                    },
                    4 => {
                        if (W.field(u, rid("limit", i), row.limit[0..row.limit_len], .{ .width = 48, .focused = u.is_focused(rid("limit", i)) })) u.set_focus(rid("limit", i));
                    },
                    5 => {
                        if (W.button(u, rid("reviewer", i), .{ .label = row.section.reviewer, .variant = .ghost, .size = .sm })) {
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
    fn build_menu(self: *Program, u: *ui.Ui) void {
        if (self.menu == .none) return;
        W.popover_begin(u, id("popover"), self.anchor, 230, &u.decors.md, true);
        switch (self.menu) {
            .user => {
                W.menu_label(u, id("account-label"), "shadcn · m@example.com");
                W.menu_separator(u, id("account-line"));
                if (W.menu_item(u, id("theme"), if (u.theme.dark) "Light appearance" else "Dark appearance", icon(.tabler_settings), false)) {
                    u.toggle_theme();
                    self.menu = .none;
                }
                if (W.menu_item(u, id("sign-out"), "Log out", icon(.tabler_logout), false)) {
                    self.notice = "Demo account: no session to log out";
                    self.menu = .none;
                }
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
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    var options = ui.Options{ .title = "Acme Inc. · Documents", .fonts = &assets.font_files, .icons = &assets.icon_sources };
    while (args.next()) |arg| {
        if (std.mem.eql(u8, arg, "--smoke")) options.smoke = true else if (std.mem.eql(u8, arg, "--dark")) options.dark = true else if (std.mem.eql(u8, arg, "--snapshot")) options.snapshot_path = args.next() orelse return error.MissingSnapshotPath else return error.UnknownArgument;
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
