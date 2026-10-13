const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const shared = b.option(bool, "shared", "Build a shared library and require all symbols to resolve") orelse false;

    // Subsystems already converted to idiomatic Zig: they import only `std`,
    // are self-contained, and are covered by `zig build test`. Everything
    // still awaiting conversion lives in sources.zig and goes through the
    // translation_builtins shim.
    const converted = [_][]const u8{
        "src/atomic/SDL_atomic.zig",
        "src/atomic/SDL_spinlock.zig",
    };

    const builtins = b.createModule(.{
        .root_source_file = b.path("src/translation_builtins.zig"),
        .target = target,
        .optimize = optimize,
    });
    const simd = b.createModule(.{
        .root_source_file = b.path("src/simd.zig"),
        .target = target,
        .optimize = optimize,
    });
    const guid = b.createModule(.{
        .root_source_file = b.path("src/core/guid.zig"),
        .target = target,
        .optimize = optimize,
    });
    const calendar = b.createModule(.{
        .root_source_file = b.path("src/core/calendar.zig"),
        .target = target,
        .optimize = optimize,
    });
    const library = b.addLibrary(.{
        .name = "SDL3",
        .linkage = if (shared) .dynamic else .static,
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    library.link_z_defs = shared;
    library.root_module.linkSystemLibrary("m", .{});
    library.root_module.linkSystemLibrary("dl", .{});
    library.root_module.linkSystemLibrary("pthread", .{});
    library.root_module.addObject(b.addObject(.{
        .name = "sdl-linux-intrinsics",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/linux_intrinsics.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .pic = true,
        }),
    }));
    for (@import("sources.zig").files, 0..) |source, i| {
        const object = b.addObject(.{
            .name = b.fmt("sdl-{d}", .{i}),
            .use_llvm = std.mem.endsWith(u8, source, "SDL_fillrect.zig") or std.mem.endsWith(u8, source, "SDL_blit_copy.zig"),
            .root_module = b.createModule(.{
                .root_source_file = b.path(source),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
                .pic = true,
            }),
        });
        object.root_module.addImport("translation_builtins", builtins);
        object.root_module.addImport("simd", simd);
        object.root_module.addImport("guid", guid);
        object.root_module.addImport("calendar", calendar);
        library.root_module.addObject(object);
    }
    for (converted) |source| {
        library.root_module.addObject(b.addObject(.{
            .name = b.fmt("sdl-{s}", .{std.fs.path.stem(source)}),
            .root_module = b.createModule(.{
                .root_source_file = b.path(source),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
                .pic = true,
            }),
        }));
    }
    b.installArtifact(library);

    const tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/zdl.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    const run_tests = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run the unit tests");
    test_step.dependOn(&run_tests.step);
}
