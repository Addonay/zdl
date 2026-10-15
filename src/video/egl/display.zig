//! EGL display for an X11 (Xlib) or Wayland (libwayland-client) connection:
//! library loading, EGL initialization, extension queries, GL/GLES config
//! selection and the swap interval. Ported from SDL_egl.c (SDL_EGL_LoadLibrary,
//! SDL_EGL_PrivateChooseConfig, SDL_EGL_SetSwapInterval) with the platform
//! differences of SDL_x11opengles.c and SDL_waylandopengles.c.
//!
//! The native display pointer (Display* or wl_display*) is borrowed: it must
//! outlive the `Display`. A `Display` owns libEGL and, on Wayland, libwayland-egl.
//! Surfaces and contexts borrow the `Display` through a pointer, so the Display
//! must not move while they exist and must be deinitialized after them.
//!
//! EGL's current-thread error state is read with `error_code`, not a Zig error,
//! because EGL reports most failures only through eglGetError.

const std = @import("std");
const binding = @import("binding.zig");
const attributes = @import("attributes.zig");
const Attributes = attributes.Attributes;

/// The shared library name SDL loads by default.
pub const default_library = "libEGL.so.1";

/// Native display the EGL platform is created on. The pointer is borrowed.
pub const Platform = union(enum) {
    /// `Display*` from XOpenDisplay. The window's visual is passed to
    /// `Display.choose_config` as `required_visual_id`.
    x11: *anyopaque,
    /// `wl_display*` from libwayland-client.
    wayland: *anyopaque,
    /// `gbm_device*` from the KMS/DRM backend.
    gbm: *anyopaque,
    /// EGL_MESA_platform_surfaceless; no native display handle is used.
    surfaceless,
};

/// EGL and loader failures. Read the EGL error code with `Display.error_code`
/// after a failure that names an EGL call.
pub const Error = binding.LoadError || error{
    NoDisplay,
    InitializationFailed,
    BindApiFailed,
    NoMatchingConfig,
    InvalidAttributes,
    AttributeListFull,
    ContextAttributesUnsupported,
    ContextCreationFailed,
    MakeCurrentFailed,
    SurfaceCreationFailed,
    SurfacelessUnsupported,
    SwapBuffersFailed,
    SwapIntervalUnsupported,
    SwapIntervalFailed,
    WindowResizeFailed,
};

/// EGL 1.x version reported by eglInitialize.
pub const Version = struct {
    major: i32,
    minor: i32,

    pub fn at_least(self: Version, major: i32, minor: i32) bool {
        return self.major > major or (self.major == major and self.minor >= minor);
    }
};

/// An EGLConfig borrowed from its `Display`; valid until the display is deinitialized.
pub const Config = struct {
    handle: *binding.Config,
};

/// Upper bound on configs returned by one eglChooseConfig; SDL uses 128 as well.
const max_configs = 128;

