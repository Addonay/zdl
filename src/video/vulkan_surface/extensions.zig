//! Instance extensions an application must enable before creating a surface on
//! a native window system. Ported from SDL_x11vulkan.c (Xlib/XCB paths) and
//! SDL_waylandvulkan.c (Vulkan_GetInstanceExtensions).

const std = @import("std");

/// Core surface extension, required by both backends.
pub const surface = "VK_KHR_surface";
/// Xlib surface extension (X11).
pub const xlib_surface = "VK_KHR_xlib_surface";
/// XCB surface extension (X11).
pub const xcb_surface = "VK_KHR_xcb_surface";
/// Wayland surface extension.
pub const wayland_surface = "VK_KHR_wayland_surface";

/// The native window system a surface is created on.
pub const Backend = enum { x11, xcb, wayland };

/// The instance extensions to enable for `backend`. The slice is static data.
pub fn required(backend: Backend) []const [:0]const u8 {
    return switch (backend) {
        .x11 => &.{ surface, xlib_surface },
        .xcb => &.{ surface, xcb_surface },
        .wayland => &.{ surface, wayland_surface },
    };
}

/// Whether `name` is one of the extensions `required(backend)` lists. Use it
/// to check the availability list reported by vkEnumerateInstanceExtensionProperties.
pub fn is_required(backend: Backend, name: []const u8) bool {
    for (required(backend)) |extension| {
        if (std.mem.eql(u8, extension, name)) return true;
    }
    return false;
}
