const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const shared = b.option(bool, "shared", "Build a shared library and require all symbols to resolve") orelse false;
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
    const api = b.addModule("SDL3", .{
        .root_source_file = b.path("include/SDL3/SDL.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    api.addImport("translation_builtins", builtins);
    api.addImport("guid", guid);
    api.linkLibrary(library);
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
    b.installArtifact(library);
}
