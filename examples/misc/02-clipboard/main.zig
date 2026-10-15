//! SDL misc/02-clipboard: copy the current UTC time or paste plain clipboard text.
const std = @import("std");
const zdl = @import("zdl");
const common = @import("common");

const copy_label = "Click here to copy!";
const paste_label = "Click here to paste!";
const current_rect = common.FRect{ .x = 30, .y = 10, .width = 390, .height = 18 };
const copy_rect = common.FRect{ .x = 450, .y = 10, .width = @floatFromInt(copy_label.len * 8 + 10), .height = 18 };
const pasted_rect = common.FRect{ .x = 10, .y = 38, .width = 620, .height = 404 };
const paste_rect = button_rect();

const App = struct {
    allocator: std.mem.Allocator,
    current_time: [96]u8 = undefined,
    current_time_len: usize = 0,
    pasted: ?[]u8 = null,
    copy_pressed: bool = false,
    paste_pressed: bool = false,

    fn deinit(self: *App) void {
        if (self.pasted) |text| self.allocator.free(text);
    }

    fn before_frame(self: *App, io: std.Io) !void {
        const now = std.Io.Timestamp.now(io, .real);
        const nanoseconds = std.math.cast(i64, now.nanoseconds) orelse return error.OutOfRange;
        const date_time = try zdl.time.DateTime.from_timestamp(nanoseconds, 0);
        const weekdays = [_][]const u8{ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
        const months = [_][]const u8{ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
        const weekday = @backingInt(try date_time.date.weekday());
        const month = @backingInt(date_time.date.month) - 1;
        const text = try std.fmt.bufPrint(&self.current_time, "{s}, {s} {d}, {d}   {d:0>2}:{d:0>2}:{d:0>2} UTC", .{
            weekdays[weekday], months[month],    date_time.date.day, date_time.date.year,
            date_time.hour,    date_time.minute, date_time.second,
        });
        self.current_time_len = text.len;
    }

    pub fn event_with_renderer(self: *App, renderer: *common.Renderer, context: *zdl.app.callbacks.Context, ev: zdl.app.callbacks.Event) zdl.app.callbacks.Result {
        switch (ev) {
            .mouse_button => |button| {
                if (button.button != zdl.events.mouse.button.left) return .@"continue";
                const point = renderer.window_to_render(.{ .x = button.x, .y = button.y }) catch return .failure;
                const inside_copy = contains(copy_rect, point);
                const inside_paste = contains(paste_rect, point);
                if (button.kind == .down) {
                    self.copy_pressed = inside_copy;
                    self.paste_pressed = inside_paste;
                } else {
                    const window: zdl.linux.Window = .{ .platform = context.platform, .id = button.window_id };
                    if (self.copy_pressed and inside_copy) {
                        window.set_clipboard_text(self.current_time[0..self.current_time_len]) catch return .failure;
                    } else if (self.paste_pressed and inside_paste) {
                        if (self.pasted) |previous| self.allocator.free(previous);
                        self.pasted = window.clipboard_text(self.allocator) catch return .failure;
                    }
                    self.copy_pressed = false;
                    self.paste_pressed = false;
                }
            },
            else => {},
        }
        return .@"continue";
    }
};

pub fn main(init: std.process.Init) !void {
    var app = App{ .allocator = init.gpa };
    defer app.deinit();
    try app.before_frame(init.io);
    try common.run(App, &app, init, "examples/misc/clipboard", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });

    renderer.set_draw_color(.{ .r = 0, .g = 0, .b = 255, .a = 255 });
    try renderer.fill_rect(current_rect);
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.draw_rect(current_rect);
    const current = app.current_time[0..app.current_time_len];
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 0, .a = 255 });
    try renderer.debug_text(current_rect.x + (current_rect.width - 8 * @as(f32, @floatFromInt(current.len))) / 2, current_rect.y + 5, current);

    renderer.set_draw_color(if (app.copy_pressed) .{ .r = 0, .g = 255, .b = 0, .a = 255 } else .{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try renderer.fill_rect(copy_rect);
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.draw_rect(copy_rect);
    try renderer.debug_text(copy_rect.x + 5, copy_rect.y + 5, copy_label);

    renderer.set_draw_color(.{ .r = 0, .g = 53, .b = 25, .a = 255 });
    try renderer.fill_rect(pasted_rect);
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.draw_rect(pasted_rect);
    renderer.set_draw_color(.{ .r = 0, .g = 219, .b = 107, .a = 255 });
    if (app.pasted) |text| try draw_pasted_text(renderer, text);

    renderer.set_draw_color(if (app.paste_pressed) .{ .r = 0, .g = 255, .b = 0, .a = 255 } else .{ .r = 255, .g = 0, .b = 0, .a = 255 });
    try renderer.fill_rect(paste_rect);
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.draw_rect(paste_rect);
    try renderer.debug_text(paste_rect.x + 5, paste_rect.y + 5, paste_label);
}

fn draw_pasted_text(renderer: *common.Renderer, text: []const u8) !void {
    const x = pasted_rect.x + 5;
    const max_chars: usize = @intFromFloat((pasted_rect.width - 10) / 8);
    var y = pasted_rect.y + 5;
    var lines = std.mem.splitScalar(u8, text, '\n');
    while (lines.next()) |raw_line| {
        const line = std.mem.trimEnd(u8, raw_line, "\r");
        try renderer.debug_text(x, y, line[0..@min(max_chars, line.len)]);
        y += 10;
        if (pasted_rect.height - (y - pasted_rect.y) < 8) break;
    }
}

fn contains(rect: common.FRect, point: common.FPoint) bool {
    return point.x >= rect.x and point.y >= rect.y and point.x < rect.x + rect.width and point.y < rect.y + rect.height;
}

fn button_rect() common.FRect {
    const button_width = @as(f32, @floatFromInt(paste_label.len * 8 + 10));
    const text_y = pasted_rect.y + pasted_rect.height + 10;
    return .{ .x = (640 - button_width) / 2, .y = text_y, .width = button_width, .height = current_rect.height };
}
