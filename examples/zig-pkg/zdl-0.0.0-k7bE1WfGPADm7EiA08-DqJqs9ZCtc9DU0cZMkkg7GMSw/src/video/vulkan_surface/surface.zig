//! Vulkan presentation surfaces for X11 (Xlib) and Wayland windows, created
//! through the instance-level entry points of a Vulkan loader. Ported from
//! SDL_x11vulkan.c (SDL_Vulkan_CreateSurface, SDL_Vulkan_GetPresentationSupport)
//! and SDL_waylandvulkan.c, with SDL_vulkan_utils.c's loader handling.
//!
//! The caller normally supplies its loader's `vkGetInstanceProcAddr` (the
//! `ProcAddress` value) and the VkInstance it created with the extensions from
//! `extensions.required`. When no address is supplied, `Loader.open` loads
//! libvulkan.so.1 privately and resolves only vkGetInstanceProcAddr from it.
//!
//! A `Surface` is the 64-bit VkSurfaceKHR handle, returned as an integer, and
//! `0` is VK_NULL_HANDLE. The surface borrows the native display and window: it
//! must be destroyed before them and before the instance (`destroy_surface`).

const std = @import("std");
const binding = @import("binding.zig");
pub const extensions = @import("extensions.zig");

/// The `PFN_vkGetInstanceProcAddr` value as an opaque address. Obtain it from
/// the Vulkan loader the application uses; it must stay valid while surfaces exist.
pub const ProcAddress = *const anyopaque;

/// VkSurfaceKHR, a non-dispatchable handle. 0 is VK_NULL_HANDLE.
pub const Surface = u64;

/// Failures from the Vulkan loader or a VkResult other than VK_SUCCESS.
pub const Error = binding.Library.LoadError || error{
    /// vkCreateXlibSurfaceKHR or vkCreateWaylandSurfaceKHR is not available: the
    /// instance was created without the matching surface extension.
    ExtensionNotEnabled,
    OutOfHostMemory,
    OutOfDeviceMemory,
    InitializationFailed,
    DeviceLost,
    SurfaceLost,
    NativeWindowInUse,
    VulkanFailed,
};

/// Owns a privately loaded libvulkan.so.1, only used for vkGetInstanceProcAddr.
pub const Loader = struct {
    library: binding.Library,

    /// Loads libvulkan.so.1 (the system loader) and resolves vkGetInstanceProcAddr.
    pub fn open() Error!Loader {
        return .{ .library = try binding.Library.open("libvulkan.so.1") };
    }

    /// The loaded loader's vkGetInstanceProcAddr, to pass to the functions below.
    pub fn proc_address(self: *const Loader) ProcAddress {
        return @ptrCast(self.library.get_instance_proc_addr);
    }

    /// Unloads libvulkan.so.1. Surfaces and the instance must already be destroyed.
    pub fn deinit(self: *Loader) void {
        self.library.close();
        self.* = undefined;
    }
};

/// Creates a VkSurfaceKHR for an Xlib window. `display` is the `Display*` and
/// `window` the XID, both from the X11 backend. `instance` is a VkInstance with
/// VK_KHR_surface and VK_KHR_xlib_surface enabled.
pub fn create_xlib_surface(get_proc: ProcAddress, instance: *anyopaque, display: *anyopaque, window: u64) Error!Surface {
    const create: binding.CreateXlibSurface = @ptrCast(lookup(get_proc, instance, "vkCreateXlibSurfaceKHR") orelse return error.ExtensionNotEnabled);
    const info: binding.XlibSurfaceCreateInfo = .{
        .s_type = binding.structure_type_xlib_surface_create_info,
        .p_next = null,
        .flags = 0,
        .dpy = display,
        .window = @intCast(window),
    };
    var surface: u64 = 0;
    try check(create(@ptrCast(instance), &info, null, &surface));
    return surface;
}

/// Creates a VkSurfaceKHR for a Wayland surface. `display` is `wl_display*` and
/// `wl_surface` the `wl_surface*`, both from libwayland-client. Requires
/// VK_KHR_surface and VK_KHR_wayland_surface on the instance.
pub fn create_wayland_surface(get_proc: ProcAddress, instance: *anyopaque, display: *anyopaque, wl_surface: *anyopaque) Error!Surface {
    const create: binding.CreateWaylandSurface = @ptrCast(lookup(get_proc, instance, "vkCreateWaylandSurfaceKHR") orelse return error.ExtensionNotEnabled);
    const info: binding.WaylandSurfaceCreateInfo = .{
        .s_type = binding.structure_type_wayland_surface_create_info,
        .p_next = null,
        .flags = 0,
        .display = display,
        .surface = wl_surface,
    };
    var surface: u64 = 0;
    try check(create(@ptrCast(instance), &info, null, &surface));
    return surface;
}

/// Destroys a surface created by this module. Surface 0 is ignored. Uses the
/// default allocator, as the surfaces are created with a null VkAllocationCallbacks.
pub fn destroy_surface(get_proc: ProcAddress, instance: *anyopaque, surface: Surface) void {
    if (surface == 0) return;
    const destroy: binding.DestroySurface = @ptrCast(lookup(get_proc, instance, "vkDestroySurfaceKHR") orelse return);
    destroy(@ptrCast(instance), surface, null);
}

/// Whether `queue_family` on `physical_device` can present to an Xlib visual on
/// `display` (vkGetPhysicalDeviceXlibPresentationSupportKHR). `visual_id` is the
/// X11 visual ID the window was created with. Returns false when the entry point
/// is missing, so callers that only check support need no separate probe.
pub fn xlib_presentation_support(get_proc: ProcAddress, instance: *anyopaque, physical_device: *anyopaque, queue_family: u32, display: *anyopaque, visual_id: u64) bool {
    const query: binding.XlibPresentationSupport = @ptrCast(lookup(get_proc, instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR") orelse return false);
    return query(@ptrCast(physical_device), queue_family, display, @intCast(visual_id)) != 0;
}

/// Whether `queue_family` on `physical_device` can present to a Wayland
/// compositor on `display` (vkGetPhysicalDeviceWaylandPresentationSupportKHR).
pub fn wayland_presentation_support(get_proc: ProcAddress, instance: *anyopaque, physical_device: *anyopaque, queue_family: u32, display: *anyopaque) bool {
    const query: binding.WaylandPresentationSupport = @ptrCast(lookup(get_proc, instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR") orelse return false);
    return query(@ptrCast(physical_device), queue_family, display) != 0;
}

fn lookup(get_proc: ProcAddress, instance: *anyopaque, name: [:0]const u8) ?*const anyopaque {
    const get: binding.GetInstanceProcAddr = @ptrCast(get_proc);
    return get(@ptrCast(instance), name.ptr);
}

/// Maps a VkResult to this module's error set. VK_SUCCESS (0) is not an error.
fn check(result: i32) Error!void {
    return switch (result) {
        0 => {},
        -1 => error.OutOfHostMemory,
        -2 => error.OutOfDeviceMemory,
        -3 => error.InitializationFailed,
        -4 => error.DeviceLost,
        -1000000000 => error.SurfaceLost,
        -1000000001 => error.NativeWindowInUse,
        else => error.VulkanFailed,
    };
}