/// An initialized EGL display. Owns libEGL (and libwayland-egl on Wayland).
pub const Display = struct {
    library: binding.Library,
    handle: *binding.Display,
    platform: Platform,
    wayland_egl: ?binding.WaylandEgl,
    version: Version,
    /// Driver-owned EGL_EXTENSIONS string, borrowed until `deinit`.
    extensions: []const u8,
    /// Last swap interval accepted. On Wayland this is the value the window's
    /// frame pacing uses; the EGL interval itself is always 0 there.
    swap_interval_value: i32 = 0,

    /// Loads `library_path` (use `default_library`), creates the EGL display on
    /// `platform` and initializes it. Tries eglGetPlatformDisplay (EGL 1.5),
    /// then EGL_EXT_platform_base, then eglGetDisplay, like SDL_EGL_LoadLibrary.
    pub fn open(platform: Platform, library_path: []const u8) Error!Display {
        var library = try binding.Library.open(library_path);
        errdefer library.close();
        const handle = get_display(&library, platform) orelse return error.NoDisplay;
        var major: binding.Int = 0;
        var minor: binding.Int = 0;
        if (library.functions.eglInitialize(handle, &major, &minor) != binding.true_value) {
            return error.InitializationFailed;
        }
        errdefer _ = library.functions.eglTerminate(handle);
        const extension_text = library.functions.eglQueryString(handle, binding.egl_extensions);
        const extensions: []const u8 = if (extension_text) |text| std.mem.span(text) else "";
        var wayland_egl: ?binding.WaylandEgl = null;
        if (std.meta.activeTag(platform) == .wayland) wayland_egl = try binding.WaylandEgl.open();
        errdefer if (wayland_egl) |*loaded| loaded.close();
        return .{
            .library = library,
            .handle = handle,
            .platform = platform,
            .wayland_egl = wayland_egl,
            .version = .{ .major = major, .minor = minor },
            .extensions = extensions,
        };
    }

    /// Releases the current context on this thread, terminates the EGL display
    /// and unloads libEGL. Every surface and context must already be destroyed.
    pub fn deinit(self: *Display) void {
        _ = self.library.functions.eglMakeCurrent(self.handle, null, null, null);
        _ = self.library.functions.eglTerminate(self.handle);
        if (self.wayland_egl) |*loaded| loaded.close();
        self.library.close();
        self.* = undefined;
    }

    /// The EGL version from eglInitialize.
    pub fn egl_version(self: *const Display) Version {
        return self.version;
    }

    /// Resolves a GL or EGL entry point as eglGetProcAddress does. `Fn` must be
    /// a function-pointer type matching the entry point's C signature (for
    /// example `*const fn (u32) void` with the C calling convention). Returns null when the driver has no
    /// such function; a current context is not required by eglGetProcAddress.
    pub fn proc_address(self: *const Display, comptime Fn: type, name: [:0]const u8) ?Fn {
        comptime if (@typeInfo(Fn) != .pointer) @compileError("proc_address expects a function-pointer type");
        const raw = self.library.functions.eglGetProcAddress(name.ptr) orelse return null;
        return @ptrCast(@alignCast(raw));
    }

    /// True when the EGL display advertises the extension name (for example
    /// "EGL_KHR_create_context"). Matches whole space-separated tokens only.
    pub fn has_extension(self: *const Display, name: []const u8) bool {
        var tokens = std.mem.tokenizeScalar(u8, self.extensions, ' ');
        while (tokens.next()) |token| {
            if (std.mem.eql(u8, token, name)) return true;
        }
        return false;
    }

    /// Selects the EGLConfig that best matches `options`, scoring like
    /// SDL_EGL_PrivateChooseConfig: the caveat-free request is tried first, then
    /// any config. `required_visual_id` is the X11 visual ID of the window that
    /// will receive the surface (`XVisualIDFromVisual` of its visual); pass null
    /// on Wayland. The EGL API for `options.profile` is bound on this thread.
    pub fn choose_config(self: *Display, options: Attributes, required_visual_id: ?u32) Error!Config {
        return self.choose_config_for_surface(options, required_visual_id, .window);
    }

    /// Selects a config that supports EGL pbuffer surfaces, for headless GL.
    pub fn choose_pbuffer_config(self: *Display, options: Attributes) Error!Config {
        return self.choose_config_for_surface(options, null, .pbuffer);
    }

    fn choose_config_for_surface(self: *Display, options: Attributes, required_visual_id: ?u32, surface_kind: SurfaceKind) Error!Config {
        try options.validate();
        const api: binding.Enum = switch (options.api()) {
            .gl => binding.egl_opengl_api,
            .es => binding.egl_opengl_es_api,
        };
        if (self.library.functions.eglBindAPI(api) != binding.true_value) return error.BindApiFailed;
        const renderable = attributes.renderable_type(options, self.has_extension("EGL_KHR_create_context"));
        if (try self.choose_matching(options, renderable, true, required_visual_id, surface_kind)) |config| return config;
        if (try self.choose_matching(options, renderable, false, required_visual_id, surface_kind)) |config| return config;
        return error.NoMatchingConfig;
    }

    /// Sets the swap interval for the current drawing surface. 0 is immediate,
    /// 1 waits for vertical blank, values above 1 are passed through to EGL.
    /// -1 is adaptive vsync (tear only when late); it needs EGL_EXT_swap_control_tear.
    ///
    /// Wayland never blocks inside EGL: the EGL interval stays 0 and the value is
    /// clamped to [-1, 1] and recorded, so the window's frame callbacks can pace
    /// presentation (SDL_waylandopengles.c). That pacing belongs to the window.
    pub fn set_swap_interval(self: *Display, interval: i32) Error!void {
        if (std.meta.activeTag(self.platform) == .wayland) {
            self.swap_interval_value = std.math.clamp(interval, -1, 1);
            _ = self.library.functions.eglSwapInterval(self.handle, 0);
            return;
        }
        if (interval < -1) return error.SwapIntervalUnsupported;
        if (interval == -1 and !self.has_extension("EGL_EXT_swap_control_tear")) {
            return error.SwapIntervalUnsupported;
        }
        if (self.library.functions.eglSwapInterval(self.handle, interval) != binding.true_value) {
            return error.SwapIntervalFailed;
        }
        self.swap_interval_value = interval;
    }

    /// The last interval accepted by `set_swap_interval`. Starts at 0.
    pub fn swap_interval(self: *const Display) i32 {
        return self.swap_interval_value;
    }

    /// Makes no context current on this thread. Surfaces and contexts stay valid.
    pub fn release_current(self: *Display) Error!void {
        if (self.library.functions.eglMakeCurrent(self.handle, null, null, null) != binding.true_value) {
            return error.MakeCurrentFailed;
        }
    }

    /// The thread's last EGL error (eglGetError), which this call clears.
    /// `binding.egl_success` (0x3000) means none.
    pub fn error_code(self: *const Display) i32 {
        return self.library.functions.eglGetError();
    }

    fn choose_matching(self: *Display, options: Attributes, renderable: i32, caveat_none: bool, required_visual_id: ?u32, surface_kind: SurfaceKind) Error!?Config {
        var list = switch (surface_kind) {
            .window => attributes.config_list(options, renderable, caveat_none),
            .pbuffer => attributes.pbuffer_config_list(options, renderable, caveat_none),
        };
        var configs: [max_configs]?*binding.Config = @splat(null);
        var found: binding.Int = 0;
        const request = list.terminated();
        if (self.library.functions.eglChooseConfig(self.handle, request.ptr, &configs, max_configs, &found) != binding.true_value or found <= 0) {
            return null;
        }
        const count: usize = @intCast(found);
        const visual_required = required_visual_id != null;
        var visual_match_exists = false;
        if (required_visual_id) |visual| {
            for (configs[0..count]) |maybe| {
                const config = maybe orelse continue;
                if (self.visual_of(config) == visual) {
                    visual_match_exists = true;
                    break;
                }
            }
        }
        // Scoring: sum of (driver bits - requested bits) over the requested
        // colour and depth channels. Lower is closer. Negative cannot occur
        // because eglChooseConfig only returns configs meeting the minimums.
        var best: ?usize = null;
        var best_bitdiff: i32 = 0;
        var truecolor: ?usize = null;
        var best_truecolor_bitdiff: i32 = 0;
        for (configs[0..count], 0..) |maybe, index| {
            const config = maybe orelse continue;
            if (visual_match_exists and visual_required and self.visual_of(config) != required_visual_id.?) continue;
            const red = self.config_value(config, attributes.egl.red_size) orelse continue;
            const green = self.config_value(config, attributes.egl.green_size) orelse continue;
            const blue = self.config_value(config, attributes.egl.blue_size) orelse continue;
            const is_truecolor = red == 8 and green == 8 and blue == 8;
            var bitdiff: i32 = 0;
            var pair: usize = 0;
            const pairs = list.pairs();
            while (pair < pairs.len) : (pair += 2) {
                const name = pairs[pair];
                const wanted = pairs[pair + 1];
                if (wanted == attributes.egl.dont_care) continue;
                if (!is_scored_channel(name)) continue;
                const value = self.config_value(config, name) orelse continue;
                bitdiff += value - wanted;
            }
            if (best == null or bitdiff < best_bitdiff) {
                best = index;
                best_bitdiff = bitdiff;
            }
            if (is_truecolor and (truecolor == null or bitdiff < best_truecolor_bitdiff)) {
                truecolor = index;
                best_truecolor_bitdiff = bitdiff;
            }
        }
        // SDL_EGL_PrivateChooseConfig (FAVOR_TRUECOLOR): a request of 16 bits or
        // less prefers an exact 8-8-8 config when one exists, because apps that
        // ask for small colour depth often want 24-bit and dither otherwise.
        const requested_bits = @as(u32, options.red_size) + options.green_size + options.blue_size;
        if (requested_bits <= 16) {
            if (truecolor) |index| best = index;
        }
        const chosen = best orelse return null;
        return .{ .handle = configs[chosen] orelse return null };
    }

    fn config_value(self: *const Display, config: *binding.Config, name: i32) ?i32 {
        var value: binding.Int = 0;
        if (self.library.functions.eglGetConfigAttrib(self.handle, config, name, &value) != binding.true_value) return null;
        return value;
    }

    fn visual_of(self: *const Display, config: *binding.Config) ?u32 {
        const value = self.config_value(config, attributes.egl.native_visual_id) orelse return null;
        return @bitCast(value);
    }
};

