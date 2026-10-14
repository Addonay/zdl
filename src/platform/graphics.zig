//! Window-to-graphics integration for the Linux platform: OpenGL through GLX or EGL,
//! Vulkan surfaces and GPU swapchain claims, all reached from a `Window` without
//! touching a native handle.
//!
//! This is the platform-owned counterpart of SDL_video.c's SDL_GL_CreateContext,
//! SDL_GL_MakeCurrent, SDL_GL_SwapWindow, SDL_GL_SetSwapInterval,
//! SDL_GL_GetSwapInterval, SDL_GL_ExtensionSupported, SDL_GL_GetProcAddress,
//! SDL_GL_DestroyContext, SDL_Vulkan_GetInstanceExtensions,
//! SDL_Vulkan_CreateSurface, SDL_Vulkan_DestroySurface,
//! SDL_Vulkan_GetPresentationSupport and SDL_ClaimWindowForGPUDevice /
//! SDL_ReleaseWindowFromGPUDevice. The X11 `Display*`, the `wl_display*`, the
//! `wl_surface*`, the X window id and its visual stay private to the platform;
//! the GLX, EGL and Vulkan helpers (`video/egl`, `video/vulkan_surface`) receive them
//! from here.
//!
//! OpenGL model. A window gets a GLX or EGL drawable the first time a context is
//! created for it; that call's `GlOptions.attributes` select the config and later
//! contexts reuse it. X11 defaults to GLX for desktop OpenGL and switches to EGL
//! when `force_egl_hint` carries SDL_VIDEO_FORCE_EGL or the caller selects EGL.
//! Wayland always uses EGL. X11 GLX and EGL displays are shared; Wayland owns one
//! EGL display per window, so a context works only with the window it was created
//! for. The Wayland wl_egl_window is resized whenever the
//! window's pixel size changes (`resize_surface`, called from the platform's
//! pixel-size check). A window that renders with GL must not also use
//! `Window.present`: both attach buffers to the same surface.
//!
//! Deliberate differences from SDL:
//! - Attributes are passed in `GlOptions` instead of the SDL_GL_SetAttribute
//!   global; contexts are created on the window's own surface rather than on a
//!   flag set at window creation.
//! - SDL_VIDEO_FORCE_EGL is passed explicitly as `force_egl_hint`; the platform
//!   has no hidden global hint state. GLX supports desktop GL; OpenGL ES uses EGL.
//! - Context handles are ids looked up in the platform, so a stale handle reports
//!   `error.NoGlContext` instead of dangling.
//! - On Wayland `gl_swap` does not wait for the compositor's frame callback
//!   (SDL_waylandopengles.c blocks up to 33 ms when the interval is non-zero);
//!   the requested interval is recorded and returned by `gl_swap_interval`.
//! - SDL_GL_GetAttribute and the SDL_GL_EXTENSION hint overrides are not
//!   provided. Share-group semantics (`GlShare`) are explicit arguments.
//!
//! Vulkan model. `Platform.vulkan_instance_extensions` names what the instance
//! must enable; `Window.create_vulkan_surface` creates a `VkSurfaceKHR` through
//! the caller's `vkGetInstanceProcAddr`; the caller destroys it with
//! `Window.destroy_vulkan_surface` before the instance and the window.
//!
//! GPU model. `Window.claim_for_gpu` creates the surface on the device's own
//! instance and claims it. Each acquire asks the window for its current pixel
//! size (`SizeSource.bound`), so a resize recreates the swapchain with no
//! further code in the application. A claim is released by
//! `Window.release_from_gpu`, or when the window or platform goes away; the
//! device and its instance must outlive that release.
//!
//! Synchronization: nothing here synchronizes; one thread drives a platform.
const std = @import("std");
const event = @import("../events/event.zig");
const egl_attributes = @import("../video/egl/attributes.zig");
const egl_display = @import("../video/egl/display.zig");
const egl_surface = @import("../video/egl/surface.zig");
const egl_context = @import("../video/egl/context.zig");
const glx = @import("../video/egl/glx.zig");
const vulkan_surface = @import("../video/vulkan_surface/surface.zig");
const vulkan_extensions = @import("../video/vulkan_surface/extensions.zig");
const x11_window = @import("../video/x11/window.zig");
const gpu_device = @import("../gpu/vulkan/device.zig");
const gpu_window = @import("../gpu/vulkan/window.zig");
const platform = @import("linux.zig");

