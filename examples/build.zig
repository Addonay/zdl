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
}
