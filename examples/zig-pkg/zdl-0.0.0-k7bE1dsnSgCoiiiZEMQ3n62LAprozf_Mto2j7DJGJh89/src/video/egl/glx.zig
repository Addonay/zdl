//! Desktop OpenGL over X11 GLX, using a private runtime-loaded libGL binding.
//!
//! This is an X11-only alternative to EGL. It borrows an existing zdl X11
//! Connection, chooses an FBConfig matching the X window visual, and owns GLX
//! drawable/context handles. Destroy contexts and surfaces before the display,
//! and the display before its X11 connection.
//! OpenGL ES and float framebuffer requests are not supported by this GLX path.

const std = @import("std");
const binding = @import("glx_binding.zig");
const attributes = @import("attributes.zig");
const x11 = @import("../x11/window.zig");

const Attributes = attributes.Attributes;

/// The shared library name SDL loads for GLX.
pub const default_library = "libGL.so.1";

/// Failures from the GLX loader, X server extension, or requested context.
pub const Error = binding.LoadError || error{
    GlxUnavailable,
    UnsupportedVersion,
    UnsupportedProfile,
    UnsupportedAttributes,
    InvalidAttributes,
    ContextAttributesUnsupported,
    NoMatchingConfig,
    SurfaceCreationFailed,
    ContextCreationFailed,
    MakeCurrentFailed,
    SwapIntervalUnsupported,
    SwapIntervalFailed,
    WrongDisplay,
    NoDrawable,
};

/// GLX server version reported by glXQueryVersion.
pub const Version = struct {
    major: i32,
    minor: i32,

    pub fn at_least(self: Version, major: i32, minor: i32) bool {
        return self.major > major or (self.major == major and self.minor >= minor);
    }
};

/// An FBConfig borrowed from its GLX Display.
pub const Config = struct {
    display: *Display,
    handle: *binding.FbConfig,
    visual_id: ?u64,
};

/// Surface type requested while choosing an FBConfig.
pub const SurfaceKind = enum { window, pbuffer };