const Platform = platform.Platform;
const Record = platform.Record;
const Window = platform.Window;
const Error = platform.Error;

/// Errors of the EGL, Vulkan surface and GPU helpers, joined into
/// `platform.Error`.
pub const GraphicsError = egl_display.Error || glx.Error || vulkan_surface.Error || gpu_device.Error || error{
    /// The context handle was destroyed, or no context is current.
    NoGlContext,
    /// `gl_swap` or a similar call was made for a window that is not current.
    NotCurrent,
    /// The context was created for a window on another graphics display/backend.
    IncompatibleContext,
    /// The window already has a GPU claim for this device, or none.
    AlreadyClaimed,
    NotClaimed,
};

/// OpenGL / OpenGL ES request: colour and depth sizes, profile, version and
/// context flags (replaces SDL_GL_SetAttribute). Defaults match SDL's.
pub const GlAttributes = egl_attributes.Attributes;

/// Whether the new context shares objects with another.
pub const GlShare = union(enum) {
    none,
    /// The context current on the calling thread (SDL_GL_SHARE_WITH_CURRENT_CONTEXT).
    current,
    context: GlContext,
};

/// OpenGL backend choice. Automatic follows SDL's X11 policy: GLX for desktop
/// GL, EGL for OpenGL ES and Wayland, unless force_egl_hint is true.
pub const GlBackend = enum { automatic, egl, glx };

/// Options of `Window.gl_create_context`.
pub const GlOptions = struct {
    attributes: GlAttributes = .{},
    share: GlShare = .none,
    backend: GlBackend = .automatic,
    /// Set this from SDL_VIDEO_FORCE_EGL when that hint is enabled.
    force_egl_hint: bool = false,
    /// The EGL library to load when EGL is selected.
    library: []const u8 = egl_display.default_library,
    /// The GLX library to load when GLX is selected.
    glx_library: []const u8 = glx.default_library,
};

/// Handle to a context owned by the platform. Valid until `Platform.gl_destroy_context`
/// or until the window it needs is destroyed (Wayland) / the platform closes.
pub const GlContext = struct {
    platform: *Platform,
    id: u32,

    /// Destroys the context (see `Platform.gl_destroy_context`).
    pub fn deinit(self: *GlContext) void {
        self.platform.gl_destroy_context(self.*);
        self.* = undefined;
    }
};

/// The surface handle of a claimed window, as `gpu.window.acquire_window_texture` takes it.
pub const GpuSurface = vulkan_surface.Surface;

pub const EglGlWindow = struct {
    display: *egl_display.Display,
    owns_display: bool,
    config: egl_display.Config,
    surface: egl_surface.WindowSurface,
};

pub const GlxGlWindow = struct {
    display: *glx.Display,
    config: glx.Config,
    surface: glx.Surface,
};

/// Per-window native GL state, heap-allocated so borrowed pointers stay stable.
pub const GlWindow = union(enum) {
    egl: EglGlWindow,
    glx: GlxGlWindow,
};

const ContextEntry = struct {
    id: u32,
    /// The window the context was created for.
    window: event.WindowId,
    context: union(enum) {
        egl: egl_context.Context,
        glx: glx.Context,
    },
};

const GpuClaim = struct {
    window: Window,
    device: *gpu_device.Device,
    surface: GpuSurface,

    fn pixel_size(self: *GpuClaim) gpu_window.WindowSize {
        const size = self.window.size_in_pixels() catch return .{ .width = 0, .height = 0 };
        return .{ .width = size.width, .height = size.height };
    }
};

