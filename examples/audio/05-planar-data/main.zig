//! SDL audio/05-planar-data: route one mono U8 sample to the chosen stereo side.
const std = @import("std");
const zdl = @import("zdl");
const audio = @import("audio_common");
const common = @import("common");

const left_rect = common.FRect{ .x = 100, .y = 170, .width = 100, .height = 100 };
const right_rect = common.FRect{ .x = 440, .y = 170, .width = 100, .height = 100 };
const Playing = enum { none, left, right };

const App = struct {
    allocator: std.mem.Allocator,
    output: *audio.StereoOutput,
    stream: *audio.StereoToStereo,
    playing: Playing = .none,

    fn before_frame(self: *App, _: std.Io) !void {
        _ = try self.output.pump();
        if (self.playing != .none and try self.stream.status() == .drained) self.playing = .none;
    }

    pub fn event_with_renderer(self: *App, renderer: *common.Renderer, _: *zdl.app.callbacks.Context, ev: zdl.app.callbacks.Event) zdl.app.callbacks.Result {
        const button = switch (ev) {
            .mouse_button => |button| button,
            else => return .@"continue",
        };
        if (button.kind != .down or button.button != zdl.events.mouse.button.left or self.playing != .none) return .@"continue";
        const point = renderer.window_to_render(.{ .x = button.x, .y = button.y }) catch return .failure;
        const side: ?Playing = if (contains(left_rect, point)) .left else if (contains(right_rect, point)) .right else null;
        const selected = side orelse return .@"continue";
        const source_bytes = if (selected == .left) audio.planar_left else audio.planar_right;
        const interleaved = self.allocator.alloc(u8, source_bytes.len * 2) catch return .failure;
        defer self.allocator.free(interleaved);
        for (source_bytes, 0..) |sample, i| {
            interleaved[i * 2 + 0] = if (selected == .left) sample else 0x80;
            interleaved[i * 2 + 1] = if (selected == .right) sample else 0x80;
        }
        self.stream.clear();
        self.stream.write(.{ .format = .unsigned8, .sample_rate = 4000 }, interleaved) catch return .failure;
        self.stream.flush();
        self.playing = selected;
        return .@"continue";
    }
};

pub fn main(init: std.process.Init) !void {
    var library = audio.Audio.alsa.Library.open() catch |err| {
        audio.report_device_failure(err);
        return;
    };
    defer library.deinit();
    var output = audio.open_output(init.gpa, &library) catch |err| {
        audio.report_device_failure(err);
        return;
    };
    defer output.deinit();
    var stream = try audio.StereoToStereo.init(init.gpa, .{ .format = output.spec().format, .sample_rate = output.spec().sample_rate });
    defer stream.deinit();
    try stream.reserve(.{ .format = .unsigned8, .sample_rate = 4000 }, @max(audio.planar_left.len, audio.planar_right.len));
    try output.bind(.{ .stereo = &stream });
    defer output.unbind(.{ .stereo = &stream }) catch {};

    var app = App{ .allocator = init.gpa, .output = &output, .stream = &stream };
    try common.run(App, &app, init, "examples/audio/planar-data", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    try draw_button(renderer, left_rect, "LEFT", app.playing == .left);
    try draw_button(renderer, right_rect, "RIGHT", app.playing == .right);
}

fn draw_button(renderer: *common.Renderer, rect: common.FRect, text: []const u8, active: bool) !void {
    renderer.set_draw_color(if (active) .{ .r = 0, .g = 255, .b = 0, .a = 255 } else .{ .r = 0, .g = 0, .b = 255, .a = 255 });
    try renderer.fill_rect(rect);
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
    const x = rect.x + (rect.width - 8 * @as(f32, @floatFromInt(text.len))) / 2;
    const y = rect.y + (rect.height - 8) / 2;
    try renderer.debug_text(x, y, text);
}

fn contains(rect: common.FRect, point: common.FPoint) bool {
    return point.x >= rect.x and point.y >= rect.y and point.x < rect.x + rect.width and point.y < rect.y + rect.height;
}
