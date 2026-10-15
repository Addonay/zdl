//! Optional headless EGL pbuffer target for offscreen OpenGL rendering.
//!
//! The target prefers EGL_MESA_platform_surfaceless through the shared EGL
//! loader, creates a pbuffer config/surface and owns a current GL/GLES context.
//! It needs no X11 or Wayland connection. The caller owns the target and must
//! keep it on the context's current thread.
const std = @import("std");
const egl_display = @import("../egl/display.zig");
const egl_surface = @import("../egl/surface.zig");
const egl_context = @import("../egl/context.zig");
const egl_attributes = @import("../egl/attributes.zig");

pub const Error = std.mem.Allocator.Error || egl_display.Error || error{TargetSizeInvalid};

/// Size and context attributes for `Target.open`.
pub const Options = struct {
    size: egl_surface.Size,
    attributes: egl_attributes.Attributes = .{},
    library: []const u8 = egl_display.default_library,
};

/// Owns a surfaceless EGL Display, pbuffer, and GL/GLES context. All EGL-owned
/// values stay at stable addresses until `deinit`.
pub const Target = struct {
    allocator: std.mem.Allocator,
    display: *egl_display.Display,
    config: egl_display.Config,
    surface: egl_surface.PbufferSurface,
    context: egl_context.Context,
    size: egl_surface.Size,

    /// Opens EGL on the surfaceless platform and makes the new context current.
    pub fn open(allocator: std.mem.Allocator, options: Options) Error!Target {
        if (options.size.width == 0 or options.size.height == 0) return error.TargetSizeInvalid;
        const display = try allocator.create(egl_display.Display);
        errdefer allocator.destroy(display);
        display.* = try egl_display.Display.open(.surfaceless, options.library);
        errdefer display.deinit();
        const config = try display.choose_pbuffer_config(options.attributes);
        var pbuffer = try egl_surface.PbufferSurface.create(display, config, options.size);
        errdefer pbuffer.deinit();
        const context = try egl_context.Context.create_pbuffer(display, config, &pbuffer, options.attributes, .none);
        return .{ .allocator = allocator, .display = display, .config = config, .surface = pbuffer, .context = context, .size = options.size };
    }

    /// Makes the owned context current on the pbuffer again.
    pub fn make_current(self: *Target) egl_display.Error!void {
        try self.context.make_pbuffer_current(&self.surface);
    }

    /// Swaps EGL pbuffer buffers when supported by its chosen config.
    pub fn swap_buffers(self: *Target) egl_display.Error!void {
        try self.surface.swap_buffers();
    }

    /// Sets the swap interval on the EGL display.
    pub fn set_swap_interval(self: *Target, interval: i32) egl_display.Error!void {
        try self.display.set_swap_interval(interval);
    }

    /// Resolves a GL/EGL entry point from the loaded display.
    pub fn proc_address(self: *const Target, comptime Fn: type, name: [:0]const u8) ?Fn {
        return self.display.proc_address(Fn, name);
    }

    /// Releases context, pbuffer, EGL display and its dynamic-library handle.
    pub fn deinit(self: *Target) void {
        self.context.deinit();
        self.surface.deinit();
        self.display.deinit();
        self.allocator.destroy(self.display);
        self.* = undefined;
    }
};