/// Graphics bookkeeping of one platform.
pub const State = struct {
    /// The shared EGL display for X11 windows, opened on first use.
    egl_x11: ?*egl_display.Display = null,
    /// The shared GLX display/library for X11 windows, opened on first use.
    glx_x11: ?*glx.Display = null,
    contexts: std.ArrayList(*ContextEntry) = .empty,
    next_context: u32 = 1,
    current_context: ?u32 = null,
    current_window: event.WindowId = .none,
    claims: std.ArrayList(*GpuClaim) = .empty,

    /// Destroys every context and claim, then the shared EGL display. Windows
    /// must already be gone (their surfaces are destroyed with them).
    pub fn deinit(self: *State, allocator: std.mem.Allocator) void {
        self.destroy_contexts(allocator);
        self.contexts.deinit(allocator);
        for (self.claims.items) |claim| {
            release_claim(claim);
            allocator.destroy(claim);
        }
        self.claims.deinit(allocator);
        if (self.egl_x11) |shared| {
            shared.deinit();
            allocator.destroy(shared);
            self.egl_x11 = null;
        }
        if (self.glx_x11) |shared| {
            shared.deinit();
            allocator.destroy(shared);
            self.glx_x11 = null;
        }
    }

    fn destroy_contexts(self: *State, allocator: std.mem.Allocator) void {
        while (self.contexts.pop()) |entry| {
            deinit_context(entry);
            allocator.destroy(entry);
        }
        self.current_context = null;
        self.current_window = .none;
    }
};

/// A native window for the graphics backends, copied out of the platform record.
const NativeWindow = union(enum) {
    x11: struct { id: u64, visual_id: u32, connection: *x11_window.Connection },
    wayland: *anyopaque,
};

/// What EGL and Vulkan need from a window, copied out of its backend.
const NativeHandles = struct {
    display: *anyopaque,
    window: NativeWindow,
};

fn native_handles(p: *Platform, record: *Record) Error!NativeHandles {
    switch (record.native) {
        .x11 => |*window| {
            const session = p.x11 orelse return error.WindowClosed;
            return .{
                .display = session.connection.display,
                .window = .{ .x11 = .{ .id = @backingInt(window.id), .visual_id = window.visual_id(), .connection = &session.connection } },
            };
        },
        .wayland => |*window| {
            const surface = window.surface orelse return error.WindowClosed;
            return .{ .display = window.display, .window = .{ .wayland = surface } };
        },
        .wayland_popup => return error.UnsupportedOperation,
        .none => return error.WindowClosed,
    }
}

fn clamp_u31(value: u32) u31 {
    return @intCast(@min(value, std.math.maxInt(u31)));
}

// ---------------------------------------------------------------------------
// OpenGL

