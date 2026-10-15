const std = @import("std");

/// One executable per ported SDL example. zdl and zlay come from build.zig.zon;
/// pass `--fork=..` to build against the zdl working tree instead of the pin.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const zdl = b.dependency("zdl", .{ .target = target, .optimize = optimize }).module("zdl");
    const zlay = b.dependency("zlay", .{ .target = target, .optimize = optimize }).module("zlay");
    const common = b.createModule(.{
        .root_source_file = b.path("common.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "zdl", .module = zdl }},
    });
    const audio_common = b.createModule(.{
        .root_source_file = b.path("audio_common.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "zdl", .module = zdl }},
    });

    const examples = [_]struct { name: []const u8, path: []const u8 }{
        .{ .name = "renderer-01-clear", .path = "renderer/01-clear/main.zig" },
        .{ .name = "renderer-02-primitives", .path = "renderer/02-primitives/main.zig" },
        .{ .name = "renderer-03-lines", .path = "renderer/03-lines/main.zig" },
        .{ .name = "renderer-04-points", .path = "renderer/04-points/main.zig" },
        .{ .name = "renderer-05-rectangles", .path = "renderer/05-rectangles/main.zig" },
        .{ .name = "renderer-06-textures", .path = "renderer/06-textures/main.zig" },
        .{ .name = "renderer-07-streaming-textures", .path = "renderer/07-streaming-textures/main.zig" },
        .{ .name = "renderer-08-rotating-textures", .path = "renderer/08-rotating-textures/main.zig" },
        .{ .name = "renderer-09-scaling-textures", .path = "renderer/09-scaling-textures/main.zig" },
        .{ .name = "renderer-10-geometry", .path = "renderer/10-geometry/main.zig" },
        .{ .name = "renderer-11-color-mods", .path = "renderer/11-color-mods/main.zig" },
        .{ .name = "renderer-14-viewport", .path = "renderer/14-viewport/main.zig" },
        .{ .name = "renderer-15-cliprect", .path = "renderer/15-cliprect/main.zig" },
        .{ .name = "renderer-17-read-pixels", .path = "renderer/17-read-pixels/main.zig" },
        .{ .name = "renderer-18-debug-text", .path = "renderer/18-debug-text/main.zig" },
        .{ .name = "renderer-19-affine-textures", .path = "renderer/19-affine-textures/main.zig" },
        .{ .name = "renderer-20-blending", .path = "renderer/20-blending/main.zig" },
        .{ .name = "misc-01-power", .path = "misc/01-power/main.zig" },
        .{ .name = "misc-02-clipboard", .path = "misc/02-clipboard/main.zig" },
        .{ .name = "misc-03-locale", .path = "misc/03-locale/main.zig" },
        .{ .name = "audio-01-simple-playback", .path = "audio/01-simple-playback/main.zig" },
        .{ .name = "audio-02-simple-playback-callback", .path = "audio/02-simple-playback-callback/main.zig" },
        .{ .name = "audio-03-load-wav", .path = "audio/03-load-wav/main.zig" },
        .{ .name = "audio-04-multiple-streams", .path = "audio/04-multiple-streams/main.zig" },
        .{ .name = "audio-05-planar-data", .path = "audio/05-planar-data/main.zig" },
        .{ .name = "demo-01-snake", .path = "demo/01-snake/main.zig" },
        .{ .name = "chrome-01-custom-titlebar", .path = "chrome/01-custom-titlebar/main.zig" },
    };
    for (examples) |example| {
        const module = b.createModule(.{
            .root_source_file = b.path(example.path),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{
                .{ .name = "zdl", .module = zdl },
                .{ .name = "zlay", .module = zlay },
                .{ .name = "common", .module = common },
                .{ .name = "audio_common", .module = audio_common },
            },
        });
        const exe = b.addExecutable(.{ .name = example.name, .root_module = module });
        b.installArtifact(exe);
        const run = b.addRunArtifact(exe);
        run.addPassthruArgs();
        b.step(b.fmt("run-{s}", .{example.name}), b.fmt("Run the {s} example", .{example.name})).dependOn(&run.step);
    }
    const media = b.createModule(.{
        .root_source_file = b.path("apps/player/media/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{.{ .name = "zdl", .module = zdl }},
    });

    // Native UI toolkit (apps/ui) and the shadcn/ui dashboard-01 app (apps/dashboard).
    const assets = b.createModule(.{
        .root_source_file = b.path("apps/assets.zig"),
        .target = target,
        .optimize = optimize,
    });
    const ui = b.createModule(.{
        .root_source_file = b.path("apps/ui/ui.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{
            .{ .name = "zdl", .module = zdl },
            .{ .name = "zlay", .module = zlay },
        },
    });
    const dashboard = b.createModule(.{
        .root_source_file = b.path("apps/dashboard/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{
            .{ .name = "zdl", .module = zdl },
            .{ .name = "zlay", .module = zlay },
            .{ .name = "ui", .module = ui },
            .{ .name = "assets", .module = assets },
        },
    });
    const dashboard_exe = b.addExecutable(.{ .name = "apps-dashboard", .root_module = dashboard });
    b.installArtifact(dashboard_exe);
    const run_dashboard = b.addRunArtifact(dashboard_exe);
    run_dashboard.addPassthruArgs();
    b.step("run-apps-dashboard", "Run the shadcn/ui dashboard-01 app").dependOn(&run_dashboard.step);
    const playback = b.createModule(.{
        .root_source_file = b.path("apps/player/playback_check.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{ .{ .name = "zdl", .module = zdl }, .{ .name = "media", .module = media } },
    });
    const playback_exe = b.addExecutable(.{ .name = "playback-check", .root_module = playback });
    b.installArtifact(playback_exe);
    const apps_tests = b.addTest(.{ .root_module = dashboard });
    const run_apps_tests = b.addRunArtifact(apps_tests);
    const media_tests = b.addTest(.{ .root_module = media });
    const test_apps = b.step("test-apps", "Run toolkit, dashboard and media unit tests");
    test_apps.dependOn(&run_apps_tests.step);
    const ui_tests = b.addTest(.{ .root_module = ui });
    test_apps.dependOn(&b.addRunArtifact(ui_tests).step);
    test_apps.dependOn(&b.addRunArtifact(media_tests).step);
    const player_assets = b.createModule(.{ .root_source_file = b.path("apps/player/assets.zig"), .target = target, .optimize = optimize });
    const player_ui = b.createModule(.{
        .root_source_file = b.path("apps/player/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{ .{ .name = "zdl", .module = zdl }, .{ .name = "zlay", .module = zlay }, .{ .name = "ui", .module = ui }, .{ .name = "media", .module = media }, .{ .name = "player-assets", .module = player_assets } },
    });
    const player_exe = b.addExecutable(.{ .name = "apps-player", .root_module = player_ui });
    b.installArtifact(player_exe);
    const run_player = b.addRunArtifact(player_exe);
    run_player.addPassthruArgs();
    b.step("run-apps-player", "Run the VLC-style native media player").dependOn(&run_player.step);
    const build_apps = b.step("build-apps", "Compile the native applications and playback probe");
    build_apps.dependOn(&dashboard_exe.step);
    build_apps.dependOn(&player_exe.step);
    build_apps.dependOn(&playback_exe.step);
}
