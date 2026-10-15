//! EGL pixel buffers for offscreen OpenGL rendering.
//!
//! A pbuffer borrows its initialized `Display` and EGL config. Unbind contexts
//! and destroy the pbuffer before the display. The context can bind it through
//! `Context.make_current_pbuffer`.

const binding = @import("binding.zig");
const attributes = @import("attributes.zig");
const display_mod = @import("display.zig");

const Display = display_mod.Display;
const Config = display_mod.Config;

pub const Size = struct { width: u31, height: u31 };

/// A surface that owns its EGL pbuffer handle and borrows its display.
pub const Pbuffer = struct {
    display: *Display,
    handle: *binding.Surface,

    /// Creates an offscreen surface with the dimensions requested by the caller.
    pub fn create(display: *Display, config: Config, size: Size) display_mod.Error!Pbuffer {
        if (size.width == 0 or size.height == 0) return error.SurfaceCreationFailed;
        const list = [_]binding.Int{
            attributes.egl.width,
            @intCast(size.width),
            attributes.egl.height,
            @intCast(size.height),
            attributes.egl.none,
        };
        const handle = display.library.functions.eglCreatePbufferSurface(display.handle, config.handle, &list) orelse {
            return error.SurfaceCreationFailed;
        };
        return .{ .display = display, .handle = handle };
    }

    /// Swaps the pbuffer's EGL buffers when the selected config is double buffered.
    pub fn swap_buffers(self: *Pbuffer) display_mod.Error!void {
        if (self.display.library.functions.eglSwapBuffers(self.display.handle, self.handle) != binding.true_value) return error.SwapBuffersFailed;
    }

    /// Destroys the pbuffer. It must not be current when the display is closed.
    pub fn deinit(self: *Pbuffer) void {
        _ = self.display.library.functions.eglDestroySurface(self.display.handle, self.handle);
        self.* = undefined;
    }
};