/// Returns the window's EGL state, creating the display, config and surface on
/// first use with `options`.
fn ensure_gl_window(p: *Platform, record: *Record, options: GlOptions) Error!*GlWindow {
    if (record.gl) |existing| return existing;
    const handles = try native_handles(p, record);
    const pixels = p.pixel_size_of(record);
    if (pixels.width == 0 or pixels.height == 0) return error.InvalidSize;

    const selected = selected_gl_backend(handles.window, options);
    if (selected == .glx) {
        const native = switch (handles.window) {
            .x11 => |x| x,
            .wayland => return error.UnsupportedOperation,
        };
        var display: *glx.Display = undefined;
        if (p.graphics.glx_x11) |shared| {
            display = shared;
        } else {
            display = try p.allocator.create(glx.Display);
            errdefer p.allocator.destroy(display);
            display.* = try glx.Display.open(native.connection, options.glx_library);
            p.graphics.glx_x11 = display;
        }
        const config = try display.choose_config(options.attributes, .window, native.visual_id);
        var surface = try glx.Surface.create_window(display, config, native.id, native.visual_id);
        errdefer surface.deinit();
        const state = try p.allocator.create(GlWindow);
        state.* = .{ .glx = .{ .display = display, .config = config, .surface = surface } };
        record.gl = state;
        return state;
    }

    var display: *egl_display.Display = undefined;
    var owns_display = false;
    switch (handles.window) {
        .x11 => {
            if (p.graphics.egl_x11) |shared| {
                display = shared;
            } else {
                display = try p.allocator.create(egl_display.Display);
                errdefer p.allocator.destroy(display);
                display.* = try egl_display.Display.open(.{ .x11 = handles.display }, options.library);
                p.graphics.egl_x11 = display;
            }
        },
        .wayland => {
            display = try p.allocator.create(egl_display.Display);
            errdefer p.allocator.destroy(display);
            display.* = try egl_display.Display.open(.{ .wayland = handles.display }, options.library);
            owns_display = true;
        },
    }
    errdefer if (owns_display) {
        display.deinit();
        p.allocator.destroy(display);
    };

    const visual: ?u32 = switch (handles.window) {
        .x11 => |x| x.visual_id,
        .wayland => null,
    };
    const config = try display.choose_config(options.attributes, visual);
    const native: egl_surface.NativeWindow = switch (handles.window) {
        .x11 => |x| .{ .x11 = x.id },
        .wayland => |surface| .{ .wayland = surface },
    };
    const size: egl_surface.Size = .{ .width = clamp_u31(pixels.width), .height = clamp_u31(pixels.height) };
    var surface = try egl_surface.WindowSurface.create(display, config, native, size, options.attributes);
    errdefer surface.deinit();

    const state = try p.allocator.create(GlWindow);
    state.* = .{ .egl = .{ .display = display, .owns_display = owns_display, .config = config, .surface = surface } };
    record.gl = state;
    return state;
}

fn selected_gl_backend(window: NativeWindow, options: GlOptions) GlBackend {
    return switch (options.backend) {
        .egl => .egl,
        .glx => .glx,
        .automatic => switch (window) {
            .x11 => if (options.force_egl_hint or options.attributes.profile == .es) .egl else .glx,
            .wayland => .egl,
        },
    };
}

/// Creates a context for `record` and makes it current on it (SDL_GL_CreateContext).
pub fn create_context(p: *Platform, record: *Record, options: GlOptions) Error!GlContext {
    const gl_window = try ensure_gl_window(p, record, options);
    const entry = try p.allocator.create(ContextEntry);
    errdefer p.allocator.destroy(entry);
    entry.* = .{
        .id = p.graphics.next_context,
        .window = record.id,
        .context = switch (gl_window.*) {
            .egl => |*gl| .{ .egl = try create_egl_context(p, gl, options) },
            .glx => |*gl| .{ .glx = try create_glx_context(p, gl, options) },
        },
    };
    errdefer deinit_context(entry);
    try p.graphics.contexts.append(p.allocator, entry);
    p.graphics.next_context += 1;
    p.graphics.current_context = entry.id;
    p.graphics.current_window = record.id;
    return .{ .platform = p, .id = entry.id };
}

fn create_egl_context(p: *Platform, gl: *const EglGlWindow, options: GlOptions) Error!egl_context.Context {
    const share: egl_context.Share = switch (options.share) {
        .none => .none,
        .current => .current,
        .context => |other| blk: {
            const entry = try find_entry(p, other.id);
            switch (entry.context) {
                .egl => |*context| {
                    if (context.display != gl.display) return error.IncompatibleContext;
                    break :blk .{ .context = context };
                },
                .glx => return error.IncompatibleContext,
            }
        },
    };
    return egl_context.Context.create(gl.display, gl.config, &gl.surface, options.attributes, share);
}

