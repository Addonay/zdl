//! Private libvulkan.so.1 binding for the X11 and Wayland surface entry points.
//! This file declares the C structs and function pointers and is the only
//! Vulkan-surface file that uses `extern` or `callconv(.c)`. The loader opens
//! the library only to obtain vkGetInstanceProcAddr, and only when the caller
//! passes none; all other entry points come from that vkGetInstanceProcAddr.
//!
//! Layouts follow vulkan_core.h (VK_KHR_xlib_surface and VK_KHR_wayland_surface).
//! Structure type values: VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR is
//! 1000004000 and VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR is 1000006000.

const std = @import("std");

pub const Instance = opaque {};
pub const PhysicalDevice = opaque {};

/// PFN_vkGetInstanceProcAddr.
pub const GetInstanceProcAddr = *const fn (?*Instance, [*:0]const u8) callconv(.c) ?*const anyopaque;

pub const structure_type_xlib_surface_create_info: i32 = 1000004000;
pub const structure_type_wayland_surface_create_info: i32 = 1000006000;

/// VkXlibSurfaceCreateInfoKHR. `dpy` is `Display*` and `window` is `Window` (XID).
pub const XlibSurfaceCreateInfo = extern struct {
    s_type: i32,
    p_next: ?*const anyopaque,
    flags: u32,
    dpy: *anyopaque,
    window: usize,
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
pub const CreateWaylandSurface = *const fn (*Instance, *const WaylandSurfaceCreateInfo, ?*const anyopaque, *u64) callconv(.c) i32;
pub const DestroySurface = *const fn (*Instance, u64, ?*const anyopaque) callconv(.c) void;
pub const XlibPresentationSupport = *const fn (*PhysicalDevice, u32, *anyopaque, usize) callconv(.c) u32;
pub const WaylandPresentationSupport = *const fn (*PhysicalDevice, u32, *anyopaque) callconv(.c) u32;

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