/// An initialized GLX display. The X11 Connection is borrowed; libGL is owned.
pub const Display = struct {
    library: binding.Library,
    connection: *x11.Connection,
    version: Version,
    /// Driver-owned GLX extension list, borrowed until this Display is closed.
    extensions: []const u8,
    swap_interval_value: i32 = 0,

    /// Opens libGL and verifies the server supports GLX.
    pub fn open(connection: *x11.Connection, library_path: []const u8) Error!Display {
        var library = try binding.Library.open(library_path);
        errdefer library.close();
        var error_base: c_int = 0;
        var event_base: c_int = 0;
        if (library.functions.glXQueryExtension(connection.display, &error_base, &event_base) == 0) return error.GlxUnavailable;
        var major: c_int = 0;
        var minor: c_int = 0;
        if (library.functions.glXQueryVersion(connection.display, &major, &minor) == 0 or major < 1 or (major == 1 and minor < 3)) {
            return error.UnsupportedVersion;
        }
        const extension_text = library.functions.glXQueryExtensionsString(connection.display, connection.screen);
        const extensions: []const u8 = if (extension_text) |text| std.mem.span(text) else "";
        return .{
            .library = library,
            .connection = connection,
            .version = .{ .major = major, .minor = minor },
            .extensions = extensions,
        };
    }

    /// Unloads libGL. Surfaces and contexts must already be destroyed.
    pub fn deinit(self: *Display) void {
        self.library.close();
        self.* = undefined;
    }

    /// True when the whole GLX extension token is present.
    pub fn has_extension(self: *const Display, name: []const u8) bool {
        if (name.len == 0 or std.mem.indexOfScalar(u8, name, ' ') != null) return false;
        var tokens = std.mem.tokenizeScalar(u8, self.extensions, ' ');
        while (tokens.next()) |token| {
            if (std.mem.eql(u8, token, name)) return true;
        }
        return false;
    }

    /// Selects an FBConfig meeting the requested color/depth/sample minima.
    /// Window configs are required to match the given X11 visual ID.
    pub fn choose_config(self: *Display, requested: Attributes, kind: SurfaceKind, visual_id: ?u32) Error!Config {
        try requested.validate();
        if (requested.profile == .es) return error.UnsupportedProfile;
        if (requested.float_buffers) return error.UnsupportedAttributes;
        if (requested.framebuffer_srgb and !self.has_extension("GLX_ARB_framebuffer_sRGB") and
            !self.has_extension("GLX_EXT_framebuffer_sRGB")) return error.UnsupportedAttributes;
        const drawable_bit: c_int = if (kind == .window) glx.window_bit else glx.pbuffer_bit;
        var count: c_int = 0;
        const configs = self.library.functions.glXGetFBConfigs(self.connection.display, self.connection.screen, &count) orelse return error.NoMatchingConfig;
        defer _ = self.connection.library.functions.XFree(@ptrCast(configs));
        if (count <= 0) return error.NoMatchingConfig;

        var best: ?*binding.FbConfig = null;
        var best_visual: ?u64 = null;
        var best_score: u32 = std.math.maxInt(u32);
        for (configs[0..@intCast(count)]) |maybe_config| {
            const config = maybe_config orelse continue;
            const drawable = self.config_value(config, glx.drawable_type) orelse continue;
            if (drawable & drawable_bit == 0) continue;
            const render = self.config_value(config, glx.render_type) orelse continue;
            if (render & glx.rgba_bit == 0) continue;
            if (requested.framebuffer_srgb) {
                const capable = self.config_value(config, glx.framebuffer_srgb_capable) orelse continue;
                if (capable == 0) continue;
            }
            const red = self.config_value(config, glx.red_size) orelse continue;
            const green = self.config_value(config, glx.green_size) orelse continue;
            const blue = self.config_value(config, glx.blue_size) orelse continue;
            const alpha = self.config_value(config, glx.alpha_size) orelse continue;
            const depth = self.config_value(config, glx.depth_size) orelse continue;
            const stencil = self.config_value(config, glx.stencil_size) orelse continue;
            const buffer = self.config_value(config, glx.buffer_size) orelse continue;
            const double_buffer = self.config_value(config, glx.double_buffer) orelse continue;
            if (red < requested.red_size or green < requested.green_size or blue < requested.blue_size or
                alpha < requested.alpha_size or depth < requested.depth_size or stencil < requested.stencil_size or
                (requested.buffer_size != 0 and buffer < requested.buffer_size) or
                (requested.double_buffer and double_buffer == 0))
            {
                continue;
            }
            if (requested.multisample_buffers != 0) {
                const sample_buffers = self.config_value(config, glx.sample_buffers) orelse continue;
                const samples = self.config_value(config, glx.samples) orelse continue;
                if (sample_buffers < requested.multisample_buffers or samples < requested.multisample_samples) continue;
            }

            const found_visual = self.visual_id_for(config);
            if (kind == .window and found_visual == null) continue;
            if (visual_id) |required| {
                if (found_visual != required) continue;
            }

            const score = channel_difference(red, requested.red_size) +
                channel_difference(green, requested.green_size) +
                channel_difference(blue, requested.blue_size) +
                channel_difference(alpha, requested.alpha_size) +
                channel_difference(depth, requested.depth_size) +
                channel_difference(stencil, requested.stencil_size) +
                if (red == 8 and green == 8 and blue == 8) @as(u32, 0) else 1000;
            if (best == null or score < best_score) {
                best = config;
                best_visual = found_visual;
                best_score = score;
            }
        }
        const selected = best orelse return error.NoMatchingConfig;
        return .{ .display = self, .handle = selected, .visual_id = best_visual };
    }

    /// A pbuffer-only config, for offscreen rendering.
    pub fn choose_pbuffer_config(self: *Display, requested: Attributes) Error!Config {
        return self.choose_config(requested, .pbuffer, null);
    }

    /// Resolves an OpenGL entry point through GLX, then the loaded libGL.
    pub fn proc_address(self: *Display, comptime Fn: type, name: [:0]const u8) ?Fn {
        if (self.library.get_proc_address(name.ptr)) |address| return @ptrCast(address);
        return self.library.dynlib.lookup(Fn, name);
    }

    /// Whether the GLX extension token is present.
    pub fn glx_has_extension(self: *const Display, name: []const u8) bool {
        return self.has_extension(name);
    }

    /// Sets the current drawable's swap interval using EXT, MESA, or SGI support.
    pub fn set_swap_interval(self: *Display, surface: *const Surface, interval: i32) Error!void {
        if (surface.display != self) return error.WrongDisplay;
        if (interval < 0 and !self.has_extension("GLX_EXT_swap_control_tear")) return error.SwapIntervalUnsupported;
        if (self.has_extension("GLX_EXT_swap_control")) {
            if (self.proc_address(binding.SwapIntervalExt, "glXSwapIntervalEXT")) |set| {
                set(self.connection.display, surface.drawable, interval);
                self.swap_interval_value = interval;
                return;
            }
        }
        if (interval >= 0 and self.has_extension("GLX_MESA_swap_control")) {
            if (self.proc_address(binding.SwapIntervalMesa, "glXSwapIntervalMESA")) |set| {
                if (set(@intCast(interval)) == 0) {
                    self.swap_interval_value = interval;
                    return;
                }
                return error.SwapIntervalFailed;
            }
        }
        if (interval >= 0 and self.has_extension("GLX_SGI_swap_control")) {
            if (self.proc_address(binding.SwapIntervalSgi, "glXSwapIntervalSGI")) |set| {
                if (set(interval) == 0) {
                    self.swap_interval_value = interval;
                    return;
                }
                return error.SwapIntervalFailed;
            }
        }
        return error.SwapIntervalUnsupported;
    }

    /// The last interval accepted by set_swap_interval.
    pub fn swap_interval(self: *const Display) i32 {
        return self.swap_interval_value;
    }

    /// Makes no GLX context current on this display for the calling thread.
    pub fn release_current(self: *Display) Error!void {
        if (self.library.functions.glXMakeCurrent(self.connection.display, 0, null) == 0) return error.MakeCurrentFailed;
    }

    fn config_value(self: *const Display, config: *binding.FbConfig, attribute: c_int) ?c_int {
        var value: c_int = 0;
        if (self.library.functions.glXGetFBConfigAttrib(self.connection.display, config, attribute, &value) != 0) return null;
        return value;
    }

    fn visual_id_for(self: *const Display, config: *binding.FbConfig) ?u64 {
        const visual = self.library.functions.glXGetVisualFromFBConfig(self.connection.display, config) orelse return null;
        defer _ = self.connection.library.functions.XFree(@ptrCast(visual));
        return visual.visualid;
    }
};

