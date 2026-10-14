const std = @import("std");
const zdl = @import("zdl").video;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    // Display model: modes, ordering, closest selection, lookup.
    var mode: zdl.display.Mode = .{ .width = 1920, .height = 1080, .refresh_rate = 59.94, .format = .rgba8 };
    mode.finalize();
    _ = mode.same_description(mode);
    _ = zdl.display.order(mode, mode);
    _ = zdl.display.packed_layout(.rgba8);
    _ = zdl.display.parse_usable_bounds_hint("0,0,1920,1080");

    var display: zdl.display.Display = .{ .id = @fromBackingInt(1), .desktop_mode = mode };
    defer display.deinit(gpa);
    _ = try display.add_fullscreen_mode(gpa, mode);
    _ = display.closest_fullscreen_mode(1280, 720, 0, false);
    _ = display.fullscreen_modes.match(mode);
    _ = display.set_desktop_mode(mode);
    _ = display.set_current_mode(null);
    _ = display.set_content_scale(1.5);
    _ = display.usable(.{ .x = 0, .y = 0, .width = 1, .height = 1 });
    _ = display.current();
    _ = display.fullscreen_modes.modes();
    display.fullscreen_modes.reset(gpa);

    const displays = [_]zdl.display.Display{ display, .{ .id = @fromBackingInt(2) } };
    _ = zdl.display.bounds_of(&displays, 1, 0);
    _ = zdl.display.display_for_point(&displays, 0, .{ .x = 5, .y = 5 });
    _ = zdl.display.display_for_rect(&displays, 0, .{ .x = 0, .y = 0, .width = 10, .height = 10 });
    _ = zdl.display.display_at_origin(&displays, 0, 0, 0);
    _ = zdl.display.display_for_window_position(&displays, 0, null, .{ .x = 0, .y = 0, .width = 10, .height = 10 }, true);
    _ = zdl.display.display_for_fullscreen(&displays, 0, .{ .rect = .{ .x = 0, .y = 0, .width = 1, .height = 1 } });
    _ = zdl.display.primary_id(&displays, 0);

    // Window state: events, geometry, fullscreen, pending flags.
    var state = zdl.window_state.State.init(@fromBackingInt(7), .{ .x = 0, .y = 0, .width = 640, .height = 480 }, .{ .resizable = true });
    _ = state.send(.shown, 0, 0);
    _ = state.send(.moved, 10, 20);
    _ = state.send(.resized, 800, 600);
    _ = state.send(.pixel_size_changed, 800, 600);
    _ = state.send(.focus_gained, 0, 0);
    _ = state.display_changed(@fromBackingInt(1));
    _ = state.take_shown_actions();
    _ = state.begin_hide();
    _ = state.finish_hide();
    _ = state.begin_show();
    _ = state.maximize() catch null;
    _ = state.minimize();
    _ = state.restore();
    _ = state.after_minimized();
    _ = state.after_restored();
    _ = state.should_minimize_on_focus_loss(.auto, false);
    _ = state.request_fullscreen(true);
    _ = state.set_fullscreen_mode(.desktop);
    _ = state.set_fullscreen_mode(.{ .exclusive = mode });
    state.fail_fullscreen();
    const step = state.begin_fullscreen_update(.enter);
    state.finish_fullscreen_update(@fromBackingInt(1));
    _ = state.fullscreen_dimensions(step.op, .{}, .{ .x = 0, .y = 0, .width = 1920, .height = 1080 }, .{ .width = 1920, .height = 1080 });
    _ = state.retarget_fullscreen(mode, true);
    _ = state.request_size(640, 480) catch null;
    _ = state.constrain(640, 480);
    _ = state.set_aspect_ratio(0, 2.0) catch null;
    _ = state.set_minimum_size(100, 100) catch null;
    _ = state.set_maximum_size(4000, 4000) catch null;
    _ = state.request_position(.{ .value = 1 }, .undefined_position, null, null, true) catch null;
    _ = state.request_position(.{ .centered = .none }, .{ .centered = .none }, .{
        .display = @fromBackingInt(1),
        .usable = .{ .x = 0, .y = 0, .width = 1920, .height = 1080 },
        .full = .{ .x = 0, .y = 0, .width = 1920, .height = 1080 },
    }, null, false) catch null;
    _ = state.set_bordered(false);
    _ = state.set_resizable(true);
    _ = state.pixel_size(1.0);
    _ = state.check_pixel_size(800, 600, 1.0, null);

    // Camera frame conversion into a surface.
    var yuy2 = [_]u8{ 16, 128, 16, 128, 235, 128, 235, 128 };
    const frame: zdl.blit_yuv.Frame = .{ .format = .yuy2, .width = 4, .height = 2, .stride = 8, .data = &yuy2, .encoding = .bt601_limited };
    var target = try zdl.blit_yuv.to_surface(gpa, frame, 8, 4, .rgba8, null);
    defer target.deinit();
    _ = zdl.blit_yuv.encoding_for(.bt709_limited);
    _ = zdl.blit_yuv.source_from_frame(frame) catch null;
}
