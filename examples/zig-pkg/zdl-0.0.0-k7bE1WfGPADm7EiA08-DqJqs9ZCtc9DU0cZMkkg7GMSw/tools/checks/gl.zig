const std = @import("std");
const gl = struct {
    const gl_attributes = @import("zdl").egl.attributes;
    const gl_display = @import("zdl").egl.display;
    const gl_window_surface = @import("zdl").egl.surface;
    const gl_context = @import("zdl").egl.context;
    const vulkan_surface = @import("zdl").vulkan_surface.surface;
    const vulkan_extensions = @import("zdl").vulkan_surface.extensions;
};

// Compile-only consumer. Nothing here runs: the guard below returns before any
// call that would open a display, load a driver or create a surface.
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const attributes: gl.gl_attributes.Attributes = .{ .profile = .core, .major_version = 3, .minor_version = 3 };
    try attributes.validate();

    var display = try gl.gl_display.Display.open(.{ .x11 = @ptrFromInt(1) }, gl.gl_display.default_library);
    defer display.deinit();
    _ = display.egl_version().at_least(1, 5);
    _ = display.has_extension("EGL_KHR_create_context");
    _ = display.error_code();
    _ = display.swap_interval();
    try display.set_swap_interval(1);
    const config = try display.choose_config(attributes, 0x21);
    var surface = try gl.gl_window_surface.WindowSurface.create(&display, config, .{ .x11 = 1 }, .{ .width = 640, .height = 480 }, attributes);
    defer surface.deinit();
    try surface.resize(.{ .width = 800, .height = 600 });
    var context = try gl.gl_context.Context.create(&display, config, &surface, attributes, .none);
    defer context.deinit();
    try context.make_current(&surface);
    try context.make_current(null);
    _ = context.gl_has_extension("GL_ARB_clip_control");
    _ = display.proc_address(*const fn (u32) callconv(.c) void, "glFlush");
    try surface.swap_buffers();
    try display.release_current();

    var list = gl.gl_attributes.ConfigList{};
    _ = list.terminated();
    _ = gl.gl_attributes.renderable_type(attributes, true);
    _ = try gl.gl_attributes.context_list(attributes, .{ .create_context = true });
    _ = gl.vulkan_extensions.required(.x11);
    _ = gl.vulkan_extensions.is_required(.wayland, "VK_KHR_wayland_surface");

    var loader = try gl.vulkan_surface.Loader.open();
    defer loader.deinit();
    const get_proc = loader.proc_address();
    var instance: u8 = 0;
    _ = try gl.vulkan_surface.create_xlib_surface(get_proc, @ptrCast(&instance), @ptrFromInt(1), 1);
    _ = try gl.vulkan_surface.create_wayland_surface(get_proc, @ptrCast(&instance), @ptrFromInt(1), @ptrFromInt(1));
    gl.vulkan_surface.destroy_surface(get_proc, @ptrCast(&instance), 0);
    _ = gl.vulkan_surface.xlib_presentation_support(get_proc, @ptrCast(&instance), @ptrCast(&instance), 0, @ptrFromInt(1), 1);
    _ = gl.vulkan_surface.wayland_presentation_support(get_proc, @ptrCast(&instance), @ptrCast(&instance), 0, @ptrFromInt(1));
}