/// A GLX window drawable or offscreen pbuffer. It borrows its Display.
pub const Surface = struct {
    display: *Display,
    drawable: binding.Drawable,
    kind: SurfaceKind,

    /// Wraps an existing X11 window in a GLXWindow after checking the FBConfig's visual.
    pub fn create_window(display: *Display, config: Config, window: u64, visual_id: u32) Error!Surface {
        if (config.display != display) return error.WrongDisplay;
        if (config.visual_id != visual_id) return error.NoMatchingConfig;
        const drawable = display.library.functions.glXCreateWindow(display.connection.display, config.handle, @intCast(window), null);
        if (drawable == 0) return error.SurfaceCreationFailed;
        return .{ .display = display, .drawable = drawable, .kind = .window };
    }

    /// Creates an offscreen GLX pbuffer.
    pub fn create_pbuffer(display: *Display, config: Config, width: u31, height: u31) Error!Surface {
        if (config.display != display) return error.WrongDisplay;
        if (width == 0 or height == 0) return error.SurfaceCreationFailed;
        const list = [_]c_int{ glx.pbuffer_width, @intCast(width), glx.pbuffer_height, @intCast(height), 0 };
        const drawable = display.library.functions.glXCreatePbuffer(display.connection.display, config.handle, &list);
        if (drawable == 0) return error.SurfaceCreationFailed;
        return .{ .display = display, .drawable = drawable, .kind = .pbuffer };
    }

    /// Destroys the GLX drawable.
    pub fn deinit(self: *Surface) void {
        switch (self.kind) {
            .window => self.display.library.functions.glXDestroyWindow(self.display.connection.display, self.drawable),
            .pbuffer => self.display.library.functions.glXDestroyPbuffer(self.display.connection.display, self.drawable),
        }
        self.* = undefined;
    }

    /// Swaps a window surface; pbuffers do not have a displayable backbuffer.
    pub fn swap_buffers(self: *const Surface) Error!void {
        if (self.kind != .window) return error.NoDrawable;
        self.display.library.functions.glXSwapBuffers(self.display.connection.display, self.drawable);
    }
};

/// Sharing policy for a new GLX context.
pub const Share = union(enum) {
    none,
    current,
    context: *const Context,
};

