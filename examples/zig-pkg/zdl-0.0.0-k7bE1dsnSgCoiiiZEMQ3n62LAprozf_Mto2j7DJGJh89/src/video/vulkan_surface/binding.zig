//! Private libvulkan.so.1 binding for Xlib, XCB and Wayland surface entry points.
//! This file declares the C structs and function pointers and is the only
//! Vulkan-surface file that uses `extern` or `callconv(.c)`. The loader opens
//! the library only to obtain vkGetInstanceProcAddr, and only when the caller
//! passes none; all other entry points come from that vkGetInstanceProcAddr.
//!
//! Layouts follow vulkan_core.h (VK_KHR_xlib_surface, VK_KHR_xcb_surface and
//! VK_KHR_wayland_surface).
//! Structure type values: VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR is
//! 1000004000 and VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR is 1000006000.

const std = @import("std");

pub const Instance = opaque {};
pub const PhysicalDevice = opaque {};

/// PFN_vkGetInstanceProcAddr.
pub const GetInstanceProcAddr = *const fn (?*Instance, [*:0]const u8) callconv(.c) ?*const anyopaque;

pub const structure_type_xlib_surface_create_info: i32 = 1000004000;
pub const structure_type_xcb_surface_create_info: i32 = 1000005000;
pub const structure_type_wayland_surface_create_info: i32 = 1000006000;

/// VkXlibSurfaceCreateInfoKHR. `dpy` is `Display*` and `window` is `Window` (XID).
pub const XlibSurfaceCreateInfo = extern struct {
    s_type: i32,
    p_next: ?*const anyopaque,
    flags: u32,
    dpy: *anyopaque,
    window: usize,
};

/// VkXcbSurfaceCreateInfoKHR. `connection` is `xcb_connection_t*` and `window`
/// is the 32-bit `xcb_window_t` XID.
pub const XcbSurfaceCreateInfo = extern struct {
    s_type: i32,
    p_next: ?*const anyopaque,
    flags: u32,
    connection: *anyopaque,
    window: u32,
};

/// VkWaylandSurfaceCreateInfoKHR. `display` is `wl_display*`, `surface` is `wl_surface*`.
pub const WaylandSurfaceCreateInfo = extern struct {
    s_type: i32,
    p_next: ?*const anyopaque,
    flags: u32,
    display: *anyopaque,
    surface: *anyopaque,
};

pub const CreateXlibSurface = *const fn (*Instance, *const XlibSurfaceCreateInfo, ?*const anyopaque, *u64) callconv(.c) i32;
pub const CreateXcbSurface = *const fn (*Instance, *const XcbSurfaceCreateInfo, ?*const anyopaque, *u64) callconv(.c) i32;
pub const CreateWaylandSurface = *const fn (*Instance, *const WaylandSurfaceCreateInfo, ?*const anyopaque, *u64) callconv(.c) i32;
pub const DestroySurface = *const fn (*Instance, u64, ?*const anyopaque) callconv(.c) void;
pub const XlibPresentationSupport = *const fn (*PhysicalDevice, u32, *anyopaque, usize) callconv(.c) u32;
pub const XcbPresentationSupport = *const fn (*PhysicalDevice, u32, *anyopaque, u32) callconv(.c) u32;
pub const WaylandPresentationSupport = *const fn (*PhysicalDevice, u32, *anyopaque) callconv(.c) u32;

comptime {
    if (@sizeOf(XcbSurfaceCreateInfo) != 40 or @alignOf(XcbSurfaceCreateInfo) != 8) @compileError("VkXcbSurfaceCreateInfoKHR ABI mismatch");
    if (@offsetOf(XcbSurfaceCreateInfo, "s_type") != 0 or
        @offsetOf(XcbSurfaceCreateInfo, "p_next") != 8 or
        @offsetOf(XcbSurfaceCreateInfo, "flags") != 16 or
        @offsetOf(XcbSurfaceCreateInfo, "connection") != 24 or
        @offsetOf(XcbSurfaceCreateInfo, "window") != 32)
    {
        @compileError("VkXcbSurfaceCreateInfoKHR field offsets mismatch");
    }
}

/// The libvulkan.so.1 handle and its vkGetInstanceProcAddr. Owned by the caller
/// through `Loader` in surface.zig; closing it invalidates every resolved entry point.
pub const Library = struct {
    dynlib: std.DynLib,
    get_instance_proc_addr: GetInstanceProcAddr,

    pub const LoadError = std.DynLib.Error || error{MissingSymbol};

    pub fn open(path: []const u8) LoadError!Library {
        var dynlib = try std.DynLib.open(path);
        errdefer dynlib.close();
        const get = dynlib.lookup(GetInstanceProcAddr, "vkGetInstanceProcAddr") orelse return error.MissingSymbol;
        return .{ .dynlib = dynlib, .get_instance_proc_addr = get };
    }

    pub fn close(self: *Library) void {
        self.dynlib.close();
        self.* = undefined;
    }
};
