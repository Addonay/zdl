//! SDL misc/01-power: show the available power state and battery charge estimate.
const std = @import("std");
const zdl = @import("zdl");
const common = @import("common");

const App = struct {
    io: std.Io,
    info: zdl.system.power.Info = .{ .state = .unknown },

    fn before_frame(self: *App, io: std.Io) !void {
        self.io = io;
        self.info = zdl.system.power.query(io, .{});
    }
};

pub fn main(init: std.process.Init) !void {
    var app = App{ .io = init.io };
    try common.run(App, &app, init, "examples/misc/power", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    const frame_rect = common.FRect{ .x = 100, .y = 200, .width = 440, .height = 80 };
    var clear_color = common.Color{ .r = 0, .g = 0, .b = 0, .a = 255 };
    var bar_color = common.Color{ .r = 0, .g = 0, .b = 0, .a = 255 };
    const message: []const u8 = switch (app.info.state) {
        .unknown => blk: {
            clear_color = .{ .r = 50, .g = 50, .b = 50, .a = 255 };
            break :blk "Power state is unknown.";
        },
        .on_battery => blk: {
            bar_color = .{ .r = 255, .g = 0, .b = 0, .a = 255 };
            break :blk "Running on battery.";
        },
        .no_battery => blk: {
            clear_color.g = 50;
            break :blk "Plugged in, no battery available.";
        },
        .charging => blk: {
            bar_color = .{ .r = 0, .g = 255, .b = 255, .a = 255 };
            break :blk "Charging.";
        },
        .charged => blk: {
            bar_color = .{ .r = 0, .g = 255, .b = 0, .a = 255 };
            break :blk "Charged.";
        },
    };

    try common.clear(renderer, clear_color);
    if (app.info.percent) |percent| {
        const fraction = @as(f32, @floatFromInt(percent)) / 100;
        renderer.set_draw_color(bar_color);
        try renderer.fill_rect(.{ .x = frame_rect.x, .y = frame_rect.y, .width = frame_rect.width * fraction, .height = frame_rect.height });
        renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
        try renderer.draw_rect(frame_rect);

        var remaining: [32]u8 = undefined;
        const remaining_text: []const u8 = if (app.info.seconds) |seconds| blk: {
            const hours = seconds / 3600;
            const minutes = (seconds % 3600) / 60;
            const secs = seconds % 60;
            break :blk try std.fmt.bufPrint(&remaining, "{d:0>2}:{d:0>2}:{d:0>2}", .{ hours, minutes, secs });
        } else "unknown time";
        var status: [128]u8 = undefined;
        const status_text = try std.fmt.bufPrint(&status, "Battery: {d} percent, {s} remaining", .{ percent, remaining_text });
        renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
        try renderer.debug_text(frame_rect.x + (frame_rect.width - 8 * @as(f32, @floatFromInt(status_text.len))) / 2, frame_rect.y + frame_rect.height + 8, status_text);
    }

    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    try renderer.debug_text(frame_rect.x + (frame_rect.width - 8 * @as(f32, @floatFromInt(message.len))) / 2, frame_rect.y - 16, message);
}
