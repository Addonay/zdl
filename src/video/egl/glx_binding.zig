//! Private libGL GLX binding. Only `glx.zig` uses these C declarations; callers
//! work with the typed display, config, surface and context wrappers there.

const std = @import("std");
const xlib = @import("../x11/xlib.zig");

pub const Display = xlib.Display;
pub const Window = xlib.Window;
pub const Drawable = c_ulong;
pub const ContextHandle = opaque {};
pub const FbConfig = opaque {};

pub const XVisualInfo = extern struct {
    visual: ?*xlib.Visual,
    visualid: c_ulong,
    screen: c_int,
    depth: c_int,
    class: c_int,
    red_mask: c_ulong,
    green_mask: c_ulong,
    blue_mask: c_ulong,
    colormap_size: c_int,
    bits_per_rgb: c_int,
};

pub const GetProcAddress = *const fn ([*:0]const u8) callconv(.c) ?*const anyopaque;
pub const CreateContextAttribs = *const fn (*Display, *FbConfig, ?*ContextHandle, c_int, [*]const c_int) callconv(.c) ?*ContextHandle;
pub const SwapIntervalExt = *const fn (*Display, Drawable, c_int) callconv(.c) void;
pub const SwapIntervalMesa = *const fn (u32) callconv(.c) c_int;
pub const GetSwapIntervalMesa = *const fn () callconv(.c) u32;
pub const SwapIntervalSgi = *const fn (c_int) callconv(.c) c_int;
pub const GlGetString = *const fn (u32) callconv(.c) ?[*:0]const u8;
pub const GlGetStringi = *const fn (u32, u32) callconv(.c) ?[*:0]const u8;
pub const GlGetIntegerv = *const fn (u32, *c_int) callconv(.c) void;

pub const Functions = struct {
    glXQueryExtension: *const fn (*Display, *c_int, *c_int) callconv(.c) c_int,
    glXQueryVersion: *const fn (*Display, *c_int, *c_int) callconv(.c) c_int,
    glXGetFBConfigs: *const fn (*Display, c_int, *c_int) callconv(.c) ?[*]?*FbConfig,
    glXGetFBConfigAttrib: *const fn (*Display, *FbConfig, c_int, *c_int) callconv(.c) c_int,
    glXGetVisualFromFBConfig: *const fn (*Display, *FbConfig) callconv(.c) ?*XVisualInfo,
    glXCreateNewContext: *const fn (*Display, *FbConfig, c_int, ?*ContextHandle, c_int) callconv(.c) ?*ContextHandle,
    glXDestroyContext: *const fn (*Display, *ContextHandle) callconv(.c) void,
    glXCreateWindow: *const fn (*Display, *FbConfig, Window, ?[*]const c_int) callconv(.c) Drawable,
    glXDestroyWindow: *const fn (*Display, Drawable) callconv(.c) void,
    glXCreatePbuffer: *const fn (*Display, *FbConfig, [*]const c_int) callconv(.c) Drawable,
    glXDestroyPbuffer: *const fn (*Display, Drawable) callconv(.c) void,
    glXMakeCurrent: *const fn (*Display, Drawable, ?*ContextHandle) callconv(.c) c_int,
    glXGetCurrentContext: *const fn () callconv(.c) ?*ContextHandle,
    glXSwapBuffers: *const fn (*Display, Drawable) callconv(.c) void,
    glXQueryExtensionsString: *const fn (*Display, c_int) callconv(.c) ?[*:0]const u8,
};

pub const LoadError = std.DynLib.Error || error{MissingSymbol};

/// Owns `libGL.so.1` and the core GLX function table.
pub const Library = struct {
    dynlib: std.DynLib,
    functions: Functions,
    get_proc_address: GetProcAddress,

    pub fn open(path: []const u8) LoadError!Library {
        var dynlib = try std.DynLib.open(path);
        errdefer dynlib.close();
        var functions: Functions = undefined;
        inline for (@typeInfo(Functions).@"struct".field_names, @typeInfo(Functions).@"struct".field_types) |name, FieldType| {
            const symbol: [:0]const u8 = "" ++ name;
            @field(functions, name) = dynlib.lookup(FieldType, symbol) orelse return error.MissingSymbol;
        }
        const get_proc_address = dynlib.lookup(GetProcAddress, "glXGetProcAddressARB") orelse
            dynlib.lookup(GetProcAddress, "glXGetProcAddress") orelse return error.MissingSymbol;
        return .{ .dynlib = dynlib, .functions = functions, .get_proc_address = get_proc_address };
    }

    pub fn close(self: *Library) void {
        self.dynlib.close();
        self.* = undefined;
    }
};

comptime {
    if (@sizeOf(XVisualInfo) != 64 or @alignOf(XVisualInfo) != 8) @compileError("XVisualInfo ABI mismatch");
    if (@offsetOf(XVisualInfo, "visualid") != 8 or
        @offsetOf(XVisualInfo, "screen") != 16 or
        @offsetOf(XVisualInfo, "red_mask") != 32 or
        @offsetOf(XVisualInfo, "bits_per_rgb") != 60)
    {
        @compileError("XVisualInfo field offsets mismatch");
    }
}
