//! Private libEGL.so.1, libwayland-egl.so.1 and GL entry-point binding. This is
//! the only file in the EGL port that declares C types or calls C; the rest of
//! the folder is idiomatic Zig built on it.
//!
//! Libraries are loaded at runtime with `std.DynLib` (as SDL does) so that an
//! application starts without EGL or wayland-egl installed and gets an error
//! instead of a loader abort. Function tables are resolved by their C names, so
//! a missing symbol is reported as `error.MissingSymbol` during `open`.
//!
//! Handles are opaque C pointers. EGL uses `EGLNativeWindowType` and
//! `EGLNativeDisplayType` values that are an XID on X11 and a pointer on
//! Wayland; both are carried as `usize`, which is the integer width of either.

const std = @import("std");

/// EGL and wl_egl_window handles. Null is the EGL_NO_* value for each.
pub const Display = opaque {};
pub const Config = opaque {};
pub const Context = opaque {};
pub const Surface = opaque {};
pub const WlEglWindow = opaque {};

/// `EGLint`, `EGLenum` and `EGLBoolean` (EGL_TRUE is 1, EGL_FALSE is 0).
pub const Int = i32;
pub const Enum = u32;
pub const Bool = u32;
pub const true_value: Bool = 1;

pub const egl_success: Int = 0x3000;
pub const egl_bad_attribute: Int = 0x3004;
pub const egl_none: Int = 0x3038;
pub const egl_version: Int = 0x3054;
pub const egl_extensions: Int = 0x3055;
pub const egl_platform_x11: Enum = 0x31D5;
pub const egl_platform_wayland: Enum = 0x31D8;
pub const egl_opengl_api: Enum = 0x30A2;
pub const egl_opengl_es_api: Enum = 0x30A0;

/// GL enums used by the extension query (GL 1.0, GL 3.0 and GL 4.3 headers).
pub const gl_version: u32 = 0x1F02;
pub const gl_extensions: u32 = 0x1F03;
pub const gl_major_version: u32 = 0x821B;
pub const gl_num_extensions: u32 = 0x821D;

pub const GetPlatformDisplay = *const fn (Enum, *anyopaque, ?[*]const isize) callconv(.c) ?*Display;
pub const GetProcAddress = *const fn ([*:0]const u8) callconv(.c) ?*const anyopaque;
pub const GlGetString = *const fn (u32) callconv(.c) ?[*:0]const u8;
pub const GlGetStringi = *const fn (u32, u32) callconv(.c) ?[*:0]const u8;
pub const GlGetIntegerv = *const fn (u32, *Int) callconv(.c) void;

/// Core EGL 1.4 entry points. Every field is resolved by its C name during
/// `Library.open`; a missing one is `error.MissingSymbol`.
pub const Functions = struct {
    eglGetError: *const fn () callconv(.c) Int,
    eglGetDisplay: *const fn (usize) callconv(.c) ?*Display,
    eglInitialize: *const fn (*Display, *Int, *Int) callconv(.c) Bool,
    eglTerminate: *const fn (*Display) callconv(.c) Bool,
    eglQueryString: *const fn (?*Display, Int) callconv(.c) ?[*:0]const u8,
    eglGetProcAddress: GetProcAddress,
    eglBindAPI: *const fn (Enum) callconv(.c) Bool,
    eglChooseConfig: *const fn (*Display, [*]const Int, ?[*]?*Config, Int, *Int) callconv(.c) Bool,
    eglGetConfigAttrib: *const fn (*Display, *Config, Int, *Int) callconv(.c) Bool,
    eglCreateWindowSurface: *const fn (*Display, *Config, usize, [*]const Int) callconv(.c) ?*Surface,
    eglCreatePbufferSurface: *const fn (*Display, *Config, [*]const Int) callconv(.c) ?*Surface,
    eglDestroySurface: *const fn (*Display, *Surface) callconv(.c) Bool,
    eglCreateContext: *const fn (*Display, *Config, ?*Context, [*]const Int) callconv(.c) ?*Context,
    eglDestroyContext: *const fn (*Display, *Context) callconv(.c) Bool,
    eglMakeCurrent: *const fn (*Display, ?*Surface, ?*Surface, ?*Context) callconv(.c) Bool,
    eglGetCurrentContext: *const fn () callconv(.c) ?*Context,
    eglSwapBuffers: *const fn (*Display, *Surface) callconv(.c) Bool,
    eglSwapInterval: *const fn (*Display, Int) callconv(.c) Bool,
};

/// Loader failures: a missing library or symbol, or a failed dlopen.
pub const LoadError = std.DynLib.Error || error{MissingSymbol};

/// An open libEGL.so.1 and its resolved entry points. `eglGetPlatformDisplay`
/// is optional because it is EGL 1.5; without it the EXT entry point or plain
/// eglGetDisplay is used.
pub const Library = struct {
    dynlib: std.DynLib,
    functions: Functions,
    get_platform_display: ?GetPlatformDisplay,

    /// Loads `path` (for example "libEGL.so.1") and resolves the core entry points.
    /// The returned value owns the handle; call `close` exactly once.
    pub fn open(path: []const u8) LoadError!Library {
        var dynlib = try std.DynLib.open(path);
        errdefer dynlib.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |name, FieldType| {
            const sym: [:0]const u8 = "" ++ name;
            @field(functions, name) = dynlib.lookup(FieldType, sym) orelse return error.MissingSymbol;
        }
        const get_platform_display = dynlib.lookup(GetPlatformDisplay, "eglGetPlatformDisplay");
        return .{ .dynlib = dynlib, .functions = functions, .get_platform_display = get_platform_display };
    }

    /// Unloads libEGL. Every EGL handle and function pointer from this library
    /// becomes invalid, so terminate displays first.
    pub fn close(self: *Library) void {
        self.dynlib.close();
        self.* = undefined;
    }
};

/// Entry points from libwayland-egl.so.1, which creates the wl_egl_window that
/// EGL needs as its native window on Wayland.
pub const WaylandEgl = struct {
    dynlib: std.DynLib,
    create: *const fn (*anyopaque, Int, Int) callconv(.c) ?*WlEglWindow,
    destroy: *const fn (*WlEglWindow) callconv(.c) void,
    resize: *const fn (*WlEglWindow, Int, Int, Int, Int) callconv(.c) void,

    pub fn open() LoadError!WaylandEgl {
        var dynlib = try std.DynLib.open("libwayland-egl.so.1");
        errdefer dynlib.close();
        return .{
            .dynlib = dynlib,
            .create = dynlib.lookup(@FieldType(WaylandEgl, "create"), "wl_egl_window_create") orelse return error.MissingSymbol,
            .destroy = dynlib.lookup(@FieldType(WaylandEgl, "destroy"), "wl_egl_window_destroy") orelse return error.MissingSymbol,
            .resize = dynlib.lookup(@FieldType(WaylandEgl, "resize"), "wl_egl_window_resize") orelse return error.MissingSymbol,
        };
    }

    pub fn close(self: *WaylandEgl) void {
        self.dynlib.close();
        self.* = undefined;
    }
};