fn create_glx_context(p: *Platform, gl: *const GlxGlWindow, options: GlOptions) Error!glx.Context {
    const share: glx.Share = switch (options.share) {
        .none => .none,
        .current => .current,
        .context => |other| blk: {
            const entry = try find_entry(p, other.id);
            switch (entry.context) {
                .egl => return error.IncompatibleContext,
                .glx => |*context| {
                    if (context.display != gl.display) return error.IncompatibleContext;
                    break :blk .{ .context = context };
                },
            }
        },
    };
    return glx.Context.create(gl.display, gl.config, &gl.surface, options.attributes, share);
}

fn find_entry(p: *Platform, id: u32) Error!*ContextEntry {
    for (p.graphics.contexts.items) |entry| {
        if (entry.id == id) return entry;
    }
    return error.NoGlContext;
}

fn current_entry(p: *Platform) Error!*ContextEntry {
    return find_entry(p, p.graphics.current_context orelse return error.NoGlContext);
}

/// SDL_GL_MakeCurrent. Both null releases the current context; a context
/// without a window is made current surfaceless when the driver allows it; a
/// window without a context releases like SDL does.
pub fn make_current(p: *Platform, window: ?Window, context: ?GlContext) Error!void {
    const ctx = context orelse return release_current(p);
    const entry = try find_entry(p, ctx.id);
    if (window) |handle| {
        const record = try p.record_for(handle.id);
        const window_gl = record.gl orelse return error.NoGlContext;
        switch (entry.context) {
            .egl => |*context_value| switch (window_gl.*) {
                .egl => |*gl| {
                    if (gl.display != context_value.display) return error.IncompatibleContext;
                    try context_value.make_current(&gl.surface);
                },
                .glx => return error.IncompatibleContext,
            },
            .glx => |*context_value| switch (window_gl.*) {
                .egl => return error.IncompatibleContext,
                .glx => |*gl| {
                    if (gl.display != context_value.display) return error.IncompatibleContext;
                    try context_value.make_current(&gl.surface);
                },
            },
        }
        p.graphics.current_window = handle.id;
    } else {
        switch (entry.context) {
            .egl => |*context_value| try context_value.make_current(null),
            .glx => return error.NoDrawable,
        }
        p.graphics.current_window = .none;
    }
    p.graphics.current_context = entry.id;
}

fn release_current(p: *Platform) Error!void {
    const entry = current_entry(p) catch {
        p.graphics.current_context = null;
        p.graphics.current_window = .none;
        return;
    };
    switch (entry.context) {
        .egl => |*context_value| try context_value.display.release_current(),
        .glx => |*context_value| try context_value.display.release_current(),
    }
    p.graphics.current_context = null;
    p.graphics.current_window = .none;
}

/// Destroys a context (SDL_GL_DestroyContext). A current context is released first.
pub fn destroy_context(p: *Platform, id: u32) void {
    for (p.graphics.contexts.items, 0..) |entry, index| {
        if (entry.id != id) continue;
        deinit_context(entry);
        if (p.graphics.current_context == id) {
            p.graphics.current_context = null;
            p.graphics.current_window = .none;
        }
        _ = p.graphics.contexts.orderedRemove(index);
        p.allocator.destroy(entry);
        return;
    }
}

/// SDL_GL_SwapWindow: presents `record`'s back buffer. The window must be the
/// one the current context is bound to.
pub fn swap(p: *Platform, record: *Record) Error!void {
    const gl = record.gl orelse return error.NoGlContext;
    if (p.graphics.current_window != record.id) return error.NotCurrent;
    switch (gl.*) {
        .egl => |*window_gl| try window_gl.surface.swap_buffers(),
        .glx => |*window_gl| try window_gl.surface.swap_buffers(),
    }
}