/// A desktop OpenGL context that borrows its GLX Display and surface.
pub const Context = struct {
    display: *Display,
    handle: *binding.ContextHandle,

    /// Creates a GLX context and makes it current on surface.
    pub fn create(display: *Display, config: Config, surface: *const Surface, requested: Attributes, share: Share) Error!Context {
        try requested.validate();
        if (surface.display != display or config.display != display) return error.WrongDisplay;
        if (requested.profile == .es or requested.float_buffers) return error.UnsupportedProfile;

        const share_handle: ?*binding.ContextHandle = switch (share) {
            .none => null,
            .current => display.library.functions.glXGetCurrentContext(),
            .context => |other| blk: {
                if (other.display != display) return error.WrongDisplay;
                break :blk other.handle;
            },
        };

        const legacy = requested.major_version < 3 and requested.profile == .default and
            @as(u32, @bitCast(requested.flags)) == 0 and !requested.no_error and
            requested.release_behavior == .flush and requested.reset_notification == .none;
        const handle = if (legacy)
            display.library.functions.glXCreateNewContext(display.connection.display, config.handle, glx.rgba_type, share_handle, 1)
        else
            try create_attribs(display, config, requested, share_handle);
        const context_handle = handle orelse return error.ContextCreationFailed;
        var context: Context = .{ .display = display, .handle = context_handle };
        context.make_current(surface) catch |err| {
            display.library.functions.glXDestroyContext(display.connection.display, context_handle);
            return err;
        };
        display.set_swap_interval(surface, 0) catch {};
        return context;
    }

    /// Makes this context current with surface, or releases the thread's current
    /// context when null.
    pub fn make_current(self: *Context, surface: ?*const Surface) Error!void {
        const drawable: binding.Drawable = if (surface) |target| blk: {
            if (target.display != self.display) return error.WrongDisplay;
            break :blk target.drawable;
        } else 0;
        if (surface == null) {
            if (self.display.library.functions.glXMakeCurrent(self.display.connection.display, 0, null) == 0) return error.MakeCurrentFailed;
            return;
        }
        if (self.display.library.functions.glXMakeCurrent(self.display.connection.display, drawable, self.handle) == 0) {
            return error.MakeCurrentFailed;
        }
    }

    /// Whether a GL extension is supported by the current context.
    pub fn gl_has_extension(self: *const Context, name: []const u8) bool {
        if (name.len == 0 or std.mem.indexOfScalar(u8, name, ' ') != null) return false;
        const get_string = self.display.proc_address(binding.GlGetString, "glGetString") orelse return false;
        const version_text = get_string(glx.gl_version) orelse return false;
        if (gl_version_at_least_3(std.mem.span(version_text))) {
            const get_stringi = self.display.proc_address(binding.GlGetStringi, "glGetStringi") orelse return false;
            const get_integerv = self.display.proc_address(binding.GlGetIntegerv, "glGetIntegerv") orelse return false;
            var count: c_int = 0;
            get_integerv(glx.gl_num_extensions, &count);
            for (0..@intCast(@max(count, 0))) |index| {
                const entry = get_stringi(glx.gl_extensions, @intCast(index)) orelse continue;
                if (std.mem.eql(u8, std.mem.span(entry), name)) return true;
            }
            return false;
        }
        const list = get_string(glx.gl_extensions) orelse return false;
        var tokens = std.mem.tokenizeScalar(u8, std.mem.span(list), ' ');
        while (tokens.next()) |token| {
            if (std.mem.eql(u8, token, name)) return true;
        }
        return false;
    }

    /// Releases the GLX context. The Display must still be alive.
    pub fn deinit(self: *Context) void {
        const functions = &self.display.library.functions;
        if (functions.glXGetCurrentContext() == self.handle) _ = functions.glXMakeCurrent(self.display.connection.display, 0, null);
        functions.glXDestroyContext(self.display.connection.display, self.handle);
        self.* = undefined;
    }
};

