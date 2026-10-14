const std = @import("std");
const gl = struct {
    const gl_attributes = @import("zdl").egl.attributes;
    const gl_display = @import("zdl").egl.display;
    const gl_window_surface = @import("zdl").egl.surface;
    const gl_pbuffer = @import("zdl").egl.pbuffer;
    const gl_context = @import("zdl").egl.context;
    const glx = @import("zdl").egl.glx;
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
    const pbuffer_config = try display.choose_pbuffer_config(attributes);
    var pbuffer = try gl.gl_pbuffer.Pbuffer.create(&display, pbuffer_config, .{ .width = 64, .height = 64 });
    defer pbuffer.deinit();
    var offscreen = try gl.gl_context.Context.create_pbuffer(&display, pbuffer_config, &pbuffer, attributes, .none);
    defer offscreen.deinit();
    try offscreen.make_current_pbuffer(&pbuffer);
    try offscreen.make_current_pbuffer(null);
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

    var x11_connection: @import("zdl").x11.window.Connection = undefined;
    var glx_display = try gl.glx.Display.open(&x11_connection, gl.glx.default_library);
    defer glx_display.deinit();
    const glx_config = try glx_display.choose_config(attributes, .window, 0x21);
    var glx_surface = try gl.glx.Surface.create_window(&glx_display, glx_config, 1, 0x21);
    defer glx_surface.deinit();
    var glx_context = try gl.glx.Context.create(&glx_display, glx_config, &glx_surface, attributes, .none);
    defer glx_context.deinit();
    try glx_context.make_current(&glx_surface);
    try glx_display.set_swap_interval(&glx_surface, 1);
    _ = glx_display.swap_interval();
    _ = glx_display.glx_has_extension("GLX_ARB_create_context");
    _ = glx_context.gl_has_extension("GL_ARB_clip_control");
    _ = glx_display.proc_address(*const fn () callconv(.c) void, "glFinish");
    try glx_surface.swap_buffers();
    try glx_context.make_current(null);
    const glx_pbuffer_config = try glx_display.choose_pbuffer_config(attributes);
    var glx_pbuffer = try gl.glx.Surface.create_pbuffer(&glx_display, glx_pbuffer_config, 64, 64);
    defer glx_pbuffer.deinit();
    var glx_offscreen = try gl.glx.Context.create(&glx_display, glx_pbuffer_config, &glx_pbuffer, attributes, .none);
    defer glx_offscreen.deinit();
    try glx_offscreen.make_current(&glx_pbuffer);
    try glx_offscreen.make_current(null);

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
    _ = try gl.vulkan_surface.create_xcb_surface(get_proc, @ptrCast(&instance), @ptrFromInt(1), 1);
    _ = try gl.vulkan_surface.create_wayland_surface(get_proc, @ptrCast(&instance), @ptrFromInt(1), @ptrFromInt(1));
    gl.vulkan_surface.destroy_surface(get_proc, @ptrCast(&instance), 0);
    _ = gl.vulkan_surface.xlib_presentation_support(get_proc, @ptrCast(&instance), @ptrCast(&instance), 0, @ptrFromInt(1), 1);
    _ = gl.vulkan_surface.xcb_presentation_support(get_proc, @ptrCast(&instance), @ptrCast(&instance), 0, @ptrFromInt(1), 1);
    _ = gl.vulkan_surface.wayland_presentation_support(get_proc, @ptrCast(&instance), @ptrCast(&instance), 0, @ptrFromInt(1));
    _ = gl.vulkan_extensions.required(.xcb);
    _ = gl.vulkan_extensions.is_required(.xcb, "VK_KHR_xcb_surface");
}
