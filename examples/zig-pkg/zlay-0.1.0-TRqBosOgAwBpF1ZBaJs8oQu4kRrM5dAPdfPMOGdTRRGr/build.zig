const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // The library itself. It doesn't import std, so it works on any target,
    // including freestanding / wasm32.
    const zlay = b.addModule("zlay", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Tests (these use std for expectations only).
    const tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("tests/tests.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{.{ .name = "zlay", .module = zlay }},
        }),
    });
    const lib_tests = b.addTest(.{ .root_module = zlay });
    const test_step = b.step("test", "Run the zlay tests");
    test_step.dependOn(&b.addRunArtifact(tests).step);
    test_step.dependOn(&b.addRunArtifact(lib_tests).step);

    // Example: prints the render commands of a small layout.
    const example = b.addExecutable(.{
        .name = "zlay-example",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/print_commands.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{.{ .name = "zlay", .module = zlay }},
        }),
    });
    const run_example = b.addRunArtifact(example);
    const example_step = b.step("example", "Run the example that prints render commands");
    example_step.dependOn(&run_example.step);

    // Keep both benchmark engines optimized even when the rest of the build is Debug.
    // const bench_optimize = b.option(std.lang.OptimizeMode, "bench-optimize", "Benchmark optimization mode (default: ReleaseFast)") orelse .fast;
    const bench = b.addExecutable(.{
        .name = "zlay-bench",
        .root_module = b.createModule(.{
            .root_source_file = b.path("bench/main.zig"),
            .target = target,
            .optimize = .fast,
            .link_libc = true,
            .imports = &.{.{ .name = "zlay", .module = b.createModule(.{
                .root_source_file = b.path("src/root.zig"),
                .target = target,
                .optimize = .fast,
            }) }},
        }),
    });
    bench.root_module.addIncludePath(b.path("bench"));
    bench.root_module.addCSourceFile(.{ .file = b.path("bench/clay.c"), .flags = &.{"-std=c11"} });
    const run_bench = b.addRunArtifact(bench);
    run_bench.addArgs(&.{
        "--samples",  b.fmt("{d}", .{b.option(u32, "bench-samples", "Paired samples per benchmark (default: 15)") orelse 15}),
        "--batch-ms", b.fmt("{d}", .{b.option(u32, "bench-batch-ms", "Target batch duration in milliseconds (default: 10)") orelse 10}),
        "--warmup",   b.fmt("{d}", .{b.option(u32, "bench-warmup", "Warmup operations per sample (default: 32)") orelse 32}),
        "--filter",   b.option([]const u8, "bench-filter", "Run benchmarks whose names contain this text") orelse "",
    });
    if (b.option(bool, "bench-verify-only", "Check outputs without timing") orelse false) run_bench.addArg("--verify-only");
    const bench_step = b.step("bench", "Run repeated head-to-head zlay / Clay benchmarks");
    bench_step.dependOn(&run_bench.step);
    const bench_tests = b.addTest(.{ .root_module = bench.root_module });
    const bench_test_step = b.step("bench-test", "Test benchmark statistics, ABI, and fixture invariants");
    bench_test_step.dependOn(&b.addRunArtifact(bench_tests).step);

    // Check that the library builds and links for a freestanding target
    // (no OS, no libc, no std) with every code path referenced.
    const wasm_target = b.resolveTargetQuery(.{ .cpu_arch = .wasm32, .os_tag = .freestanding });
    const freestanding = b.addExecutable(.{
        .name = "zlay-freestanding",
        .root_module = b.createModule(.{
            .root_source_file = b.path("tests/freestanding.zig"),
            .target = wasm_target,
            .optimize = .small,
            .imports = &.{.{ .name = "zlay", .module = b.createModule(.{
                .root_source_file = b.path("src/zlay.zig"),
                .target = wasm_target,
                .optimize = .small,
            }) }},
        }),
    });
    freestanding.entry = .disabled;
    freestanding.rdynamic = true;
    const check_step = b.step("check-freestanding", "Build zlay for wasm32-freestanding");
    check_step.dependOn(&b.addInstallArtifact(freestanding, .{}).step);
}