fn is_scored_channel(name: i32) bool {
    return name == attributes.egl.red_size or name == attributes.egl.green_size or
        name == attributes.egl.blue_size or name == attributes.egl.alpha_size or
        name == attributes.egl.depth_size or name == attributes.egl.stencil_size;
}

const SurfaceKind = enum { window, pbuffer };

/// The EGL display for `platform` (see Display.open). Returns null when every
/// strategy fails.
fn get_display(library: *const binding.Library, platform: Platform) ?*binding.Display {
    const native: ?*anyopaque, const kind: binding.Enum = switch (platform) {
        .x11 => |display| .{ display, binding.egl_platform_x11 },
        .wayland => |display| .{ display, binding.egl_platform_wayland },
        .gbm => |display| .{ display, binding.egl_platform_gbm },
        .surfaceless => .{ null, binding.egl_platform_surfaceless },
    };
    if (library.get_platform_display) |get| {
        if (get(kind, native, null)) |display| return display;
    }
    if (library.functions.eglGetProcAddress("eglGetPlatformDisplayEXT")) |raw| {
        const get: binding.GetPlatformDisplay = @ptrCast(raw);
        if (get(kind, native, null)) |display| return display;
    }
    return library.functions.eglGetDisplay(if (native) |handle| @intFromPtr(handle) else 0);
}
