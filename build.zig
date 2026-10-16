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

    // Disposable WP-02 experiment: absent from default/check/test dependency
    // graphs, and never imported by the public library. Runtime providers are
    // required only when these explicitly named opt-in steps are executed.
    if (target.result.os.tag == .linux) {
        const paragraph_module = b.createModule(.{
            .root_source_file = b.path("tools/spikes/paragraph/main.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        });
        const paragraph_demo = b.addExecutable(.{ .name = "zdl-paragraph-spike", .root_module = paragraph_module });
        const paragraph_tests = b.addTest(.{ .root_module = b.createModule(.{
            .root_source_file = b.path("tools/spikes/paragraph/tests.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }) });
        const paragraph_check = b.step("check-paragraph-spike", "Compile the disposable Linux Pango/Cairo experiment");
        paragraph_check.dependOn(&paragraph_tests.step);
        paragraph_check.dependOn(&b.addInstallArtifact(paragraph_demo, .{
            .dest_sub_path = b.fmt("spikes/{s}/zdl-paragraph-spike", .{@tagName(optimize orelse .debug)}),
        }).step);
        const paragraph_run = b.addRunArtifact(paragraph_demo);
        paragraph_run.setEnvironmentVariable("G_DEBUG", "fatal-warnings");
        paragraph_run.addPassthruArgs();
        b.step("run-paragraph-spike", "Run a finite Pango/Cairo experiment (arguments: PNG path, optional width)").dependOn(&paragraph_run.step);
        const paragraph_test_run = b.addRunArtifact(paragraph_tests);
        paragraph_test_run.setEnvironmentVariable("G_DEBUG", "fatal-warnings");
        b.step("test-paragraph-spike", "Run opt-in Linux paragraph provider tests").dependOn(&paragraph_test_run.step);
    }

    // Native editor feasibility stays opt-in, like its paragraph provider.
    if (target.result.os.tag == .linux) {
        const editor_module = b.createModule(.{
            .root_source_file = b.path("tools/spikes/editor_main.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{.{ .name = "zdl", .module = native }},
        });
        const editor = b.addExecutable(.{ .name = "zdl-editor-spike", .root_module = editor_module });
        const checks = b.addTest(.{ .root_module = b.createModule(.{
            .root_source_file = b.path("tools/spikes/editor_tests.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{.{ .name = "zdl", .module = native }},
        }) });
        const check_editor = b.step("check-editor-spike", "Compile the optional native editable paragraph experiment");
        check_editor.dependOn(&checks.step);
        check_editor.dependOn(&b.addInstallArtifact(editor, .{ .dest_sub_path = b.fmt("spikes/{s}/zdl-editor-spike", .{@tagName(optimize orelse .debug)}) }).step);
        const run_editor = b.addRunArtifact(editor);
        run_editor.addPassthruArgs();
        run_editor.setEnvironmentVariable("G_DEBUG", "fatal-warnings");
        b.step("run-editor-spike", "Run the optional paragraph editor (use --script for finite offscreen output)").dependOn(&run_editor.step);
        const tests_editor = b.addRunArtifact(checks);
        tests_editor.setEnvironmentVariable("G_DEBUG", "fatal-warnings");
        b.step("test-editor-spike", "Run optional Pango/document editing integration tests").dependOn(&tests_editor.step);
    }

    // Optional dependency experiment: the audit passes an extracted, hash-checked
    // source directory from the exact examples pin. Core has no zlay dependency.
    if (b.option([]const u8, "layout-zlay-source", "Pinned zlay source directory for the optional layout experiment")) |directory| {
        const zlay = b.createModule(.{ .root_source_file = .{ .cwd_relative = b.fmt("{s}/src/root.zig", .{directory}) }, .target = target, .optimize = optimize });
        const pure = b.createModule(.{ .root_source_file = b.path("tools/spikes/layout_main.zig"), .target = target, .optimize = optimize, .imports = &.{ .{ .name = "zdl", .module = native }, .{ .name = "zlay", .module = zlay } } });
        const executable = b.addExecutable(.{ .name = "zdl-layout-spike", .root_module = pure });
        const check_layout = b.step("check-layout-spike", "Compile the optional pinned-zlay adapter experiment");
        check_layout.dependOn(&b.addInstallArtifact(executable, .{ .dest_sub_path = b.fmt("spikes/{s}/zdl-layout-spike", .{@tagName(optimize orelse .debug)}) }).step);
        const test_layout = b.step("test-layout-spike", "Run pinned-zlay geometry and paragraph integration fixtures");
        inline for (.{ "layout_tests.zig", "layout_paragraph_tests.zig" }) |file| {
            const tests = b.addTest(.{ .root_module = b.createModule(.{
                .root_source_file = b.path("tools/spikes/" ++ file),
                .target = target,
                .optimize = optimize,
                .link_libc = std.mem.eql(u8, file, "layout_paragraph_tests.zig"),
                .imports = &.{ .{ .name = "zdl", .module = native }, .{ .name = "zlay", .module = zlay } },
            }) });
            check_layout.dependOn(&tests.step);
            const run_tests = b.addRunArtifact(tests);
            run_tests.setEnvironmentVariable("G_DEBUG", "fatal-warnings");
            test_layout.dependOn(&run_tests.step);
        }
    }

    // Concrete consumers keep dependency boundaries measurable. Installation is
    // compile/link-only: audit_foundation.py explicitly runs the safe profiles.
    const foundation = b.step("check-foundation", "Compile/link isolated geometry, image, audio, retained scene and window consumers");
    inline for (.{ "geometry", "image", "audio", "scene", "state", "text", "registration", "semantics", "actions", "paint", "window" }) |profile| {
        if (!std.mem.eql(u8, profile, "window") or target.result.os.tag == .linux) {
            const module = b.createModule(.{
                .root_source_file = b.path("tools/consumers/" ++ profile ++ ".zig"),
                .target = target,
                .optimize = optimize,
                .link_libc = std.mem.eql(u8, profile, "window"),
                .imports = &.{.{ .name = "zdl", .module = native }},
            });
            const executable = b.addExecutable(.{ .name = "zdl-foundation-" ++ profile, .root_module = module });
            foundation.dependOn(&b.addInstallArtifact(executable, .{
                .dest_sub_path = b.fmt("foundation/{s}/zdl-foundation-{s}", .{ @tagName(optimize orelse .debug), profile }),
            }).step);
        }
    }

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
    check.dependOn(foundation);
    // Existing tests remain available for explicit execution, without running
    // any as part of this compile-only port.
    const run = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run native unit tests and Linux platform regressions");
    test_step.dependOn(&run.step);

    // Platform API bodies instantiate optional C-library backends. Test those
    // with libc in a separate application root, keeping native/core consumers
    // free to compile without libc.
    if (target.result.os.tag == .linux) {
        const platform_module = b.createModule(.{
            .root_source_file = b.path("tools/platform_test.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{.{ .name = "zdl", .module = native }},
        });
        const platform_tests = b.addTest(.{ .root_module = platform_module });
        b.default_step.dependOn(&platform_tests.step);
        check.dependOn(&platform_tests.step);
        test_step.dependOn(&b.addRunArtifact(platform_tests).step);

        // Exercise the actual optional loader against controlled ELF providers.
        // Fixture addresses are resolved but never invoked as audio functions.
        const alsa_binding = b.createModule(.{
            .root_source_file = b.path("src/audio/alsa/binding.zig"),
            .target = target,
            .optimize = optimize,
        });
        const fixture_paths = b.addOptions();
        inline for (.{ "complete", "pcm_open", "pcm_recover", "strerror" }) |name| {
            const fixture_options = b.addOptions();
            fixture_options.addOption([]const u8, "omit", if (std.mem.eql(u8, name, "complete")) "" else name);
            const fixture_module = b.createModule(.{
                .root_source_file = b.path("tools/fixtures/alsa_symbols.zig"),
                .target = target,
                .optimize = optimize,
                .imports = &.{.{ .name = "alsa_binding", .module = alsa_binding }},
            });
            fixture_module.addOptions("fixture_options", fixture_options);
            const fixture = b.addLibrary(.{
                .name = "zdl-alsa-fixture-" ++ name,
                .linkage = .dynamic,
                .root_module = fixture_module,
            });
            fixture_paths.addOptionPath(name, fixture.getEmittedBin());
        }
        const provider_module = b.createModule(.{
            .root_source_file = b.path("tools/provider_test.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{.{ .name = "alsa_binding", .module = alsa_binding }},
        });
        provider_module.addOptions("provider_fixtures", fixture_paths);
        const provider_tests = b.addTest(.{ .root_module = provider_module });
        const provider_step = b.step("test-providers", "Test optional library rejection and loader ownership without hardware");
        const provider_run = b.addRunArtifact(provider_tests);
        provider_step.dependOn(&provider_run.step);
        test_step.dependOn(&provider_run.step);
        b.default_step.dependOn(&provider_tests.step);
        check.dependOn(&provider_tests.step);

        const pipewire_module = b.createModule(.{
            .root_source_file = b.path("src/pipewire_tests.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        });
        const pipewire_tests = b.addTest(.{ .root_module = pipewire_module });
        const pipewire_run = b.addRunArtifact(pipewire_tests);
        provider_step.dependOn(&pipewire_run.step);
        test_step.dependOn(&pipewire_run.step);
        b.default_step.dependOn(&pipewire_tests.step);
        check.dependOn(&pipewire_tests.step);
    }
}
