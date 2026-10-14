const std = @import("std");

/// One executable per ported SDL example. zdl and zlay come from build.zig.zon;
/// pass `--fork=..` to build against the zdl working tree instead of the pin.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const zdl = b.dependency("zdl", .{ .target = target, .optimize = optimize }).module("zdl");
    const zlay = b.dependency("zlay", .{ .target = target, .optimize = optimize }).module("zlay");

    const examples = [_]struct { name: []const u8, path: []const u8 }{
        .{ .name = "smoke", .path = "smoke/main.zig" },
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
            },
        });
        const exe = b.addExecutable(.{ .name = example.name, .root_module = module });
        b.installArtifact(exe);
        const run = b.addRunArtifact(exe);
        run.addPassthruArgs();
        b.step(b.fmt("run-{s}", .{example.name}), b.fmt("Run the {s} example", .{example.name})).dependOn(&run.step);
    }
}