fn create_attribs(display: *Display, config: Config, requested: Attributes, share: ?*binding.ContextHandle) Error!?*binding.ContextHandle {
    if (!display.has_extension("GLX_ARB_create_context")) return error.ContextAttributesUnsupported;
    const create = display.proc_address(binding.CreateContextAttribs, "glXCreateContextAttribsARB") orelse return error.ContextAttributesUnsupported;
    var list: [24]c_int = undefined;
    var len: usize = 0;
    append_pair(&list, &len, glx.context_major_version, requested.major_version);
    append_pair(&list, &len, glx.context_minor_version, requested.minor_version);
    var flags: c_int = 0;
    if (requested.flags.debug) flags |= glx.context_debug_bit;
    if (requested.flags.forward_compatible) flags |= glx.context_forward_compatible_bit;
    if (requested.flags.robust_access) flags |= glx.context_robust_access_bit;
    if (requested.flags.reset_isolation) flags |= glx.context_reset_isolation_bit;
    if (flags != 0) append_pair(&list, &len, glx.context_flags, flags);
    switch (requested.profile) {
        .core => append_pair(&list, &len, glx.context_profile_mask, glx.context_core_profile_bit),
        .compatibility => append_pair(&list, &len, glx.context_profile_mask, glx.context_compatibility_profile_bit),
        .default => {},
        .es => return error.UnsupportedProfile,
    }
    if (requested.no_error) {
        if (!display.has_extension("GLX_ARB_create_context_no_error")) return error.ContextAttributesUnsupported;
        append_pair(&list, &len, glx.context_no_error, 1);
    }
    if (requested.release_behavior == .none and display.has_extension("GLX_ARB_context_flush_control")) {
        append_pair(&list, &len, glx.context_release_behavior, glx.context_release_behavior_none);
    }
    if (requested.reset_notification == .lose_context) {
        if (!display.has_extension("GLX_ARB_create_context_robustness")) return error.ContextAttributesUnsupported;
        append_pair(&list, &len, glx.context_reset_notification_strategy, glx.lose_context_on_reset);
    }
    list[len] = 0;
    return create(display.connection.display, config.handle, share, 1, @ptrCast(&list[0]));
}

fn append_pair(list: *[24]c_int, len: *usize, name: c_int, value: anytype) void {
    list[len.*] = name;
    list[len.* + 1] = @intCast(value);
    len.* += 2;
}

fn channel_difference(value: c_int, requested: u8) u32 {
    return @intCast(@max(value - requested, 0));
}

fn gl_version_at_least_3(version: []const u8) bool {
    for (version) |byte| {
        if (std.ascii.isDigit(byte)) return byte >= '3';
    }
    return false;
}

const glx = struct {
    const drawable_type = 0x8010;
    const render_type = 0x8011;
    const rgba_bit = 0x0001;
    const framebuffer_srgb_capable = 0x20B2;
    const window_bit = 0x0001;
    const pbuffer_bit = 0x0004;
    const buffer_size = 2;
    const double_buffer = 5;
    const red_size = 8;
    const green_size = 9;
    const blue_size = 10;
    const alpha_size = 11;
    const depth_size = 12;
    const stencil_size = 13;
    const sample_buffers = 100000;
    const samples = 100001;
    const rgba_type = 0x8014;
    const pbuffer_width = 0x8041;
    const pbuffer_height = 0x8040;
    const context_major_version = 0x2091;
    const context_minor_version = 0x2092;
    const context_flags = 0x2094;
    const context_debug_bit = 0x0001;
    const context_forward_compatible_bit = 0x0002;
    const context_robust_access_bit = 0x0004;
    const context_reset_isolation_bit = 0x0008;
    const context_profile_mask = 0x9126;
    const context_core_profile_bit = 0x0001;
    const context_compatibility_profile_bit = 0x0002;
    const context_no_error = 0x31B3;
    const context_release_behavior = 0x2097;
    const context_release_behavior_none = 0;
    const context_reset_notification_strategy = 0x8256;
    const lose_context_on_reset = 0x8252;
    const gl_version = 0x1F02;
    const gl_extensions = 0x1F03;
    const gl_num_extensions = 0x821D;
};

test "GLX public declarations are type-complete" {
    std.testing.refAllDecls(@This());
}

test "GLX rejects sRGB framebuffer requests without either defining extension" {
    var display: Display = undefined;
    display.extensions = "GLX_ARB_create_context GLX_ARB_framebuffer_sRGB_extra";
    // This check must happen before touching an X connection or function table.
    try std.testing.expectError(error.UnsupportedAttributes, display.choose_config(.{ .framebuffer_srgb = true }, .window, null));
    display.extensions = "GLX_EXT_framebuffer_sRGB";
    try std.testing.expect(display.has_extension("GLX_EXT_framebuffer_sRGB"));
}
