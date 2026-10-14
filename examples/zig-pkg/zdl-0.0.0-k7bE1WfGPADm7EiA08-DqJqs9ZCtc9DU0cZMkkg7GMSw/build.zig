const std = @import("std");

/// Expose source to consumers. There is deliberately no prelinked archive:
/// building hundreds of exported objects would defeat lazy declaration analysis.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const native = b.addModule("zdl", .{
        .root_source_file = b.path("src/root.zig"), // i changed this myself.
        .target = target,
        .optimize = optimize,
    });

    // Calls in this compile-only consumer instantiate generic API bodies. A
    // namespace import alone would not cause Zig to analyze those bodies.
    const consumer_module = b.createModule(.{
        .root_source_file = b.path("tools/compile_check.zig"),
        .link_libc = true, // The check instantiates optional system-library backends.
        .target = target,
        .optimize = optimize,
    });
    consumer_module.addImport("zdl", native);
    const consumer = b.addExecutable(.{ .name = "zdl-compile-check", .root_module = consumer_module });
    _ = consumer.getEmittedBin(); // Check linking too, without running it.
    const tests = b.addTest(.{ .root_module = native });
    b.default_step.dependOn(&consumer.step);
    b.default_step.dependOn(&tests.step);
    const check = b.step("check", "Compile native declarations without executing tests or consumers");
    check.dependOn(&consumer.step);
    check.dependOn(&tests.step);
    // Existing tests remain available for explicit execution, without running
    // any as part of this compile-only port.
    const run = b.addRunArtifact(tests);
    b.step("test", "Run existing native unit tests").dependOn(&run.step);
}