/// SDL_GL_SetSwapInterval for the current context's display.
pub fn set_swap_interval(p: *Platform, interval: i32) Error!void {
    const entry = try current_entry(p);
    switch (entry.context) {
        .egl => |*context_value| try context_value.display.set_swap_interval(interval),
        .glx => |*context_value| {
            const window_id = p.graphics.current_window;
            if (window_id == .none) return error.NoDrawable;
            const record = try p.record_for(window_id);
            const gl = record.gl orelse return error.NoGlContext;
            switch (gl.*) {
                .egl => return error.IncompatibleContext,
                .glx => |*window_gl| try context_value.display.set_swap_interval(&window_gl.surface, interval),
            }
        },
    }
}

/// SDL_GL_GetSwapInterval for the current context's display.
pub fn swap_interval(p: *Platform) Error!i32 {
    const entry = try current_entry(p);
    return switch (entry.context) {
        .egl => |context_value| context_value.display.swap_interval(),
        .glx => |context_value| context_value.display.swap_interval(),
    };
}

/// SDL_GL_ExtensionSupported: asks the current context.
pub fn extension_supported(p: *Platform, name: []const u8) bool {
    const entry = current_entry(p) catch return false;
    return switch (entry.context) {
        .egl => |context_value| context_value.gl_has_extension(name),
        .glx => |context_value| context_value.gl_has_extension(name),
    };
}

/// SDL_GL_GetProcAddress for the current context's display; null when there is
/// no context or the function is unknown.
pub fn proc_address(p: *Platform, comptime Fn: type, name: [:0]const u8) ?Fn {
    const entry = current_entry(p) catch return null;
    return switch (entry.context) {
        .egl => |context_value| context_value.display.proc_address(Fn, name),
        .glx => |context_value| context_value.display.proc_address(Fn, name),
    };
}

/// Resizes a Wayland window's wl_egl_window to the pixel size the backend
/// reports now. Does nothing for windows without GL or on X11.
pub fn resize_surface(p: *Platform, record: *Record) Error!void {
    const gl = record.gl orelse return;
    const pixels = p.pixel_size_of(record);
    if (pixels.width == 0 or pixels.height == 0) return;
    switch (gl.*) {
        .egl => |*window_gl| try window_gl.surface.resize(.{ .width = clamp_u31(pixels.width), .height = clamp_u31(pixels.height) }),
        .glx => {},
    }
}

// ---------------------------------------------------------------------------
// Vulkan

/// The Vulkan instance extensions the active backend needs.
pub fn instance_extensions(backend: platform.Backend) []const [:0]const u8 {
    return vulkan_extensions.required(switch (backend) {
        .x11 => .x11,
        .wayland => .wayland,
    });
}

/// Creates a VkSurfaceKHR for `record` on `instance` (SDL_Vulkan_CreateSurface).
pub fn create_vulkan_surface(p: *Platform, record: *Record, instance: *anyopaque, get_proc: vulkan_surface.ProcAddress) Error!vulkan_surface.Surface {
    const handles = try native_handles(p, record);
    return switch (handles.window) {
        .x11 => |x| try vulkan_surface.create_xlib_surface(get_proc, instance, handles.display, x.id),
        .wayland => |surface| try vulkan_surface.create_wayland_surface(get_proc, instance, handles.display, surface),
    };
}

/// SDL_Vulkan_GetPresentationSupport for the platform's connection.
pub fn presentation_support(p: *Platform, get_proc: vulkan_surface.ProcAddress, instance: *anyopaque, physical_device: *anyopaque, queue_family: u32) bool {
    if (p.x11) |session| {
        return vulkan_surface.xlib_presentation_support(get_proc, instance, physical_device, queue_family, session.connection.display, session.connection.default_visual_id());
    }
    if (p.wayland != null) {
        // Each Wayland window owns its connection; the first window's display
        // stands for the compositor, as all windows share one.
        for (p.records.items) |record| switch (record.native) {
            .wayland => |*window| return vulkan_surface.wayland_presentation_support(get_proc, instance, physical_device, queue_family, window.display),
            else => {},
        };
    }
    return false;
}

// ---------------------------------------------------------------------------
// GPU

fn device_proc_address(device: *gpu_device.Device) vulkan_surface.ProcAddress {
    return @ptrCast(device.library.get_instance_proc_addr);
}

