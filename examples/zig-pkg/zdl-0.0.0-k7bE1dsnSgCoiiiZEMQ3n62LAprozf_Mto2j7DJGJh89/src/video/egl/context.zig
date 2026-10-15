//! OpenGL and OpenGL ES contexts on an EGL display: creation (with share and
//! SDL's version/profile/flag rules), making current, surfaceless use, and the
//! GL extension query. Ported from SDL_egl.c (SDL_EGL_CreateContext,
//! SDL_EGL_MakeCurrent, SDL_EGL_DestroyContext) and SDL_video.c
//! (SDL_GL_ExtensionSupported, SDL_GL_CreateContext, SDL_GL_DestroyContext).
//!
//! A `Context` borrows its `Display` and must be deinitialized before it. The
//! context is bound to the thread that makes it current; EGL does not allow one
//! context current on two threads at once.

const std = @import("std");
const binding = @import("binding.zig");
const attributes = @import("attributes.zig");
const display_mod = @import("display.zig");
const surface_mod = @import("surface.zig");
const pbuffer_mod = @import("pbuffer.zig");

const Display = display_mod.Display;
const Config = display_mod.Config;
const Error = display_mod.Error;
const WindowSurface = surface_mod.WindowSurface;
const Pbuffer = pbuffer_mod.Pbuffer;
const Attributes = attributes.Attributes;
const Api = attributes.Api;

/// Context sharing. `current` shares with whatever context is current on the
/// calling thread at creation (SDL's SDL_GL_SHARE_WITH_CURRENT_CONTEXT).
pub const Share = union(enum) {
    none,
    current,
    context: *const Context,
};

