//! SDL misc/03-locale: list the preferred languages and regions in order.
const std = @import("std");
const zdl = @import("zdl");
const common = @import("common");

const App = struct { locales: *const zdl.system.locale.Locales };

pub fn main(init: std.process.Init) !void {
    var locales = try zdl.system.locale.preferred(init.gpa, init.environ_map, null);
    defer locales.deinit(init.gpa);
    var app = App{ .locales = &locales };
    try common.run(App, &app, init, "examples/misc/locale", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    if (app.locales.items.len == 0) {
        const message = "No preferred locale is set.";
        try renderer.debug_text((640 - 8 * @as(f32, @floatFromInt(message.len))) / 2, 0, message);
        return;
    }

    var title: [96]u8 = undefined;
    const header = try std.fmt.bufPrint(&title, "Locales, in order of preference ({d} total):", .{app.locales.items.len});
    try renderer.debug_text((640 - 8 * @as(f32, @floatFromInt(header.len))) / 2, 0, header);
    for (app.locales.items, 0..) |locale, i| {
        const country = locale.country orelse "";
        const separator: []const u8 = if (locale.country == null) "" else "_";
        const text_width = 3 + locale.language.len + separator.len + country.len;
        const y = 16 * @as(f32, @floatFromInt(i + 1));
        try renderer.debug_text_format((640 - 8 * @as(f32, @floatFromInt(text_width))) / 2, y, " - {s}{s}{s}", .{ locale.language, separator, country });
    }
}