/// SDL_ClaimWindowForGPUDevice: creates the surface on the device's instance and
/// claims it. The device must have been created with `instance_extensions`.
pub fn claim_for_gpu(p: *Platform, record: *Record, device: *gpu_device.Device, options: gpu_device.SwapchainOptions) Error!GpuSurface {
    for (p.graphics.claims.items) |claim| {
        if (claim.window.id == record.id and claim.device == device) return error.AlreadyClaimed;
    }
    const instance = device.instance orelse return error.NotClaimed;
    const get_proc = device_proc_address(device);
    const surface = try create_vulkan_surface(p, record, instance, get_proc);
    errdefer vulkan_surface.destroy_surface(get_proc, instance, surface);

    const claim = try p.allocator.create(GpuClaim);
    errdefer p.allocator.destroy(claim);
    claim.* = .{ .window = .{ .platform = p, .id = record.id }, .device = device, .surface = surface };
    try p.graphics.claims.ensureUnusedCapacity(p.allocator, 1);
    try gpu_window.claim_window_with(device, surface, options, gpu_window.SizeSource.bound(GpuClaim, claim, GpuClaim.pixel_size));
    p.graphics.claims.appendAssumeCapacity(claim);
    return surface;
}

fn release_claim(claim: *GpuClaim) void {
    gpu_window.unclaim_window(claim.device, claim.surface);
    const instance = claim.device.instance orelse return;
    vulkan_surface.destroy_surface(device_proc_address(claim.device), instance, claim.surface);
}

/// Releases `record`'s claim on `device` (SDL_ReleaseWindowFromGPUDevice): waits
/// for the GPU, destroys the swapchain and the surface.
pub fn release_from_gpu(p: *Platform, record: *Record, device: *gpu_device.Device) Error!void {
    for (p.graphics.claims.items, 0..) |claim, index| {
        if (claim.window.id != record.id or claim.device != device) continue;
        release_claim(claim);
        _ = p.graphics.claims.orderedRemove(index);
        p.allocator.destroy(claim);
        return;
    }
    return error.NotClaimed;
}

// ---------------------------------------------------------------------------
// Window teardown

/// Releases everything graphics-related that belongs to `record`; called before
/// the native window is destroyed. GPU claims go first (they wait for the GPU),
/// then the EGL surface, then a Wayland window's private display with the
/// contexts that live on it.
pub fn release_window(p: *Platform, record: *Record) void {
    var index: usize = 0;
    while (index < p.graphics.claims.items.len) {
        const claim = p.graphics.claims.items[index];
        if (claim.window.id == record.id) {
            release_claim(claim);
            _ = p.graphics.claims.orderedRemove(index);
            p.allocator.destroy(claim);
        } else {
            index += 1;
        }
    }
    const gl = record.gl orelse return;
    record.gl = null;
    if (p.graphics.current_window == record.id) p.graphics.current_window = .none;
    var at: usize = 0;
    while (at < p.graphics.contexts.items.len) {
        const entry = p.graphics.contexts.items[at];
        if (entry.window == record.id) {
            if (p.graphics.current_context == entry.id) p.graphics.current_context = null;
            deinit_context(entry);
            _ = p.graphics.contexts.orderedRemove(at);
            p.allocator.destroy(entry);
        } else {
            at += 1;
        }
    }
    switch (gl.*) {
        .egl => |*window_gl| {
            window_gl.surface.deinit();
            if (window_gl.owns_display) {
                window_gl.display.deinit();
                p.allocator.destroy(window_gl.display);
            }
        },
        .glx => |*window_gl| window_gl.surface.deinit(),
    }
    p.allocator.destroy(gl);
}

fn deinit_context(entry: *ContextEntry) void {
    switch (entry.context) {
        .egl => |*context_value| context_value.deinit(),
        .glx => |*context_value| context_value.deinit(),
    }
}
