//! EGL window surfaces for X11 and Wayland windows, and the wl_egl_window that
//! Wayland requires. Ported from SDL_egl.c (SDL_EGL_CreateSurface) and
//! SDL_waylandopengles.c, which wraps the wl_surface with wl_egl_window_create
//! and resizes it on every window size change.
//!
//! A `WindowSurface` borrows its `Display` (see display.zig for the lifetime
//! rules) and owns the EGL surface and, on Wayland, the wl_egl_window. Deinit it
//! before the display. The native window itself (XID or wl_surface) is borrowed
//! and must outlive the surface.

const std = @import("std");
const binding = @import("binding.zig");
const attributes = @import("attributes.zig");
const display_mod = @import("display.zig");

const Display = display_mod.Display;
const Config = display_mod.Config;
const Error = display_mod.Error;

/// Drawable size in pixels. EGL and wl_egl_window take C int dimensions, so the
/// width is limited to 31 bits; callers pass the framebuffer size, not the
/// logical size, on HiDPI Wayland outputs.
pub const Size = struct {
    width: u31,
    height: u31,
};

/// The native window an EGL surface is created on.
pub const NativeWindow = union(enum) {
    /// X11 window ID (XID, as in `Window`); borrowed.
    x11: u64,
    /// `wl_surface*` from libwayland-client. A wl_egl_window of `size` is
    /// created on it and owned by the WindowSurface.
    wayland: *anyopaque,
    /// `gbm_surface*` from a `kmsdrm.GbmWindow`; borrowed.
    gbm: *anyopaque,
};

/// An EGL window surface and the native window bookkeeping it needs.
pub const WindowSurface = struct {
    display: *Display,
    handle: *binding.Surface,
    /// Present only on Wayland; resized with `resize` as the window changes size.
    wayland_window: ?*binding.WlEglWindow,

    /// Creates a window surface for `config` on `native`. Like SDL, the surface
    /// colour space is set from `attributes.framebuffer_srgb` when
    /// EGL_KHR_gl_colorspace is advertised. A `size` of zero on Wayland is
    /// rejected because wl_egl_window cannot be created with a zero dimension.
    pub fn create(display: *Display, config: Config, native: NativeWindow, size: Size, options: attributes.Attributes) Error!WindowSurface {
        var list: attributes.AttributeList(4) = .{};
        if (display.has_extension("EGL_KHR_gl_colorspace")) {
            const colorspace = if (options.framebuffer_srgb) attributes.egl.gl_colorspace_srgb else attributes.egl.gl_colorspace_linear;
            list.append(attributes.egl.gl_colorspace, colorspace) catch return error.AttributeListFull;
        }
        const request = list.terminated();
        switch (native) {
            .x11 => |window| {
                const handle = display.library.functions.eglCreateWindowSurface(display.handle, config.handle, @intCast(window), request.ptr) orelse return error.SurfaceCreationFailed;
                return .{ .display = display, .handle = handle, .wayland_window = null };
            },
            .wayland => |surface| {
                if (size.width == 0 or size.height == 0) return error.SurfaceCreationFailed;
                const egl = display.wayland_egl orelse return error.SurfaceCreationFailed;
                const wl_window = egl.create(surface, @intCast(size.width), @intCast(size.height)) orelse return error.SurfaceCreationFailed;
                errdefer egl.destroy(wl_window);
                const handle = display.library.functions.eglCreateWindowSurface(display.handle, config.handle, @intFromPtr(wl_window), request.ptr) orelse return error.SurfaceCreationFailed;
                return .{ .display = display, .handle = handle, .wayland_window = wl_window };
            },
            .gbm => |surface| {
                const handle = display.library.functions.eglCreateWindowSurface(display.handle, config.handle, @intFromPtr(surface), request.ptr) orelse return error.SurfaceCreationFailed;
                return .{ .display = display, .handle = handle, .wayland_window = null };
            },
        }
    }

    /// Resizes the wl_egl_window to a new pixel size. On X11 the EGL surface
    /// follows the X window automatically, so this is a no-op there.
    pub fn resize(self: *WindowSurface, size: Size) Error!void {
        const wl_window = self.wayland_window orelse return;
        if (size.width == 0 or size.height == 0) return error.WindowResizeFailed;
        const egl = self.display.wayland_egl orelse return error.WindowResizeFailed;
        egl.resize(wl_window, @intCast(size.width), @intCast(size.height), 0, 0);
    }

    /// Presents the back buffer (eglSwapBuffers). The surface must be the one
    /// current on this thread. On Wayland the window's frame callback still
    /// governs when the next frame is produced; see `Display.set_swap_interval`.
    pub fn swap_buffers(self: *WindowSurface) Error!void {
        if (self.display.library.functions.eglSwapBuffers(self.display.handle, self.handle) != binding.true_value) {
            return error.SwapBuffersFailed;
        }
    }

    /// Destroys the EGL surface, then the wl_egl_window (EGL requires this order).
    pub fn deinit(self: *WindowSurface) void {
        _ = self.display.library.functions.eglDestroySurface(self.display.handle, self.handle);
        if (self.wayland_window) |wl_window| {
            if (self.display.wayland_egl) |egl| egl.destroy(wl_window);
        }
        self.* = undefined;
    }
};