/// A GL or GLES context. Holds a borrowed `Display` pointer.
pub const Context = struct {
    display: *Display,
    handle: *binding.Context,
    api: Api,
    /// True when `make_current(null)` is valid: EGL 1.5 or EGL_KHR_surfaceless_context,
    /// plus GL 3.0+ (desktop) or GL_OES_surfaceless_context (GLES).
    surfaceless: bool,

    /// Creates a context for `config`, makes it current on `surface`, and sets
    /// the swap interval to 0 (vsync off), as SDL_GL_CreateContext does. A
    /// `Share.current` request uses the calling thread's current context.
    pub fn create(display: *Display, config: Config, surface: *const WindowSurface, options: Attributes, share: Share) Error!Context {
        if (surface.display != display) return error.MakeCurrentFailed;
        return create_on_surface(display, config, surface.handle, options, share);
    }

    /// Creates and binds a context to an offscreen EGL pbuffer.
    pub fn create_pbuffer(display: *Display, config: Config, surface: *const Pbuffer, options: Attributes, share: Share) Error!Context {
        if (surface.display != display) return error.MakeCurrentFailed;
        return create_on_surface(display, config, surface.handle, options, share);
    }

    fn create_on_surface(display: *Display, config: Config, native_surface: *binding.Surface, options: Attributes, share: Share) Error!Context {
        try options.validate();
        const api = options.api();
        const support: attributes.ContextSupport = .{
            .create_context = display.has_extension("EGL_KHR_create_context"),
            .no_error = display.has_extension("EGL_KHR_create_context_no_error"),
            .flush_control = display.has_extension("EGL_KHR_context_flush_control"),
            .robustness = display.has_extension("EGL_EXT_create_context_robustness"),
        };
        var list = try attributes.context_list(options, support);
        const request = list.terminated();

        const bind: binding.Enum = switch (api) {
            .gl => binding.egl_opengl_api,
            .es => binding.egl_opengl_es_api,
        };
        if (display.library.functions.eglBindAPI(bind) != binding.true_value) return error.BindApiFailed;

        const share_handle: ?*binding.Context = switch (share) {
            .none => null,
            .current => display.library.functions.eglGetCurrentContext(),
            .context => |other| if (other.display == display) other.handle else return error.MakeCurrentFailed,
        };
        const handle = display.library.functions.eglCreateContext(display.handle, config.handle, share_handle, request.ptr) orelse {
            return error.ContextCreationFailed;
        };
        var context: Context = .{ .display = display, .handle = handle, .api = api, .surfaceless = false };
        context.make_current_raw(native_surface) catch |err| {
            _ = display.library.functions.eglDestroyContext(display.handle, handle);
            return err;
        };
        context.surfaceless = detect_surfaceless(&context, display);
        // SDL forces vsync off at startup because EGL defaults to 1; apps change it explicitly.
        display.set_swap_interval(0) catch {};
        return context;
    }

    /// Makes this context current on the calling thread with `surface` for both
    /// draw and read. A null surface makes it current without a surface, which
    /// requires `surfaceless`. Binds the context's API first, as SDL does.
    pub fn make_current(self: *Context, surface: ?*const WindowSurface) Error!void {
        return self.make_current_raw(if (surface) |window_surface| window_surface.handle else null);
    }

    /// Makes this context current with an EGL pbuffer, or surfaceless when null.
    /// The pbuffer must belong to the same display.
    pub fn make_current_pbuffer(self: *Context, surface: ?*const Pbuffer) Error!void {
        if (surface) |pbuffer| {
            if (pbuffer.display != self.display) return error.MakeCurrentFailed;
            return self.make_current_raw(pbuffer.handle);
        }
        return self.make_current_raw(null);
    }

    fn make_current_raw(self: *Context, draw: ?*binding.Surface) Error!void {
        const bind: binding.Enum = switch (self.api) {
            .gl => binding.egl_opengl_api,
            .es => binding.egl_opengl_es_api,
        };
        _ = self.display.library.functions.eglBindAPI(bind);
        if (draw == null and !self.surfaceless) return error.SurfacelessUnsupported;
        if (self.display.library.functions.eglMakeCurrent(self.display.handle, draw, draw, self.handle) != binding.true_value) {
            return error.MakeCurrentFailed;
        }
    }

    /// True when the GL extension `name` (for example "GL_ARB_clip_control") is
    /// available on the current context. Requires this context to be current on
    /// the calling thread; returns false otherwise. Uses glGetStringi on GL 3.0+
    /// and the space-separated GL_EXTENSIONS string before that, as SDL does.
    /// SDL's SDL_GL_EXTENSION hint overrides are not implemented.
    pub fn gl_has_extension(self: *const Context, name: []const u8) bool {
        if (name.len == 0 or std.mem.indexOfScalar(u8, name, ' ') != null) return false;
        const get_string = self.display.proc_address(binding.GlGetString, "glGetString") orelse return false;
        const version_text = get_string(binding.gl_version) orelse return false;
        if (gl_version_at_least_3(std.mem.span(version_text))) {
            const get_stringi = self.display.proc_address(binding.GlGetStringi, "glGetStringi") orelse return false;
            const get_integerv = self.display.proc_address(binding.GlGetIntegerv, "glGetIntegerv") orelse return false;
            var count: binding.Int = 0;
            get_integerv(binding.gl_num_extensions, &count);
            var index: binding.Int = 0;
            while (index < count) : (index += 1) {
                const entry = get_stringi(binding.gl_extensions, @intCast(index)) orelse continue;
                if (std.mem.eql(u8, std.mem.span(entry), name)) return true;
            }
            return false;
        }
        const list = get_string(binding.gl_extensions) orelse return false;
        var tokens = std.mem.tokenizeScalar(u8, std.mem.span(list), ' ');
        while (tokens.next()) |token| {
            if (std.mem.eql(u8, token, name)) return true;
        }
        return false;
    }

    /// Releases the context. If it is current on the calling thread, it is first
    /// made non-current (SDL_GL_DestroyContext). The Display must still be alive.
    pub fn deinit(self: *Context) void {
        const functions = &self.display.library.functions;
        if (functions.eglGetCurrentContext() == self.handle) {
            _ = functions.eglMakeCurrent(self.display.handle, null, null, null);
        }
        _ = functions.eglDestroyContext(self.display.handle, self.handle);
        self.* = undefined;
    }
};

/// The GL version string starts with the major version ("4.6.0 ...", "OpenGL
/// ES 3.2 ..."); its first digit decides the GL 3.0 query path.
fn gl_version_at_least_3(version: []const u8) bool {
    for (version) |byte| {
        if (std.ascii.isDigit(byte)) return byte >= '3';
    }
    return false;
}

/// Whether `make_current(null)` is valid for this context. Must run while the
/// context is current, because it queries GL state.
fn detect_surfaceless(context: *const Context, display: *const Display) bool {
    if (!(display.version.at_least(1, 5) or display.has_extension("EGL_KHR_surfaceless_context"))) return false;
    if (context.api == .es) return context.gl_has_extension("GL_OES_surfaceless_context");
    const get_integerv = display.proc_address(binding.GlGetIntegerv, "glGetIntegerv") orelse return false;
    var major: binding.Int = 0;
    get_integerv(binding.gl_major_version, &major);
    return major >= 3;
}
